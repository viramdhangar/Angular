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

    <title>Forgot Password</title>

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
	    $(document).ready(function() {
		$('#forgotPass').click(function(){ 
			var email = $('#email').val();
			var dataSet = {
					'email':email
			}
			var myString = JSON.stringify(dataSet); 
			
			$.ajax({
                    url:'forgotPassword',
                    type: "POST",
				contentType: "application/json",
                   
				data: myString,
                    success: function(response) {
					alert(response);
					$('#ajaxGetUserServletResponse').text(response);
				    $('.validateIt')[0].reset(); 
                    }
                });
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
    <%@ include file="mobile-login-signup.jsp" %>
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
                <h3 class="modal-title text-uppercase">Forgot Password</h3>
            </div>
        </div>
    </div>
</div>

<div class="ct-site--map ct-u-backgroundGradient">
    <div class="container">
        <div class="ct-u-displayTableVertical text-capitalize">
            <div class="ct-u-displayTableCell">
                <span class="ct-u-textBig">
                    Forgot Password
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
                                <span class="ct-month">Enter your email</span>
                            </div>
                        </div>
                        <div class="ct-contentSection ct-priceBox-section">
                       <span style="color:green">${msg}</span><span style="color:red">${errorMsg}</span>
                            <form class="validateIt" >
                    <div class="form-group ct-u-marginBottom50">
                        <input placeholder="Email Id" name="email" id="email" type="email" class="form-control ct-input--type1  h5-email" title="Email">
						<label for="contact_email" class="sr-only">Email Id</label>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-lg text-uppercase" value="Submit" id="forgotPass"><span>Submit</span></button>
                    <div id="ajaxGetUserServletResponse"
								class="successMessage alert alert-success ct-u-marginTop20"
								style="display: block;"></div>
                    </div>
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