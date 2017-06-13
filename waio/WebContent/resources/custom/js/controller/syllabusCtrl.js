
waioApp.controller('syllabusCtrl',['$scope','$rootScope','$http',function($scope,$rootScope,$http){
		console.log('asdasdasd');
		console.info('sdfsdf');
		///$state.go('/getUsers');
		var userListData = $http.get('/waio/syllabus')
			.then(function(item){
				console.log(item);
				$scope.syllabusList = item.data;
			});
	}
]);