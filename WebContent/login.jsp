<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="include/script/login.js"></script>
</head>
<body>
	<section id="sc_login">
		<form action="loginProc.jsp"  method="POST">
			<input type="text" name="id" id="ip_id"/>
			<input type="password" name="pw" id="ip_pw"/>
			<input type="button" value="LogIn" id="btn_login"/>	
			<a href="signIn.jsp">Join us?</a>
		</form>
	</section>
</body>
</html>