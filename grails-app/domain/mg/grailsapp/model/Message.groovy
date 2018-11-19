package mg.grailsapp.model

class Message {
    Utilisateur expediteur
    Utilisateur destinataire
    String contenu
    Date dateEnvoi
    boolean flag

    static constraints = {
    }
}
