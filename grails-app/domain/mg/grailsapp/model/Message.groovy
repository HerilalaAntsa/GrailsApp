package mg.grailsapp.model

class Message {
    SecUser expediteur
    SecUser destinataire
    String contenu
    Date dateEnvoi
    boolean flag

    static constraints = {
        contenu blank: false
    }
}
