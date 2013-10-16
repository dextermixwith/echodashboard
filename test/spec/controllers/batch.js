'use strict';


describe('Controller: BatchCtrl', function () {

  // load the controller's module
  beforeEach(module('EchoDashboardApp'));

  var BatchCtrl,
    scope;

  var batchId = 'E82EB6DD-F457-4FCE-8003-AFDC66042FC9';

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($rootScope, $routeParams, $controller) {
    scope = $rootScope.$new();
    $routeParams.batchId = batchId; 
    BatchCtrl = $controller('BatchCtrl', { $scope: scope });
  }));

  it('Should have the batch ID correctly set', function () {
    expect(scope.batchId).toBe(batchId);
  });
});
