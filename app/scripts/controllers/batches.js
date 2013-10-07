'use strict';

angular.module('EchoDashboardApp')
  .controller('BatchesCtrl', function ($scope, $http) {
  	$http.get('batches.json').success(function(data){
  		$scope.batches = data;
  	});
  });
