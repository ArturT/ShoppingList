angular.module('App').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/lists"
  $stateProvider.state("lists",
    url: "/lists"
    templateUrl: "templates/shopping_lists.html"
    controller: "ListsController"
  )
  .state("list",
    url: "/lists/:id"
    templateUrl: "templates/shopping_list.html"
    controller: "ListController"
  )
