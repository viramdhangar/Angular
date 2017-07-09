<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
body{
background-color:yellow;
}
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="editUser" method="POST">
	<input type="hidden" name="emailId" value="${user.emailId}">
	First Name<input type="text" name="firstname" value="${user.firstname}">
	Last Name<input type="text" name="lastname" value="${user.lastname}">
	Password<input type="password" name="password" value="${user.password}">
	<input type="submit" value="Update">
</form>
</body>
</html>