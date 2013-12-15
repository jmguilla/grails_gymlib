<%@ page import="com.jmguilla.gymlib.User" %>
<ul class="nav nav-pills nav-stacked">
	<li class="${activeMenu == 'profile' ? 'active' : '' }">
		<!-- TODO internationalization --> <a href="${createLink(controller: 'user', action: 'edit', id: userInstance.id, params: [tab: 'profile']) }"><span><g:message
					code="gsp.user.profile.menu.profile.label" default="Profile" /></span></a>
	</li>
	<li class="${activeMenu == 'content' ? 'active' : '' }"><a href="${createLink(controller: 'user', action: 'edit', id: userInstance.id, params: [tab: 'content']) }"><span><g:message
					code="gsp.user.profile.menu.content.label"
					default="Pictures & Videos" /></span></a></li>
	<li class="${activeMenu == 'comments' ? 'active' : '' }"><a href="${createLink(controller: 'user', action: 'edit', id: userInstance.id, params: [tab: 'comments']) }"><span><g:message
					code="gsp.user.profile.menu.comments.label" default="Comments" /></span></a></li>
	<li class="${activeMenu == 'recommendations' ? 'active' : '' }"><a href="${createLink(controller: 'user', action: 'edit', id: userInstance.id, params: [tab: 'recommendations']) }"><span><g:message
					code="gsp.user.profile.menu.recommendations.label"
					default="Recommendations" /></span></a></li>
</ul>