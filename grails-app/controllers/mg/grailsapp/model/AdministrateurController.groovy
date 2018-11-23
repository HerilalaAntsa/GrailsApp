package mg.grailsapp.model

import grails.plugin.springsecurity.annotation.Secured

class AdministrateurController {

    @Secured("ROLE_ADMIN")
    def index() {
        def listUserRole = SecUserRole.findAll()
        def listJoueur = SecUserRole.findAll {secRole.authority == "ROLE_JOUEUR"}
        def listAdmin = SecUserRole.findAll {secRole.authority == "ROLE_ADMIN"}
        def listMatch = MatchJoueur.findAll()
        [
                listUserRole: listUserRole,
                listJoueur: listJoueur,
                listAdmin: listAdmin,
                listMatch: listMatch
        ]
    }
}
