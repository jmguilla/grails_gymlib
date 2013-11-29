<%@ page import="com.jmguilla.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<r:require modules="angular_app"/>
	</head>
	<body>
		<div class="container" ng-app="gymlib" ng-controller="UserCtrl">
			<div ng-cloak ng-repeat="alert in alerts" class="alert alert-{{alert.type}} alert-dismissable">
				<button ng-click="closeAlert($index)" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				{{alert.content}}
			</div>
			<div class="row">
				<g:render template="nav" model="['activeNav': 'profile', 'userInstance': userInstance]"/>
			</div>
			<!-- left colum -->
			<div class="col-md-3 top-buffer">
				<g:render template="profile_menu" model="['activeMenu': params.tab]"/>
			</div>
			<div class="col-md-9 top-buffer">
				<g:if test="${params.tab == 'profile'}">
				<form class="form-horizontal" role="form">
					<fieldset class="form">
						<g:render template="form" model="['userInstance': userInstance]"/>
					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit ng-disabled="submitDisabled" ng-click="submitDisabled = true; update()" class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</fieldset>
				</form>
				</g:if>
				<g:elseif test="${params.tab == 'content'}">
				<div>
				<h3>Here you can manage all your pictures</h3>
				</div>
				</g:elseif>
				<g:elseif test="${params.tab == 'comments'}">
				<div>
				<h3>All your comments at a glance</h3>
				</div>
				</g:elseif>
				<g:elseif test="${params.tab == 'recommendations'}">
				<div>
				<h3>Everything the others say about you</h3>
				</div>
				</g:elseif>
			</div>
		</div>
	</body>
</html>
