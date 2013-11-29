<%@ page import="com.jmguilla.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title><g:message code="gsp.user.dashboard.title" /></title>
</head>
<body>
	<div class="container">
		<div class="row">
			<g:render template="nav" model="['activeNav': 'dashboard', 'userInstance': userInstance]"/>
		</div>
		<div class="row top-buffer"">
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="http://lorempixel.com/300/300/sports/"/>
					<div class="caption">
						<h3>
							<a href="${createLink(controller: 'user', action: 'show', id: userInstance.id) }">
								<g:if test="${userInstance?.firstName}">
									<g:fieldValue bean="${userInstance}" field="firstName" />
								</g:if>
								<g:elseif test="${userInstance?.username}">
									<g:fieldValue bean="${userInstance}" field="username" />
								</g:elseif>
								<g:elseif test="${userInstance?.lastName}">
									<g:fieldValue bean="${userInstance}" field="lastName" />
								</g:elseif>
							</a>
						</h3>
						<a href="${createLink(controller: 'user', action: 'edit', id: userInstance.id) }">
							<g:message code="gsp.user.dashboard.modifyprofile.link" defaul="Modify your profile"/>
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				Here is a place which could be used like a dashboard for the user. All the interesting activity of the website at a glance!
			</div>
		</div>
	</div>
	<!-- 
		<div id="show-user" class="content scaffold-show" role="main">
					<ol class="property-list user">
						<g:if test="${userInstance?.firstName}">
						<li class="fieldcontain">
							<span id="firstName-label" class="property-label"><g:message code="user.firstName.label" default="First Name" /></span>
							
								<span class="property-value" aria-labelledby="firstName-label"></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.lastName}">
						<li class="fieldcontain">
							<span id="lastName-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span>
							
								<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userInstance}" field="lastName"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.phoneNumber}">
						<li class="fieldcontain">
							<span id="phoneNumber-label" class="property-label"><g:message code="user.phoneNumber.label" default="Phone Number" /></span>
							
								<span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${userInstance}" field="phoneNumber"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.sha1}">
						<li class="fieldcontain">
							<span id="sha1-label" class="property-label"><g:message code="user.sha1.label" default="Sha1" /></span>
							
								<span class="property-value" aria-labelledby="sha1-label"><g:fieldValue bean="${userInstance}" field="sha1"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.address}">
						<li class="fieldcontain">
							<span id="address-label" class="property-label"><g:message code="user.address.label" default="Address" /></span>
							
								<span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show" id="${userInstance?.address?.id}">${userInstance?.address?.encodeAsHTML()}</g:link></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.username}">
						<li class="fieldcontain">
							<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
							
								<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.password}">
						<li class="fieldcontain">
							<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
							
								<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.fbUser}">
						<li class="fieldcontain">
							<span id="fbUser-label" class="property-label"><g:message code="user.fbUser.label" default="Fb User" /></span>
							
								<span class="property-value" aria-labelledby="fbUser-label"><g:link controller="facebookUser" action="show" id="${userInstance?.fbUser?.id}">${userInstance?.fbUser?.encodeAsHTML()}</g:link></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.accountExpired}">
						<li class="fieldcontain">
							<span id="dashboardExpired-label" class="property-label"><g:message code="user.dashboardExpired.label" default="dashboard Expired" /></span>
							
								<span class="property-value" aria-labelledby="dashboardExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.accountLocked}">
						<li class="fieldcontain">
							<span id="dashboardLocked-label" class="property-label"><g:message code="user.dashboardLocked.label" default="dashboard Locked" /></span>
							
								<span class="property-value" aria-labelledby="dashboardLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.email}">
						<li class="fieldcontain">
							<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
							
								<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.enabled}">
						<li class="fieldcontain">
							<span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>
							
								<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}" /></span>
							
						</li>
						</g:if>
					
						<g:if test="${userInstance?.passwordExpired}">
						<li class="fieldcontain">
							<span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>
							
								<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span>
							
						</li>
						</g:if>
					
					</ol>
					<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
				 -->
</body>
</html>
