package mg.grailsapp.model

import grails.gorm.services.Service
import grails.gorm.transactions.Transactional

@Service(SecUser)
class UtilisateurService {

    @Transactional
    SecUser inscription(SecUser user, String authority){
        user.save()
        new SecUserRole(secUser: user, secRole: SecRole.findByAuthority(authority)).save()
        return user
    }

    MatchJoueur jouer(SecUser joueur, SecUser adversaire){
        if(adversaire == null){
            throw new Exception('user.notFound.message')
        }
        if(adversaire == joueur){
            throw new Exception("L'adversaire ne peut etre le joueur lui meme")
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
        def list = [utilisateur1, utilisateur2]
        return Message.findAllByDestinataireInListOrExpediteurInList(list,list,
                [max: 10, offset: offset, sort: "dateEnvoi", order: "desc"]).reverse()
    }
//    def lastMessage(SecUser utilisateur, int offset = 25){
//        def result = Message.findAll("""
//            FROM Message message WHERE message.id in (
//                SELECT id, other FROM Message m WHERE message.id in(
//                    SELECT id, expediteur as other
//                    FROM Message
//                    WHERE  destinataire = :utilisateur
//                ) or message.id in (
//                    SELECT id, destinataire as other
//                    FROM Message
//                    WHERE expediteur LIKE :utilisateur
//                ) GROUP BY other
//            )
//        """,
//                [utilisateur: utilisateur, max: 10, offset: offset, sort: "dateEnvoi", order: "desc"])
//        return result
//    }
}