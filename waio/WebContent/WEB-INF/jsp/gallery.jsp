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
                    Gallery
                </span>
            </div>
            <div class="ct-u-displayTableCell text-right">
                <span class="ct-u-textNormal ct-u-textItalic">
                    <a href="index.html">Features</a> / <a href="#">Gallery</a>
                </span>
            </div>
        </div>
    </div>
</div>
<section class="ct-u-paddingBoth100 ct-u-backgroundLightGreen">
    <div class="container">
        <div class="ct-u-sectionMotive text-center">
            <h3 class="ct-u-colorMotive ct-u-marginBottom40 ct-fw-600 text-uppercase">
                Recent works
            </h3>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <p class="ct-fw-600">
                        The European languages are members of the same family. Their separate existence is a myth. For science,
                        vocabulary. The languages only differ in their grammar .
                    </p>
                </div>
            </div>
            <ul class="ct-gallery-filters ct-js-gallery-filters text-uppercase ct-u-doubleBorder">
                <li><a data-filter="*" class="btn btn-motive active"><span>All</span></a></li>
                <li><a data-filter=".web" class="btn btn-motive"><span>web design</span></a></li>
                <li><a data-filter=".wordpress" class="btn btn-motive"><span>wordpress</span></a></li>
                <li><a data-filter=".marketing" class="btn btn-motive"><span>marketing</span></a></li>
                <li><a data-filter=".graphic" class="btn btn-motive"><span>graphic design</span></a></li>
            </ul>
        </div>
        <div id="ct-gallery" class="ct-gallery ct-gallery--rounded ct-gallery--arrowBottom row ct-js-magnificPortfolioPopupGroup">
            <a class="ct-js-magnificPopupImage" href="assets/images/demo-content/header2.jpg" title="Our Gallery">
                <div class="ct-gallery-item ct-u-marginBottom30 col-sm-4 wordpress">
                    <figure class="ct-u-relative   ">
                        <img src="assets/images/demo-content/gallery1.jpg" alt="">
                        <figcaption class="ct-u-colorWhite">
                            <div class="ct-u-displayTable ct-gallery-meta">
                                <div class="ct-u-displayTableCell text-left">
                                    <h4>Project name</h4>
                                    <div class="text-left">
                                        <span>Logo, </span>
                                        <span>Design</span>
                                    </div>
                                </div>
                                <div class="ct-u-displayTableCell text-right">
                                    <i class="fa fa-heart"></i>
                                </div>
                            </div>
                        </figcaption>
                    </figure>
                </div>
            </a>
            <a class="ct-js-magnificPopupImage" href="assets/images/demo-content/header.jpg" title="Our Gallery">
                <div class="ct-gallery-item ct-u-marginBottom30 col-sm-4 marketing">
                    <figure class="ct-u-relative ">
                        <img src="assets/images/demo-content/gallery2.jpg" alt="">
                        <figcaption class="ct-u-colorWhite">
                            <div class="ct-u-displayTable ct-gallery-meta">
                                <div class="ct-u-displayTableCell text-left">
                                    <h4>Project name</h4>
                                    <div class="text-left">
                                        <span>Logo, </span>
                                        <span>Design</span>
                                    </div>
                                </div>
                                <div class="ct-u-displayTableCell text-right">
                                    <i class="fa fa-heart"></i>
                                </div>
                            </div>
                        </figcaption>
                    </figure>
                </div>
            </a>
            <a class="ct-js-magnificPopupImage" href="assets/images/demo-content/header4.jpg" title="Our Gallery">
                <div class="ct-gallery-item ct-u-marginBottom30 col-sm-4 graphic">
                    <figure class="ct-u-relative  ">
                        <img src="assets/images/demo-content/gallery3.jpg" alt="">
                        <figcaption class="ct-u-colorWhite">
                            <div class="ct-u-displayTable ct-gallery-meta">
                                <div class="ct-u-displayTableCell text-left">
                                    <h4>Project name</h4>
                                    <div class="text-left">
                                        <span>Logo, </span>
                                        <span>Design</span>
                                    </div>
                                </div>
                                <div class="ct-u-displayTableCell text-right">
                                    <i class="fa fa-heart"></i>
                                </div>
                            </div>
                        </figcaption>
                    </figure>
                </div>
            </a>
            <a class="ct-js-magnificPopupImage" href="assets/images/demo-content/header5.jpg" title="Our Gallery">
                <div class="ct-gallery-item ct-u-marginBottom30 col-sm-4 graphic">
                    <figure class="ct-u-relative ">
                        <img src="assets/images/demo-content/gallery4.jpg" alt="">
                        <figcaption class="ct-u-colorWhite">
                            <div class="ct-u-displayTable ct-gallery-meta">
                                <div class="ct-u-displayTableCell text-left">
                                    <h4>Project name</h4>
                                    <div class="text-left">
                                        <span>Logo, </span>
                                        <span>Design</span>
                                    </div>
                                </div>
                                <div class="ct-u-displayTableCell text-right">
                                    <i class="fa fa-heart"></i>
                                </div>
                            </div>
                        </figcaption>
                    </figure>
                </div>
            </a>
            <a class="ct-js-magnificPopupImage" href="assets/images/demo-content/header6.jpg" title="Our Gallery">
                <div class="ct-gallery-item ct-u-marginBottom30 col-sm-4 web">
                    <figure class="ct-u-relative ">
                        <img src="assets/images/demo-content/gallery5.jpg" alt="">
                        <figcaption class="ct-u-colorWhite">
                            <div class="ct-u-displayTable ct-gallery-meta">
                                <div class="ct-u-displayTableCell text-left">
                                    <h4>Project name</h4>
                                    <div class="text-left">
                                        <span>Logo, </span>
                                        <span>Design</span>
                                    </div>
                                </div>
                                <div class="ct-u-displayTableCell text-right">
                                    <i class="fa fa-heart"></i>
                                </div>
                            </div>
                        </figcaption>
                    </figure>
                </div>
            </a>


            <a class="ct-js-magnificPopupImage" href="assets/images/demo-content/gallery1.jpg" title="Our Gallery">
                <div class="ct-gallery-item ct-u-marginBottom30 col-sm-4 wordpress">
                    <figure class="ct-u-relative ">
                        <img src="assets/images/demo-content/gallery6.jpg" alt="">
                        <figcaption class="ct-u-colorWhite">
                            <div class="ct-u-displayTable ct-gallery-meta">
                                <div class="ct-u-displayTableCell text-left">
                                    <h4>Project name</h4>
                                    <div class="text-left">
                                        <span>Logo, </span>
                                        <span>Design</span>
                                    </div>
                                </div>
                                <div class="ct-u-displayTableCell text-right">
                                    <i class="fa fa-heart"></i>
                                </div>
                            </div>
                        </figcaption>
                    </figure>
                </div>

            </a>

            <a class="ct-js-magnificPopupImage" href="assets/images/demo-content/header7.jpg" title="Our Gallery">
                <div class="ct-gallery-item ct-u-marginBottom30 col-sm-4 marketing">
                    <figure class="ct-u-relative ">
                        <img src="assets/images/demo-content/gallery7.jpg" alt="">
                        <figcaption class="ct-u-colorWhite">
                            <div class="ct-u-displayTable ct-gallery-meta">
                                <div class="ct-u-displayTableCell text-left">
                                    <h4>Project name</h4>
                                    <div class="text-left">
                                        <span>Logo, </span>
                                        <span>Design</span>
                                    </div>
                                </div>
                                <div class="ct-u-displayTableCell text-right">
                                    <i class="fa fa-heart"></i>
                                </div>
                            </div>
                        </figcaption>
                    </figure>
                </div>
            </a>

            <a class="ct-js-magnificPopupImage" href="assets/images/demo-content/gallery8.jpg" title="Our Gallery">
                <div class="ct-gallery-item ct-u-marginBottom30 col-sm-4 web">
                    <figure class="ct-u-relative ">
                        <img src="assets/images/demo-content/gallery8.jpg" alt="">
                        <figcaption class="ct-u-colorWhite">
                            <div class="ct-u-displayTable ct-gallery-meta">
                                <div class="ct-u-displayTableCell text-left">
                                    <h4>Project name</h4>
                                    <div class="text-left">
                                        <span>Logo, </span>
                                        <span>Design</span>
                                    </div>
                                </div>
                                <div class="ct-u-displayTableCell text-right">
                                    <i class="fa fa-heart"></i>
                                </div>
                            </div>
                        </figcaption>
                    </figure>
                </div>

            </a>

            <a class="ct-js-magnificPopupImage" href="assets/images/demo-content/gallery9.jpg" title="Our Gallery">
                <div class="ct-gallery-item ct-u-marginBottom30 col-sm-4 marketing">
                    <figure class="ct-u-relative  ">
                        <img src="assets/images/demo-content/gallery9.jpg" alt="">
                        <figcaption class="ct-u-colorWhite">
                            <div class="ct-u-displayTable ct-gallery-meta">
                                <div class="ct-u-displayTableCell text-left">
                                    <h4>Project name</h4>
                                    <div class="text-left">
                                        <span>Logo, </span>
                                        <span>Design</span>
                                    </div>
                                </div>
                                <div class="ct-u-displayTableCell text-right">
                                    <i class="fa fa-heart"></i>
                                </div>
                            </div>
                        </figcaption>
                    </figure>
                </div>
            </a>
        </div>
    </div>
</section>


<footer>
	<%@ include file="footer.jsp" %>
</footer>
</div>

<!-- JavaScripts -->

<script src="assets/js/main-compiled.js"></script>

<script src="assets/js/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="assets/js/magnific-popup/init.js"></script>

<script src="assets/js/isotope/jquery.isotope.min.js"></script>
<script src="assets/js/isotope/imagesloaded.js"></script>
<script src="assets/js/isotope/infinitescroll.min.js"></script>
<script src="assets/js/isotope/init.js"></script>

</body>

</html>