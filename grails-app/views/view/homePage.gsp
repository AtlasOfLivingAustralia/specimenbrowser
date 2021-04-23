<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Images of specimens | Atlas of Living Australia</title>
</head>

<body class="nav-collections">
<div class="page-header">
    <h1>Images of specimens from Australia’s Natural History Collections</h1>

    <p class="lead">
        Images from Australia's Natural History collections made available by the museums and herbaria of Australia.<br/>
        To view images from all collections, <g:link controller="browse">click here</g:link>.</p>
    </p>
    <auth:ifAllGranted roles="ROLE_ADMIN">
        <g:link controller="admin" action="index">Admin</g:link>
    </auth:ifAllGranted>
</div>
<g:each in="${collectionsData}" var="collection" status="collectionIdx">
    <g:if test="${collectionIdx % 3 == 0}"><div class="clearfix"></div></g:if>
    <div class="col-xs-12 col-md-4">
        <div class="thumbnail">
            <h2><g:link controller="browse" params="[id: collection.uid]">${collection.name}</g:link></h2>
            <g:if test="${collection.institution}"><h3>${collection.institution.name}</h3></g:if>
            <g:link controller="browse" params="[id: collection.uid]">
                <img class="img-responsive" src="${collection.displayCollectionImage}"/>
            </g:link>
            <p class="panel-text">
                <sb:descriptionText text="${collection.pubDescription}"/>
            </p>
        </div>
    </div>
</g:each>
</div>
</body>
</html>
