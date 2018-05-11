<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="include/script/signin.js"></script>
</head>
<body>
	<section id="sc_signin">
		<form id="sigin_form" action="signinProc.jsp" method="POST">
			<input type="text" id="ip_id" name="id" required/>
			<input type="password" id="ip_pw" name="pw" required/>
			<input type="password" id="ip_re_pw" required/>
			<input type="button" id="btn_signin" value="JOIN"/>
		</form>
	</section>
</body>
</html>