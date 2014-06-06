angular.module('App.controllers').controller 'ListController', ($scope, Restangular, $stateParams) ->
  $scope.list = Restangular.all('list/' + $stateParams.id).getList().$object

