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
						<li class="btn-cta"><a href="#"><span>Mon profil</span></a></li>
						<li> <g:link controller="logout">Déconnexion</g:link></a></li>
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
						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
							<h1>Tenter votre chance face aux joueurs.</h1>
							<g:if test="${flash.message}">
								<div style="color:#f6646a;background-color: rgba(0, 0, 0, 0.25);display: inline;padding: .5em;"
									 class="message" role="status">
									<g:message code="${flash.message}" args="${flash.args}" default="${flash.default}"/>
								</div>
							</g:if>
						</div>
						<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<sec:ifNotLoggedIn>
							<div class="form-wrap">
								<div class="tab">
									<ul class="tab-menu">
										<li class="active gtco-first"><a href="#" data-tab="signup">Inscription</a></li>
										<li class="gtco-second"><a href="#" data-tab="login">Connexion</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">
											<g:form name="inscription" url="[controller:'splash',action:'inscription']">
												<div class="row form-group">
													<div class="col-md-12">
														<label for="username">Votre pseudo</label>
														<input type="text" class="form-control" name="username">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password">Votre mot de passe</label>
														<input type="password" class="form-control" name="password">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password2">R&eacute;p&eacute;ter votre mot de passe</label>
														<input type="password" class="form-control" name="confirmPassword">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="photo">Votre Avatar</label>
														<input type="file" class="form-control" name="photo">
													</div>
												</div>

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary" value="Inscription">
													</div>
												</div>
											</g:form>
										</div>

										<div class="tab-content-inner" data-content="login">
											<g:form name="inscription" url="[controller:'login',action:'authenticate']">
												<div class="row form-group">
													<div class="col-md-12">
														<label for="username">Votre pseudo</label>
														<input type="text" class="form-control" name="username">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password">Votre mot de passe</label>
														<input type="password" class="form-control" name="password">
													</div>
												</div>

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary" value="Connexion">
													</div>
												</div>
											</g:form>
										</div>

									</div>
								</div>
							</div>
							</sec:ifNotLoggedIn>
							<sec:ifLoggedIn>
								<span class="intro-text-small"><sec:username/>, bienvenue à Splash, Jeu de chance</span>
								Liste des joueurs
									<ul>
										<g:each in="${secUserList}" var="user">
											<li>${user.username} <g:link action="jouer" id="${user.id}">Jouer</g:link> - <g:link action="message" id="${user.id}">&Eacute;crire</g:link></li>
										</g:each>
									</ul>
							</sec:ifLoggedIn>
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

