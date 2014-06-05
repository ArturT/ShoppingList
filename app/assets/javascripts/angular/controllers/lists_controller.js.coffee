angular.module('App.controllers').controller 'ListsController', ($scope, Restangular) ->
  Restangular.setBaseUrl('/api/internal');

  $scope.lists = Restangular.all('lists').getList().$object
