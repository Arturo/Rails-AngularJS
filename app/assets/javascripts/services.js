var ResourceFactory = function(resource_name, $resource, options) {
    return $resource('/api/'+resource_name+'/:id', {
        format: 'json', id: '@id'
    }, {
        query: {isArray: false},
        update: {method: 'patch'}
    })
};

app.factory('Event', ['$resource', function($resource){
    return ResourceFactory('events', $resource);
}])

