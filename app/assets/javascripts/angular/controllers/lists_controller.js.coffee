angular.module('App.controllers').controller 'ListsController', ($scope, Restangular) ->
  $scope.lists = Restangular.all('lists').getList().$object
