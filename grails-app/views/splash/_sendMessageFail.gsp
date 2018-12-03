<li class="right clearfix bg-danger">
    <div class="chat-body clearfix">
        <div class="header">
            <small class=" text-muted"><span class="glyphicon glyphicon-time"></span></span><g:formatDate type="datetime" style="MEDIUM"/></small>
            <strong class="pull-right primary-font"><sec:username/></strong>
        </div>
        <p class="pull-right text-danger">
            <span class="fa fa-warning"></span> Probl&egrave;me! <g:message code="${flash?.message}" default="${flash.message}"/>
        </p>
    </div>
</li>