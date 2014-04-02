app.directive('calendarDirective', function(){
  return {
    replace: true,
    restrict: 'C',
    templateUrl: '/templates/calendar.html',
    controller: 'CalendariesController',
    link: function (scope, element, attrs) {
      $(function() {
        $('#calendar').fullCalendar({
          dayClick: function() {
            alert('a day has been clicked!' + scope);
          }
        })
      });
    }
  }
});
