<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	Map<String, String[]> params = request.getParameterMap();

	StringBuffer sb = new StringBuffer();
	for (String key : params.keySet()) {
		sb.append(key + "=" + params.get(key)[0] + "&");
	}
%>


<link rel="stylesheet" type="text/css" href="include/css/prdDetail.css">
<script src="include/script/prdDetail.js"></script>

<section id="sc_item">
	<section id="sc_item_image">
		<img src="data/product_images/<%=params.get("PRD_IMAGE")[0]%>.jpg">
	</section>
	<section id="sc_item_left">

		<section id="sc_item_detail">
			<p class="prd_store"><%=params.get("PRD_STORE")[0]%></p>
			<p class="prd_name"><%=params.get("PRD_NAME")[0]%></p>
			<p class="prd_price">
				₩
				<%=params.get("PRD_PRICE")[0]%></p>
		</section>
		<section id="sc_item_purchase">
			<form action="prdDetailService.jsp">
				<!-- 파일처리 성공하면 장바구니로 이동 실패하면 얼럿 이후 그대로 -->
				
				 <input type="hidden" name="PRD_IMAGE" value="<%=params.get("PRD_IMAGE")[0]%>" /> 
  				 <input type="hidden" name="PRD_STORE" value="<%=params.get("PRD_STORE")[0]%>" /> 
                 <input type="hidden" name="PRD_NAME" value="<%=params.get("PRD_NAME")[0]%>" /> 
                 <input type="hidden" name="PRD_PRICE" value="<%=params.get("PRD_PRICE")[0]%>" /> 
                 <input type="hidden" name="PRD_TYPE" value="<%=params.get("PRD_TYPE")[0]%>" /> 
  
  
				<section id="form_number">
					<input id="btn_minus" class="btn_pm" type="button" value="-" /> <input
						name="prd_num" id="text_number" type="text" value="1" readonly /> <input
						id="btn_plus" class="btn_pm" type="button" value="+" /><br />
				</section>
				<input id="text_message" name="prd_message" type="text" placeholder="선물 할 사람에게 메세지를 남겨보세요!" required /><br /> 
				<input type="submit" id="btn_submit" value="장바구니에 쏙!" />
			</form>
		</section>
	</section>
</section>
