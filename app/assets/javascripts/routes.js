app.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise('calendaries');

  $stateProvider
  .state('calendaries', {
    url: '/calendaries',
    templateUrl: '/templates/calendaries.html'
  })

}]);
