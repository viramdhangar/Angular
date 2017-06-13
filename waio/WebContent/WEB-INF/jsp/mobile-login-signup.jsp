<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="ct-navbarCart--mobileIcon">
		<%=session.getAttribute("userName") != null ? "<a href='logout'><i class='fa fa-sign-out'></i></a>" : "<a href='login'><i class='fa fa-lock'></i></a>"%>
		<%=session.getAttribute("userName") != null ? ""
					: "<a href='registration'><i class='fa fa-user'></i></a>"%>
	</div>
</body>
</html>