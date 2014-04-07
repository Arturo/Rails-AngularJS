var app = angular.module('app', ['ui.router','xeditable', 'ui.calendar', 'ui.bootstrap', 'ngResource']);

app.run(function(editableOptions) {
  editableOptions.theme = 'bs3';
});
