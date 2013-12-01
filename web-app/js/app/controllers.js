'use strict';
/* Controllers */
app.controller('UserCtrl', function($scope, User) {
 	$scope.user = User.me(); 
  $scope.update = function(){
  	
  	$scope.user.$save({},
  	function(value, responseHeaders){
  		$scope.alerts.push({type: value.type, content: value.message});
  		$scope.user = User.me();
  		$scope.submitDisabled = false;
  	},
  	function(response){
  		$scope.alerts.push({type: response.data.type, content: response.data.message});
  		$scope.user = User.me();
  		$scope.submitDisabled = false;
  	});
  };
  $scope.closeAlert = function(index) {
  	$scope.alerts.splice(index, 1);
  };
  $scope.alerts = []
});
//UserCtrl.$inject = ['$scope', 'User'];

app.controller('UserClubsCtrl', function($scope, Club) {
});

app.controller('ClubShowCtrl', function($scope, Club) {
	$scope.init = function(clubId){
		$scope.imagesLoading = true;
		$scope.alerts = []
		$scope.club = Club.get({clubId: clubId},
				function(value, responseHeaders){
					$scope.imagesLoading = false;
					$scope.imagesLoaded = true;
				},
				function(response){
					$scope.imagesLoading = false;
					$scope.imagesNotLoaded = true;
					$scope.alerts.push({type: response.data.type, content: response.data.message});
				});
	}
});

app.controller('ClubEditcontentCtrl', function($scope, Club) {
	$scope.init = function(clubId){
		$scope.alerts = []
		Club.get({clubId: clubId, fields: 'gallery'},
				function(value, responseHeaders){
					$scope.gallery = value.gallery;
					$scope.gallery.medias.forEach(function(entry){
						if(entry.enabled){
							entry['checked'] = 'checked';
						}else{
							entry['checked'] = '';
						}
					});
				},
				function(response){
					$scope.alerts.push({type: response.data.type, content: response.data.message})
				});
	}
	$scope.toggleEnabled = function(media){
		media.enabled = !media.enabled;
	}
});