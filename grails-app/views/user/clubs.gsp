<%@ page import="com.jmguilla.gymlib.User" %>
<%@ page import="com.jmguilla.gymlib.Club" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="gsp.user.clubs.title" args="[userInstance.username]" /></title>
		<r:require modules="bootstrap_switch"/>
		<r:require modules="angular_app"/>
		<r:require modules="user_clubs_css"/>
	</head>
	<body>
		<div class="container" ng-app="gymlib" ng-controller="UserClubsCtrl">
			<div class="row">
				<g:render template="nav" model="['activeNav': 'clubs', 'userInstance': userInstance]"/>
			</div>
			<div class="row">
				<div class="col-md-12">
				<table class="table table-hover">
				<g:each in="${clubs}">
					<tr>
					 	<td>
					 	<a href="${createLink(controller: 'club', action: 'show', id: it.id)}">
						 	<img src="${(it.gallery?.main?.url)?(it.gallery.main.url):'http://lorempixel.com/g/140/140/city/'}" alt="Main image" class="img-thumbnail" />
					 	</a>
					 	</td>
					 	<td>
					 	<div class="row">
							 	<div class="col-md-12">
							 		some stats about the club, how many people, number of courses, opening hours...
							 	</div>
							 	<div class="col-md-12">
							 		with some nice pictures and graphs
							 	</div>
							 	<div class="col-md-12">
							 		<form style='display:inline;' action="${createLink(controller: 'club', action: 'show', id: it.id)}">
								 		<button type="submit" class="btn btn-default btn-xs"><g:message code="Show" default="Show"/></button>
							 		</form>
							 		<form style='display:inline;' action="${createLink(controller: 'club', action: 'edit', id: it.id)}">
							 			<button type="submit" class="btn btn-default btn-xs"><g:message code="Edit" default="Edit"/></button>
							 		</form>	
							 		<div class="make-switch switch-mini" data-on="primary" data-off="danger" data-on-label="${message(code: 'enabled', default: 'enabled')}" data-off-label="${message(code: 'disabled', default: 'disabled')}">
									    <input id="toggleEnabled${it.id}" ng-model="clubs[${it.id}]" ng-click="switchEnabled(${it.id})" type="checkbox" ${it.enabled? 'checked' : ''} >
									</div>
							 	</div>
					 	</div>
					 	</td>
					</tr>
				</g:each>
				</table>
				</div>
			</div>
		</div>
	</body>
</html>
