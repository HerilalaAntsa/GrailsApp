
											<li class="right clearfix">
												<span class="chat-img pull-right">
													<img src="${message.expediteur.photo}" alt="${message.expediteur.username} Avatar" class="img-circle img-responsive">
												</span>
												<div class="chat-body clearfix">
													<div class="header">
														<small class=" text-muted"><span class="glyphicon glyphicon-time"></span></span><g:formatDate date="${message.dateEnvoi}" type="datetime" style="MEDIUM"/></small>
														<strong class="pull-right primary-font">${message.expediteur.username}</strong>
													</div>
													<p class="pull-right">
														${message.contenu}
													</p>
												</div>
											</li>