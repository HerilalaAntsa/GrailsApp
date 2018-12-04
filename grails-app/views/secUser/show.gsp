<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="admin" />
        <g:set var="entityName" value="${message(code: 'secUser.label', default: 'Utilisateur')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-utilisateur" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/administrateur')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-utilisateur" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="row">
                <div class="col-sm-2 photo-profil" id="holder">
                        <img class="img-fluid img-thumbnail"  src="${secUser.photo}" alt="" id="pdp-image">
                    <div class="alert alert-danger invisible" id="error-upload"></div>
                </div>
                <div class="col-sm-10">
                    <f:display bean="secUser" except="photo,photoContentType" />
                </div>
            </div>
            <g:form resource="${this.secUser}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" id="${this.secUser.id}" resource="${this.utilisateur}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>

    <script>
        var el = document.getElementById('holder');

        function stop_and_prevent(e) {
            e.stopPropagation();
            e.preventDefault();
        }

        function load_images(files) {
            var images = document.getElementById("pdp-image");
            [].forEach.call(files, function(file) {
                if (file.type.match('image/*')) {
                    var reader = new FileReader();
                        //var img = document.createElement('img');
//                        img.src = event.target.result;
                       // images.src = "/assets/"+file.name;
                    reader.onload = function(){
                        var $data = { 'title': 'Sample Photo Title', 'file': reader.result, 'id':${this.secUser.id} };
                        $.ajax({
                            type: 'POST',
                            url:'${g.createLink( controller:'secUser', action:'uploadPhoto')}',
                            data:$data,
                            success: function(response) {
                                images.src = reader.result;
                            },
                            error: function(response) {
                                var elmt = document.getElementById("error-upload")
                                elmt.innerHTML = "Error while uploading image";
                                elmt.classList.remove("invisible");
                            },
                        });
                    }
                    reader.readAsDataURL(file);
                }
            });
        }

        function onDrop(e) {
            stop_and_prevent(e);
            load_images(e.dataTransfer.files);
            return false;
        }

        el.addEventListener('dragenter', stop_and_prevent);
        el.addEventListener('dragover', stop_and_prevent);
        el.addEventListener('drop', onDrop);
    </script>
    </body>
</html>
