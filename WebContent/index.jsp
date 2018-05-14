<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		User user = (User)session.getAttribute("user_id");
		System.out.println("USER ?? ? ?");	
		boolean isLoginState = false;
		if(user == null){
			//로그인 전
			isLoginState = false;
		}else{
			//로그인 후
			isLoginState = true;
		}
		String MENU_NAME = request.getParameter("MENU_NAME");
	%>
	
	<jsp:forward page="template.jsp">
		<jsp:param name="isLoginState" value="<%=isLoginState%>"/>
		<jsp:param name="CONTENTPAGE" value="indexProc.jsp?MENU_NAME=<%=MENU_NAME%>" />
	</jsp:forward>	
	
</body>
</html>
