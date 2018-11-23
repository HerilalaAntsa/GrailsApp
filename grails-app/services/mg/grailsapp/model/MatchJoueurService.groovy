package mg.grailsapp.model

import grails.gorm.services.Service

@Service(MatchJoueur)
interface MatchJoueurService {

    MatchJoueur get(Serializable id)

    List<MatchJoueur> list(Map args)

    Long count()

    void delete(Serializable id)

    MatchJoueur save(MatchJoueur match)

}