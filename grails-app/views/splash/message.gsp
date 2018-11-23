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
							<li>Bienvenue <sec:username/> ${request.getAttributeNames()}!</li>
							<li class="btn-cta"><a href="#"><span>Mon profil</span></a></li>
						</sec:ifLoggedIn>
					</ul>
				</div>
			</div>
			
		</div>
	</nav>
	
	<header id="gtco-header" class="gtco-cover" role="banner" style="background-image: url('${assetPath(src : "background.jpg")}')">
		<div class="overlay"></div>
		<div class="gtco-container" id="gtco-counter">
			<div class="row row-mt-15em">
				<div class="col-md-12 col-md-offset-0 text-left">

					<div class="row">

						<g:if test="${flash.message}">
						<div class="col-sm-12">
							<span class="counter">Problème! <g:message code="${flash.message}" default="${flash.message}"/></span>
						</div>
						</g:if>
						<g:elseif test="${messageList != null}">
							<h2>Messages échangés avec ${utilisateur.username}</h2>
						<div class="col-md-12 chat-div">
							<div class="panel-body">
								<ul class="chat">
									<g:each in="${messageList}" var="message">
										<g:if test="${utilisateur == message.expediteur}">

											<li class="left clearfix ${message.flag? '' : 'bg-success'}">
												<span class="chat-img pull-left">
													<img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
												</span>
												<div class="chat-body clearfix">
													<div class="header">
														<strong class="primary-font">${message.expediteur.username}</strong> <small class="pull-right text-muted">
														<span class="glyphicon glyphicon-time"></span>${message.dateEnvoi}</small>
													</div>
													<p>
														${message.contenu}
													</p>
												</div>
											</li>
										</g:if>
										<g:else>
											<li class="right clearfix">
												<span class="chat-img pull-right">
													<img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />
												</span>
												<div class="chat-body clearfix">
													<div class="header">
														<small class=" text-muted"><span class="glyphicon glyphicon-time"></span>${message.dateEnvoi}</small>
														<strong class="pull-right primary-font">${message.expediteur.username}</strong>
													</div>
													<p class="pull-right">
														${message.contenu}
													</p>
												</div>
											</li>
										</g:else>
									</g:each>
								</ul>
							</div>
							<g:form action="ecrire" id="${utilisateur.id}">
							<div class="input-group">
								<input name="contenu" id="btn-input" type="text" class="form-control input-sm" placeholder="Taper votre message ici..." />
								<span class="input-group-btn">
									<button class="btn btn-warning btn-sm" id="btn-chat">Envoyer</button>
								</span>
							</div>
							</g:form>
						</div>
						</g:elseif>
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

