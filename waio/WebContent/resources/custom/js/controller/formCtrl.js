
waioApp.controller('formCtrl', function($scope, $http) {
    // create a blank object to handle form data.
      $scope.profile = {};
    // calling our submit function.
      $scope.submitForm = function() {
      // Posting data to php file
      $http({
        method  : 'POST',
        url     : '/waio/formSubmit',
        data    : $scope.profile, //forms user object
        headers : {'Content-Type': 'application/json'} 
       })
        .then(function(item) {
        	console.log(item);
        	$scope.profile = item.data;
        	alert('Submitted successfully');
        });
      };
  });