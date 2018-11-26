package mg.grailsapp.model

class Message {
    SecUser expediteur
    SecUser destinataire
    String contenu
    Date dateEnvoi = new Date()
    boolean flag = false
    boolean toasted = false

    static constraints = {
        contenu blank: false
        expediteur notEqual: destinataire
    }
    static mapping = {
        contenu type: 'text'
        sort dateEnvoi: "desc"
    }
}
