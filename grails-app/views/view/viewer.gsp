<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Image viewer | ${params.recordId} | Specimens | Atlas of Living Australia </title>
    <style>
        html, body {
            height:100%;
            padding: 0;
        }
        #imageViewerContainer {
            height: 100%;
            padding: 0;
        }
        #imageViewer {
            width: 100%;
            height: 100%;
            margin: 0;
        }
    </style>

    <r:require modules="bootstrap,leaflet,leaflet_draw,image_viewer"/>
    <r:layoutResources/>
    <r:script>
        $(document).ready(function() {
            var options = {
                imageServiceBaseUrl : "${grailsApplication.config.ala.image.baseURL}",
                auxDataUrl : "${createLink(controller: "view", action: "auxData")}/${params.recordId}"
            };
            imgvwr.viewImage($("#imageViewer"), "${id}", options);
        });
    </r:script>
</head>
<body class="content" style="padding-top:0px;">
<div id="imageViewerContainer" class="container-fluid">
    <div id="imageViewer">
    </div>
</div>
<r:layoutResources/>
</body>
</html>