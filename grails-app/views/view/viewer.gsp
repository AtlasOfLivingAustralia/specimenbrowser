<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Image </title>
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

    <r:require modules="bootstrap,leaflet,leaflet_draw,viewer"/>
    <r:layoutResources/>
    <r:script>
        $(document).ready(function() {
            var options = {
                imageServiceBaseUrl : "http://images.ala.org.au",
                auxDataUrl : "http://localhost:8080/specimenbrowser/auxData/${params.recordId}"
            };

            imgvwr.viewImage($("#imageViewer"), "${id}", options);
        });
    </r:script>
</head>
<body class="content">
<div id="imageViewerContainer" class="container-fluid">
    <div id="imageViewer">
    </div>
</div>
<r:layoutResources/>
</body>
</html>