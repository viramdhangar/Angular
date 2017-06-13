'use strict';

waioApp.config(['$routeProvider', function($routeProvider) {
	$routeProvider
		.when('/home/', {
			templateUrl: 'resources/custom/templates/home/home.html'
		})
		.when('/about/', {
			templateUrl: 'resources/custom/templates/about/about.html'
		})
		.when('/courses/', {
			templateUrl: 'resources/custom/templates/courses/courses.html'
			//controller : "courseCtrl",
		})
		.when('/course/:courseId', {
			templateUrl: 'resources/custom/templates/courses/course.html'
			//controller : "courseCtrl",
		})
		.when('/members/', {
			templateUrl: 'resources/custom/templates/member/members.html'
		})
		.when('/register/', {
			templateUrl: 'resources/custom/templates/register/registration.html'
		})
		.when('/getUsers/', {
			templateUrl: 'resources/custom/templates/register/users.html',
			controller : "userListCtrl"
		})
		.when('/gallery/', {
			templateUrl: 'resources/custom/templates/gallery/gallery.html'
		})
		.when('/syllabus/', {
			templateUrl: 'resources/custom/templates/syllabus/syllabus.html'
		})
		.when('/contact/', {
			templateUrl: 'resources/custom/templates/contact/contact.html'
		})
		
		/*.when('/items/computerdetails/:id', {
			templateUrl: 'items/computerdetails',
			controller : "ItemDetailsController as itemDetailsCtrl",
			resolve: {
                async: ['ItemService','$route', function(ItemService , $route) {
                    return ItemService.fetchSpecificItem('computers',$route.current.params.id);
               	}]
            }
		})
		.when('/items/phonedetails/:id', {
			templateUrl: 'items/phonedetails',
			controller : "ItemDetailsController as itemDetailsCtrl",
			resolve: {
                async: ['ItemService','$route', function(ItemService , $route) {
                    return ItemService.fetchSpecificItem('phones',$route.current.params.id);
               	}]
            }
		})
		.when('/items/printerdetails/:id', {
			templateUrl: 'items/printerdetails',
			controller : "ItemDetailsController as itemDetailsCtrl",
			resolve: {
                async: ['ItemService','$route', function(ItemService , $route) {
                    return ItemService.fetchSpecificItem('printers',$route.current.params.id);
               	}]
            }
		})*/
		
		.otherwise({redirectTo:'/home'});		
}]);

