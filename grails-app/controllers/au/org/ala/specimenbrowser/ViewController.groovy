package au.org.ala.specimenbrowser

import grails.config.Config
import grails.core.support.GrailsConfigurationAware
import groovy.json.JsonOutput
import groovy.json.JsonSlurper

class ViewController implements GrailsConfigurationAware {
    def resourceService

    URL biocacheServicesUrl

    def homePage(){
        [collectionsData: resourceService.resources]
    }

    def view(String id, String recordId) {
        render view: 'viewer', model:[id: id, recordId: recordId]
    }

    def auxData(){
        def js = new JsonSlurper()
        def json = js.parse(new URL(biocacheServicesUrl, "occurrence/" + params.recordId))
        def data = [:]
        def title
        if (!json) {
            title = "Unable to retrieve specimen data"
        } else {
            title = "Collection: " + json.processed.attribution.collectionName
            data = [
                    "Scientific name": json.raw.classification.scientificName,
                    "Type status"    : json.raw.identification.typeStatus ?: "",
                    "Catalog Number" : json.raw.occurrence.catalogNumber ?: "",
                    "Preparations"   : json.raw.occurrence.preparations ?: "",
                    "Sex"            : json.raw.occurrence.sex ?: "",
                    "Recorded by"    : json.raw.occurrence.recordedBy ?: "",
                    "Photographer"   : json.raw.occurrence.photographer ?: "",
                    "State"          : json.processed.location.stateProvince ?: "",
                    "Country"        : json.processed.location.country ?: ""
            ]

            if (json.processed.location.decimalLatitude && json.processed.location.decimalLongitude) {
                data.put("Coordinates", json.processed.location.decimalLatitude + " " + json.processed.location.decimalLongitude)
            }
            if (json.raw.location.locality) {
                data.put("Locality", json.raw.location.locality)
            }
            if (json.processed.location.stateProvince) {
                data.put("State", json.processed.location.stateProvince)
            }
            if (json.processed.location.country) {
                data.put("Country", json.processed.location.country)
            }
        }

        def model = [title:title, data:data, link:grailsApplication.config.biocache.baseURL + "/occurrence/" + params.recordId, linkText:"View full record details"]
        def jsOutput = new JsonOutput()
        def output = jsOutput.toJson(model)
        if(params.callback){
            output = params.callback + "(" + output + ");"
        }
        response.setContentType("application/json")
        render output
    }

    @Override
    void setConfiguration(Config config) {
        biocacheServicesUrl = new URL(config.getRequiredProperty("biocache.servicesUrl"))
    }
}
