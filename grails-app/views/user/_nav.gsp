<!-- my account banner -->
<g:if test="${flash.message}">
	<div class="message" role="status">
		${flash.message}
	</div>
</g:if>
<g:if test="${flash.error}">
	<div class="error" role="status">
		${flash.error}
	</div>
</g:if>
<ul class="nav nav-tabs nav-justified top-buffer bottom-buffer">
	<li class="${activeNav == 'dashboard' ? 'active' : '' }"><a href="${activeNav == 'dashboard' ? '#': g.createLink(controller: 'user', action: 'dashboard', id: userInstance.id)}"><g:message code="gsp.user.dashboard.nav.dashboard.label" default="Dashboard"/></a></li>
	<li class="${activeNav == 'profile' ? 'active' : '' }"><a href="${activeNav == 'profile' ? '#': g.createLink(controller: 'user', action: 'edit', id: userInstance.id)}"><g:message code="gsp.user.dashboard.nav.profile.label" default="Profile"/></a></li>
	<li class="${activeNav == 'account' ? 'active' : '' }"><a href="${activeNav == 'account' ? '#': g.createLink(controller: 'user', action: 'account', id: userInstance.id)}"><g:message code="gsp.user.dashboard.nav.account.label" default="Account"/></a></li>
	<sec:ifAllGranted roles="ROLE_CLUB_ADMIN">
	<li class="${activeNav == 'clubs' ? 'active' : '' }"><a href="${activeNav == 'clubs' ? '#': g.createLink(controller: 'user', action: 'clubs', id: userInstance.id)}"><g:message code="gsp.user.dashboard.nav.clubs.label" default="My Clubs"/></a></li>
	</sec:ifAllGranted>
</ul>