<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Image viewer | ${params.recordId} | Specimens | Atlas of Living Australia </title>
    <style>
        html, body { height:100%; padding: 0; }
        #imageViewerContainer { height: 100%; padding: 0; }
        #imageViewer { width: 100%; height: 100%; margin: 0; }
        .content { padding-top:0;}
    </style>
    <r:require modules="bootstrap,leaflet,leaflet-draw,image-viewer"/>
    <r:layoutResources/>
    <r:script>
        $(document).ready(function() {
            var options = {
                auxDataUrl : "${createLink(controller: "view", action: "auxData")}/${params.recordId}",
                imageClientBaseUrl : "${grailsApplication.config.contextPath}",
                imageServiceBaseUrl : "${grailsApplication.config.ala.image.service.url}"
            };
            imgvwr.viewImage($("#imageViewer"), "${id}", options);
        });
    </r:script>
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
<r:layoutResources/>
</body>
</html>