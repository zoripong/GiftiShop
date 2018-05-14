<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="Reader.*" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	User user = new User(request.getParameter("id"), request.getParameter("pw"));
	UserController userReader = new UserController(application.getRealPath("./data/users.txt"));
	
	if(userReader.isValidID(user)){%>
		<jsp:forward page="signin.jsp?isFirst=false"/>
		
	<%		
	}else{
		userReader.insert(user);
		%>
		<jsp:forward page="login.jsp?fromSignIn=true&isFail=false"/>
		<%
	}
	
%>


</body>
</html>