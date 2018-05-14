<%
	boolean isLoginState = Boolean.parseBoolean(request.getParameter("isLoginState"));
%>

<header id="top_title">
	<a href="index.jsp"><img id="ic_header_logo"src="include/images/logo.png"/></a>
	<section id="hd_right_items">
	
			<%
				if(isLoginState){
			%>
			<a href="basket.jsp">
			<!-- 장바구니 -->
			<img id="ic_shopping_basket" src="include/images/ic_gift_black.svg"/>
			</a>
	
			<a href="purchaseList.jsp">
			<!-- 구매내역 -->			
			<img id="ic_user_profile" src="include/images/ic_user_profile.svg"/>
			</a>
	
			<%}else{ %>
			<a href="login.jsp?fromSignIn=false&isFail=false">
			<img id="ic_user_profile" src="include/images/ic_user_add.svg"/>
			</a>
			<%} %>
			
	</section>
</header>