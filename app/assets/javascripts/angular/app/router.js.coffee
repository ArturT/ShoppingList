angular.module('App').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"
  $stateProvider.state("search",
    url: "/"
    templateUrl: "templates/shopping_lists.html"
    controller: "ListsController"
  )
  .state("list",
    url: "/list/:id"
    templateUrl: "templates/shopping_list.html"
    controller: "ListController"
  )
