<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Specimens | Atlas of Living Australia</title>
		<style type="text/css">
			.panel-text { margin-top : 15px; }
		</style>
	</head>
	<body class="nav-collections">
		<div id="breadcrumb">
			<ol class="breadcrumb">
				<li><a href="http://www.ala.org.au">Home</a> <span class="icon icon-arrow-right"></span> <a href="${grailsApplication.config.collectory.baseURL}">Collections</a></li>
				<li> <span class="icon icon-arrow-right"></span> Specimen images</li>
			</ol>
		</div>
		<div id="page-body" role="main">
			<h1>Specimens images from Australia's Natural History collections</h1>
			<p class="lead">Images from Australian Natural History collections made available by the museums and herbaria of Australia</p>
			<g:each in="${collectionsData}" var="collection" status="collectionIdx">
				<g:if test="${collectionIdx == 0 || collectionIdx % 3 == 0}">
					<g:if test="${collectionIdx > 0}">
						</div>
					</g:if>
					<div class="row-fluid">
				</g:if>
				<div class="span4 well">
					<h2>${collection.name}</h2>
					<h3>${collection.institution.name}</h3>
					<g:link controller="browse" params="[id:collection.uid]">
						<img class="img-polaroid" src="${collection.displayCollectionImage}"/>
					</g:link>
					<p class="panel-text">
						${collection.pubDescription}
					</p>
				</div>
			</g:each>
			</div>
		</div>
	</body>
</html>
