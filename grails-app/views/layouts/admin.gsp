<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>
        <g:layoutTitle default="Splash"/>
    </title>

    <asset:stylesheet src="main.css"/>
    <!-- Bootstrap Core CSS -->
    <asset:stylesheet src="bootstrap.css"/>
    <!-- MetisMenu CSS -->
    <asset:stylesheet src="metisMenu.min.css"/>

    <!-- Custom CSS -->
    <asset:stylesheet src="sb-admin-2.min.css"/>

    <!-- Morris Charts CSS -->
    <asset:stylesheet src="morris.css"/>

    <!-- Custom Fonts -->
    <asset:stylesheet src="font-awesome.css"/>
    <asset:stylesheet src="style.css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <g:layoutHead/>
</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${createLink('controller':'administrateur')}">SPLASH.</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> Profile</a>
                    </li>
                    <li class="divider"></li>
                    <li><g:link controller="logout"><i class="fa fa-sign-out fa-fw"></i> Logout</g:link>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <g:link controller="administrateur"><i class="fa fa-dashboard fa-fw"></i> Tableau de bord</g:link>
                    </li>
                    <li>
                        <g:link controller="secUser"><i class="fa fa-user fa-fw"></i> Gestion des utilisateurs<span class="fa arrow"></span></g:link>
                    </li>
                    <li>
                        <g:link controller="matchJoueur"><i class="fa fa-gamepad fa-fw"></i> Gestion des matchs<span class="fa arrow"></span></g:link>
                    </li>
                    <li>
                        <g:link controller="message"><i class="fa fa-comments fa-fw"></i> Gestion des messages<span class="fa arrow"></span></g:link>
                    </li>

                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <div id="page-wrapper">
        <g:layoutBody/>
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<asset:javascript src="jquery-2.2.0.min.js"/>

<!-- Bootstrap Core JavaScript -->
<asset:javascript src="bootstrap.js"/>

<!-- Metis Menu Plugin JavaScript -->
<asset:javascript src="metisMenu.min.js"/>

<!-- Morris Charts JavaScript -->
<asset:javascript src="raphael.min.js"/>
<asset:javascript src="morris.min.js"/>
<asset:javascript src="morris-data.js"/>

<!-- Custom Theme JavaScript -->
<asset:javascript src="sb-admin-2.js"/>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>
</body>

</html>
