<!DOCTYPE html>
<html>
<head>
<title><g:message code="gsp.landing.title" defaul="Grails Template landing page" /></title>
<meta name="layout" content="main" />
</head>
<body>
	<div class="container-full">
		<div class="row jumbotron">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<h1><g:message code="gsp.landing.hero.title" default="My hero message"/></h1>
				<p><g:message code="gsp.landing.hero.caption" /></p>
				<p>
				<form class="form-inline" role="form">
				  <div class="form-group col-md-6">
				    <input type="search" class="form-control input-lg" id="userInput" placeholder="${message(code:'gsp.landing.hero.userinput.placeholder')}" />
				  </div>
				  <button type="submit" class="btn btn-primary btn-large btn-contrast input-lg" id="submit_location"><g:message code="Search" default="Search" /></button>
				</form>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
