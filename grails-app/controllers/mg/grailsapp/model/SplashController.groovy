package mg.grailsapp.model
import grails.plugin.springsecurity.annotation.Secured

class SplashController {

    def springSecurityService
    def utilisateurService
    def sessionRegistry

    @Secured('permitAll')
    def index() {
        respond SecUser.list() , model:[unread : utilisateurService.unreadMessage(springSecurityService.currentUser)]
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
        render sessionRegistry.allPrincipals.size()
    }

    @Secured(['ROLE_JOUEUR', 'ROLE_ADMIN'])
    def ecrire(SecUser user, String contenu)
    {
        try{
            def message = utilisateurService.ecrire(springSecurityService.currentUser, user, contenu)
            if(request.xhr){
                respond message
                return
            }
        }catch(Exception e){
            flash.message = e.getMessage()
        }
        redirect(action: 'message', params: [id:user.id])
    }

    @Secured(['ROLE_JOUEUR', 'ROLE_ADMIN'])
    def lire(SecUser user)
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
            respond utilisateurService.message(springSecurityService.currentUser, user), model:[utilisateur: user, online: true]
        }catch(Exception e){
            e.printStackTrace()
            flash.message = e.getMessage()
            return
        }
    }

    @Secured(['ROLE_JOUEUR', 'ROLE_ADMIN'])
    def otherMessage(SecUser user)
    {
        try{
            if(request.xhr){
                respond utilisateurService.otherMessage(springSecurityService.currentUser, user)
                return
            }
        }catch(Exception e){
            e.printStackTrace()
            flash.message = e.getMessage()
            render e
            return
        }
        redirect(action: 'message')
    }

    @Secured(['ROLE_JOUEUR', 'ROLE_ADMIN'])
    def newMessage(SecUser user)
    {
        try{
            if(request.xhr){
                def message = utilisateurService.newMessage(springSecurityService.currentUser, user)
                respond message
                if(message?.size() > 0){
                    utilisateurService.lire(springSecurityService.currentUser, user)
                }
                return
            }
        }catch(Exception e){
            e.printStackTrace()
            flash.message = e.getMessage()
            return
        }
        redirect(action: 'message', params: [id:user.id])
    }
    @Secured(['ROLE_JOUEUR', 'ROLE_ADMIN'])
    def profil()
    {
        respond MatchJoueur.findAllByJoueurOrAdversaire(springSecurityService.currentUser, springSecurityService.currentUser)
    }
}
