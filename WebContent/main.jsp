<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.StringTokenizer, java.util.ArrayList"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
		class MenuReader{
			private String fileName;
			private ArrayList<Product> products;
			public MenuReader(String fileName){
				this.fileName = fileName;
				products = new ArrayList<Product>();
				readFile();
			}
			
			private void readFile(){
				
				String filePath = application.getRealPath("./data/products/"+fileName+".txt");
				
				BufferedReader br = null;
			 
				try{
					br = new BufferedReader(new FileReader(filePath));
					while(true){
						// 한 줄 씩 읽어옴
						String str = br.readLine();
						if(str == null) break;
					
						// \t을 기준으로 token을 나눔
						StringTokenizer token = new StringTokenizer(str, "\t");
						while(token.hasMoreTokens()){
							//리스트에 상품 객체 추가
							products.add(new Product(token.nextToken(), token.nextToken(), Integer.parseInt(token.nextToken()), Integer.parseInt(token.nextToken()), token.nextToken()));
						}
					}
					br.close();	
				}catch(IOException e){
					System.out.println(e.toString());
				}
				
			}
			
			private String createItem(Product prd){
				
				/*
					//sample code	
					<section id="item_00" class="prd_item">
						<p class="prd_store">CU</p>
						<img class="prd_img" src="data/product_images/product_00.jpg" />
						<h5 class="prd_name">[LOTTE] 바삭바삭 크런키</h5>
						<p class="prd_price">₩ 1000</p>
						<div class="prd_type"></div>
					</section>
				*/
				StringBuffer code = new StringBuffer();
				
				code.append("<section id=\""+prd.getPrdPath()+"\" class=\"prd_item\">");
				code.append("<p class=\"prd_store\">"+prd.getPrdStore()+"</p>");
				code.append("<img class=\"prd_img\" src=\"data/product_images/"+prd.getPrdPath()+".jpg\" />");
				code.append("<h5 class=\"prd_name\">"+prd.getPrdName()+"</h5>");
				code.append("<p class=\"prd_price\">₩ "+prd.getPrdPrice()+"</p>");
				code.append("<div class=\"prd_type\"></div></section>");
			
				return code.toString();
			}
			
			private String createItemList(){
				StringBuffer code = new StringBuffer();
				int index = 1;
				for(Product prd : products){
					code.append(createItem(prd));
					if(index % 4 == 0)
						code.append("<br/>");
					index++;
				}
				return code.toString();
			}
		}
	
	MenuReader menuReader = new MenuReader(request.getParameter("MENU_NAME"));
	%>
<jsp:include page="/include/html/menu.jsp" flush="false" />
<section id="sc_items">
	<%= menuReader.createItemList() %>
<%-- 
	<section id="item_00" class="prd_item">
		<p class="prd_store">CU</p>
		<img class="prd_img" src="data/product_images/product_00.jpg" />
		<h5 class="prd_name">[LOTTE] 바삭바삭 크런키</h5>
		<p class="prd_price">₩ 1000</p>
		<div class="prd_type"></div>
	</section>
--%>

</section>

