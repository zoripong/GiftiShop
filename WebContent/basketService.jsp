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
		BasketController basketController = new BasketController(application.getRealPath("./data/basket/"+user.getUserId()+".txt"));
		
		if(basketController.getCount() == 0){
			%>
			<jsp:forward page="basket.jsp?isZero=1"/>
			
			<%
		}
		if(basketController.purchaseCoupon(application.getRealPath("./data/purchase_details/"+user.getUserId()+".txt"))){
			//성공
			%>
			<jsp:forward page="purchaseList.jsp"/>
		<%}else{
			//실패
			%>
			
			<jsp:forward page="index.jsp?isFail=1"/>

		<%}
	%>
</body>
</html>