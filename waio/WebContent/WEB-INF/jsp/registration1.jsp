<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

    <title>Registration - Training</title>

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
<script type="text/javascript">
    $(document).ready(function(){ 
            $('#saveUser').click(function(){ 
				var firstName = $('#firstName').val();
				var lastName = $('#lastName').val();
				var phoneNumber = $('#phoneNumber').val();
				var email = $('#email').val();
				var course = $('#course').val(); 
				var gender = $('#gender').val();
				var graduation = $('#graduation').val();
				var passout = $('#passout').val(); 
				var addressline1 = $('#addressline1').val();
				
				/* var file = new CommonsMultipartFile[]{$('#file').val()};	 */			
				var dataSet = {
						'firstName':firstName,
						'lastName':lastName,
						'phoneNumber':phoneNumber,
						'email':email,
						'course':course,
						'gender':gender,
						'graduation':graduation,
						'passout':passout,
						'addressline1':addressline1
				}                             
				 dataSet.append("file", file.files[0]); 
				var myString = JSON.stringify(dataSet); 
				if (firstName  === '') {
			        alert('Please enter first name.');
			        return false;
			    }else if (lastName  === '') {
			        alert('Please enter last name.');
			        return false;
			    }else if (gender  === '') {
			        alert('Please select gender.');
			        return false;
			    }else if (phoneNumber  === '') {
			        alert('Please enter contact number.');
			        return false;
			    }else if (email  === '') {
			        alert('Please enter email address.');
			        return false;
			    }else if (addressline1  === '') {
			        alert('Please type your address.');
			        return false;
			    }else if (graduation  === '') {
			        alert('Please select your graduation.');
			        return false;
			    }else if (passout  === '') {
			        alert('Please select passout year of your graduation.');
			        return false;
			    }else if (course  === '') {
			        alert('Please select interested course.');
			        return false;
			    }else{
				$.ajax({
                    url:'saveRegistration',
                    type: "POST",
					contentType: "application/json",
                   
					data: myString,
                    success: function(data) {
						alert("Registration Successful!. Thank you for your interest. We will contact you soon.");
						$('#ajaxGetUserServletResponse').text("Registration Successful!. Thank you for your interest. We will contact you soon.");
					    $('.validateIt')[0].reset(); 
                    }
                });
			    }
            });
    });
</script>
</head>
<body class="cssAnimate ct-headroom--scrollUpMenu">
<div class="ct-preloader">
	<div class="ct-preloader-content">
	</div>
</div>
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
</div>
<%@ include file="header-web.jsp" %>

<!-- Modal -->
<div class="modal ct-js-searchModal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel">Search Results</h3>
            </div>
            <div class="modal-body">
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
                <form class="ct-u-paddingBottom100">
                    <div class="form-group ct-u-marginBottom50">
                        <input placeholder="E-mail" type="text" required="" name="field[]" class="form-control ct-input--type1 input-hg ct-u-marginBottom50" title="Login">
                        <input placeholder="Password" type="text" required="" name="field[]" class="form-control ct-input--type1 input-hg ct-u-marginBottom50" title="Password">
                        <div class="ct-checbox--custom">
                            <input id="remember" type="checkbox" name="remember" value="remember">
                            <label for="remember">remember me</label>
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-lg text-uppercase"><span>Sign In</span></button>
                        <div class="ct-u-marginTop50">
                            <a href="#"><i class="fa fa-info-circle"></i> Forgot Password ?</a>
                            <a href="registration"><i class="fa fa-long-arrow-right"></i> Register Now ?</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="ct-site--map ct-u-backgroundGradient">
    <div class="container">
        <div class="ct-u-displayTableVertical text-capitalize">
            <div class="ct-u-displayTableCell">
                <span class="ct-u-textBig">
                    Registration
                </span>
            </div>
           <!--  <div class="ct-u-displayTableCell text-right">
                <span class="ct-u-textNormal ct-u-textItalic">
                    <a href="index.html">Features</a> / <a href="#">Syllabus Tables</a>
                </span>
            </div> -->
        </div>
    </div>
</div>
<section class="ct-u-paddingBoth100 ct-u-backgroundLightGreen">
    <div class="container">
        <div class="container">
            <div class="row">
            
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="ct-priceBox text-center">
                        <div class="ct-priceSection ct-priceBox-section">
                            <h5 class="ct-fw-400">${syllabus.plan}</h5>
                            <div class="ct-priceBox-fullPrice">                        
                                <span class="ct-month">Registration Form</span>
                                <span class="ct-main-price ct-fw-700">${syllabus.course}!</span>
                            </div>
                        </div>
                        <div class="ct-contentSection ct-priceBox-section">
                       
                            <form  method="POST" class="validateIt" enctype="multipart/form-data">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
								
								<input  placeholder="First Name" type="text" name="firstName" id="firstName" class="form-control ct-input--type1 " title="First Name">
								<label for="contact_name" class="sr-only">First Name</label>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
								<input  placeholder="Last Name" type="text" name="lastName" id="lastName" class="form-control ct-input--type1 " title="Last Name">
								<label for="contact_name" class="sr-only">Last Name</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
							  
								<select class="form-control h5-phone ct-input--type1 " name="gender" id="gender">
									<option value=""> Choose Gender</option>
									  
									<option value="Male">Male</option>
									<option value="Female">Female</option>
									
									<!-- <option value="1"> Java </option>
									<option value="2"> .Net </option>
									<option value="3"> PHP </option>
									<option value="4"> Jquery </option>
									<option value="5"> JavaScript </option> -->
								</select>
								
								<label for="contact_phone" class="sr-only"></label>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
								<input  placeholder="Mobile Number" type="text" name="phoneNumber" id="phoneNumber" class="form-control ct-input--type1 " title="Mobile Number">
								<label for="contact_name" class="sr-only">Mobile Number</label>
							</div>
						</div>
						
					</div>
					<div class="row">
						
						<div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
								<input placeholder="Email Id" name="email" id="email" type="email" class="form-control ct-input--type1  h5-email" title="Email">
								<label for="contact_email" class="sr-only">Email Id</label>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
								<input placeholder="Address" type="text" name="addressline1" id="addressline1" class="form-control ct-input--type1 " title="Address">
								<label for="contact_name" class="sr-only">Address</label>
							</div>
						</div>
					</div>
					<div class="row">
					<div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
							  
								<select class="form-control h5-phone ct-input--type1 " name="graduation" id="graduation">
									<option value=""> Choose Graduation</option>
									
									<option value="BE">BE</option>
									<option value="BCA">BCA</option>
									<option value="BSC Computer Science">BSC Computer Science</option>
									
									<!-- <option value="1"> Java </option>
									<option value="2"> .Net </option>
									<option value="3"> PHP </option>
									<option value="4"> Jquery </option>
									<option value="5"> JavaScript </option> -->
								</select>
								
								<label for="contact_phone" class="sr-only"></label>
							</div>
						</div>
					<div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
							  
								<select class="form-control h5-phone ct-input--type1 " name="paasout" id="passout">
									<option value=""> Choose Passout Year</option>
									<option value="2020">2020</option>
									<option value="2019">2019</option>
									<option value="2018">2018</option>
									<option value="2017">2017</option>
									<option value="2016">2016</option>
									<option value="2015">2015</option>
									<option value="2014">2014</option>
									<option value="2013">2013</option>
									<option value="2012">2012</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
									<option value="2009">2009</option>
									<!-- <option value="1"> Java </option>
									<option value="2"> .Net </option>
									<option value="3"> PHP </option>
									<option value="4"> Jquery </option>
									<option value="5"> JavaScript </option> -->
								</select>
								
								<label for="contact_phone" class="sr-only"></label>
							</div>
						</div>
						
						</div>
						<div class="row">
						<div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
							  
								<select class="form-control h5-phone ct-input--type1 " name="course" id="course">
									<option value=""> Choose Course</option>
									<c:forEach items="${courseList}" var="employee">  
									<option value="${employee.id}">${employee.course}</option>
									</c:forEach>
									<!-- <option value="1"> Java </option>
									<option value="2"> .Net </option>
									<option value="3"> PHP </option>
									<option value="4"> Jquery </option>
									<option value="5"> JavaScript </option> -->
								</select>
								
								<label for="contact_phone" class="sr-only"></label>
							</div>
						</div>
						
					</div>
										
										<%-- <div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
								<div class="col-sm-7">
								<input id="captcha" placeholder="Enter the contents of image" name="captcha1" type="text" class="form-control h5-phone ct-input--type1 " required="">
								</div>
								<div class="col-sm-5">
									<img src="captcha/securimage_show.php?sid=<?php echo md5(uniqid(time())); ?>" alt="captcha image" width="180" height="50" id='captchaimg1'/><br>
									<small >Can't read the image? click <a href="javascript: refreshCaptcha1();" style="color:blue">here</a> to refresh</small>
									<script>
									function refreshCaptcha1(){
										var img = document.images['captchaimg1'];
										img.src = img.src.substring(0,img.src.lastIndexOf("?"))+"?sid="+Math.random()*1000;
									}
									</script>
								</div>								
							</div>
						</div>
					</div> --%> 
					<div class="row">
						
						<div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
								Photo<input type="file" name="file[0]" id="file" size="50" />
								<label for="contact_email" class="sr-only">Upload Photo..</label>
							</div>
						</div>
						
					</div>
					<!-- <div class="row">
					<div class="col-sm-6">
							<div class="form-group ct-u-marginBottom30">
								Resume<input type="file" name="fileUpload" id="fileUpload" size="50" />
								<label for="contact_name" class="sr-only">Upload resume here..</label>
							</div>
						</div>
					</div> -->
                   <input type="submit" class="btn btn-primary btn-sm ct-u-marginBottom30 pull-right" name="Submit" id="saveUser" value="Submit">
							<div id="ajaxGetUserServletResponse"
								class="successMessage alert alert-success ct-u-marginTop20"
								style="display: block;"></div>
						</form> 

                        </div>
                       <!--  <div class="ct-priceBox-section">
                            <a href="#" class="btn btn-default text-capitalize">more..</a>
                        </div> -->
                    </div>
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
<script id="googleMap" type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places,geometry"></script>
<script src="assets/js/main-compiled.js"></script>
<script src="assets/js/jQueryShopLocator/src/shop-locator.js"></script>
<script src="assets/js/jQueryShopLocator/init.js"></script>

</body>

</html>