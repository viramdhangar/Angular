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
</head>
<body class="cssAnimate ct-headroom--scrollUpMenu"><div class="ct-preloader"><div class="ct-preloader-content"></div></div>
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
                    List of Courses
                </span>
            </div>
            <div class="ct-u-displayTableCell text-right">
                <span class="ct-u-textNormal ct-u-textItalic">
                    <a href="index.html">Courses</a> / <a href="#">List of Courses</a>
                </span>
            </div>
        </div>
    </div>
</div>
<section class="ct-u-paddingBoth100">
    <div class="container">
        <div class="row">
        	<c:forEach items="${courseList}" var="employee">    
		        <div class="ct-productBox ct-productBox--inline ct-u-displayTable ct-u-marginBottom30">
		            <div class="ct-u-displayTableCell">
		                <div class="ct-productImage">
		                    <a href="course?courseId=${employee.id}">
		                        <img src=<c:out value="${employee.imagePath}"/> alt="Product">
		                    </a>
		                </div>
		            </div>
		            <div class="ct-u-displayTableCell">
		                <div class="ct-productDescription">
		                    <a href="course?courseId=${employee.id}"><h5 class="ct-fw-600 ct-u-marginBottom10"><c:out value="${employee.course}"/></h5></a>
		                                        <span>
		                                            <c:out value="${employee.description}"/>
		                                        </span>
		                </div>
		                <%-- <div class="ct-productMeta">
		                    <div class="ct-u-displayTableVertical">
		                        <div class="ct-u-displayTableCell">
		                            <div class="starrr" data-rating=<c:out value="${employee.starHits}"/>></div>
		                        </div>
		                        <div class="ct-u-displayTableCell">
		                            <span class="ct-u-colorMotive"><c:out value="${employee.price}"/></span>
		                            <span class="ct-u-textLineThrough">290$</span>
		                        </div>
		                        <div class="ct-u-displayTableCell">
		                            <a href="#">
		                                <c:out value="${employee.countTrainee}"/> <i class="fa fa-user"></i>
		                            </a>
		                        </div>
		                    </div>
		                </div> --%>
		            </div>
		        </div>
    		</c:forEach>
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