<%@ page import="com.jmguilla.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="default.edit.label" args="['Club']" /></title>
		<r:require modules="club_show_css"/>
		<r:require modules="angular_app"/>
	</head>
	<body>
		<div class="container" ng-app="gymlib" ng-controller="ClubShowCtrl" ng-init="init(${clubInstance.id})">
			<div class="row">
				<div ng-if="imagesLoading" class="col-md-3" id="carousel">
					<img src="${createLink(uri: '/images/standardLoading520x520.jpg')}" />
				</div>
				<div ng-if="imagesNotLoaded" class="col-md-3" id="carousel" ng-cloak>
					<img src="${createLink(uri: '/images/standardNotAvailable330x330.jpg')}" />
				</div>
				<div ng-if="imagesLoaded" class="col-md-3" id="carousel" ng-cloak>
					<div id="carousel-generic" class="carousel slide" data-ride="carousel">
					  <!-- Indicators -->
					  <ol class="carousel-indicators">
					  	<li ng-repeat="media in club.gallery.medias" data-slide-to="$index" ng-class="{active: club.gallery.main.id==media.id}"></li>
					  </ol>
					
					  <!-- Wrapper for slides -->
					  <div class="carousel-inner">
					  	<div class="item" ng-repeat="media in club.gallery.medias" data-slide-to="$index" ng-class="{active: club.gallery.main.id==media.id}">
					  		<img src="{{media.url}}" />
					  		<div class="carousel-caption">
					  			<h3>{{media.header}}</h3>
					  			<p>{{media.description}}</p>
					  		</div>
					  	</div>
					  </div>
					
					  <!-- Controls -->
					  <a class="left carousel-control" href="#carousel-generic" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left"></span>
					  </a>
					  <a class="right carousel-control" href="#carousel-generic" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right"></span>
					  </a>
					</div>
					<div class="center-block text-center">
						See full size and all pictures
					</div>
				</div>
				<div class="col-md-9">
					<div class="row">
						<div class="media" ng-cloak>
							<span class="pull-left"><img src="{{club.owner.thumbnail}}" alt="Owner thumbnail" class="media-object img-thumbnail"/></span>
							<div class="media-body">
								<h4 class="media-heading">Hey! I am {{club.owner.firstName}} and this is my club!</h4>
								&gt;&gt; I am in, you can chat with me!&lt;&lt; Do not hesitate! This club is awesome!<br/>
								Check all nice coaches just down here!<br/>
								And... Do not forget to check all the good reveiws from our members ;-)!!...
							</div>
						</div>
						Owner section, where we can introduce the owner of the club, the opportunity for him to say hello to people
					</div>
					<div class="row">
						<div ng-repeat="coach in club.coaches | limitTo:9" class="col-md-1"><a href="${createLink(controller: 'coach', action: 'show')}/{{coach.id}}"><img src="{{coach.thumbnail}}" alt="{{coach.firstName}} thumbnail" class="media-object img-thumbnail"/></a></div>
					</div>
					<div class="row">
						Maybe, when click on a coach, displaying some stats about him...
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
