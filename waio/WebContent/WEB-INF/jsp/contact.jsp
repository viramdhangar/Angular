<!DOCTYPE html>
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
			        alert('Please select gender.');
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
                    Contact Us
                </span>
            </div>
            <div class="ct-u-displayTableCell text-right">
                <span class="ct-u-textNormal ct-u-textItalic">
                    <a href="index">Home</a> / <a href="#">Contact Us</a>
                </span>
            </div>
        </div>
    </div>
</div>
<section class="ct-u-backgroundLightGreen">
    <div class="ct-googleMap ct-js-googleMap">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30165.66948999016!2d72.9810503766549!3d19.076541673592832!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c136b519107b%3A0x8452b99754be0fc8!2sVashi%2C+Navi+Mumbai%2C+Maharashtra+400703!5e0!3m2!1sen!2sin!4v1452429294227" width="100%" height="500" frameborder="0" style="border:0" allowfullscreen></iframe>
	</div>
    <div class="ct-u-paddingBoth100">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h4 class="text-uppercase ct-fw-700 ct-u-marginBottom100 ct-u-textNormal">Leave a reply</h4>
                    <div class="successMessage alert alert-success ct-u-marginTop20" style="display:none;">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        Message Sent.
                    </div>
                    <div class="errorMessage alert alert-danger ct-u-marginTop20" style="display:none;">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        An error occured. Please try again later.
                    </div>
                    <form action="http://uacademy.html.themeforest.createit.pl/assets/form/send.php" method="POST" class="validateIt">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group ct-u-marginBottom30">
                                    <input id="contact_name" placeholder="Name" type="text" name="field[]" class="form-control ct-input--type1 input-hg" title="Name">
                                    <label for="contact_name" class="sr-only"></label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group ct-u-marginBottom30">
                                    <input id="contact_email" placeholder="Email" name="field[]" type="email" class="form-control ct-input--type1 input-hg h5-email" title="Email">
                                    <label for="contact_email" class="sr-only"></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group  ct-u-marginBottom30">
                            <input id="contact_phone" placeholder="Phone Number" name="field[]" type="tel" class="form-control h5-phone ct-input--type1 input-hg" title="Phone">
                            <label for="contact_phone" class="sr-only"></label>
                        </div>
                        <div class="form-group  ct-u-marginBottom30">
                            <textarea id="contact_message" placeholder="Your Message" class="form-control ct-input--type1" rows="6" name="field[]" title="Message"></textarea>
                            <label for="contact_message" class="sr-only"></label>
                        </div>
							<div id="ajaxGetUserServletResponse"
								class="successMessage alert alert-success ct-u-marginTop20"
								style="display: block;"></div>
                        <input type="submit" class="btn btn-primary btn-lg pull-right" name="Submit" id="leaveReply" value="Submit">
                        <!-- <div class="clearfix"></div> -->
                    </form> 
                </div>
                <div class="col-md-4">
                    <div class="ct-addressInformation">
                        <h4 class="text-uppercase ct-fw-700 ct-u-marginBottom20 ct-u-textNormal">Postal Address :</h4>
                        <p class="ct-u-marginBottom20">202, Balaji Park, Sector - 9, Airoli, Mumbai
                        </p>
                        <h4 class="text-uppercase ct-fw-700 ct-u-marginBottom20 ct-u-textNormal">Phone :</h4>
                        <span>Phone Number: 809 754 7286</span>
                        <h4 class="text-uppercase ct-fw-700 ct-u-marginBottom20 ct-u-textNormal">Email :</h4>
                        <span>For Query: <a href="#">viram@waiotech.com </a></span>
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