<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="model.*"%>
<%@page import="java.util.Map" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
	
	 	Map<String, String[]> params = request.getParameterMap();
	 	
	 	StringBuffer sb = new StringBuffer();
	 	for(String key : params.keySet()){
	 		sb.append(key+"="+params.get(key)[0]+"&");
	 	}
	 	
	 	if(request.getParameter("isNotLogin")!=null){
	 		
	 		%>
	 		<jsp:forward page="login.jsp?isNotLogin=1"/>
	 		<%
	 	}
	 	
		if(request.getParameter("isFail")!=null){
			out.println("<script>alert('실패하였습니다. 다시 시도하세요.');</script>");
	 	}	
	 	
	 	
	 %>
	

	<jsp:forward page="template.jsp">
		<jsp:param name="CONTENTPAGE" value="prdDetailProc.jsp?<%= sb.toString() %>" />
	</jsp:forward>	
	
</body>
</html>