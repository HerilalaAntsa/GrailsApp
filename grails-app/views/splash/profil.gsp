<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Splash &mdash; Jeu de chance</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />


  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->


  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<asset:stylesheet src="theme/animate.css"/>
	<!-- Icomoon Icon Fonts-->
	<asset:stylesheet src="theme/icomoon.css"/>
	<!-- Themify Icons-->
	<asset:stylesheet src="theme/themify-icons.css"/>
	<!-- Bootstrap  -->
	<asset:stylesheet src="theme/bootstrap.css"/>

	<!-- Magnific Popup -->
	<asset:stylesheet src="theme/magnific-popup.css"/>

	<!-- Owl Carousel  -->
	<asset:stylesheet src="theme/owl.carousel.min.css"/>
	<asset:stylesheet src="theme/owl.theme.default.min.css"/>

	<!-- Theme style  -->
	<asset:stylesheet src="theme/style.css"/>
	<asset:stylesheet src="theme/chat.css"/>

	<!-- Modernizr JS -->
	<asset:javascript src="theme/modernizr-2.6.2.min.js"/>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<asset:javascript src="theme/respond.min.js"/>
	<![endif]-->

	</head>
	<body>
		
	<div class="gtco-loader"></div>
	
	<div id="page">

	
	<div class="page-inner">
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div id="gtco-logo"><g:link	action="index">Splash <em>.</em></g:link></div>
				</div>
				<div class="col-xs-8 text-right menu-1">
					<ul>
						<sec:ifLoggedIn>
							<li>Bienvenue <sec:username/>!</li>
									<g:if test="${unread}">
							<li class="has-dropdown btn-cta">
								<a href="#"><span>Mes messages <small class="label label-danger">${unread?.size()}</small></span></a>
								<ul class="dropdown" style="display: none;">
									<g:each in="${unread}" var="message">
									<li>
										<g:link action="message" id="${message.expediteur.id}">
											<strong>${message.expediteur.username}</strong>
											<p>${message.contenu}</p>
										</g:link>
									</li>
									<li class="divider" role="separator"></li>
									</g:each>
								</ul>
							</li>
							</g:if>
							<li class="has-dropdown btn-cta">
								<a href="#">Mon Profil</a>
								<ul class="dropdown" style="display: none;">
									<li><g:link action="profil">Voir</g:link></li>
									<li> <g:link controller="logout">Déconnexion</g:link></li>
								</ul>
							</li>
						</sec:ifLoggedIn>
					</ul>
				</div>
			</div>
			
		</div>
	</nav>
	
	<header id="gtco-header" class="gtco-cover" role="banner" style="background-image: url('${assetPath(src : "background.jpg")}')">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">
					<div class="row row-mt-15em">
						<h2>Match Joués par vous et contre vous</h2>
						<div class="col-md-12 mt-text animate-box chat-div" data-animate-effect="fadeInUp">
							<table class="table table-striped">
								<thead>
								<tr>
									<th>Date</th>
									<th>Joueur</th>
									<th>Adversaire</th>
									<th>Score Joueur</th>
									<th>Score Adversaire</th>
								</tr>
								</thead>
								<tbody>
									<g:render template="matchTemplate" collection="${matchJoueurList}" var="match"/>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>
	</header>


	</div>

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<asset:javascript src="theme/jquery.min.js"/>
	<!-- jQuery Easing -->
	<asset:javascript src="theme/jquery.easing.1.3.js"/>
	<!-- Bootstrap -->
	<asset:javascript src="theme/bootstrap.min.js"/>
	<!-- Waypoints -->
	<asset:javascript src="theme/jquery.waypoints.min.js"/>
	<!-- Carousel -->
	<asset:javascript src="theme/owl.carousel.min.js"/>
	<!-- countTo -->
	<asset:javascript src="theme/jquery.countTo.js"/>
	<!-- Magnific Popup -->
	<asset:javascript src="theme/jquery.magnific-popup.min.js"/>
	<asset:javascript src="theme/magnific-popup-options.js"/>
	<!-- Main -->
	<asset:javascript src="theme/main.js"/>

	</body>
</html>

