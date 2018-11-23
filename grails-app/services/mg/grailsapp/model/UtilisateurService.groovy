package mg.grailsapp.model

import grails.gorm.services.Service

@Service(SecUser)
interface UtilisateurService {

    SecUser get(Serializable id)

    List<SecUser> list(Map args)

    Long count()

    void delete(Serializable id)

    SecUser save(SecUser utilisateur)

}