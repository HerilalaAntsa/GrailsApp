package mg.grailsapp.model

class MatchJoueur {
    float scoreJ
    float scoreA
    Date dateMatch = new Date()

    static belongsTo = [joueur: SecUser, adversaire: SecUser]
    static constraints = {
    }

    def gagnant(){
        return scoreJ > scoreA
    }
}
