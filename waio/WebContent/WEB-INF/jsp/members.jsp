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
                    Professors
                </span>
            </div>
            <div class="ct-u-displayTableCell text-right">
                <span class="ct-u-textNormal ct-u-textItalic">
                    <a href="./index">Home</a> / <a href="./members">Member</a>
                </span>
            </div>
        </div>
    </div>
</div>
 <section class="ct-u-paddingBoth100 ct-u-doubleBorder ct-u-backgroundLightGreen">
    <div class="container">
        <div class="row">
       
        <c:forEach var="employee" items="${profileList}">
	       <%--  <c:forEach items="${profileList}" var="employee"> --%>
	            <div class="col-md-6 col-lg-3">
	                <div class="ct-personBox ct-u-marginBottom30">
	                    <div class="ct-personMedia">
	                        <div class="ct-personImage">
	                            <a href="member?profileId=${employee.id}">
	                                <img src=<c:out value="${employee.imagePath}"/> alt="person">
	                            </a>
	                        </div>
	                        <div class="ct-personName">
	                            <h4 class="ct-personName--title ct-fw-600">
	                                <c:out value="${employee.firstName}"/> <c:out value="${employee.lastName}"/>
	                            </h4>
	                                <span class="ct-personName--meta ct-u-colorMotive">
	                                    <c:out value="${employee.profileType}"/>
	                                </span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            </c:forEach>
            <!-- <div class="col-md-6 col-lg-3">
                <div class="ct-personBox ct-u-marginBottom30">
                    <div class="ct-personMedia">
                        <div class="ct-personImage">
                            <a href="memberSingle">
                                <img src="assets/images/demo-content/members2.jpg" alt="person">
                            </a>
                        </div>
                        <div class="ct-personName">
                            <h4 class="ct-personName--title ct-fw-600">
                                Mohamed Said
                            </h4>
                                <span class="ct-personName--meta ct-u-colorMotive">
                                    Web Designer
                                </span>
                        </div>
                    </div>
                    <div class="ct-personDescription">
                        <p>
                            Ut enim ad minima veniam, quis
                            nostrum exercitationem ullamcorpor
                            suscipit laboriosam
                        </p>
                    </div>
                </div>
            </div>
            <div class="clearfix visible-md"></div>
            <div class="col-md-6 col-lg-3">
                <div class="ct-personBox ct-u-marginBottom30">
                    <div class="ct-personMedia">
                        <div class="ct-personImage">
                            <a href="memberSingle">
                                <img src="assets/images/demo-content/members3.jpg" alt="person">
                            </a>
                        </div>
                        <div class="ct-personName">
                            <h4 class="ct-personName--title ct-fw-600">
                                Mohamed Said
                            </h4>
                                <span class="ct-personName--meta ct-u-colorMotive">
                                    Web Designer
                                </span>
                        </div>
                    </div>
                    <div class="ct-personDescription">
                        <p>
                            Ut enim ad minima veniam, quis
                            nostrum exercitationem ullamcorpor
                            suscipit laboriosam
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="ct-personBox ct-u-marginBottom30">
                    <div class="ct-personMedia">
                        <div class="ct-personImage">
                            <a href="memberSingle">
                                <img src="assets/images/demo-content/members4.jpg" alt="person">
                            </a>
                        </div>
                        <div class="ct-personName">
                            <h4 class="ct-personName--title ct-fw-600">
                                Mohamed Said
                            </h4>
                                <span class="ct-personName--meta ct-u-colorMotive">
                                    Web Designer
                                </span>
                        </div>
                    </div>
                    <div class="ct-personDescription">
                        <p>
                            Ut enim ad minima veniam, quis
                            nostrum exercitationem ullamcorpor
                            suscipit laboriosam
                        </p>
                    </div>
                </div>
            </div>
            <div class="clearfix visible-md"></div>
            <div class="col-md-6 col-lg-3">
                <div class="ct-personBox ct-u-marginBottom30">
                    <div class="ct-personMedia">
                        <div class="ct-personImage">
                            <a href="memberSingle">
                                <img src="assets/images/demo-content/members5.jpg" alt="person">
                            </a>
                        </div>
                        <div class="ct-personName">
                            <h4 class="ct-personName--title ct-fw-600">
                                Mohamed Said
                            </h4>
                                <span class="ct-personName--meta ct-u-colorMotive">
                                    Web Designer
                                </span>
                        </div>
                    </div>
                    <div class="ct-personDescription">
                        <p>
                            Ut enim ad minima veniam, quis
                            nostrum exercitationem ullamcorpor
                            suscipit laboriosam
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="ct-personBox ct-u-marginBottom30">
                    <div class="ct-personMedia">
                        <div class="ct-personImage">
                            <a href="memberSingle">
                                <img src="assets/images/demo-content/members6.jpg" alt="person">
                            </a>
                        </div>
                        <div class="ct-personName">
                            <h4 class="ct-personName--title ct-fw-600">
                                Mohamed Said
                            </h4>
                                <span class="ct-personName--meta ct-u-colorMotive">
                                    Web Designer
                                </span>
                        </div>
                    </div>
                    <div class="ct-personDescription">
                        <p>
                            Ut enim ad minima veniam, quis
                            nostrum exercitationem ullamcorpor
                            suscipit laboriosam
                        </p>
                    </div>
                </div>
            </div>
            <div class="clearfix visible-md"></div>
            <div class="col-md-6 col-lg-3">
                <div class="ct-personBox ct-u-marginBottom30">
                    <div class="ct-personMedia">
                        <div class="ct-personImage">
                            <a href="memberSingle">
                                <img src="assets/images/demo-content/members7.jpg" alt="person">
                            </a>
                        </div>
                        <div class="ct-personName">
                            <h4 class="ct-personName--title ct-fw-600">
                                Mohamed Said
                            </h4>
                                <span class="ct-personName--meta ct-u-colorMotive">
                                    Web Designer
                                </span>
                        </div>
                    </div>
                    <div class="ct-personDescription">
                        <p>
                            Ut enim ad minima veniam, quis
                            nostrum exercitationem ullamcorpor
                            suscipit laboriosam
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="ct-personBox ct-u-marginBottom30">
                    <div class="ct-personMedia">
                        <div class="ct-personImage">
                            <a href="memberSingle">
                                <img src="assets/images/demo-content/members8.jpg" alt="person">
                            </a>
                        </div>
                        <div class="ct-personName">
                            <h4 class="ct-personName--title ct-fw-600">
                                Mohamed Said
                            </h4>
                                <span class="ct-personName--meta ct-u-colorMotive">
                                    Web Designer
                                </span>
                        </div>
                    </div>
                    <div class="ct-personDescription">
                        <p>
                            Ut enim ad minima veniam, quis
                            nostrum exercitationem ullamcorpor
                            suscipit laboriosam
                        </p>
                    </div>
                </div>
            </div>
            <div class="clearfix visible-md"></div>
            <div class="col-md-6 col-lg-3">
                <div class="ct-personBox ct-u-marginBottom30">
                    <div class="ct-personMedia">
                        <div class="ct-personImage">
                            <a href="memberSingle">
                                <img src="assets/images/demo-content/members9.jpg" alt="person">
                            </a>
                        </div>
                        <div class="ct-personName">
                            <h4 class="ct-personName--title ct-fw-600">
                                Mohamed Said
                            </h4>
                                <span class="ct-personName--meta ct-u-colorMotive">
                                    Web Designer
                                </span>
                        </div>
                    </div>
                    <div class="ct-personDescription">
                        <p>
                            Ut enim ad minima veniam, quis
                            nostrum exercitationem ullamcorpor
                            suscipit laboriosam
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="ct-personBox ct-u-marginBottom30">
                    <div class="ct-personMedia">
                        <div class="ct-personImage">
                            <a href="memberSingle">
                                <img src="assets/images/demo-content/members10.jpg" alt="person">
                            </a>
                        </div>
                        <div class="ct-personName">
                            <h4 class="ct-personName--title ct-fw-600">
                                Mohamed Said
                            </h4>
                                <span class="ct-personName--meta ct-u-colorMotive">
                                    Web Designer
                                </span>
                        </div>
                    </div>
                    <div class="ct-personDescription">
                        <p>
                            Ut enim ad minima veniam, quis
                            nostrum exercitationem ullamcorpor
                            suscipit laboriosam
                        </p>
                    </div>
                </div>
            </div>
            <div class="clearfix visible-md"></div>
            <div class="col-md-6 col-lg-3">
                <div class="ct-personBox ct-u-marginBottom30">
                    <div class="ct-personMedia">
                        <div class="ct-personImage">
                            <a href="memberSingle">
                                <img src="assets/images/demo-content/members11.jpg" alt="person">
                            </a>
                        </div>
                        <div class="ct-personName">
                            <h4 class="ct-personName--title ct-fw-600">
                                Mohamed Said
                            </h4>
                                <span class="ct-personName--meta ct-u-colorMotive">
                                    Web Designer
                                </span>
                        </div>
                    </div>
                    <div class="ct-personDescription">
                        <p>
                            Ut enim ad minima veniam, quis
                            nostrum exercitationem ullamcorpor
                            suscipit laboriosam
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="ct-personBox ct-u-marginBottom30">
                    <div class="ct-personMedia">
                        <div class="ct-personImage">
                            <a href="memberSingle">
                                <img src="assets/images/demo-content/members12.jpg" alt="person">
                            </a>
                        </div>
                        <div class="ct-personName">
                            <h4 class="ct-personName--title ct-fw-600">
                                Mohamed Said
                            </h4>
                                <span class="ct-personName--meta ct-u-colorMotive">
                                    Web Designer
                                </span>
                        </div>
                    </div>
                    <div class="ct-personDescription">
                        <p>
                            Ut enim ad minima veniam, quis
                            nostrum exercitationem ullamcorpor
                            suscipit laboriosam
                        </p>
                    </div>
                </div>
            </div>-->
            <div class="clearfix visible-md"></div> 
        </div>
      <!--   <nav class="ct-u-marginTop20">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">&lt;</a>
                </li>
                <li><a href="#">1</a></li>
                <li class="active"><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">></a>
                </li>
            </ul>
        </nav>  -->
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