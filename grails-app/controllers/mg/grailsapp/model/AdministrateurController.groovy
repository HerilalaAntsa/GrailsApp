package mg.grailsapp.model

import grails.plugin.springsecurity.annotation.Secured

class AdministrateurController {

    def matchJoueurService

    @Secured("ROLE_ADMIN")
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def listUserRole = SecUserRole.findAll()
        def listJoueur = SecUserRole.findAll {secRole.authority == "ROLE_JOUEUR"}
        def listAdmin = SecUserRole.findAll {secRole.authority == "ROLE_ADMIN"}
        def listMatch = matchJoueurService.list(params)
        [
                listUserRole: listUserRole,
                listJoueur: listJoueur,
                listAdmin: listAdmin,
                listMatch: listMatch,
                matchCount: matchJoueurService.count()
        ]
    }
}
