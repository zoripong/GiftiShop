<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="sc_menu">
		<ul>
			<% for(int i = 0; i<5; i++){%>
			<li><a href="main.jsp?MENU_NAME=menu_0<%=i%>"><img src="include/images/menu_0<%=i%>.png"/></a></li>
			<%
			}%>
		
		</ul>
	
	</section>

</body>
</html>