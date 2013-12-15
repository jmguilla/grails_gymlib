<%@ page import="com.jmguilla.gymlib.User" %>
<div class="panel panel-default">
	<div class="panel-heading"><g:message code="gsp.user.profile.edit.mandatory.label" default="Mandatory" /></div>
	<div class="panel-body">
		  <div class="form-group ${hasErrors(bean: userInstance, field: 'email', 'has-error')}">
		    <label for="email" class="col-sm-2 control-label"><g:message code="gsp.user.profile.edit.email.label" default="Email" /></label>
		    <div class="col-sm-10">
		      <input ng-model="user.email" type="text" value="${userInstance?.email}" class="form-control" id="email" placeholder="Email">
		    </div>
		  </div>
		  <div class="form-group ${hasErrors(bean: userInstance, field: 'firstName', 'has-error')}">
		    <label for="firstname" class="col-sm-2 control-label"><g:message code="gsp.user.profile.edit.firstname.label" default="First Name" /></label>
		    <div class="col-sm-10">
		      <input ng-model="user.firstName" type="text" value="${userInstance?.firstName}" class="form-control" id="firstname" placeholder="Firstname">
		    </div>
		  </div>
		  <div class="form-group ${hasErrors(bean: userInstance, field: 'lastName', 'has-error')}">
		    <label for="lastname" class="col-sm-2 control-label"><g:message code="gsp.user.profile.edit.lastname.label" default="Last Name" /></label>
		    <div class="col-sm-10">
		      <input ng-model="user.lastName" type="text" value="${userInstance?.lastName}" class="form-control" id="lastname" placeholder="Lastname">
		    </div>
		  </div>
		  <div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'has-error')}">
		    <label for="username" class="col-sm-2 control-label"><g:message code="gsp.user.profile.edit.username.label" default="User Name" /></label>
		    <div class="col-sm-10">
		      <input ng-model="user.username" type="text" value="${userInstance?.username}" class="form-control" id="username" placeholder="Username">
		    </div>
		  </div>
	</div>
	<div class="panel-heading"><g:message code="gsp.user.profile.edit.optional.label" default="Optional" /></div>
	<div class="panel-body">
		<div class="form-group">
			<label for="facebook" class="col-sm-2 control-label"><g:message code="gsp.user.profile.edit.fb.label" default="Link your FB account"/></label>
			<div class="col-sm-10">
		<sec:ifNotGranted roles="ROLE_FACEBOOK">
				<facebookAuth:connect permissions="email,user_photos" text="Link your FB account"/>
		</sec:ifNotGranted>
		<sec:ifAllGranted roles="ROLE_FACEBOOK">
			<div class="row">
				<div class="col-sm-7">
				<span><g:message code="gsp.user.profile.edit.fb.connected"/></span>
				</div><div class="col-sm-3">
				<span><button type="button" class="btn btn-default"><g:message code="gsp.button.disconnect" default="Disconnect"/></button></span>
				</div>
			</div>
		</sec:ifAllGranted>
			</div>
		</div>
		<div class="form-group ${hasErrors(bean: userInstance, field: 'birthday', 'has-error')}">
		    <label for="birthday" class="col-sm-2 control-label"><g:message code="gsp.user.profile.edit.birthday.label" default="Birth Day" /></label>
		    <div class="col-sm-10">
		      <input ng-model="user.birthday" type="text" value="${userInstance?.birthday}" class="form-control" id="birthday" placeholder="Birthday">
		    </div>
		  </div>
		  <div class="form-group ${hasErrors(bean: userInstance, field: 'phoneNumber', 'has-error')}">
		    <label for="phonenumber" class="col-sm-2 control-label"><g:message code="gsp.user.profile.edit.phonenumber.label" default="Phone Number" /></label>
		    <div class="col-sm-10">
		      <input ng-model="user.phoneNumber" type="text" value="${userInstance?.phoneNumber}" class="form-control" id="phonenumber" placeholder="Phonenumber">
		    </div>
		  </div>
	</div>
</div>
<!-- 
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'sha1', 'error')} ">
	<label for="sha1">
		<g:message code="user.sha1.label" default="Sha1" />
		
	</label>
	<g:textField name="sha1" value="${userInstance?.sha1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="user.address.label" default="Address" />
		
	</label>
	<g:select id="address" name="address.id" from="${com.jmguilla.gymlib.Address.list()}" optionKey="id" value="${userInstance?.address?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fbUser', 'error')} ">
	<label for="fbUser">
		<g:message code="user.fbUser.label" default="Fb User" />
		
	</label>
	<g:select id="fbUser" name="fbUser.id" from="${com.jmguilla.gymlib.oauth.FacebookUser.list()}" optionKey="id" value="${userInstance?.fbUser?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
</div>
 -->
