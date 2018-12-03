import mg.grailsapp.util.SecUserPasswordEncoderListener
import org.springframework.security.web.authentication.session.CompositeSessionAuthenticationStrategy
import org.springframework.security.web.authentication.session.ConcurrentSessionControlAuthenticationStrategy
import org.springframework.security.web.session.ConcurrentSessionFilter
import org.springframework.security.core.session.SessionRegistryImpl
import org.springframework.security.web.authentication.session.RegisterSessionAuthenticationStrategy;
import org.springframework.security.web.authentication.session.SessionFixationProtectionStrategy


// Place your Spring DSL code here
beans = {
    secUserPasswordEncoderListener(SecUserPasswordEncoderListener)

    concurrentSessionControlAuthenticationStrategy(ConcurrentSessionControlAuthenticationStrategy,ref('sessionRegistry')) {
        maximumSessions = -1
    }
    registerSessionAuthenticationStrategy(RegisterSessionAuthenticationStrategy, ref('sessionRegistry'))
    sessionFixationProtectionStrategy(SessionFixationProtectionStrategy){
        migrateSessionAttributes = true
        alwaysCreateSession = true
    }
    concurrentSessionFilter(ConcurrentSessionFilter, ref('sessionRegistry'))

    sessionAuthenticationStrategy(CompositeSessionAuthenticationStrategy, [ref('concurrentSessionControlAuthenticationStrategy'), ref('sessionFixationProtectionStrategy'),ref('registerSessionAuthenticationStrategy')])

    sessionRegistry(SessionRegistryImpl)
}