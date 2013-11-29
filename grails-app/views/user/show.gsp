<%@ page import="com.jmguilla.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
<r:require modules="angular_app" />
</head>
<body>
	<div class="container" ng-app="grailsTemplate" ng-controller="UserCtrl">
		<div ng-repeat="alert in alerts"
			class="alert alert-{{alert.type}} alert-dismissable">
			<button ng-click="closeAlert($index)" type="button" class="close"
				data-dismiss="alert" aria-hidden="true">&times;</button>
			{{alert.content}}
		</div>
		<div class="row">
			<div class="col-md-12 top-buffer">
				<div class="jumbotron">
				<h1>
					Hey!!! I am
					${userInstance.username}
				</h1>
				<p>
					on &lt;&lt;And yes, here is the name of the website&gt;&gt;
				</p><p>
					And I am part of the adventure since
					${userInstance.signin}
				</p>
					<p>
						<a class="btn btn-primary btn-lg" role="button">You can contact me by email</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
