package mg.grailsapp.model

class Message {
    String contenu
    Date dateEnvoi = new Date()
    boolean flag = false
    boolean toasted = false

    static belongsTo = [expediteur: SecUser, destinataire: SecUser]

    static constraints = {
        contenu blank: false
    }
    static mapping = {
        contenu type: 'text'
        sort dateEnvoi: "desc"
    }
}
