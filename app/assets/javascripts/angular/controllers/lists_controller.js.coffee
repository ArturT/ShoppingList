angular.module('App.controllers').controller 'ListsController', ($scope, Restangular) ->
  baseLists = Restangular.all('lists')
  $scope.lists = baseLists.getList().$object

  $scope.addList = ->
    list = {name: $scope.newList}
    baseLists.post(list).then((data) ->
      $scope.lists.push(data))

  $scope.remove = (listId) ->
    list = _.find($scope.lists, (list) -> list.id == listId)
    list.remove().then((data) ->
      $scope.lists = _.reject($scope.lists, (l) -> l.id == list.id))
