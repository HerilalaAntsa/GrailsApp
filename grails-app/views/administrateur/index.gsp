<!DOCTYPE html>
<html lang="en">

<head>

    <meta name="layout" content="admin">

    <title>Bienvenue administrateur, <sec:username/> </title>

</head>

<body>

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
                                <i class="fa fa-dashboard fa-5x"></i>
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
                                <i class="fa fa-group fa-5x"></i>
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
                                <div class="huge">${matchCount}</div>
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
                                            <th>Date</th>
                                            <th>Joueur</th>
                                            <th>Adversaire</th>
                                            <th>Score joueur</th>
                                            <th>Score adversaire</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each var="c" in="${listMatch}">
                                            <tr>
                                                <td><g:formatDate date="${c.dateMatch}" type="datetime" style="MEDIUM"/></td>
                                                <td>${c.joueur.username}</td>
                                                <td>${c.adversaire.username}</td>
                                                <td><g:formatNumber number="${c.scoreJ}" type="number"
                                                                    maxFractionDigits="2" roundingMode="HALF_DOWN" /></td>
                                                <td><g:formatNumber number="${c.scoreA}" type="number"
                                                                    maxFractionDigits="2" roundingMode="HALF_DOWN" /></td>
                                            </tr>
                                        </g:each>
                                        </tbody>
                                    </table>
                                </div>

                                <ul class="pagination">
                                    <g:paginate  total="${matchCount ?: 0}" />
                                </ul>
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
                                        Administrateur
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
                                    Joueur
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

</body>

</html>
