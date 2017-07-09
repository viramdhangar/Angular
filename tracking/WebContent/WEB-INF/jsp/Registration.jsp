<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
body{
background-color:orange;
}
h3 {
color:yellow;
margin-left:40px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<h1><title>please Registration here</title></h1>
</head>
<body>
<form action="saveUser" method="post">
First Name <input type="text" name="firstname" placeholder="firstname"><br>
Last Name <input type="text" name="lastname" placeholder="lastname"><br>
EmailId <input type="text" name="emailId" placeholder="emailId"><br>
Password<input type="text" name="password" placeholder="emailId"><br>
<input type="submit" value="Submit">
</form>

</body>
</html>