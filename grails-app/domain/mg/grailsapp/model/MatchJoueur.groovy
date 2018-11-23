package mg.grailsapp.model

class MatchJoueur {
    SecUser joueur
    SecUser adversaire
    float scoreJ
    float scoreA
    Date dateMatch = new Date()

    static constraints = {
    }

    def gagnant(){
        return scoreJ > scoreA
    }
}
