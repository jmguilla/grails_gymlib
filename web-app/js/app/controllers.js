'use strict';
/* Controllers */
app.controller('MainCtrl', function($scope, Club, Gallery) {
  $scope.closeAlert = function(index) {
  	$scope.alerts.splice(index, 1);
  };
  $scope.alerts = []
});

app.controller('UserCtrl', function($scope, User) {
 	$scope.user = User.me(); 
  $scope.update = function(){
  	
  	$scope.user.$save({},
  	function(value, responseHeaders){
  		$scope.alerts.push(value);
  		$scope.user = User.me();
  		$scope.submitDisabled = false;
  	},
  	function(response){
  		$scope.alerts.push(response.data);
  		$scope.user = User.me();
  		$scope.submitDisabled = false;
  	});
  };
});
//UserCtrl.$inject = ['$scope', 'User'];

app.controller('UserClubsCtrl', function($scope, Club) {
});

app.controller('ClubShowCtrl', function($scope, Club) {
	$scope.init = function(clubId){
		$scope.imagesLoading = true;
		$scope.club = Club.get({clubId: clubId},
				function(value, responseHeaders){
					$scope.imagesLoading = false;
					$scope.imagesLoaded = true;
				},
				function(response){
					$scope.imagesLoading = false;
					$scope.imagesNotLoaded = true;
					$scope.alerts.push(response.data);
				});
	}
});

app.controller('ClubEditcontentCtrl', function($scope, Club, Gallery) {
	$scope.init = function(clubId){
		Club.get({clubId: clubId, fields: 'id,gallery'},
				function(value, responseHeaders){
					$scope.club = value;
					$scope.gallery = value.gallery;
					$scope.gallery.medias.forEach(function(entry){
						entry['showDescription'] = false;
						entry['deleted'] = false;
					});
				},
				function(response){
					$scope.alerts.push(response.data)
				});
	};
	
	$scope.save = function(){
		var deletion = false;
		var userConfirm = true;
		$scope.gallery.medias.forEach(function(entry){
			deletion = deletion || entry.deleted;
		});
		if(deletion){
			userConfirm = confirm("Some pictures have been deleted. Continue?")
		}
		if(userConfirm){
			Club.save({actionId: "updateGallery", clubId: $scope.club.id}, $scope.gallery,
					function(value, headers){
						$scope.alerts.push(value);
				  	$scope.init($scope.club.id);
					},
					function(httpResponse){
						$scope.alerts.push(httpResponse.data);
					});
		}
	};
	
	$scope.upload = function(){
		alert('You have to wait a little for that feature')
	};
	
	$scope.toggleEnabled = function(media){
		media.enabled = !media.enabled;
	}
});