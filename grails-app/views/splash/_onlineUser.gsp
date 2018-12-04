<%@ page import="mg.grailsapp.model.SecRole" %>
<g:if test="${sec.username() != user?.username}">

    <li>${user?.username} <g:if test="${grails.plugin.springsecurity.SpringSecurityUtils.authoritiesToRoles(user?.authorities).contains('ROLE_JOUEUR')}"><sec:link action="jouer" id="${user?.id}">Jouer</sec:link></g:if> - <sec:link action="messages" id="${user?.id}">&Eacute;crire</sec:link></li>
</g:if>