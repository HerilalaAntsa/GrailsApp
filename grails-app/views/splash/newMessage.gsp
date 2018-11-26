											<g:each in="${messageList}" var="message">
												<li class="left clearfix bg-success">
													<span class="chat-img pull-left">
														<img src="${message.expediteur.photo}" alt="${message.expediteur.username} Avatar" class="img-circle img-responsive">
													</span>
													<div class="chat-body clearfix">
														<div class="header">
															<strong class="primary-font">${message.expediteur.username}</strong> <small class="pull-right text-muted">
															<span class="glyphicon glyphicon-time"></span><g:formatDate date="${message.dateEnvoi}" type="datetime" style="MEDIUM"/></small>
														</div>
														<p>
															${message.contenu}
														</p>
													</div>
												</li>
											</g:each>