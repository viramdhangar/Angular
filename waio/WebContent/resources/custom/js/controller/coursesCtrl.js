
waioApp.controller('coursesCtrl',['$scope','$rootScope','$http',function($scope,$rootScope,$http){
		console.log('asdasdasd');
		console.info('sdfsdf');
		///$state.go('/getUsers');
		$scope.save = function() {
			console.log('id ccc'+id);
		    $scope.id = $scope.course.id;
		    alert(id);
		    console.log('id'+id);
		    $scope.disableEditor();
		  };
		var userListData = $http.get('/waio/courses')
			.then(function(item){
				console.log(item);
				$scope.courseList = item.data;
			});
		
	}
]);

waioApp.controller('courseCtrl',['$scope','$rootScope','$http',function($scope,$http,$routeParams){
	
	console.info('in course');
	
	var userListData = $http({
	    url: '/waio/course/:courseId', 
	    method: "GET"
	 })
		.then(function(item){
			console.log(item);
			$scope.course = item.data;
		});
}
]);