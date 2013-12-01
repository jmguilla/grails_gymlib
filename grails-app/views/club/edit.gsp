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
			<div class="row">
				<!-- left colum -->
				<div class="col-md-3">
					<g:render template="edit_menu" model="['activeMenu': params.tab]"/>
				</div>
				<!-- main edit panel -->
				<div class="col-md-9">
					<g:render template="edit_panel_${params.tab}" model="['activeMenu': params.tab]"/>
				</div>
			</div>
		</div>
	</body>
</html>
