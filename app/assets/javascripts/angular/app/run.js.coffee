angular.module('App').run ($compile, $rootScope, $document, Restangular) ->
  Restangular.setBaseUrl('/api/internal');

  $document.on 'page:load', ->
    body = angular.element('body')
    compiled = $compile(body.html())($rootScope)
    body.html(compiled);
