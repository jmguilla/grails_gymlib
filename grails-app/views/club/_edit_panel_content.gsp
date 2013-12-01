<r:require modules="club_edit_css"/>
<r:require modules="bootstrap_switch"/>
<div class="row">
	<div class="col-md-3" ng-repeat="media in gallery.medias">
		<div class="thumbnail">
			<a ng-cloak ng-if="media.enabled == true" href="#" data-toggle="tooltip" data-original-title="tooltip on top" class="btn btn-primary btn-xs pull-left" role="button" ng-click="toggleEnabled(media)"><span class="glyphicon glyphicon-pause"></span></a>
			<a ng-cloak ng-if="media.enabled == false" href="#" title="The picture is not visible" class="btn btn-danger btn-xs pull-left" role="button" ng-click="toggleEnabled(media)"><span class="glyphicon glyphicon-play"></span></a>
			<a href="#" class="btn btn-danger btn-xs pull-right" role="button"><span class="glyphicon glyphicon-remove"></span></a>
			<img src="{{media.url}}" class="img-thumbnail" ng-cloack/>
			<div class="caption" ng-cloak>
				<h3><textarea class="form-control" ng-model="media.header" rows="1"></textarea></h3>
				<p><textarea class="form-control" ng-model="media.description" rows="2"></textarea></p>	
			</div>
		</div>
	</div>
</div>
