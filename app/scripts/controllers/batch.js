'use strict';

angular.module('EchoDashboardApp')
  	.controller('BatchCtrl', function ($scope, $routeParams) {
    	$scope.batchId = $routeParams.batchId;
	});

//BatchCtrl.$inject = ['$scope', '$routeParams'];