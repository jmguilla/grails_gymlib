'use strict';
/* Services */
angular.module('gymlibServices', ['ngResource']).
factory('User', function($resource){
  return $resource('/gymlib/user/:actionId/:userId.json', {actionId: 'list', userId: '@id'}, {
  	me:{
  		method: 'GET',
  		params: {
  			actionId: 'me',
  			userId: ''
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		}
  	},
	  save: {
		  method: 'POST',
		  params: {
			  actionId: 'update',
			  userId: ''
		  },
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		}
	  }
  });
}).
factory('Club', function($resource){
  return $resource('/gymlib/club/:actionId/:clubId.json', {actionId: '', clubId: '@id'}, {
  	switchEnabled:{
  		method: 'POST',
  		params: {
  			actionId: 'switchEnabled',
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		}
  	}
  });
}).
factory('Gallery', function($resource){
  return $resource('/gymlib/gallery/:actionId/:galleryId.json', {actionId: '', galleryId: '@id'}, {});
});