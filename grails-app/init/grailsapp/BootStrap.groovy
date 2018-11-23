package mg.grailsapp.model

import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
class BootStrap {

    def init = { servletContext ->

        def authorities = ['ROLE_ADMIN', 'ROLE_JOUEUR']
        authorities.each { String authority ->
            if ( !SecRole.findByAuthority(authority) ) {
                new SecRole(authority: authority).save()
            }
        }

        if ( !SecUser.findByUsername('Henintsoa') ) {
            def u = new SecUser(username: 'Henintsoa', password: 'Henintsoa')
<<<<<<< HEAD
            u.save(flush: true)
            println(u)
=======
            u.save()
>>>>>>> 5c05a3f682b2c717bcf51bab5bbd2c31d5d8e35c
            new SecUserRole(secUser: u, secRole: SecRole.findByAuthority('ROLE_ADMIN')).save()
        }

        if ( !SecUser.findByUsername('Antsa') ) {
            def u = new SecUser(username: 'Antsa', password: 'Antsa')
            u.save()
            new SecUserRole(secUser: u, secRole: SecRole.findByAuthority('ROLE_JOUEUR')).save()
        }
    }
    def destroy = {
    }
}
