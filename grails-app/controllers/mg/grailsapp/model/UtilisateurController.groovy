package mg.grailsapp.model

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured

class SecUserController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE",ajaxSaveIntegrationData : 'POST']

    @Secured("ROLE_ADMIN")
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SecUser.list(params), model:[utilisateurCount: SecUser.count()]
    }

    @Secured("ROLE_ADMIN")
    def show(Long id) {
        respond SecUser.get(id)
    }

    @Secured("ROLE_ADMIN")
    def create() {
        respond new SecUser(params)
    }

    @Secured("ROLE_ADMIN")
    def save(SecUser utilisateur) {
        if (utilisateur == null) {
            notFound()
            return
        }
        try {
            utilisateur.save()
            new SecUserRole(secUser: utilisateur, secRole: SecRole.findByAuthority(params.role_authority)).save(flush:true)
        } catch (ValidationException e) {
            respond utilisateur.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'secUser.label', default: 'Utilisateur'), utilisateur.id])
                redirect utilisateur
            }
            '*' { respond utilisateur, [status: CREATED] }
        }
    }

    @Secured("permitAll")
    def uploadPhoto() {
        def utilisateur = SecUser.get(params.id)
        utilisateur.photo = params.file
        utilisateur.save(flush: true)
        render("SUCCESS")
       // def messages = Message.listOrderByDate(order: 'desc', max:10)
    }

    @Secured("permitAll")
    def featuredImage(Long id) {
        SecUser utilisateur = SecUser.get(id)
        if (!utilisateur || utilisateur.photo == null) {
            notFound()
            return
        }
        render file: utilisateur.photo,
                contentType: utilisateur.photoContentType
    }

    @Secured("ROLE_ADMIN")
    def edit(Long id) {
        respond SecUser.get(id)
    }

    @Secured("ROLE_ADMIN")
    def update(SecUser utilisateur) {
        if (utilisateur == null) {
            notFound()
            return
        }

        try {
            utilisateur.save(flush: true)
            new SecUserRole(secUser: utilisateur, secRole: SecRole.findByAuthority(params.role_authority)).save(flush:true)
        } catch (ValidationException e) {
            respond utilisateur.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'secUser.label', default: 'Utilisateur'), utilisateur.id])
                redirect utilisateur
            }
            '*'{ respond utilisateur, [status: OK] }
        }
    }

    @Secured("ROLE_ADMIN")
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        SecUser u = SecUser.get(id)
        def sur = SecUserRole.findBySecUser(u)
        sur.delete()
        u.delete()

        u.delete(flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'secUser.label', default: 'Utilisateur'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured("ROLE_ADMIN")
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUser.label', default: 'Utilisateur'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
