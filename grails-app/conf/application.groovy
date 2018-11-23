grails {
	plugin {
		springsecurity {
			filterChain {
				chainMap = [
						[pattern: '/api/**',filters: 'JOINED_FILTERS,-anonymousAuthenticationFilter,-exceptionTranslationFilter,-authenticationProcessingFilter,-securityContextPersistenceFilter,-rememberMeAuthenticationFilter'],
						[pattern: '/**', filters: 'JOINED_FILTERS,-restTokenValidationFilter,-restExceptionTranslationFilter']
				]
			}
			userLookup {
				userDomainClassName = 'mg.grailsapp.model.SecUser'
				authorityJoinClassName = 'mg.grailsapp.model.SecUserRole'
			}
			authority {
				className = 'mg.grailsapp.model.SecRole'
			}
			logout {
				postOnly = false
			}
			controllerAnnotations{
				staticRules = [
						[pattern: '/',                      access: ['permitAll']],
						[pattern: '/error',                 access: ['permitAll']],
						[pattern: '/index',                 access: ['permitAll']],
						[pattern: '/index.gsp',             access: ['permitAll']],
						[pattern: '/shutdown',              access: ['permitAll']],
						[pattern: '/assets/**',             access: ['permitAll']],
						[pattern: '/**/js/**',              access: ['permitAll']],
						[pattern: '/**/css/**',             access: ['permitAll']],
						[pattern: '/**/images/**',          access: ['permitAll']],
						[pattern: '/**/favicon.ico',        access: ['permitAll']]
				]
			}
		}
	}
}