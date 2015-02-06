<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Specimens | Atlas of Living Australia</title>
		<style type="text/css">
			.panel-text { margin-top : 15px; font-size: 15px; line-height: 1.5em;}
			.panel h2 { line-height: 1.2em; }
			.panel h3 { line-height: 1.2em; }
		</style>
	</head>
	<body class="nav-collections">
		%{--<div id="breadcrumb">--}%
			%{--<ol class="breadcrumb">--}%
				%{--<li><a href="http://www.ala.org.au">Home</a></li>--}%
				%{--<li> <span class="icon icon-arrow-right"></span> Specimen images</li>--}%
			%{--</ol>--}%
		%{--</div>--}%
		<div id="page-body" role="main">
			<h1>Specimens images from Australia's Natural History collections</h1>
			<p class="lead">
				Images from Australian Natural History collections made available by the museums and herbaria of Australia.<br/>
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
