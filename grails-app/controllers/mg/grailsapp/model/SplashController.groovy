package mg.grailsapp.model
import grails.plugin.springsecurity.annotation.Secured
class SplashController {

    def springSecurityService
    def utilisateurService
    def sessionRegistry

    @Secured('permitAll')
    def index() {
        respond SecUser.list()
    }

    @Secured(value=['permitAll'])
    def inscription(){
        if(request.method == 'POST'){
            if(params['confirmPassword'] != params['password']){
                flash.message = "user.password.different"
                flash.default = "Les mots de passes ne correspondent pas"
                redirect(action: 'index')
                return
            }
            def user = utilisateurService.inscription(new SecUser(params),'ROLE_JOUEUR')
            flash.message = "user.created.message"
            flash.args = [user.username]
            flash.default = "Votre profil a &eacute;t&eacute; cr&eacute;&eacute; correctement"
            springSecurityService.reauthenticate(params.username, params.password)
        }
        redirect(action:"index")
    }

    @Secured('ROLE_JOUEUR')
    def jouer(SecUser user)
    {
//        def users = sessionRegistry.allPrincipals
//        if(users.contains(user)){
//            flash.message = "Cet utilisateur n'est pas connecté"
//        }
        try{
            def match = utilisateurService.jouer(springSecurityService.currentUser, user)
            [match : match]
        }catch(Exception e){
            flash.message = e.getMessage()
            render(view: 'jouer')
            return
        }

    }

    @Secured('permitAll')
    def getUserOnline(){
        render sessionRegistry.allPrincipals
    }

    @Secured(['ROLE_JOUEUR', 'ROLE_ADMIN'])
    def ecrire(SecUser user, String contenu)
    {
        try{
            utilisateurService.ecrire(springSecurityService.currentUser, user, contenu)
            utilisateurService.lire(springSecurityService.currentUser, user)
        }catch(Exception e){
            flash.message = e.getMessage()
        }
        redirect(action: 'message', params: [id:user.id])
    }

    @Secured(['ROLE_JOUEUR', 'ROLE_ADMIN'])
    def lire(SecUser user, String contenu)
    {
        try{
            utilisateurService.lire(springSecurityService.currentUser, user)
            render "SUCCESS"
        }catch(Exception e){
            flash.message = e.getMessage()
            return
        }
    }

    @Secured(['ROLE_JOUEUR', 'ROLE_ADMIN'])
    def message(SecUser user)
    {
        try{
            def messageList = utilisateurService.message(springSecurityService.currentUser, user)
            respond messageList, model:[utilisateur: user]
        }catch(Exception e){
            flash.message = e.getMessage()
            return
        }
    }
}
