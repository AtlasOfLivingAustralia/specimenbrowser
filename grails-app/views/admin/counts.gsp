<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <meta name="breadcrumbs" content="${g.createLink(controller: 'admin', action: 'index')},Admin"/>
        <title>Image Counts - Specimen image browser - Atlas of Living Australia</title>
        <asset:javascript src="admin.js"/>
        <asset:script type="text/javascript">
        var biocacheServicesUrl = "${grailsApplication.config.biocache.servicesUrl}",
            collectoryServicesURL = "${grailsApplication.config.collectory.servicesUrl}",
            browseUrl = "${createLink(controller: 'browse')}";
        </asset:script>
    </head>
    <body>
    <div class="page-header">
        <h1>Image Counts</h1>
        <p>This page displays all collections and data resources that have images associated with them.</p>
    </div>
    <div class="row">
        <div class="col-md-offset-1 col-md-10">
            <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Resource UID</th>
                    <th>Resource</th>
                    <th>Number of images</th>
                </tr>
            <tr id="countLoading">
                <td class="text-center" colspan="3"><asset:image src="ajax-loader.gif"/></td>
            </tr>
            </thead>
            <tbody data-bind="foreach:resources">
                <tr>
                    <td data-bind="text:uid"></td>
                    <td data-bind="text:name"></td>
                    <td><a data-bind="click:gotoBrowse"><span data-bind="text:count"></span></a></td>
                </tr>
            </tbody>
        </table>
    <asset:script type="text/javascript">

        $(document).ready(function() {

            var Resource = function (uid, name, count) {
                var self = this;
                this.uid = uid;
                this.count = count;
                this.name = name;
                this.gotoBrowse = function () {
                    document.location.href = browseUrl + '/' + self.uid;
                };
            };
            var ViewModel = function () {
                var self = this,
                    url = biocacheServicesUrl +
                            '/occurrences/search.json?q=multimedia:Image&facets=collection_uid&facets=data_resource_uid&flimit=-1&pageSize=0';
                this.resources = ko.observableArray();
                $.ajax(url, {
                    dataType: 'jsonp',
                    timeout: 20000
                }).done(function (data) {
                    $.each(data.facetResults, function (i, facet) {
                        $.each(facet.fieldResult, function (idx, item) {
                            var fq = /:"?([^"]+)"?/.exec(item.fq);
                            var uid = fq ? fq[1] : "-";
                            self.resources.push(new Resource(uid, item.label, item.count));
                        });
                    });
                    $("#countLoading").hide();
                });
            };

            var viewModel = new ViewModel();
            ko.applyBindings(viewModel);
        });

    </asset:script>

        </div>
    </div>

    </body>
</html>