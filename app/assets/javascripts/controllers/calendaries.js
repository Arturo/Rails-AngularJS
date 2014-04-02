app.controller('CalendariesController', ['$scope', '$modal', function($scope, $modal){
  $scope.events = [];
  //var date = new Date(),
  //    d = date.getDate(),
  //    m = date.getMonth(),
  //    y = date.getFullYear();

  //$scope.events = [
  //  {title: 'All Day Event',start: new Date(y, m, 1)},
  //  {title: 'Long Event',start: new Date(y, m, d - 5),end: new Date(y, m, d - 2)},
  //  {id: 999,title: 'Repeating Event',start: new Date(y, m, d - 3, 16, 0),allDay: false},
  //  {id: 999,title: 'Repeating Event',start: new Date(y, m, d + 4, 16, 0),allDay: false},
  //  {title: 'Birthday Party',start: new Date(y, m, d + 1, 19, 0),end: new Date(y, m, d + 1, 22, 30),allDay: false},
  //  {title: 'Click for Google',start: new Date(y, m, 28),end: new Date(y, m, 29),url: 'http://google.com/'}
  //];

  $scope.uiConfig = {
    calendar:{
      height: 450,
      width: 650,
      editable: true,
      draggable: false,
      header:{
        left: 'month basicWeek basicDay agendaWeek agendaDay',
        center: 'title',
        right: 'today prev,next'
      },
      dayClick: function(date, allDay, jsEvent, view) {
        $modal.open({
          templateUrl: 'templates/new_event.html',
          scope: $scope,
          controller: 'CreateEventController'
        });
      }
    }
  };

  $scope.eventSources = [$scope.events];

}])

app.controller('CreateEventController', ['$scope', '$modalInstance', function($scope, $modalInstance){

  $scope.create = function(event){
    $scope.events.push(event);
    $modalInstance.close();
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
