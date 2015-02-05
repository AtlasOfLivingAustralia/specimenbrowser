package au.org.ala.specimenbrowser

import groovy.xml.MarkupBuilder

class SBTagLib {

    static namespace = 'sb'

    /**
     * @attr active
     * @attr title
     * @attr href
     */
    def breadcrumbItem = { attrs, body ->
        def active = attrs.active
        if (!active) {
            active = attrs.title
        }
        def current = pageProperty(name:'page.pageTitle')?.toString()

        def mb = new MarkupBuilder(out)
        mb.li(class: active == current ? 'active' : '') {
            a(href:attrs.href) {
                i(class:'icon-chevron-right') { mkp.yieldUnescaped('&nbsp;')}
                mkp.yield(attrs.title)
            }
        }
    }

    def navSeparator = { attrs, body ->
        out << "&nbsp;&#187;&nbsp;"
    }


    def descriptionText = { attrs, body ->
        if(attrs.text) {
            def firstPeriod = attrs.text.indexOf('. ')
            if (firstPeriod > 0) {
                def secondPeriod = attrs.text.indexOf('. ', firstPeriod)
                if (secondPeriod > 0) {
                    out << attrs.text.substring(0, secondPeriod + 1 )
                } else {
                    out << attrs.text
                }
            } else {
                out << attrs.text
            }
        }
    }
}