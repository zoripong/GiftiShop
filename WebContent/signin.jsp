<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="include/css/signin.css">
<script src="include/script/signin.js"></script>
</head>
<body>
	<section id="sc_signin">
	
		<form id="sigin_form" action="signinProc.jsp" method="POST">
			<h1>Sign In</h1>
			<input class="input_text" type="text" id="ip_id" name="id" placeholder="ID" required/><br/>
			<input class="input_text" type="password" id="ip_pw" name="pw" placeholder="Password" required/><br/>
			<input class="input_text" type="password" id="ip_re_pw" placeholder="Repeat Password" required/><br/>
			<input type="button" id="btn_signin" value="Join"/>
		</form>
	</section>
</body>
</html>