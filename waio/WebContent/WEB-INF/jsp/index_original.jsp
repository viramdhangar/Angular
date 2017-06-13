<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html class="no-js ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]>
<html class="no-js ie9" lang="en"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="no-js" lang="en"> <!--<![endif]-->
<head lang="en">
    <meta charset="UTF-8">
    <meta name="description" content="Uacademy - Creative HTML Template">
    <meta name="author" content="CreateIT">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, shrink-to-fit=no">

    <link rel="shortcut icon" href="assets/images/demo-content/favicon.png">
    <link rel="apple-touch-icon" href="assets/images/demo-content/favicon.png">

    <title>Training</title>

    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">


    <!--[if lt IE 9]>
    <script src="assets/bootstrap/js/html5shiv.min.js"></script>
    <script src="assets/bootstrap/js/respond.min.js"></script>
    <![endif]-->

	<script src="assets/js/modernizr.custom.js"></script> 
    
    <script type="text/javascript" 
		src="assets/js/jquery.min.js"></script>
	<script type="text/javascript" 
		src="assets/js/jquery-ui.min.js"></script>
		
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
</head>
<body class="cssAnimate ct-headroom--scrollUpMenu">
<div class="ct-preloader"><div class="ct-preloader-content"></div></div>
<nav class="ct-menuMobile">
    <%@ include file="header-menu-mobile.jsp" %>
</nav>
<div id="ct-js-wrapper" class="ct-pageWrapper">
<div class="ct-navbarMobile">
    <a class="navbar-brand" href="index"><img src="assets/images/demo-content/logo.png" alt="Website Logo"> </a>
    <button type="button" class="navbar-toggle">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <%@ include file="mobile-login-signup.jsp" %>	
</div>
<div class="ct-topBar text-center">
    <div class="container">
        <ul class="ct-panel--user list-inline pull-left">
        <%= session.getAttribute("userName")!=null?"":"<li><a href='#' class='ct-js-login'>Login<i class='fa fa-lock'></i></a></li><li><a href='registration' class='ct-js-signup'>Sign Up<i class='fa fa-user'></i></a></li>"%>
        </ul>
        <div class="ct-widget--group pull-right">
        	<!-- <ul class="ct-widget--socials list-inline text-uppercase"> -->
 			${logoutMsg}
            <ul class="ct-widget--socials list-inline">
            	<%= session.getAttribute("userName")!=null?"Welcome: "+session.getAttribute("userName")+" | <a href='logout' class='ct-js-logout-msg'><font color='blue'>Logout</font></a>":""%>
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<nav class="navbar navbar-default yamm " data-heighttopbar="60px" data-startnavbar="0">
<div class="container">
<div class="navbar-header">
    <a href="index.html"><img src="assets/images/demo-content/logo.png" alt="logo"/></a>
</div>
<div class="ct-navbar--fluid pull-right">
<!-- Desktop navigation Div -->
	<%@ include file="header-menu-web.jsp" %>
<!-- Search Div -->
<div id="ct-js-navSearch" class="ct-navbarSearch--icon">
    <i class="fa fa-search"></i>
</div>

<div class="ct-navbar-search"><i class="fa fa-times ct-navbar-search-closeIcon"></i>
    <button class="ct-navbar-search-button" id="searchText" type="submit">
        <i class="fa fa-search fa-fw"></i>
    </button>
    <div class="form-group">
        <input id="search" placeholder="Search ..." required type="text" class="form-control input-lg ct-searchCourse">
    </div>
</div>
</div>
</div>
</nav>

<!-- Modal -->
<div class="modal ct-js-searchModal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel">Search Results</h3>
            </div>
            <!-- <div class="modal-body">
            
            </div> -->
            
             <div id="modal-body" class="successMessage alert alert-success ct-u-marginTop20"
								style="display: block;">
								
						</div>
        </div>
    </div>
</div>

<!-- success message -->
<div class="modal ct-modal ct-js-modal-logout-msg fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-close"></i></span></button>
                <h3 class="modal-title text-uppercase">Login</h3>
            </div>
        </div>
    </div>
</div>
<div class="modal ct-modal ct-js-modal-login fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-close"></i></span></button>
                <h3 class="modal-title text-uppercase">Login</h3>
            </div>
            <div class="modal-body">
                <form class="ct-u-paddingBottom100" action=getCredential method="POST">
                <span style="color:red">${loginstatus}</span>
                    <div class="form-group ct-u-marginBottom50">
                        <input placeholder="E-mail" type="text" required="" name="profile_id" class="form-control ct-input--type1 input-hg ct-u-marginBottom50" title="Login">
                        <input placeholder="Password" type="password" required="" name="password" class="form-control ct-input--type1 input-hg ct-u-marginBottom50" title="Password">
                        <div class="ct-checbox--custom">
                            <input id="remember" type="checkbox" name="remember" value="remember">
                            <label for="remember">remember me</label>
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-lg text-uppercase"><span>Sign In</span></button>
                        <div class="ct-u-marginTop50">
                            <a href="forgotPassword"><i class="fa fa-info-circle"></i> Forgot Password ?</a>
                            <a href="registration"><i class="fa fa-long-arrow-right"></i> Register Now ?</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<header>
<script type="text/javascript">
    $(document).ready(function(){ 
            $('#leaveReply').click(function(){
				var firstName = $('#contact_name').val();
				var email = $('#contact_email').val();
				var phoneNumber = $('#contact_phone').val();
				var yourMessage = $('#contact_message').val();
				var dataSet = {
						'firstName':firstName,
						'email':email,
						'phoneNumber':phoneNumber,
						'yourMessage':yourMessage
				}
				var myString = JSON.stringify(dataSet); 
				if (firstName  === '') {
			        alert('Please enter first name.');
			        return false;
			    }else if (email  === '') {
			        alert('Please enter email.');
			        return false;
			    }else if (phoneNumber  === '') {
			        alert('Please enter phone number.');
			        return false;
			    } else if (yourMessage  === '') {
			        alert('Please leave a messgae.');
			        return false;
			    } else{
				$.ajax({
                    url:'quickContact',
                    type: "POST",
					contentType: "application/json",
                   
					data: myString,
                    success: function(data) {
						alert("Thank you for your interest. If you want to create your profile please register from left top corner.");
						$('#ajaxGetUserServletResponse').text("Thank you for your interest. If you want to create your profile please register from left top corner.");
					    $('.validateIt')[0].reset(); 
                    }
                });
			    }
            });

$('#searchText').click(function(){
	var search = $('#search').val();
	var dataSet = {
			'course':search
	}
	var myString = JSON.stringify(dataSet); 
	if (search  === '') {
        alert('Please enter text to search.');
        return false;
    }else{
	$.ajax({
                    url:'searchCourse',
                    type: "POST",
					contentType: "application/json",
                   
					data: myString,
                    success: function(response) {
	
						 var arr = response.split(',');
						$("#modal-body").html("<a href='course?courseId="+arr[0]+"' class='red'>"+arr[1]+"</a>");
									 
		    
                    }
                });
    }
            });
    });
</script>
    <!-- <div class="ct-slick ct-js-slick ct-slick-defaultNavigation ct-u-colorWhite" data-height="500" data-adaptiveHeight="true" data-animations="true" data-autoplay="true" data-infinite="true" data-autoplaySpeed="6000" data-draggable="false" data-touchMove="false" data-arrows="true" data-items="1">
        <div class="item" data-bg="assets/images/demo-content/header3.jpg">
            <div class="ct-slick-inner">
                <div class="ct-slick-content">
                    <div class="ct-showcaseBox--withImagePerson">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-7">
                                    <h3 class="text-capitalize ct-fw-900 ct-u-marginBottom40 animated" data-fx="fadeInLeft" data-time="200">Created For Education Business</h3>
                                    <p class="ct-u-marginBottom40 ct-fw-600 animated" data-fx="fadeInLeft" data-time="600">
                                        
                                        
                                        </p>
                                    <a class="text-uppercase btn btn-transparent btn-bordered--Light btn-lg animated" data-fx="fadeInLeft" data-time="1000" href="courses">view courses</a>
                                </div>
                                <img class="ct-js-imageOffset animated" src="assets/images/demo-content/header3-person.png" data-fx="fadeInRight" data-time="1000" data-bottom="-265" data-right="0" alt="person">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item" data-bg="assets/images/demo-content/header3.jpg">
            <div class="ct-slick-inner">
                <div class="ct-slick-content">
                    <div class="ct-showcaseBox--withImagePerson">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-7">
                                    <h3 class="text-capitalize ct-fw-900 ct-u-marginBottom40 animated" data-fx="fadeInLeft" data-time="200">Created For Education Business</h3>
                                    <p class="ct-u-marginBottom40 ct-fw-600 animated" data-fx="fadeInLeft" data-time="600">
                                        
                                        
                                        </p>
                                    <a class="text-uppercase btn btn-transparent btn-bordered--Light btn-lg animated" data-fx="fadeInLeft" data-time="1000" href="courses">view courses</a>
                                </div>
                                <img class="ct-js-imageOffset animated" src="assets/images/demo-content/person-single3.png" data-fx="fadeInRight" data-time="1000" data-bottom="-200" data-right="15" alt="person">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item" data-bg="assets/images/demo-content/header8.jpg">
            <div class="ct-slick-inner">
                <div class="ct-slick-content">
                    <div class="ct-showcaseBox--withImagePerson">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="text-capitalize ct-fw-900 ct-u-marginBottom40 ct-darkBackground animated" data-fx="fadeInLeft" data-time="200">Created For Education Business</h3>
                                    <p class="ct-u-marginBottom40 ct-fw-600 animated" data-fx="fadeInLeft" data-time="600">
                                        
                                        
                                        </p>
                                    <a class="text-uppercase btn btn-default btn-lg animated" href="courses" data-fx="fadeInLeft" data-time="1000">view courses</a>
                                </div>
                                <img class="ct-js-imageOffset animated" src="assets/images/demo-content/header8-person.png" data-fx="fadeInRight" data-time="1000" data-bottom="-255" data-right="-250" alt="person">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
</header>
<%-- <section class="ct-u-paddingBoth100 text-justify">
    <div class="container">
        <h2 class="ct-fw-700 ct-u-marginBottom30">Welcome to Waio</h2>
        <p class="ct-fw-600 ct-u-marginBottom100">Java is one of the most powerful and secure programming languages available in the market that was created more than 20 years back. From large super computers to mobile phones, millions of applications run on Java platform. 
        There is a huge demand for Java and J2EE developers to develop new applications as well as to maintain the old applications developed in Java. Waio going to offers wide range of JAVA training in Mandsaur to meet the growing corporate needs. 
        The course materials and syllabus are prepared by trainers who have many years of experience in leading IT companies. We providing Java Training in Mandsaur with Placement in leading companies.
        </p>
				<h4 class="ct-fw-700 ct-u-marginBottom30">Why Choose Waio for
					your JAVA/J2EE Training:</h4>
				<ul
					class="list-unstyled ct-list-arrowBackground ct-fw-600 ct-u-marginBottom40">
					<li>Practical training by working professionals from leading
						IT companies</li>
					<li>Learn by working on real - time Java projects</li>
					<li>Flexible Timings - Weekday, Weekend</li>
					<li>Online support for any doubt's and queries any time.</li>
				</ul>

			</div>
</section>
<section class="ct-u-paddingBoth100 ct-u-backgroundLightGreen">
    <div class="container">
        <div class="ct-slick ct-js-slick" data-adaptiveHeight="true" data-animations="true" data-autoplay="true" data-infinite="true" data-autoplaySpeed="6000" data-draggable="false" data-touchMove="false" data-arrows="true" data-items="1">
            <div class="item">
                <h2 class="ct-fw-700">Popular Courses</h2>
                <div class="ct-divider ct-u-marginBoth30"></div>
                <p class="ct-u-marginBottom90">
                    Popular courses through many people made his career.

                </p>
                <div class="row">
                <c:forEach items="${courseList}" var="employee"> 
                    <div class="col-sm-6 col-md-3">
                        <div class="ct-productBox ct-u-marginBottom30">
                            <a href="course?courseId=${employee.id}">
                                <div class="ct-productImage">
                                    <img src=<c:out value="${employee.imagePath}"/> alt="Product">
                                </div>
                                <div class="ct-productDescription">
                                    <h5 class="ct-fw-600 ct-u-marginBottom10"><c:out value="${employee.course}"/></h5>
                                    <span><c:out value="${employee.description}"/></span>
                                </div>
                            </a>
                            <div class="ct-productMeta">
                                <div class="ct-u-displayTableVertical">
                                    <div class="ct-u-displayTableCell">
                                        <div class="starrr" data-rating=<c:out value="${employee.starHits}"/>></div>
                                    </div>
                                    <div class="ct-u-displayTableCell">
                                        <span class="ct-u-colorMotive"><c:out value="${employee.price}"/></span>
                                        <span class="ct-u-textLineThrough">290$</span>
                                    </div>
                                    <a href="#">
                                        <div class="ct-u-displayTableCell">
                                            <c:out value="${employee.countTrainee}"/> <i class="fa fa-user"></i>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                   </c:forEach>
                    <div class="clearfix visible-sm"></div>
                </div>
            </div>
            <div class="item">
                <h2 class="ct-fw-700">Top Rated Courses</h2>
                <div class="ct-divider ct-u-marginBoth30"></div>
                <p class="ct-u-marginBottom90">
                    consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus etma
                    enim. Donec pede justo  .

                </p>
                <div class="row">
                <c:forEach items="${courseList}" var="employee"> 
                    <div class="col-sm-6 col-md-3">
                        <div class="ct-productBox ct-u-marginBottom30">
                            <a href="course?courseId=${employee.id}">
                                <div class="ct-productImage">
                                    <img src=<c:out value="${employee.imagePath}"/> alt="Product">
                                </div>
                                <div class="ct-productDescription">
                                    <h5 class="ct-fw-600 ct-u-marginBottom10"><c:out value="${employee.course}"/></h5>
                                    <span><c:out value="${employee.description}"/></span>
                                </div>
                            </a>
                            <div class="ct-productMeta">
                                <div class="ct-u-displayTableVertical">
                                    <div class="ct-u-displayTableCell">
                                        <div class="starrr" data-rating=<c:out value="${employee.starHits}"/>></div>
                                    </div>
                                    <div class="ct-u-displayTableCell">
                                        <span class="ct-u-colorMotive"><c:out value="${employee.price}"/></span>
                                        <span class="ct-u-textLineThrough">290$</span>
                                    </div>
                                    <a href="#">
                                        <div class="ct-u-displayTableCell">
                                            <c:out value="${employee.countTrainee}"/> <i class="fa fa-user"></i>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                   </c:forEach>
                
                <div class="clearfix visible-sm"></div>
                </div>
            </div>
        </div>
    </div>
</section> --%>
<!-- <marquee> <font color="blue"><strong>New batch starting from 4th February 2017, Please get registered soon!</strong></font></marquee> -->
<section class="ct-u-backgroundLightGreen">
    <div class="ct-u-paddingBoth100">
        <div class="container">
            <div class="row">
            <div class="col-md-8">
							<h2 class="ct-fw-700 ct-u-marginBottom30">Welcome to Waio</h2>
							<p class="ct-fw-600 ct-u-marginBottom100">Java is one of the
								most powerful and secure programming languages available in the
								market that was created more than 20 years back. From large
								super computers to mobile phones, millions of applications run
								on Java platform. There is a huge demand for Java and J2EE
								developers to develop new applications as well as to maintain
								the old applications developed in Java. Waio going to offers
								wide range of JAVA training in Mandsaur to meet the growing
								corporate needs. The course materials and syllabus are prepared
								by trainers who have many years of experience in leading IT
								companies. We providing Java Training in Mandsaur with Placement
								in leading companies.</p>
							<h4 class="ct-fw-700 ct-u-marginBottom30">Why Choose Waio
								for your JAVA/J2EE Training:</h4>
							<ul
								class="list-unstyled ct-list-arrowBackground ct-fw-600 ct-u-marginBottom40">
								<li>Practical training by working professionals from
									leading IT companies</li>
								<li>Learn by working on real - time Java projects</li>
								<li>Flexible Timings - Weekday, Weekend</li>
								<li>Online support for any doubt's and queries any time.</li>
							</ul>
						</div>
                <div class="col-md-4">
                    <h2 class="ct-fw-700 ct-u-marginBottom30">Please Contact us!!</h2>
                    <!-- <div class="successMessage alert alert-success ct-u-marginTop20" style="display:none;">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        Message Sent.
                    </div>
                    <div class="errorMessage alert alert-danger ct-u-marginTop20" style="display:none;">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        An error occured. Please try again later.
                    </div> -->
                    <form action="http://uacademy.html.themeforest.createit.pl/assets/form/send.php" method="POST" class="validateIt">
                        <div class="form-group  ct-u-marginBottom30">
                                <div class="form-group ct-u-marginBottom30">
                                	Your Name (required)
                                    <input id="contact_name" placeholder="Name" type="text" name="field[]" class="form-control ct-input--type1 input-hg" title="Name">
                                    <label for="contact_name" class="sr-only"></label>
                                </div>
                             </div>
                        <div class="form-group  ct-u-marginBottom30">
                                <div class="form-group ct-u-marginBottom30">
                                	Your Email (required)
                                    <input id="contact_email" placeholder="Email" name="field[]" type="email" class="form-control ct-input--type1 input-hg h5-email" title="Email">
                                    <label for="contact_email" class="sr-only"></label>
                                </div>
                            </div>
                        <div class="form-group  ct-u-marginBottom30">
                        	Phone Number (required)
                            <input id="contact_phone" placeholder="Phone Number" name="field[]" type="tel" class="form-control h5-phone ct-input--type1 input-hg" title="Phone">
                            <label for="contact_phone" class="sr-only"></label>
                        </div>
                        <div class="form-group  ct-u-marginBottom30">
                        	Your Message (required)
                            <textarea id="contact_message" placeholder="Your Message" class="form-control ct-input--type1" rows="6" name="field[]" title="Message"></textarea>
                            <label for="contact_message" class="sr-only"></label>
                        </div>
							<div id="ajaxGetUserServletResponse"
								class="successMessage alert alert-success ct-u-marginTop20"
								style="display: block;"></div>
                        <input type="submit" class="btn btn-primary btn-sm ct-u-marginBottom30 pull-right" name="Submit" id="leaveReply" value="Submit">
                        <!-- <div class="clearfix"></div> -->
                    </form>
                </div>
					</div>
        </div>
    </div>
</section>
<footer>
<%@ include file="footer.jsp" %>
</footer>
</div>
<!-- JavaScripts -->

<script src="assets/js/main-compiled.js"></script>



</body>

</html>