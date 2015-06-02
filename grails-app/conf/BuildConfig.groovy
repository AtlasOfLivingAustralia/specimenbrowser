grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

//grails.plugin.location."images-client-plugin" = "../images-client-plugin"
// uncomment (and adjust settings) to fork the JVM to isolate classpaths
grails.project.fork = [
        test: false,
        run: false,
        war: false,
        console: false
]

grails.project.dependency.resolver = "maven"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        mavenLocal()
        mavenRepo("http://nexus.ala.org.au/content/groups/public/"){
            updatePolicy 'always'
        }
    }

    dependencies {

    }

    plugins {
        runtime ":ala-bootstrap2:2.2"
        runtime ":images-client-plugin:0.5.3"
        compile ':cache:1.1.8'
        compile ':ala-auth:1.3.1'
        build ':tomcat:7.0.54'
    }
}
