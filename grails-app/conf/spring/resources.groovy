import mg.grailsapp.util.SecUserPasswordEncoderListener
import org.springframework.security.web.authentication.session.ConcurrentSessionControlAuthenticationStrategy
import org.springframework.security.web.session.ConcurrentSessionFilter
import org.springframework.security.core.session.SessionRegistryImpl
import org.springframework.security.web.authentication.session.RegisterSessionAuthenticationStrategy;
import org.springframework.security.web.session.SimpleRedirectSessionInformationExpiredStrategy

// Place your Spring DSL code here
beans = {
    secUserPasswordEncoderListener(SecUserPasswordEncoderListener)

    sessionRegistry(SessionRegistryImpl)
    sessionAuthenticationStrategy(ConcurrentSessionControlAuthenticationStrategy,ref('sessionRegistry')) {
        maximumSessions = -1
    }
    registerSessionAuthenticationStrategy(RegisterSessionAuthenticationStrategy,ref('sessionRegistry'))
    simpleRedirectSessionInformationExpiredStrategy(SimpleRedirectSessionInformationExpiredStrategy, '/login/auth')
    concurrentSessionFilter(ConcurrentSessionFilter, ref('sessionRegistry'), ref('simpleRedirectSessionInformationExpiredStrategy'))
}
