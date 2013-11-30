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
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					This is the beautiful page of the club, where you can browse comments, members, coaches and see nice pictures :D!!
				</div>
			</div>
		</div>
	</body>
</html>
