
waioApp.controller('courseCtrl',['$scope','$rootScope','$http',function($scope,$rootScope,$http){
	console.log('asdasdasd');
	console.info('sdfsdf');
	///$state.go('/getUsers');
	var userListData = $http({
	    url: '/waio/course', 
	    method: "GET",
	    params: {courseId: course.id}
	 })
		.then(function(item){
			console.log(item);
			$scope.course = item.data;
		});
}
]);