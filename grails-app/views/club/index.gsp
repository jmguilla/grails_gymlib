<%@ page import="com.jmguilla.Club, com.jmguilla.Activity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="default.list.label" default="All the clubs"/></title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="firstName" title="${message(code: 'user.firstName.label', default: 'First Name')}" />
						<g:sortableColumn property="lastName" title="${message(code: 'user.lastName.label', default: 'Last Name')}" />
						<g:sortableColumn property="phoneNumber" title="${message(code: 'user.phoneNumber.label', default: 'Phone Number')}" />
						<g:sortableColumn property="sha1" title="${message(code: 'user.sha1.label', default: 'Sha1')}" />
						<th><g:message code="user.address.label" default="Address" /></th>
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="dashboard" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "firstName")}</g:link></td>
						<td>${fieldValue(bean: userInstance, field: "lastName")}</td>
						<td>${fieldValue(bean: userInstance, field: "phoneNumber")}</td>
						<td>${fieldValue(bean: userInstance, field: "sha1")}</td>
						<td>${fieldValue(bean: userInstance, field: "address")}</td>
						<td>${fieldValue(bean: userInstance, field: "username")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
