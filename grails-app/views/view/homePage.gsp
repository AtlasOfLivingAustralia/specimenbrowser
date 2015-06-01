<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Images of specimens | Atlas of Living Australia</title>
	</head>
	<body class="nav-collections">
		<div id="page-body" role="main">
			<h1>Images of specimens from Australia’s Natural History Collections</h1>
			<p class="lead">
				Images from Australia's Natural History collections made available by the museums and herbaria of Australia.<br/>
				To view images from all collections, <g:link controller="browse">click here</g:link>.</p>
			</p>
			<g:each in="${collectionsData}" var="collection" status="collectionIdx">
				<g:if test="${collectionIdx == 0 || collectionIdx % 3 == 0}">
					<g:if test="${collectionIdx > 0}">
						</div>
					</g:if>
					<div class="row-fluid">
				</g:if>
				<div class="span4 well panel">
					<h2><g:link controller="browse" params="[id:collection.uid]">${collection.name}</g:link></h2>
					<h3>${collection.institution.name}</h3>
					<g:link controller="browse" params="[id:collection.uid]">
						<img class="img-polaroid" src="${collection.displayCollectionImage}"/>
					</g:link>
					<p class="panel-text">
						<sb:descriptionText text="${collection.pubDescription}"/>
					</p>
				</div>
			</g:each>
			</div>
		</div>
	</body>
</html>
