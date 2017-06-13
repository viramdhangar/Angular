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

	<title>Member details</title>

    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">


    <!--[if lt IE 9]>
    <script src="assets/bootstrap/js/html5shiv.min.js"></script>
    <script src="assets/bootstrap/js/respond.min.js"></script>
    <![endif]-->

    <script src="assets/js/modernizr.custom.js"></script>
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
                   ${profile.firstName}
                </span>
            </div>
            <div class="ct-u-displayTableCell text-right">
                <span class="ct-u-textNormal ct-u-textItalic">
                    <a href="./index">Home</a> / <a href="./members">Member</a> / <a href="./members"> ${profile.firstName}</a>
                </span>
            </div>
        </div>
    </div>
</div>
    <section class="ct-u-backgroundLightGreen">
        <div class="ct-personBox ct-personBox--inline ct-personBox--inlineDescription">
            <div class="container">
                <div class="ct-personMedia ct-u-displayTableVertical">
                    <div class="ct-u-displayTableCell">
                        <div class="ct-personImage">
                            <img src="${profile.imagePath}" alt="person">
                        </div>
                    </div>
                    <div class="ct-u-displayTableCell">
                        <div class="ct-personName ct-u-marginBottom20">
                                <span class="ct-personName--title ct-fw-700 ct-u-marginBottom20">
                                   ${profile.firstName}
                                </span>
                                <span class="ct-personName--meta ct-fw-600">
                                   ${profile.profileType}                                 
                                </span>
                        </div>
                        <div class="ct-personDescription">
                            <p class="ct-fw-300">
                                ${profile.description}
                            </p>
                        </div>
                    </div>
                    <div class="ct-u-displayTableCell">
                        <ul class="ct-socials--singleMember list-unstyled">
                            <li><a href="http://www.createit.pl/"><i class="fa fa-wordpress"></i></a></li>
                            <li><a href="#"><i class="fa fa-cloud"></i></a></li>
                            <li><a href="https://twitter.com/createitpl"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container ct-u-paddingBoth100">
            <div class="row">
                <div class="col-md-4">
                    <div class="ct-textBox ct-textBox--thin">
                        <div class="ct-textBox--heading">
                            <h4 class="ct-fw-700 ct-u-colorMotive">Will take session on</h4>
                            <div class="ct-textBox--withNumber">
                                <span class="ct-fw-700">${fn:length(courseList)}</span>
                            </div>
                        </div>
                        <ul class="list-unstyled ct-list-bordered">
								<c:forEach items="${courseList}" var="course">
									<li><a href="#">${course.course}</a></li>
								</c:forEach>
							</ul>
                    </div>
                    
                </div>
                <div class="col-md-8">
                    <!-- <div class="ct-textBox ct-textBox--thin ct-u-marginBottom30">
                        <div class="ct-textBox--heading">
                            <h4 class="ct-fw-700 ct-u-colorMotive">Badges</h4>
                            <div class="ct-textBox--withNumber">
                                <span class="ct-fw-700">8</span>
                            </div>
                        </div>
                        <div class="ct-badgeBox">
                            <div class="ct-iconBox ct-iconBox--normal ct-iconBox--solidDark">
                                <div class="ct-icon">
                                    <img src="assets/images/demo-content/badge1.png" alt="icon">
                                </div>
                            </div>
                            <div class="ct-iconBox ct-iconBox--normal ct-iconBox--solidDark">
                                <div class="ct-icon">
                                    <img src="assets/images/demo-content/badge2.png" alt="icon">
                                </div>
                            </div>
                            <div class="ct-iconBox ct-iconBox--normal ct-iconBox--solidDark">
                                <div class="ct-icon">
                                    <img src="assets/images/demo-content/badge3.png" alt="icon">
                                </div>
                            </div>
                            <div class="ct-iconBox ct-iconBox--normal ct-iconBox--solidDark">
                                <div class="ct-icon">
                                    <img src="assets/images/demo-content/badge4.png" alt="icon">
                                </div>
                            </div>
                            <div class="ct-iconBox ct-iconBox--normal ct-iconBox--solidDark">
                                <div class="ct-icon">
                                    <img src="assets/images/demo-content/badge3.png" alt="icon">
                                </div>
                            </div>
                            <div class="ct-iconBox ct-iconBox--normal ct-iconBox--solidDark">
                                <div class="ct-icon">
                                    <img src="assets/images/demo-content/badge5.png" alt="icon">
                                </div>
                            </div>
                            <div class="ct-iconBox ct-iconBox--normal ct-iconBox--solidDark">
                                <div class="ct-icon">
                                    <img src="assets/images/demo-content/badge6.png" alt="icon">
                                </div>
                            </div>
                            <div class="ct-iconBox ct-iconBox--normal ct-iconBox--solidDark">
                                <div class="ct-icon">
                                    <img src="assets/images/demo-content/badge7.png" alt="icon">
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <div class="ct-textBox ct-textBox--thin">
                        <div class="ct-textBox--heading">
                            <h4 class="ct-fw-700 ct-u-colorMotive">Courses Made By ${profile.firstName}</h4>
                            <div class="ct-textBox--withNumber">
                                <span class="ct-fw-700">${fn:length(courseList)}</span>
                            </div>
                        </div>
                        <div class="ct-u-padding70">
				                        <c:forEach items="${courseList}" var="course">    
						        <div class="ct-productBox ct-productBox--inline ct-u-displayTable ct-u-marginBottom30">
						            <div class="ct-u-displayTableCell">
						                <div class="ct-productImage">
						                    <a href="course?courseId=${course.id}">
						                        <img src=<c:out value="${course.imagePath}"/> alt="Product">
						                    </a>
						                </div>
						            </div>
						            <div class="ct-u-displayTableCell">
						                <div class="ct-productDescription">
						                    <a href="course?courseId=${course.id}"><h5 class="ct-fw-600 ct-u-marginBottom10"><c:out value="${course.course}"/></h5></a>
						                                        <span>
						                                            <c:out value="${course.description}"/>
						                                        </span>
						                </div>
						                <div class="ct-productMeta">
						                    <div class="ct-u-displayTableVertical">
						                        <div class="ct-u-displayTableCell">
						                            <div class="starrr" data-rating=<c:out value="${course.starHits}"/>></div>
						                        </div>
						                        <div class="ct-u-displayTableCell">
						                            <span class="ct-u-colorMotive"><c:out value="${course.price}"/></span>
						                            <span class="ct-u-textLineThrough">290$</span>
						                        </div>
						                        <div class="ct-u-displayTableCell">
						                            <a href="#">
						                                <c:out value="${course.countTrainee}"/> <i class="fa fa-user"></i>
						                            </a>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </div>
				    		</c:forEach>
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

<script src="assets/js/main-compiled.js"></script>
</body>

</html>