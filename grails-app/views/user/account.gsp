<%@ page import="com.jmguilla.gymlib.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<r:require modules="angular_app"/>
	</head>
	<body>
		<div class="container" ng-controller="UserCtrl">
			<div class="row">
				<g:render template="nav" model="['activeNav': 'account', 'userInstance': userInstance]"/>
			</div>
			<div class="row">
				<div class="col-md-12">
					<span>Everything related to the user's account.</span>
				</div>
			</div>
		</div>
	</body>
</html>
