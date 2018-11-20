package mg.grailsapp.model

class Utilisateur {
    String pseudo
    String password
    String confirmPassword
    String passwordHash
    String email
    Date dateInscription
    String role

    static constraints = {
        pseudo size: 5..15, blank: false, unique: true
        password size: 5..15, blank: false
        confirmPassword blank: false, nullable: false
        passwordHash blank: false, nullable: false
        email email: true, blank: false
        role(inList: ["Admin", "Joueur"])
    }
    //static transients = ['password','confirmPassword']
}
