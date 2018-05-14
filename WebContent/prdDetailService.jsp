<%@page import="model.Product"%>
<%@page import="model.BasketProduct"%>
<%@page import="Reader.BasketController"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		User user = (User)session.getAttribute("user_id");

		String PRD_IMAGE = request.getParameter("PRD_IMAGE");
		String PRD_STORE = request.getParameter("PRD_STORE");
		String PRD_NAME = request.getParameter("PRD_NAME");
		String PRD_PRICE = request.getParameter("PRD_PRICE");
		String PRD_TYPE = request.getParameter("PRD_TYPE");
		
		if(user == null){%>
			<jsp:forward page="prdDetail.jsp?PRD_IMAGE=<%=PRD_IMAGE %>&PRD_STORE=<%=PRD_STORE %>&PRD_NAME=<%=PRD_NAME%>&PRD_PRICE=<%=PRD_PRICE%>&PRD_TYPE<%=PRD_TYPE %>&isNotLogin=1"/>
		<%}else{
			
		
		BasketController basketController = new BasketController(application.getRealPath("./data/basket/"+user.getUserId()+".txt"));
		
		String num = request.getParameter("prd_num");
		String message = request.getParameter("prd_message");
		
		System.out.println(PRD_IMAGE);
		System.out.println(PRD_TYPE);
		System.out.println(PRD_PRICE);
		Product prd = new Product(PRD_NAME, PRD_STORE, PRD_TYPE, PRD_PRICE, PRD_IMAGE);
		BasketProduct bprd = new BasketProduct(prd, num, message);
		
		
		if(basketController.insertData(bprd)){
			// 장바구니로 이동하시겠습니까?
					%>		
			<jsp:forward page="basket.jsp"/>
		<%}else{%>
			<jsp:forward page="prdDetail.jsp?PRD_IMAGE=<%=PRD_IMAGE %>&PRD_STORE=<%=PRD_STORE %>&PRD_NAME=<%=PRD_NAME%>&PRD_PRICE=<%=PRD_PRICE%>&PRD_TYPE<%=PRD_TYPE %>&isFail=1"/>
		<%}
		
		}
		
	%>
</body>
</html>