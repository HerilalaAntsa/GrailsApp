package mg.grailsapp.model

class Message {
    SecUser expediteur
    SecUser destinataire
    String contenu
    Date dateEnvoi = new Date()
    boolean flag = false

    static constraints = {
        contenu blank: false
    }
}
