<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'secUser.label', default: 'Utilisateur')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-utilisateur" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><g:link class="home" controller="administrateur"><g:message code="default.home.label"/></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-utilisateur" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th></th>
                    <th></th>
                    <th>Nom</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="c" in="${secUserList}">
                    <tr>
                        <td>${c.id}</td>
                        <td><img class="img-fluid"  src="${c.photo}" alt="" id="pdp-image" width="30px"></td>
                        <td><g:link controller="secUser" action="show" id="${c.id}">${c.username}</g:link></td>
                    </tr>
                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${utilisateurCount ?: 0}" />
            </div>
        </div>
    </body>
</html>