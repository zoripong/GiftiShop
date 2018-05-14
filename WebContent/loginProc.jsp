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
	
	User user = new User(request.getParameter("id"),request.getParameter("pw"));
	UserController userReader = new UserController(application.getRealPath("./data/users.txt"));
	System.out.println("왜지 ? " + userReader);
	
	System.out.println("return ? "+userReader.isExist(user));
	
	if(userReader.isExist(user)){
		// 로그인 성공		
		session.setAttribute("user_id", user);
		System.out.println("로그인성공~");

		%>
		<jsp:forward page="index.jsp"/>
		
		<%
	}else {
		// 로그인 실패
		System.out.println("로그인 실패?");
		%>
		
		<jsp:forward page="login.jsp?fromSignin=false&isFail=true"/>
	<%}
	
%>

</body>
</html>