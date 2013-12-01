<%@ page import="com.jmguilla.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="default.edit.label" args="['Club']" /></title>
		<r:require modules="angular_app"/>
	</head>
	<body>
		<div class="container" ng-app="gymlib" ng-controller="ClubEdit${params.tab}Ctrl" ng-init="init(${clubInstance.id})">
			<div ng-cloak ng-repeat="alert in alerts" class="alert alert-{{alert.type}} alert-dismissable">
				<button ng-click="closeAlert($index)" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				{{alert.content}}
			</div>
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
