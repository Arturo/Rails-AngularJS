app.controller('CalendariesController', ['$scope', '$modal', 'Event', function($scope, $modal, Event){
  $scope.events = [];

  Event.query(function(response){
    response.events.forEach(function(event){
      event.start = new Date(event.start_date);
      event.end = new Date(event.end_date);
      $scope.events.push(event);
    });
  });

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
      },
      eventRender: function(event, element) {
      }
      //eventClick: function(calEvent, jsEvent, view) {
      //  alert('Edit Event' + calEvent.title);
      //}
    }
  };

  $scope.eventSources = [$scope.events];

}])

