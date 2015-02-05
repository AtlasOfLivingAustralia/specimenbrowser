package au.org.ala.specimenbrowser

import grails.converters.JSON
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

    def index() {
        render view: 'view', model: [imageId: 'be0947a6-23e5-4c9d-acf3-c2855c9cc3ba']
    }

    def view(String id, String title, String common, String recordId) {
        [id: id, title: title, common: common, recordId: recordId]
    }
}
