angular.module('App.controllers').controller 'ListController', ($scope, Restangular, $stateParams) ->
  baseList = Restangular.all('lists')
  $scope.list = baseList.one($stateParams.id).get().$object

