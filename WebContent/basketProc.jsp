<%@page import="Reader.BasketController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.*"%>

<section id="basket_title">
<hr class="bolder_line">
<%
	User user = (User)session.getAttribute("user_id");
	out.println(user.getUserId()+"'s basket");
	
	BasketController basketController = new BasketController(application.getRealPath("./data/basket/"+user.getUserId()+".txt"));
	
	//[픽규어] 원피스 루피(L)	GS	6	29900	product_07	1	오다주움
%>
<hr class="bolder_line">
</section>

<link rel="stylesheet" type="text/css" href="include/css/basket.css">


<section id="item_list">
	
	<section class="bakset_item">
		<img class="item_image" src="data/product_images/product_07.jpg"/>
		<section class="item_center">
			<p class="item_name"><a href="prdDetail.jsp">[픽규어] 원피스 루피(L)</a></p>
			<p class="item_message">오다주움</p>
		</section>
		<p class="item_price">29900</p>
		<p class="item_num">1</p>
	</section>
	<hr class="light_line">

	<section class="bakset_item">
		<img src="data/product_images/product_07.jpg"/>
		<p class="item_name"><a href="prdDetail.jsp">[픽규어] 원피스 루피(L)</a></p>
		<p class="item_message">오다주움</p>
		<p class="item_price">29900</p>
		<p class="item_num">1</p>
	</section>
	<hr class="light_line">
	
	
</section>

