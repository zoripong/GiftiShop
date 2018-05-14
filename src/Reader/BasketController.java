package Reader;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import model.BasketProduct;
import model.Product;
import model.User;

public class BasketController {
	private String filePath;
	private ArrayList<BasketProduct> basketProducts;
	
	public BasketController(String filePath) {
		this.filePath = filePath;
		basketProducts = new ArrayList<BasketProduct>();
		readFile();
	}

	private void readFile() {
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(filePath));
		
			while(true){
				String str = br.readLine();
				if(str == null) break;
				StringTokenizer token = new StringTokenizer(str, "\t", false);
				while(token.hasMoreTokens()){
					//String prdName, String prdStore, String prdType, String prdPrice, String prdPath
					Product prd = new Product(token.nextToken(), token.nextToken(), token.nextToken(), token.nextToken(), token.nextToken());
					basketProducts.add(new BasketProduct(prd, token.nextToken(), token.nextToken()));
					
				}
			}
			
//			for(BasketProduct prd : basketProducts) {
//				System.out.println(prd);
//			}
			
			br.close();	
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	private String createItem(BasketProduct prd) {
	
		return null;
	}

	public String createItemList(){

		return null;
	}
}
