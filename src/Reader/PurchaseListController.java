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
	
	public PurchaseListController(String filePath) {
		this.filePath = filePath;
		purchaseProducts = new ArrayList<PurchaseProduct>();
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
					purchaseProducts.add(new PurchaseProduct(bprd, token.nextToken()));

				}
			}

			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private String createItem(PurchaseProduct prd) {
		
		return null;
	}
	
	public String createItemList(boolean isUsing) {
		
		return null;
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
}
