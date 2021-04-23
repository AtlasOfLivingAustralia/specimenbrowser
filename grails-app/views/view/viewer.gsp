<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="app.version" content="${g.meta(name:'info.app.version')}"/>
    <meta name="app.build" content="${g.meta(name:'info.app.build')}"/>
    <meta name="description" content="${grailsApplication.config.skin?.orgNameLong?:'Atlas of Living Australia'}"/>
    <meta name="author" content="${grailsApplication.config.skin?.orgNameLong?:'Atlas of Living Australia'}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${grailsApplication.config.skin.favicon}" rel="shortcut icon"  type="image/x-icon"/>
    <title>Image viewer | ${params.recordId} | Specimens | Atlas of Living Australia </title>
    <style>
        html, body { height:100%; padding: 0; }
        #imageViewerContainer { height: 100%; padding: 0; }
        #imageViewer { width: 100%; height: 100%; margin: 0; }
        .content { padding-top:0;}
    </style>
    <link href="${grailsApplication.config.headerAndFooter.baseURL}/css/bootstrap.min.css" rel="stylesheet" media="screen,print"/>
    <link href="${grailsApplication.config.headerAndFooter.baseURL}/css/bootstrap-theme.min.css" rel="stylesheet" media="screen,print"/>
    <link href="${grailsApplication.config.headerAndFooter.baseURL}/css/font-awesome.min.css" rel="stylesheet" media="screen,print"/>
    <link href="${grailsApplication.config.headerAndFooter.baseURL}/css/ala-styles.css" rel="stylesheet" media="screen,print"/>
    <script type="text/javascript" src="${grailsApplication.config.headerAndFooter.baseURL}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${grailsApplication.config.headerAndFooter.baseURL}/js/jquery-migration.min.js"></script>
    <script type="text/javascript" src="${grailsApplication.config.headerAndFooter.baseURL}/js/application.js"></script>
    <script type="text/javascript" src="${grailsApplication.config.headerAndFooter.baseURL}/js/bootstrap.min.js"></script>
    <asset:javascript src="ala/images-client.js"/>
    <asset:stylesheet src="ala/images-client.css" />
    <asset:stylesheet src="viewer.css"/>
    <script type="text/javascript">
        $(document).ready(function() {
            var options = {
                auxDataUrl : "${createLink(controller: "view", action: "auxData")}/${params.recordId}",
                imageClientBaseUrl : "${grailsApplication.config.contextPath}",
                imageServiceBaseUrl : "${grailsApplication.config.ala.image.service.url}"
            };
            imgvwr.viewImage($("#imageViewer"), "${id}", null, null, options);
        });
    </script>
    <auth:ifLoggedIn>
        <meta name="userLoggedIn" content="yes" />
    </auth:ifLoggedIn>
    <auth:ifNotLoggedIn>
        <meta name="userLoggedIn" content="no" />
    </auth:ifNotLoggedIn>
</head>
<body class="content">
<div id="imageViewerContainer" class="container-fluid">
    <div id="imageViewer"></div>
</div>
</body>
</html>