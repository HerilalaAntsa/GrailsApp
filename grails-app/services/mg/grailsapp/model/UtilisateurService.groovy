package mg.grailsapp.model

import grails.gorm.services.Service
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.userdetails.GrailsUser

@Service(SecUser)
class UtilisateurService {

    def sessionRegistry

    @Transactional
    SecUser inscription(SecUser user, String authority){
        user.save()
        new SecUserRole(secUser: user, secRole: SecRole.findByAuthority(authority)).save()
        return user
    }
    def online(SecUser user){
        def users = sessionRegistry.allPrincipals
        boolean contains = false
        users.each {
            GrailsUser u ->
                if(u?.username == user?.username){
                    contains = true
                }
        }
        return contains
    }
    MatchJoueur jouer(SecUser joueur, SecUser adversaire){
        if(adversaire == null){
            throw new Exception('user.notFound.message')
        }
        else if(adversaire == joueur){
            throw new Exception("L'adversaire ne peut etre le joueur lui meme")
        }
        else if(!adversaire.authorities.contains(SecRole.findByAuthority('ROLE_JOUEUR'))){
            throw new Exception("L'adversaire n'est pas un joueur")
        }
        if(!online(adversaire)){
            throw new Exception("Cet utilisateur n'est pas connecté")
        }
        def score1 = Math.random() * 20
        def score2 = Math.random() * 20
        def match = new MatchJoueur(joueur: joueur, adversaire: adversaire, scoreJ: score1, scoreA: score2)
        match.save(true)
        return match
    }
    def ecrire(SecUser expediteur, SecUser destinataire, String contenu){
        if(destinataire == null){
            throw new Exception('user.notFound.message')
        }
        else if(!online(destinataire)){
            throw new Exception("Cet utilisateur n'est pas connecté")
        }
        if(destinataire == expediteur){
            throw new Exception("Le destinataire ne peut etre l'exp&eacute;diteur lui meme")
        }
        def message = new Message(expediteur:expediteur, destinataire:destinataire, contenu:contenu)
        message.save(true)
        return message
    }
    def lire(SecUser destinataire, SecUser expediteur){
        if(destinataire == null){
            throw new Exception("Aucun utilisateur n'a &eacute;t&eacute; sel&eacute;ctionn&eacute;ctionn&eacute;")
        }
        if(destinataire == expediteur){
            throw new Exception("Utilisateur erron&eacute;")
        }
        Message.findAllByDestinataireAndExpediteurAndFlag(destinataire, expediteur, false).each
        {
            Message m ->
            m.flag = true
            m.save(flush:true)
        }
    }
    def message(SecUser utilisateur1, SecUser utilisateur2, int offset = 0){
        if(utilisateur2 == null){
            throw new Exception("Aucun utilisateur n'a &eacute;t&eacute; sel&eacute;ctionn&eacute;")
        }
        if(utilisateur1 == utilisateur2){
            throw new Exception("Utilisateur erron&eacute;")
        }
        def message = Message.withCriteria {
            or{
                and {
                    eq("expediteur", utilisateur1)
                    eq("destinataire", utilisateur2)
                }
                and {
                    eq("expediteur", utilisateur2)
                    eq("destinataire", utilisateur1)
                }
            }
            maxResults(10)
            order("dateEnvoi", "desc")
            firstResult(offset)
        }
        return message.reverse()
    }
    def otherMessage(SecUser utilisateur, SecUser expediteur){
        def message = Message.findAll("""
           SELECT m, e.username 
           FROM Message AS m 
           INNER JOIN m.expediteur AS e 
           WHERE m.destinataire = :destinataire 
           AND m.expediteur != :expediteur 
           AND m.flag = :flag AND m.toasted =:toasted
        """, [destinataire: utilisateur, expediteur: expediteur, flag:false, toasted:false],[sort: "dateEnvoi", order: "desc"])
        message.each {
            def m ->
            m[0].toasted = true
            m[0].save(flush:true)
        }
        return message.reverse()
    }
    def newMessage(SecUser destinataire, SecUser expediteur){
        return Message.findAllByDestinataireAndExpediteurAndFlag(destinataire,expediteur,false, [sort: "dateEnvoi", order: "desc"]).reverse()
    }
    def unreadMessage(SecUser destinataire){
        def list = Message.withCriteria {
            eq('destinataire', destinataire)
            eq('flag', false)
            order('dateEnvoi', 'desc')
            projections{
                property('id')
                groupProperty('expediteur')
            }
        }
        if(list){
            println list
            def message = Message.findAllByIdInList(list)
            return message.reverse()
        }
    }
}