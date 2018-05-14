<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="include/css/login.css">

</head>
<body>
	<section id="sc_login">
		<form id="login_form" action="loginProc.jsp" method="POST">
			<h1>Log In</h1>
			<input class="input_text" type="text" name="id" required placeholder="ID"/><br/>
			<input class="input_text" type="password" name="pw" required placeholder="Password"/><br/>
			<input id="btn_login" type="button" value="Log In" />	<br/>
			<a href="signin.jsp"><p id="link_signin">Join us?</p></a>
		</form>
	</section>
</body>
</html>