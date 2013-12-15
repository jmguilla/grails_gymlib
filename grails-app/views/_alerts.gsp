<div ng-cloak ng-repeat="alert in alerts" class="col-xs-12 slide alert alert-{{alert.type}} alert-dismissable">
	<button ng-click="closeAlert($index)" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	<span ng-bind-html="alert.content"></span>
</div>