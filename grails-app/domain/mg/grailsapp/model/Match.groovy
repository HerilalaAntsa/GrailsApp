package mg.grailsapp.model

class Match {
    SecUser joueur1
    SecUser joueur2
    Float score1
    Float score2
    Date date

    static constraints = {
    }
}
