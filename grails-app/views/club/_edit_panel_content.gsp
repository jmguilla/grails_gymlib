<r:require modules="club_edit_css"/>
<r:require modules="bootstrap_ui"/>
<div class="row bottom-buffer">
<div class="col-xs-12">
	<button class="btn" role="button" ng-click="upload()"><g:message code="gsp.clug.edit.content.upload.label" default="Upload"/></button>
	<button class="btn" role="button" ng-click="save()"><g:message code="gsp.clug.edit.content.save.label" default="Save"/></button>
</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-3 col-md-2" ng-repeat="media in gallery.medias">
		<div class="thumbnail">
			<button ng-disabled="media.deleted" ng-cloak ng-if="media.enabled == true" popover="${message(code:'gsp.clug.edit.content.disable.tooltip')}" popover-trigger="mouseenter" popover-placement="bottom" class="btn btn-primary btn-xs pull-left" role="button" ng-click="toggleEnabled(media)"><span class="glyphicon glyphicon-pause"></span></button>
			<button ng-disabled="media.deleted" ng-cloak ng-if="media.enabled == false" popover="${message(code:'gsp.clug.edit.content.enable.tooltip')}" popover-trigger="mouseenter" popover-placement="bottom" class="btn btn-danger btn-xs pull-left" role="button" ng-click="toggleEnabled(media)"><span class="glyphicon glyphicon-play"></span></button>
			<button ng-disabled="media.deleted" ng-cloak ng-if="media.showDescription == false" ng-click="media.showDescription =! media.showDescription" popover="${message(code:'gsp.clug.edit.content.description.show.tooltip')}" popover-trigger="mouseenter" popover-placement="bottom" class="btn btn-success btn-xs pull-left" role="button" ng-click="toggleEnabled(media)"><span class="glyphicon glyphicon-arrow-down"></span></button>
			<button ng-disabled="media.deleted" ng-cloak ng-if="media.showDescription == true" ng-click="media.showDescription =! media.showDescription" popover="${message(code:'gsp.clug.edit.content.description.hide.tooltip')}" popover-trigger="mouseenter" popover-placement="bottom" class="btn btn-success btn-xs pull-left" role="button" ng-click="toggleEnabled(media)"><span class="glyphicon glyphicon-arrow-up"></span></button>
			<button ng-cloak ng-if="media.deleted == false" ng-click="media.deleted =! media.deleted; media.showDescription = false;" popover="${message(code:'gsp.clug.edit.content.delete.tooltip')}" popover-trigger="mouseenter" popover-placement="bottom" class="btn btn-danger btn-xs pull-right" role="button"><span class="glyphicon glyphicon-remove"></span></button>
			<button ng-cloak ng-if="media.deleted == true" ng-click="media.deleted =! media.deleted; media.showDescription = false;" popover="${message(code:'gsp.clug.edit.content.undelete.tooltip')}" popover-trigger="mouseenter" popover-placement="bottom" class="btn btn-danger btn-xs pull-right" role="button"><span class="glyphicon glyphicon-remove"></span></button>
			<img src="{{media.url}}" class="img-thumbnail" ng-cloack/>
			<div class="caption" ng-cloak ng-if="media.showDescription == true">
				<h3><textarea class="form-control" ng-model="media.header" rows="1"></textarea></h3>
				<p><textarea class="form-control" ng-model="media.description" rows="2"></textarea></p>	
			</div>
		</div>
		<script type="text/javascript">
		$(document).ready(function() {
		  $(".btn").tooltip();
		});
		</script>
	</div>
</div>
