'use strict';

describe('Controller: BatchesCtrl', function () {

  // load the controller's module
  beforeEach(module('EchoDashboardApp'));

  var BatchesCtrl,
    scope, $httpBackend;

  var batchesResponseJSON = [{id: '642A01A6-A483-44F3-A2F2-A48B1D0FE141'}, {id: '537A01A6-A483-44F3-A2F2-A48B1D0FE6AB'}];

  // Initialize the controller and a mock scope
  beforeEach(inject(function (_$httpBackend_, $rootScope, $controller) {
    $httpBackend = _$httpBackend_;
    $httpBackend.expectGET('batches.json').
        respond(batchesResponseJSON);

    scope = {};
    BatchesCtrl = $controller('BatchesCtrl', {
      $scope: scope
    });
  }));

  it('Should fetch the latest batches for the logged in user', function() {
    expect(scope.batches).toBeUndefined();

    $httpBackend.flush();

    expect(scope.batches).toEqual(batchesResponseJSON);
  });
});