<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
            <a class="navbar-brand" href="#">Result Game</a>
        </div>
        <!-- /.navbar-header -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-dashboard fa-fw"></i> Tableau de bord</a>
                    </li>
                    <li>
                        <g:link controller="secUser"><i class="fa fa-user fa-fw"></i> Gestion des user<span class="fa arrow"></span></g:link>
                    </li>
                    <li>
                        <g:link controller="match"><i class="fa fa-gamepad fa-fw"></i> Gestion des matchs<span class="fa arrow"></span></g:link>
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
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Tableau de bord</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">${listAdmin.size()}</div>
                                <div>Administrateur(s)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">${listJoueur.size()}</div>
                                <div>Joueur(s)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-gamepad fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">124</div>
                                <div>Match(s)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-8">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-gamepad fa-fw"></i> Liste des matchs
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th>Joueur</th>
                                            <th>Adversaire</th>
                                            <th>Score joueur</th>
                                            <th>Score adversaire</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        %{--<g:each var="c" in="${listMatch}">
                                            <tr>
                                                <td>${c.joueur}</td>
                                                <td>${c.adversaire}</td>
                                                <td>${c.scoreJ}</td>
                                                <td>${c.scoreA}</td>
                                            </tr>
                                        </g:each>--}%
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.col-lg-4 (nested) -->
                            <div class="col-lg-8">
                                <div id="morris-bar-chart"></div>
                            </div>
                            <!-- /.col-lg-8 (nested) -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-user fa-fw"></i> Liste des admins
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                            <g:each var="c" in="${listAdmin}">
                                <g:link controller="secUser" action="show" id="${c.secUser.id}"  class="list-group-item">
                                    <i class="fa fa-comment fa-fw"></i> ${c.secUser.username}
                                    <span class="pull-right text-muted small">
                                        <g:if test="${c.secRole.authority == 'ROLE_ADMIN'}">
                                            Administrateur
                                        </g:if>
                                        <g:if test="${c.secRole.authority == 'ROLE_JOUEUR'}">
                                            Joueur
                                        </g:if>
                                    </span>
                                </g:link>
                            </g:each>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-user fa-fw"></i> Liste des joueurs
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="list-group">
                        <g:each var="c" in="${listJoueur}">
                            <g:link controller="secUser" action="show" id="${c.secUser.id}" class="list-group-item">
                                <i class="fa fa-comment fa-fw"></i> ${c.secUser.username}
                                <span class="pull-right text-muted small">
                                    <g:if test="${c.secRole.authority == 'ROLE_ADMIN'}">
                                        Administrateur
                                    </g:if>
                                    <g:if test="${c.secRole.authority == 'ROLE_JOUEUR'}">
                                        Joueur
                                    </g:if>
                                </span>
                            </g:link>
                        </g:each>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<asset:stylesheet src="jquery.min.js"/>

<!-- Bootstrap Core JavaScript -->
<asset:stylesheet src="bootstrap.js"/>

<!-- Metis Menu Plugin JavaScript -->
<asset:stylesheet src="metisMenu.min.js"/>

<!-- Morris Charts JavaScript -->
<asset:stylesheet src="raphael.min.js"/>
<asset:stylesheet src="morris.min.js"/>
<asset:stylesheet src="morris-data.js"/>

<!-- Custom Theme JavaScript -->
<asset:stylesheet src="sb-admin-2.js"/>

</body>

</html>
