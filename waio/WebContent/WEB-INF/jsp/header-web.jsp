<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="ct-topBar text-center">
    <div class="container">
        <ul class="ct-panel--user list-inline pull-left">
        <%-- <%= session.getAttribute("userName")!=null?"":"<li><a href='#' class='ct-js-login'>Login<i class='fa fa-lock'></i></a></li><li><a href='registration' class='ct-js-signup'>Sign Up<i class='fa fa-user'></i></a></li>"%> --%>
            <!-- <li><a href="#" class="ct-js-login">Login<i class="fa fa-lock"></i></a></li>
            <li><a href="registration" class="ct-js-signup">Sign Up<i class="fa fa-user"></i></a></li> -->
        </ul>
        <div class="ct-widget--group pull-right">
        	<!-- <ul class="ct-widget--socials list-inline text-uppercase"> -->
 			${logoutMsg}
            <ul class="ct-widget--socials list-inline">
            	<%= session.getAttribute("userName")!=null?"Welcome: "+session.getAttribute("userName")+" | <a href='logout' class='ct-js-logout-msg'><font color='blue'>Logout</font></a>":""%>
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
		<nav class="navbar navbar-default navbar-parts  yamm " data-heighttopbar="60px" data-startnavbar="0">
    <div class="navbar-headerTop">
        <div class="container">
            <div class="btn-group pull-left">
                <button type="button" class="btn btn-md dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-bars"></i> Browse Courses
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="course?courseId=100">Java</a></li>
                    <li><a href="course?courseId=101">HTML5/CSS3</a></li>
                    <li><a href="course?courseId=102">JQuery</a></li>
                </ul>
            </div>
            <div class="navbar-header">
                <a href="index"><img src="assets/images/demo-content/logo.png" alt="logo"/></a>
            </div>
            <div class="pull-right ct-searchInput--icon">
                <div class="form-group">
                    <input id="search" placeholder="Search for Courses" required="" type="text" class="form-control input-lg ct-searchCourse">
                </div>
                <button type="submit" class="ct-search-button"><i class="fa fa-search"></i></button>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="container">
    <%@ include file="header-menu-web.jsp" %>
       <!-- <ul class="nav navbar-nav ct-navbar--fadeInUp">
            <li class="dropdown active"><a href="index">Home</a> </li>
			<li class="dropdown yamm-fw"><a href="aboutus">About Us</a></li>
			<li class="dropdown yamm-fw"><a href="courses">Courses</a> </li>
			<li class="dropdown yamm-fw"><a href="members">Members</a> </li>
			<li class="dropdown yamm-fw"><a href="gallery">Gallery</a> </li>
			<li class="dropdown yamm-fw"><a href="syllabus">Syllabus</a> </li>
			<li class="dropdown"><a href="contact">Contact</a></li>
		</ul> -->
    </div>
</nav>
</body>
</html>