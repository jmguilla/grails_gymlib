<%@ page import="com.jmguilla.gymlib.Club" %>
<ul class="nav nav-pills nav-stacked">
	<li class="${activeMenu == 'description' ? 'active' : '' }"><a href="${createLink(controller: 'club', action: 'edit', id: clubInstance.id, params: [tab: 'description']) }"><span><g:message
					code="gsp.club.edit.menu.description.label" default="Description" /></span></a></li>
	<li class="${activeMenu == 'content' ? 'active' : '' }"><a href="${createLink(controller: 'club', action: 'edit', id: clubInstance.id, params: [tab: 'content']) }"><span><g:message
					code="gsp.club.edit.menu.content.label" default="Pictures & Videos" /></span></a></li>
	<li class="${activeMenu == 'coaches' ? 'active' : '' }"><a href="${createLink(controller: 'club', action: 'edit', id: clubInstance.id, params: [tab: 'coaches']) }"><span><g:message
					code="gsp.club.edit.menu.coaches.label" default="Coaches" /></span></a></li>
	<li class="${activeMenu == 'members' ? 'active' : '' }"><a href="${createLink(controller: 'club', action: 'edit', id: clubInstance.id, params: [tab: 'members']) }"><span><g:message
					code="gsp.club.edit.menu.members.label" default="Members" /></span></a></li>
	<li class="${activeMenu == 'comments' ? 'active' : '' }"><a href="${createLink(controller: 'club', action: 'edit', id: clubInstance.id, params: [tab: 'comments']) }"><span><g:message
					code="gsp.club.edit.menu.comments.label" default="Comments" /></span></a></li>   
</ul>