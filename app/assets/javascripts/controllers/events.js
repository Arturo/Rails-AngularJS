app.controller('CreateEventController', ['$scope', '$modalInstance', 'Event', function($scope, $modalInstance, Event){

  $scope.create = function(event){
    Event.save(event, function(response){
      event.start = new Date(event.start_date);
      event.end = new Date(event.end_date);
      $scope.events.push(event);
      $modalInstance.close();
    });
  }

  $scope.dateOptions = {
    'year-format': "'yy'",
    'starting-day': 1
  };

  $scope.formats = ['yyyy-MM-dd', 'yyyy/MM/dd', 'shortDate'];
  $scope.format = $scope.formats[0];

  $scope.cancel = function(){
    $modalInstance.close();
  }

}])
