package mg.grailsapp.model

class Match {
    Utilisateur joueur1
    Utilisateur joueur2
    Float score1
    Float score2
    Date date

    static constraints = {
    }
}
