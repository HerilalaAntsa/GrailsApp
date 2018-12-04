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
	<asset:stylesheet src="font-awesome.css"/>
	<asset:stylesheet src="theme/chat.css"/>
	<asset:stylesheet src="jquery.toast.min.css"/>

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
			<div class="gtco-container" id="gtco-counter">
				<div class="row row-mt-15em">
					<div class="col-md-12 col-md-offset-0 text-left">

						<div class="row">

							<g:if test="${flash.message}">
								<div class="col-sm-12">
									<span class="counter">Problème! <g:message code="${flash.message}" default="${flash.message}"/></span>
								</div>
							</g:if>
							<g:elseif test="${utilisateur}">
								<h2>Messages échangés avec ${utilisateur.username} ${online? '' : '(Hors ligne)'}</h2>
								<div class="col-md-12 chat-div">
									<div class="panel-body">
										<ul class="chat" id="chat-container">
											<g:each in="${messageList}" var="message">
												<g:if test="${utilisateur == message.expediteur}">
													<g:render template="newMessage" model="[message: message, flag:message.flag]"/>
												</g:if>
												<g:else>
													<g:render template="ecrire" model="[message: message]"/>
												</g:else>
											</g:each>
										</ul>
									</div>
									<g:if test="${online==true}">
										<form action="#" >
											<div class="input-group">
												<textarea name="contenu" id="btn-chat-input" rows="1" class="form-control input-sm" placeholder="Taper votre message ici..."></textarea>
												<span class="input-group-btn">
													<button type="button" class="btn btn-warning btn-sm" id="btn-chat">Envoyer</button>
												</span>
											</div>
										</form>
									</g:if>
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
<!-- Toast -->
<asset:javascript src="jquery.toast.min.js"/>
<!-- countTo -->
<asset:javascript src="theme/jquery.countTo.js"/>
<!-- Magnific Popup -->
<asset:javascript src="theme/jquery.magnific-popup.min.js"/>
<asset:javascript src="theme/magnific-popup-options.js"/>
<!-- Main -->
<asset:javascript src="theme/main.js"/>
<asset:javascript src="message.js"/>
<script>
    var loadUrl = '<g:createLink action="newMessage" absolute="true" id="${utilisateur?.id}"/>' ;
    var sendUrl = '<g:createLink action="ecrire" absolute="true" id="${utilisateur?.id}"/>' ;
    var luUrl = '<g:createLink action="lire" absolute="true" id="${utilisateur?.id}"/>' ;
    var otherMessageUrl = '<g:createLink action="otherMessage" absolute="true" id="${utilisateur?.id}"/>' ;
    var readUrl = '<g:createLink absolute="true" action="messages" id=""/>';
    function loadMessage(data){
        $('#chat-container').append(data);
        scroll();
    }
    function toast(data){
        $.each(data, function( index, value ){
            $.toast({
                heading: value[1] + ' - <a href="' + readUrl + value[0].expediteur.id + '">Lire</a>',
                text: value[0].contenu,
                icon: 'info',
                position: 'top-right',
                loader: true,        // Change it to false to disable loader
                loaderBg: '#ffffff',  // To change the background
                bgColor: '#f54c53',
                textColor: 'white',
                hideAfter: 5000
            })
        })
    }
    function scroll(){
        var height = $('.panel-body')[0].scrollHeight;
        $('.panel-body').scrollTop(height);
    }
    $(document).ready(function () {
        scroll();
        execute(luUrl, function (data) {})
        send($('#btn-chat'), sendUrl, $('#btn-chat-input'), $('#chat-container'), scroll)
        lire($('#btn-chat-input'))
        setInterval(function () {
            execute(loadUrl, loadMessage)
        }, 3000)
        setInterval(function(){
            execute(otherMessageUrl, toast, 'json')
        },3000)
    })
</script>
</body>
</html>

