'use strict';

angular.module('EchoDashboardApp', [])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/batches', {
        templateUrl: 'views/batches.html',
        controller: 'BatchesCtrl'
      })
      .when('/batch/:batchId', {
        templateUrl: 'views/batch.html',
        controller: 'BatchCtrl'
      })
      .when('/dummy', {
        templateUrl: 'views/dummy.html',
        controller: 'DummyCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
