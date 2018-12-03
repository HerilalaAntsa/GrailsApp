package grailsapp

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        group "/administrateur", {
            group "/message", {
                "/$action?/$id?"(controller:"message")
            }
            group "/utilisateur", {
                "/$action?/$id?"(controller:"secUser")
            }
            group "/match", {
                "/$action?/$id?"(controller:"matchJoueur")
            }
        }
        "/$action?/$id?(.$format)?"(controller:"splash")
        "/login/auth"(redirect: [controller: 'splash', action: 'index', keepParamsWhenRedirect: true])
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
