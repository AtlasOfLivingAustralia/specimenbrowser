package au.org.ala.specimenbrowser

import grails.converters.JSON
import groovy.json.JsonOutput
import groovy.json.JsonSlurper

class ViewController {

    def grailsApplication

    def homePage(){
        def collectionsData = []
        def md = new File("/data/specimenbrowser/config/data.json")?.text
        def js = new JsonSlurper()
        def collectionsToRender = js.parseText(md)
        collectionsToRender.each { collection ->
            def collectionMetadata = js.parseText(new URL(grailsApplication.config.collectory.servicesURL + "/collection/" + collection.uid).text)
            collectionMetadata.put("displayCollectionImage", collection.imageUrl)
            collectionsData << collectionMetadata
        }
        [collectionsData: collectionsData]
    }

    def view(String id, String recordId) {
        render view: 'viewer', model:[id: id, recordId: recordId]
    }

    def auxData(){
        def js = new JsonSlurper()
        def json = js.parseText(new URL(grailsApplication.config.biocacheServicesUrl + "/occurrence/" + params.recordId).text)
        def title = "Collection: " + json.processed.attribution.collectionName
        def data = [
                "Scientific name": json.raw.classification.scientificName,
                "Type status": json.raw.identification.typeStatus?:"",
                "Catalog Number": json.raw.occurrence.catalogNumber?:"",
                "Preparations": json.raw.occurrence.preparations?:"",
                "Sex": json.raw.occurrence.sex?:"",
                "Recorded by": json.raw.occurrence.recordedBy?:"",
                "Photographer": json.raw.occurrence.photographer?:"",
                "State": json.processed.location.stateProvince?:"",
                "Country": json.processed.location.country?:""
        ]

        if(json.processed.location.decimalLatitude && json.processed.location.decimalLongitude){
            data.put("Coordinates", json.processed.location.decimalLatitude?:"" + " " + json.processed.location.decimalLongitude?:"")
        }
        if(json.raw.location.locality){
            data.put("Locality", json.raw.location.locality)
        }
        if(json.processed.location.stateProvince){
            data.put("State", json.processed.location.stateProvince)
        }
        if(json.processed.location.country){
            data.put("Country", json.processed.location.country)
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
}
