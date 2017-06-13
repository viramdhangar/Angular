
waioApp.controller('memberCtrl',['$scope','$rootScope','$http',function($scope,$rootScope,$http){
		console.log('asdasdasd');
		console.info('sdfsdf');
		///$state.go('/getUsers');
		var userListData = $http.get('/waio/members')
			.then(function(item){
				console.log(item);
				$scope.profileList = item.data;
			});
	}
]);