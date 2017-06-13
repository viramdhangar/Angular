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

    <title>Fees Detail</title>

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

		$('#validateIt').click(function() {

			var password = $('#password').val();
			var cfmPassword = $('#cfmPassword').val();

			// Check for equality with the password inputs
			if (password != cfmPassword) {
				alert("Confirm Password is not same with new password.");
				return false;
			} else {
				return true;
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
                    Fees Detail
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
<section class="ct-u-paddingBoth100">
    <div class="container">
        <div class="row">
        <font color="red">${msg}</font>
		        <div class="ct-productBox ct-productBox--inline ct-u-displayTable ct-u-marginBottom30">
		            <div class="ct-u-displayTableCell">
		            </div>
		            <div class="ct-u-displayTableCell">
		                <div class="ct-productDescription">
			                <h5 class="ct-fw-600 ct-u-marginBottom10"><span class='span-feeDetails' style='font-weight: bold;'> Total Training Cost :- ${feesDetail.totalFees}<br>Total Paid Fee :- <font color='green'>${feesDetail.totalPaidFees}</font><br>Total Remaining Fee :-  <font color='red'>${feesDetail.totalRemainingFees}</font><br>Training name :- <font color='blue'>${feesDetail.course.trainingType}</font><br></span></h5>
		                    <%-- Total Training Cost :- <h5 class="ct-fw-600 ct-u-marginBottom10"><font color='grey'><c:out value="${feesDetail.totalFees}"/></font></h5>
		                    Total Paid Fee :- <h5 class="ct-fw-600 ct-u-marginBottom10"><font color='green'><c:out value="${feesDetail.totalPaidFees}"/></font></h5>
		                    Total Remaining Fee :- <h5 class="ct-fw-600 ct-u-marginBottom10"><font color='red'><c:out value="${feesDetail.totalRemainingFees}"/></font></h5> --%>
		                                    
		                </div>
		                <c:forEach items="${feesList}" var="fee">
		                <c:forEach items="${fee.intallments}" var="installments">
		                <div class="ct-installment">
		                    <div class="ct-u-displayTableVertical">
		                        <div class="ct-u-displayTableCell">
		                            <span class="ct-u-colorMotive"><c:out value="${installments.installmentName}"/></span>
		                        </div>
		                        <div class="ct-u-displayTableCell">
		                            <span class="ct-u-colorMotive"><font color='green'><c:out value="${installments.paidFees}"/></font></span>
		                        </div>
		                        <div class="ct-u-displayTableCell">
		                            <span class="ct-u-colorMotive"><c:out value="${installments.paidOn}"/></span>
		                        </div>
		                    </div>
		                </div>
		                 </c:forEach>
		                 </c:forEach>
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