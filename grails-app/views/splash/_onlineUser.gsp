<g:if test="${sec.username() != user?.username}">
    <li>${user?.username} <sec:link action="jouer" id="${user?.id}">Jouer</sec:link> - <sec:link action="messages" id="${user?.id}">&Eacute;crire</sec:link></li>
</g:if>