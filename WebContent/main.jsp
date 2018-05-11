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
			
			public MenuReader(String fileName){
				this.fileName = fileName;
				readFile();
			}
			
			private void readFile(){
				
				String filePath = application.getRealPath("./data/products/"+fileName+".txt");
				
				BufferedReader br = null;
				ArrayList<Product> products = new ArrayList<Product>();
				
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
			
			public String createMenuItem(){
				return null;
			}
			
		}
	
	MenuReader menuReader = new MenuReader(request.getParameter("MENU_NAME"));
	%>
	<jsp:include page="/include/html/menu.jsp" flush="false" />
	
	<section id="item00">
		<img class="prd_img" src="data/product_images/product_00.jpg"/>
		<h5 class="prd_name">[LOTTE] 바삭바삭 크런키</h5>
		<p class="prd_store">CU</p>
		<p class="prd_type">식품</p>
		<p class="prd_price">1000</p>
	</section>

	