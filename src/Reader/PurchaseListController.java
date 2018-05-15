package Reader;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import model.BasketProduct;
import model.Product;
import model.PurchaseProduct;

public class PurchaseListController {
	private String filePath;
	private ArrayList<PurchaseProduct> purchaseProducts;

	private ArrayList<PurchaseProduct> usingPurchaseProducts;
	private ArrayList<PurchaseProduct> notUsingPurchaseProducts;
	
	public PurchaseListController(String filePath) {
		this.filePath = filePath;
		purchaseProducts = new ArrayList<PurchaseProduct>();
		usingPurchaseProducts = new ArrayList<PurchaseProduct>();
		notUsingPurchaseProducts = new ArrayList<PurchaseProduct>();
		readFile();
	}
	private void readFile() {
		BufferedReader br = null;
		try {

			File file = new File(filePath);
			if (!file.exists()) {
				file.createNewFile();
			}

			br = new BufferedReader(new FileReader(file.getAbsoluteFile()));

			while (true) {
				String str = br.readLine();
				if (str == null)
					break;
				StringTokenizer token = new StringTokenizer(str, "\t", false);
				while (token.hasMoreTokens()) {
					
					Product prd = new Product(token.nextToken(), token.nextToken(), token.nextToken(),
							token.nextToken(), token.nextToken());
					BasketProduct bprd = new BasketProduct(prd, token.nextToken(), token.nextToken());
					
					PurchaseProduct ppd = new PurchaseProduct(bprd, token.nextToken());
					purchaseProducts.add(ppd);

					if(ppd.isUsing()){
						usingPurchaseProducts.add(ppd);
					}
					else {
						notUsingPurchaseProducts.add(ppd);
					}
					
					
				}
			}

			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private String createItem(PurchaseProduct prd) {
		
		/*
		<section id="item" class="using">
			<p class="item_store"> 매장</p>
			<img class="item_image" src="data/product_images/product_07.jpg"/>
			<p class="item_price">₩29900</p>
			<p class="item_num">X1</p>
			<p class="item_message">고맙다 이자식아</p>
		</section>
		 */
		
		StringBuffer sb = new StringBuffer();
		String isUsing;
		if(!prd.isUsing()) {
			isUsing="using";
		}else {
			isUsing="notUsing";			
		}
		
		sb.append("<section id=\"item\" class=\""+isUsing+"\">");
		sb.append("<p class=\"item_store\">"+prd.getPrd().getPrd().getPrdStore()+"</p>");
		sb.append("<img class=\"item_image\" src=\"data/product_images/"+prd.getPrd().getPrd().getPrdPath()+".jpg\"/>");
		sb.append("<p class=\"item_price\">₩"+prd.getPrd().getPrd().getPrdPrice()+"</p>");
		sb.append("<p class=\"item_num\">X"+prd.getPrd().getNumber()+"</p>");
		sb.append("<p class=\"item_message\">"+prd.getPrd().getMessage()+"</p>");
		sb.append("</section>");	
		
		return sb.toString();
	}
	
	public String createItemList() {
		StringBuffer sb = new StringBuffer();
		
		int index = 0;
		for(int i = 0; i<notUsingPurchaseProducts.size(); i++) {
			index++;
			sb.append(createItem(notUsingPurchaseProducts.get(i)));
			if(index%4==0)
				sb.append("<br/>");
		}
		
		for(int i = 0; i<usingPurchaseProducts.size(); i++) {
			index++;
			sb.append(createItem(usingPurchaseProducts.get(i)));
			if(index%4==0)
				sb.append("<br/>");
		}
	
		return sb.toString();
	}
	
	public void useCoupon(PurchaseProduct prd) {
		
		for(PurchaseProduct pprd : purchaseProducts) {

			if(pprd.equals(prd)) {
				if(pprd.isUsing()) {
					//이미 사용함.
					return;
				}
				pprd.setUsing(true);
			}
		}
		
		update();
		return ;
	}
	private void update() {
		BufferedWriter bw;
		try {
			bw = new BufferedWriter(new FileWriter(filePath));
			for (PurchaseProduct prd : purchaseProducts) {
				bw.write(prd.toString());
			}
			bw.flush();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int usableCouponSize() {
		return notUsingPurchaseProducts.size();
	}
	
	public int totalSize() {
		return purchaseProducts.size();
	}
}
