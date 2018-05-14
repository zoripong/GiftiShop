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
	<%
		boolean fromSignin = Boolean.parseBoolean(request.getParameter("fromSignIn"));
		boolean isFail = Boolean.parseBoolean(request.getParameter("isFail"));
		
		System.out.println("fromSignin : " + fromSignin);
		if (fromSignin) {
			out.println("<script>alert('회원가입이 완료되었습니다 :)');</script>");
		}
		
		if(isFail){
			out.println("<script>alert('존재하지 않는 계정입니다. :(');</script>");
		}
		
	%>
	<section id="sc_login">
	<form id="login_form" action="loginProc.jsp" method="POST">
		<a href="index.jsp"><img src="include/images/logo.png" id="img_home" /></a><br /> 
		<input class="input_text" type="text" name="id" required placeholder="ID" /><br /> 
		<input class="input_text" type="password" name="pw" required placeholder="Password" /><br />
		<input id="btn_login" type="submit"	value="Log In" /><br /> <a href="signin.jsp?isFirst=true">
		<p id="link_signin">Join us?</p></a>
	</form>
	</section>
</body>
</html>