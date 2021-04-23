package specimenbrowser

class UrlMappings {

    static mappings = {
        "/browse/$id?"{
            controller = 'browse'
            action = 'index'
            constraints {
                id(validator: {it == null ||
                        it.startsWith('co') ||
                        it.startsWith('dp') ||
                        it.startsWith('dr') ||
                        it.startsWith('in') ||
                        it.startsWith('drt')})
            }
        }


        "/"(controller: 'view', action: 'homePage')
        "/view/auxData/$recordId"(controller: 'view', action: 'auxData')
        "/view/$id"(controller: 'view', action: 'view')
        "/$controller/$action?/$id?"{
            constraints {
                // apply constraints here
            }
        }

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
