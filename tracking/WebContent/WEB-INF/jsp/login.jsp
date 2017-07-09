
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
body{
background-color:grey;
}
h2{
color:red;
}
h3{
color:yellow;
margin-left:50px;
margin-bottom:30px;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<h1><title>please Login here</title></h1>
</head>
<body>

<form action="login" method="GET">
 <h3> EmailId <input type="text" name="emailId" ><br></h3>
 <h3> Password <input type="text" name="password"><br></h3>
  <h3><input type="submit" value="login"></h3>
</form>
<h2><a href="saveUser">SignUp</a></h2>
 <h2><a href="getusers">User List</a></h2>
  
</body>
</html>