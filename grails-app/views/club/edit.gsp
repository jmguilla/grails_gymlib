<%@ page import="com.jmguilla.gymlib.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="default.edit.label" args="['Club']" /></title>
		<r:require modules="angular_app"/>
	</head>
	<body>
		<div class="container" ng-app="gymlib" ng-controller="ClubEdit${params.tab}Ctrl" ng-init="init(${clubInstance.id})">
			<g:render template="/alerts"/>
			<sec:ifLoggedIn roles="ROLE_CLUB_ADMIN">
			<div class="row">
				<g:render template="/user/nav" model="['userInstance': userInstance]"/>
			</div>
			</sec:ifLoggedIn>
			<div class="row">
				<!-- left colum -->
				<div class="col-sm-3 col-md-2">
					<g:render template="edit_menu" model="['activeMenu': params.tab]"/>
				</div>
				<!-- main edit panel -->
				<div class="col-sm-9 col-md-10">
					<g:render template="edit_panel_${params.tab}" model="['activeMenu': params.tab]"/>
				</div>
			</div>
		</div>
	</body>
</html>
