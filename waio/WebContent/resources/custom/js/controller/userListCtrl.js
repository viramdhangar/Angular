/**
 * 
 */

waioApp.controller('userListCtrl',['$scope','$rootScope','$http',function($scope,$rootScope,$http){
		console.log('asdasdasd');
		console.info('sdfsdf');
		///$state.go('/getUsers');
		var userListData = $http.get('/AngularPOC/users')
			.then(function(item){
				$scope.userList = item.data;
			});
	}
]);