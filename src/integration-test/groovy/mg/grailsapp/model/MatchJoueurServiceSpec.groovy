package mg.grailsapp.model

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class MatchJoueurServiceSpec extends Specification {

    MatchJoueurService matchJoueurService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Match(...).save(flush: true, failOnError: true)
        //new Match(...).save(flush: true, failOnError: true)
        //Match match = new Match(...).save(flush: true, failOnError: true)
        //new Match(...).save(flush: true, failOnError: true)
        //new Match(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //match.id
    }

    void "test get"() {
        setupData()

        expect:
        matchJoueurService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<MatchJoueur> matchList = matchJoueurService.list(max: 2, offset: 2)

        then:
        matchList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        matchJoueurService.count() == 5
    }

    void "test delete"() {
        Long matchId = setupData()

        expect:
        matchJoueurService.count() == 5

        when:
        matchJoueurService.delete(matchId)
        sessionFactory.currentSession.flush()

        then:
        matchJoueurService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        MatchJoueur match = new MatchJoueur()
        matchJoueurService.save(match)

        then:
        match.id != null
    }
}
