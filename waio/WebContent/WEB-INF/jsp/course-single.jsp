<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<html class="no-js" lang="en">
<head lang="en">
<meta charset="UTF-8">
<meta name="description" content="Uacademy - Creative HTML Template">
<meta name="author" content="CreateIT">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, shrink-to-fit=no">

<link rel="shortcut icon" href="assets/images/demo-content/favicon.png">
<link rel="apple-touch-icon"
	href="assets/images/demo-content/favicon.png">

<title>Course details</title>

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
		<div class="ct-preloader-content"></div>
	</div>
	<nav class="ct-menuMobile">
		<%@ include file="header-menu-mobile.jsp"%>
	</nav>
	<div class="ct-navbarCart ct-navbarCart--mobile">
		<div class="ct-navbarCart--Info">
			<div
				class="media ct-navbarCart--Item ct-u-displayTable ct-hoverImage--rectangle">
				<a href="course-single.html">
					<div class="media-left">
						<img class="media-object"
							src="assets/images/demo-content/itemCart1.jpg" alt="Item Cart">
					</div>
					<div class="media-body">
						<h5 class="ct-navbarCart--itemName ct-fw-400">Your Product
							Name</h5>
						<span class="ct-navbarCart--itemPrice ct-u-colorMotive">90x3</span>
					</div>
				</a>
			</div>
			<div
				class="media ct-navbarCart--Item ct-u-displayTable ct-hoverImage--rectangle">
				<a href="course-single.html">
					<div class="media-left">
						<img class="media-object"
							src="assets/images/demo-content/itemCart2.jpg" alt="Item Cart">
					</div>
					<div class="media-body">
						<h5 class="ct-navbarCart--itemName ct-fw-400">Your Product
							Name</h5>
						<span class="ct-navbarCart--itemPrice ct-u-colorMotive">90x3</span>
					</div>
				</a>
			</div>
			<div
				class="media ct-navbarCart--Item ct-u-displayTable ct-hoverImage--rectangle">
				<a href="course-single.html">
					<div class="media-left">
						<img class="media-object"
							src="assets/images/demo-content/itemCart3.jpg" alt="Item Cart">
					</div>
					<div class="media-body">
						<h5 class="ct-navbarCart--itemName ct-fw-400">Your Product
							Name</h5>
						<span class="ct-navbarCart--itemPrice ct-u-colorMotive">90x3</span>
					</div>
				</a>
			</div>
			<div class="ct-navbarCart--summary">
				<div class="pull-left">
					<a class="ct-fw-400" href="#"><i class="fa fa-trash-o"></i>
						Clear The Cart</a>
				</div>
				<div class="pull-right">Total: $54.30</div>
				<div class="clearfix"></div>
			</div>
			<a href="#"
				class="btn btn-primaryDark ct-fw-600 text-uppercase ct-u-marginTop30">Checkout</a>
		</div>
	</div>

	<div id="ct-js-wrapper" class="ct-pageWrapper">
		<div class="ct-navbarMobile">
			<a class="navbar-brand" href="index"><img
				src="assets/images/demo-content/logo.png" alt="Website Logo">
			</a>
			<button type="button" class="navbar-toggle">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<button type="button" class="ct-navbarCart--mobileIcon">
				<span class="sr-only">Toggle navigation</span> <span><i
					class="fa fa-shopping-cart"></i></span>
			</button>
		</div>
		<%@ include file="header-web.jsp" %>

		<!-- Modal -->
		<div class="modal ct-js-searchModal fade" id="myModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h3 class="modal-title" id="myModalLabel">Search Results</h3>
					</div>
					<div class="modal-body"></div>
				</div>
			</div>
		</div>

		<div class="modal ct-modal ct-js-modal-login fade" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-close"></i></span>
						</button>
						<h3 class="modal-title text-uppercase">Login</h3>
					</div>
					<div class="modal-body">
						<form class="ct-u-paddingBottom100">
							<div class="form-group ct-u-marginBottom50">
								<input placeholder="E-mail" type="text" required=""
									name="field[]"
									class="form-control ct-input--type1 input-hg ct-u-marginBottom50"
									title="Login"> <input placeholder="Password"
									type="text" required="" name="field[]"
									class="form-control ct-input--type1 input-hg ct-u-marginBottom50"
									title="Password">
								<div class="ct-checbox--custom">
									<input id="remember" type="checkbox" name="remember"
										value="remember"> <label for="remember">remember
										me</label>
								</div>
							</div>
							<div class="text-center">
								<button type="submit"
									class="btn btn-primary btn-lg text-uppercase">
									<span>Sign In</span>
								</button>
								<div class="ct-u-marginTop50">
									<a href="#"><i class="fa fa-info-circle"></i> Forgot
										Password ?</a> <a href="#"><i class="fa fa-long-arrow-right"></i>
										Register Now ?</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="modal ct-modal ct-js-modal-signup fade" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"><i class="fa fa-close"></i></span>
						</button>
						<h3 class="modal-title text-uppercase">Signup</h3>
					</div>
					<div class="modal-body">
						<form class="ct-u-paddingBottom100">
							<div class="form-group ct-u-marginBottom50">
								<div class="row">
									<div class="col-md-6">
										<input placeholder="Name" type="text" required=""
											name="field[]"
											class="form-control ct-input--type1 input-hg ct-u-marginBottom50"
											title="Name"> <input placeholder="Password"
											type="text" required="" name="field[]"
											class="form-control ct-input--type1 input-hg ct-u-marginBottom50"
											title="Password">
									</div>
									<div class="col-md-6">
										<input placeholder="Email" type="text" required=""
											name="field[]"
											class="form-control ct-input--type1 input-hg ct-u-marginBottom50"
											title="Email"> <input placeholder="Repeat Password"
											type="text" required="" name="field[]"
											class="form-control ct-input--type1 input-hg ct-u-marginBottom50"
											title="Repeat">
									</div>
								</div>


								<div class="ct-checbox--custom">
									<input id="signup" type="checkbox" name="signup" value="signup">
									<label for="signup">I agree with <a href="#"
										class="ct-u-textUnderline">The terms of use</a>
									</label>
								</div>
							</div>
							<div class="text-center">
								<button type="submit"
									class="btn btn-primary btn-lg text-uppercase">
									<span>Sign Up</span>
								</button>
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
						<span class="ct-u-textBig"> information system </span>
					</div>
					<div class="ct-u-displayTableCell text-right">
						<span class="ct-u-textNormal ct-u-textItalic"> <a
							href="index">Home</a> / <a href="courses">Course</a>
						</span>
					</div>
				</div>
			</div>
		</div>
		<section
			class="ct-u-paddingBoth100 ct-u-doubleBorder ct-u-backgroundLightGreen">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="ct-sidebarProducts">
							<div class="ct-productBox">
								<a href="#">
									<div class="ct-productImage">
										<img src="${course.imagePath}" alt="Product">
									</div>
									<div class="ct-productDescription">
										<h4 class="ct-fw-600">${course.course}</h4>
										<span>${course.description}</span>
									</div>
								</a>
								<div class="ct-productMeta">
									<div class="ct-u-displayTableVertical">
										<div class="ct-u-displayTableCell">
											<div class="starrr" data-rating="${course.starHits}"></div>
										</div>
										<div class="ct-u-displayTableCell">
											<span class="ct-u-colorMotive">${course.price}</span> <span
												class="ct-u-textLineThrough">290$</span>
										</div>
										<div class="ct-u-displayTableCell">
											<a href="#">${course.countTrainee} <i class="fa fa-user"></i></a>
										</div>
									</div>
								</div>
							</div>
							<%-- <div class="ct-personBox ct-personBox--inline">
                        <div class="ct-personMedia ct-u-displayTableVertical">
                            <div class="ct-u-displayTableCell">
                                <div class="ct-personImage">
                                    <img src="assets/images/demo-content/personBoxImage1-circle.jpg" alt="person">
                                </div>
                            </div>
                            <div class="ct-u-displayTableCell">
                                <div class="ct-personName">
                                <span class="ct-personName--title ct-fw-700">
                                    ${course.course}
                                </span>
                                <span class="ct-personName--meta text-lowercase">
                                    senior ui ux designer
                                </span>
                                </div>
                            </div>
                        </div>
                        <div class="ct-personDescription">
                            <p>
                                In just 2 years Victor has become one of the most
                                successful instructors on the web. Victor's incred
                                ble rising story has been covered on the Wall Stre
                                et Journal, MIT Journal, Slate and the Sydney Mo
                                rning Herald <a href="#">Moree..</a>
                            </p>
                        </div>
                    </div> --%>
							<!-- <div class="ct-sidebarNavigation">
                        <ul class="list-unstyled">
                            <li class="ct-fw-700"><a href="#"><i class="fa fa-paper-plane-o"></i>Home</a></li>
                            <li class="ct-fw-700"><a href="#"><i class="fa fa-laptop"></i>Curriculum</a></li>
                            <li class="ct-fw-700"><a href="#"><i class="fa fa-user"></i>Members</a></li>
                            <li class="ct-fw-700"><a href="#"><i class="fa fa-comments-o"></i>Events</a></li>
                            <li class="ct-fw-700"><a href="#"><i class="fa fa-stack-overflow"></i>Forum</a></li>
                        </ul>
                    </div> -->
						</div>
					</div>
					<div class="hidden-lg hidden-md ct-u-marginBottom30"></div>
					<div class="col-md-8">
						<div
							class="ct-textBox ct-textBox--price ct-u-displayTableVertical ct-u-marginBottom30">
							<div class="ct-u-displayTableCell text-left">
								<span class="ct-fw-600">Price :</span> <span
									class="ct-u-colorMotive">${course.price} <span
									class="ct-u-textLineThrough"> 290$</span></span>
							</div>
							<div class="ct-u-displayTableCell text-right">
								<button type="submit" class="btn btn-primary text-capitalize">
									take this course</button>
							</div>
						</div>
						<div class="ct-textBox">
							<h4 class="ct-fw-600 ct-u-marginBottom40">${course.heading1}
							</h4>
							<p class="ct-u-marginBottom40">${course.para1}</p>
							<h4 class="ct-fw-600 ct-u-marginBottom40">${course.heading2}
							</h4>
							<p class="ct-u-marginBottom40">${course.para2}</p>
							<h4 class="ct-fw-600 ct-u-marginBottom40">${course.heading3}
							</h4>
							<p class="ct-u-marginBottom40">${course.para3}</p>
							<ul
								class="list-unstyled ct-list-arrowBackground ct-fw-600 ct-u-marginBottom40">
								<li>The Basics: Core Java, jsp, servlet and JDBC</li>
								<li>BackEnd Development: MySQL, Oracle</li>
								<li>FrontEnd Development: AJAX, jQuery, HTML5 and CSS3</li>
								<li>Framworks : Spring, Hibernate and Struts.</li>
							</ul>


						</div>
					</div>
				</div>
			</div>
		</section>
		<footer>
			<%@ include file="footer.jsp"%>
		</footer>
	</div>

	<!-- JavaScripts -->

	<script src="assets/js/main-compiled.js"></script>

</body>
</html>