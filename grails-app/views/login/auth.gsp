<html>
<head>
<meta name='layout' content='main' />
<title><g:message code="springSecurity.login.title" /></title>
<r:require modules="auth_css" />
</head>
<body>
	<div class="top-buffer">
		<div class="col-sm-offset-4 col-sm-4">
			<div class="panel panel-info">
				<div class="panel-heading text-center">
					<g:message code="gsp.signin.header" default="Login" />
				</div>
				<div class="panel-body">
					<g:if test='${flash.message}'>
						<div class='alert alert-danger alert-dismissable'>
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							${flash.message}
						</div>
					</g:if>
					<sec:ifNotGranted roles="ROLE_USER">
						<div class="text-center">
							<facebookAuth:connect permissions="email,user_photos" />
						</div>
					</sec:ifNotGranted>
					<hr />
					<div class="text-center">-- or --</div>
					<form action="${postUrl}" method="POST" role="form" class="form-horizontal">
						<div class="form-group">
							<label for="username" class="col-md-2 control-label">Email</label>
							<div class="col-md-10">
								<input type="email" class="form-control" name='j_username'
									id="username" placeholder="Email" />
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-md-2 control-label">Pwd</label>
							<div class="col-md-10">
								<input type="password" class="form-control" name='j_password'
									id="password" placeholder="Password" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-2">
								<div class="checkbox">
									<label><input name='${rememberMeParameter}'
										id="remember_me" type="checkbox"
										<g:if test='${hasCookie}'>checked='checked'</g:if>> <g:message
											code="gsp.signin.remember.me.label" /> </label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-2">
								<button type="submit" id="submit" class="btn btn-default">
									<g:message code="gsp.signin.connection.button.label"
										default="Connection" />
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
