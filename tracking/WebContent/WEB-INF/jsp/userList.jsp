<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
body{
background-color:green;
}

</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="search" method="get">
   <h3>	Search<input type="text" name="searchParam"></h3>
   <h4> <input type="submit" value="search"></h4>
	
</form>

<table>
	<thead>
	    <tr>
	        <th> First Name</th>
	        <th> Last Name</th>
	        <th> EmailId</th>
	        <th> Password</th>

	    </tr>
	    
	    <c:forEach items="${userList}" var="user">
       
       <tr>
           <td>${user.firstname}</td>
           <td>${user.lastname}</td>
           <td>${user.emailId}</td>
           <td>${user.password}</td>
         <td><a href="editUser?emailId=${user.emailId}">Edit</a></td>
		<td><a href="deleteUser?emailId=${user.emailId}">Delete</a></td>
		
       </tr>
       </c:forEach>     
       
    </thead>
</table>
</body>
</html>