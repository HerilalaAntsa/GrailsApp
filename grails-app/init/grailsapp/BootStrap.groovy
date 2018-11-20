package mg.grailsapp.model

import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
class BootStrap {

    def init = { servletContext ->

        def authorities = ['ROLE_BOSS', 'ROLE_EMPLOYEE']
        authorities.each { String authority ->
            if ( !SecRole.findByAuthority(authority) ) {
                new SecRole(authority: authority).save()
            }
        }

        if ( !SecUser.findByUsername('Henintsoa') ) {
            def u = new SecUser(username: 'Henintsoa', password: 'Henintsoa')
            u.save()
            new SecUserRole(user: u, securityRole: SecRole.findByAuthority('ROLE_BOSS')).save()
        }

        if ( !SecUser.findByUsername('Antsa') ) {
            def u = new SecUser(username: 'Antsa', password: 'Antsa')
            u.save()
            new SecUserRole(user: u, securityRole: SecRole.findByAuthority('ROLE_EMPLOYEE')).save()
        }
    }
    def destroy = {
    }
}
