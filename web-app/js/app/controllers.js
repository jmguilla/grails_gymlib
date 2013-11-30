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

app.controller('ClubCtrl', function($scope, Club) {
	$scope.switchEnabled = function(id){
		Club.switchEnabled({id: id}, {},
		function(value, responseHeaders){
			
		},
		function(httpResponse){
			
		});
	};
});

