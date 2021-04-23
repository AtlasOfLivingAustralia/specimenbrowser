package au.org.ala.specimenbrowser

import au.org.ala.web.AlaSecured
import au.org.ala.web.CASRoles

@AlaSecured(CASRoles.ROLE_ADMIN)
class AdminController {
    def resourceService

    def index() {}

    def counts() {}

    def reloadResources() {
        resourceService.buildResources()
        flash.message = "Resource configuration reloaded"
        redirect controller: 'admin', action: 'index'
    }
}
