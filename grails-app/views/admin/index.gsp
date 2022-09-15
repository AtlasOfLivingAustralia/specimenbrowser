<!doctype html>
<html>
	<head>
		<meta name="layout" content="${grailsApplication.config.skin.layout}"/>
		<meta name="breadcrumbs" content="${g.createLink(controller: 'view', action: 'homePage')},Specimen Images"/>
		<title>Admin - Specimen image browser - Atlas of Living Australia</title>
		<style type="text/css" media="screen">
		</style>
	</head>
  <body>
  <g:if test="${flash.error}">
	  <div class="alert alert-danger" role="alert">${flash.error}</div>
  </g:if>
  <g:if test="${flash.message}">
	  <div class="alert alert-success" role="alert">${flash.message}</div></div>
  </g:if>
  <div class="row">
	  <div class="col-md-offset-1 col-md-10">
		  <ul>
			  <li><g:link controller="admin" action="counts">Counts</g:link></li>
			  <li><g:link controller="admin" action="reloadResources">Reload Resources</g:link></li>
			  <li><g:link controller="alaAdmin" action="index">Application Administration</g:link></li>
		  </ul>
	  </div>
  </div>
  </body>
</html>
