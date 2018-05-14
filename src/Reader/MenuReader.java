package Reader;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import model.Product;

public class MenuReader {
	private String menuName;
	private String filePath;
	private ArrayList<Product> products;
	public MenuReader(String menuName, String filePath){
		System.out.println(filePath);
		this.menuName = menuName;
		this.filePath = filePath;
		products = new ArrayList<Product>();
		readFile();
	}
	
	private void readFile(){
		
		
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
					products.add(new Product(token.nextToken(), token.nextToken(),token.nextToken(),token.nextToken(), token.nextToken()));
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
			 <a href="prdDetail.jsp?PRD_NUM=
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
		code.append("<a href=\"prdDetail.jsp?MENU_NAME="+menuName+"&PRD_STORE="+prd.getPrdStore()+"&PRD_IMAGE="+prd.getPrdPath()+"&PRD_NAME="+prd.getPrdName()+"&PRD_PRICE="+prd.getPrdPrice()+"&PRD_TYPE="+prd.getPrdType()+"\"");
		code.append("<p class=\"prd_store\">"+prd.getPrdStore()+"</p>");
		code.append("<img class=\"prd_img\" src=\"data/product_images/"+prd.getPrdPath()+".jpg\" />");
		code.append("<h5 class=\"prd_name\">"+prd.getPrdName()+"</h5>");
		code.append("<p class=\"prd_price\">₩ "+prd.getPrdPrice()+"</p>");
		code.append("<div class=\"prd_type\"></div></a></section>");
	
		return code.toString();
	}
	

	public String createItemList(){
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
