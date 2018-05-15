<%@page import="Reader.PurchaseListController"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- <script src="include/script/jquery-barcode.min.js"></script> -->  
  
<link rel="stylesheet" type="text/css" href="include/css/purchaseList.css">
    
<%
	
	User user = (User) session.getAttribute("user_id");
	PurchaseListController plc = new PurchaseListController(application.getRealPath("./data/purchase_details/"+user.getUserId()+".txt"));
	
	if(user.getUserId().equals("admin") && user.getUserPw().equals("admin")){
		%>
		<section id="purchase_list">
			<h1>관리자 페이지</h1>
			<form>
				<input type="text" placeholder="gd"/>
			</form>
		</section>
		<%
	}else{
%>

<%--
	<section class="bakset_item">
		<img class="item_image" src="data/product_images/product_07.jpg"/>
		<section class="item_center">
			<p class="item_name"><a href="prdDetail.jsp">[픽규어] 원피스 루피(L)</a></p>
			<p class="item_message">오다주움</p>
		</section>
		<p class="item_price">29900</p>
		<p class="item_num">1</p>
		<button>X</button>
	</section>
	<hr class="light_line">
 --%>
	
	
<!-- 상품이름	매장	품종	가격	이미지 경로	개수	메세지	사용여부 -->
<section id="purchase_list">
	<% out.println("<p id=\"coupon_size\">사용가능한 쿠폰 수 : <b>"+plc.usableCouponSize()+"/"+plc.totalSize()+"</b></p>"); %>
	<%= plc.createItemList() %>
</section>

<%} %>
<!--  <barcode code="978-0-9542246-0" type="ISBN" height="0.66" text="1" /> -->