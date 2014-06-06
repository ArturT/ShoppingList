angular.module('App').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"
  $stateProvider.state("search",
    url: "/"
    templateUrl: "templates/shopping_lists.html"
    controller: "ListsController"
  )
