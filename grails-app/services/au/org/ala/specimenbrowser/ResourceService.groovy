package au.org.ala.specimenbrowser

import grails.config.Config
import grails.core.support.GrailsConfigurationAware
import groovy.json.JsonSlurper

class ResourceService implements GrailsConfigurationAware {
    /** The location of the resource configuration file */
    URL resourceConfigurationUrl
    /** The location of the collectory web services */
    URL collectoryServicesUrl
    /** The mappsings from collectory UIDs to resource types, eg co -> collection, dr -> dataResource */
    List resourceMappings
    /** The list of resource metadata for each resource that is displayed */
    List resources

    /**
     * Collect the resource information
     */
    def buildResources() {
        resources = []
        def js = new JsonSlurper()
        def collectionsToRender = js.parse(resourceConfigurationUrl)
        collectionsToRender.each { collection ->
            def path = resourcePath(collection.uid)
            def metadataUrl = new URL(collectoryServicesUrl, path + "/" + collection.uid)
            try {
                def collectionMetadata = js.parse(metadataUrl)
                collectionMetadata.put("displayCollectionImage", collection.imageUrl)
                this.resources << collectionMetadata
            } catch (Exception ex) {
                log.error("Unable to access while building collections " + metadataUrl, ex)
            }
        }
    }


    /**
     * Get the path to the resource in the collectory, based on the resource UID prefix
     *
     * @param uid The resource UID (eg. co12, dr1456)
     * @return The path to that resource (eg collection, dataResource)
     */
    String resourcePath(String uid) {
        def mapping = resourceMappings.find { m -> uid.startsWith(m.prefix) }
        if (mapping)
            return mapping.path
        throw new IllegalArgumentException("Unable to find collectory path for " + uid)
    }

    @Override
    void setConfiguration(Config config) {
        resourceConfigurationUrl = new URL(config.getRequiredProperty("specimenbrowser.data.url"))
        collectoryServicesUrl = new URL(config.getRequiredProperty("collectory.servicesUrl"))
        resourceMappings = config.getRequiredProperty("collectory.resourceMapping", List)
        buildResources()
    }

}
