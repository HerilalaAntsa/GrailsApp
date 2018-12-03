package mg.grailsapp.model

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured("ROLE_ADMIN")
class MatchJoueurController {

    MatchJoueurService matchJoueurService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond matchJoueurService.list(params), model:[matchCount: matchJoueurService.count()]
    }

    def show(Long id) {
        respond matchJoueurService.get(id)
    }

    def create() {
        respond new MatchJoueur(params)
    }

    def save(MatchJoueur match) {
        if (match == null) {
            notFound()
            return
        }

        try {
            matchJoueurService.save(match)
        } catch (ValidationException e) {
            respond match.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'match.label', default: 'Match'), match.id])
                redirect match
            }
            '*' { respond match, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond matchService.get(id)
    }

    def update(MatchJoueur match) {
        if (match == null) {
            notFound()
            return
        }

        try {
            matchJoueurService.save(match)
        } catch (ValidationException e) {
            respond match.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'match.label', default: 'Match'), match.id])
                redirect match
            }
            '*'{ respond match, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        matchJoueurService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'match.label', default: 'Match'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'match.label', default: 'Match'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
