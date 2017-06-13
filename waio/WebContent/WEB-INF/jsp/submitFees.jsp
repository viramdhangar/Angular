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

    <title>Submit Fees</title>

    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

    <link rel="stylesheet" type="text/css" href="assets/css/style.css">


    <!--[if lt IE 9]>
    <script src="assets/bootstrap/js/html5shiv.min.js"></script>
    <script src="assets/bootstrap/js/respond.min.js"></script>
    <![endif]-->

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


    <script src="assets/js/modernizr.custom.js"></script> 
    
    <!-- <script type="text/javascript" 
		src="assets/js/jquery.min.js"></script> -->
	<script type="text/javascript" 
		src="assets/js/jquery-ui.min.js"></script>
		
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){ 
		
	 $('#profileId').change(function() {
		 event.preventDefault();
		 var id = $('#profileId').val();
		 $('#ajaxGetUserServletResponse').text('');
		  $.ajax({
	            url: 'getFeesDetailForTrainee',
	            type : 'GET',
				contentType : 'json',
				data : {id:id},
	            success: function(data) {
	            	$('#feesDetail').find('.span-feeDetails').remove();
	            	$('#feesDetail').append("<span class='span-feeDetails' style='font-weight: bold;'> Total Training Cost :- "+data.totalFees+"<br>Total Paid Fee :- <font color='green'>"+data.totalPaidFees+"</font><br>Total Remaining Fee :-  <font color='red'>"+data.totalRemainingFees+"</font><br>Training name :- "+data.course.trainingType+"<br><input type='hidden' name='feesId' id='feesId' value='"+data.course.id+"'></span>");
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                /* alert(errorThrown); */
	                 $('#feesDetail').find('.span-feeDetails').remove();
	                $('#feesDetail').append("<span class='span-feeDetails' style='font-weight: bold;'> No Data Available</span>");
	            }
	        });
	    });
		$('#saveFees').click(function() {
			event.preventDefault();
			var profileId = $('#profileId').val();
			var feesId = $('#feesId').val();
			var paidFees = $('#installmentRs').val();
			var dataSet = {
				'id' : feesId,
				'profileId' : profileId,
				'fees' : paidFees
			}
			var myString = JSON.stringify(dataSet);
			if (profileId === '') {
				alert('Please select trainee.');
				return false;
			}else if (feesId === '') {
				alert('Please select course.');
				return false;
			} else if (paidFees === '') {
				alert('Please enter installment amount.');
				return false;
			} else {
				$.ajax({
					url : 'submitFees',
					type : "POST",
					contentType : "application/json",

					data : myString,
					success : function(response) {
						//alert("Registration Successful!. Thank you for your interest. We will contact you soon.");
						//alert(response);
						/* $('#myModalSuccessMsg').modal('toggle'); */
						successMessage
						$('#successMessage').text(response);
						$('#myModalSuccessMsg').modal('show');
						 $('#ajaxGetUserServletResponse').text(response);
						$('#feesDetail').find('.span-feeDetails').remove();
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
<div class="ct-site--map ct-u-backgroundGradient">
    <div class="container">
        <div class="ct-u-displayTableVertical text-capitalize">
            <div class="ct-u-displayTableCell">
                <span class="ct-u-textBig">
                    Submit Fees
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
            
                <div class="col-sm-6 col-md-6 col-lg-fee">
                    <div class="ct-priceBox text-center">
                        <div class="ct-priceSection ct-priceBox-section">
                            <div class="ct-priceBox-fullPrice">                        
                                <span class="ct-month">Submit Fees !</span>
                            </div>
                        </div>
                        <div class="ct-contentSection ct-priceBox-section">
                       <span style="color:green">${msg}</span>
                            <form class="validateIt" method="POST" >
                            <div class="ct-productDescription" id = "feesDetail" style="display: block;" align="left">		                                    
		                </div>
                    <div class="form-group ct-u-marginBottom50" id=courseDetail>
                    	Select Trainee
                    	<select onchange="getval(this);" class="form-control h5-phone ct-input--type1 " name="profileId" id="profileId" >
									<option value="">--Select--</option>
									<c:forEach items="${profileList}" var="profile">  
									<option value="${profile.id}">${profile.firstName} ${profile.lastName} (${profile.email})</option>
									</c:forEach>
						</select>
                    	Installment Rs. : <input placeholder="Fees" name="installmentRs" id="installmentRs" type="text" class="form-control ct-input--type1  h5-email" title="Installment Rs">
						<label for="contact_email" class="sr-only">Installment Rs.</label>
                    </div>
                    ${msg}
					<input type="submit" class="btn btn-primary btn-sm ct-u-marginBottom30 pull-right" name="Submit" id="saveFees" value="Submit">
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

  <!-- Modal -->
   <div class="modal fade" id="myModalSuccessMsg" role="dialog">
    <div class="modal-dialog" style="width:100%; top: 50%;">
    
      <div class="modal-content" style="background-color:blue; text-align: center;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div id="successMessage" style="color:white"></div>
        </div>
        
      </div>
      
    </div>
  </div> 
  
 <!--  <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div> -->


</div>

<!-- JavaScripts -->
<script id="googleMap" type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places,geometry"></script>
<script src="assets/js/main-compiled.js"></script>
<script src="assets/js/jQueryShopLocator/src/shop-locator.js"></script>
<script src="assets/js/jQueryShopLocator/init.js"></script>

</body>

</html>