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
					// String prdName, String prdStore, String prdType, String prdPrice, String
					// prdPath
					Product prd = new Product(token.nextToken(), token.nextToken(), token.nextToken(),
							token.nextToken(), token.nextToken());
					basketProducts.add(new BasketProduct(prd, token.nextToken(), token.nextToken()));

				}
			}

			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private String createItem(BasketProduct prd) {
		StringBuffer sb = new StringBuffer();
		sb.append("<section class=\"bakset_item\">");
		sb.append("<img class=\"item_image\" src=\"data/product_images/" + prd.getPrd().getPrdPath() + ".jpg\"/>");
		sb.append("<section class=\"item_center\">");
		sb.append("<p class=\"item_name\"><a href=\"prdDetail.jsp?PRD_STORE=" + prd.getPrd().getPrdStore()
				+ "&PRD_IMAGE=" + prd.getPrd().getPrdPath() + "&PRD_NAME=" + prd.getPrd().getPrdName() + "&PRD_PRICE="
				+ prd.getPrd().getPrdPrice() + "&PRD_TYPE=" + prd.getPrd().getPrdType() + "\">"
				+ prd.getPrd().getPrdName() + "</a></p>");
		sb.append("	<p class=\"item_message\">" + prd.getMessage() + "</p>");
		sb.append("</section>");
		sb.append("<p class=\"item_price\">₩" + prd.getPrd().getPrdPrice() + "</p>");
		sb.append("<p class=\"item_num\">" + prd.getNumber() + "</p>");
		// sb.append("<button id=\"remove_btn\" class=\"remove_btn\">X</button>");
		sb.append("</section>");

		return sb.toString();
	}

	public String createItemList() {
		if (basketProducts.size() == 0)
			return "<p id=\"null_basket\">장바구니 내역이 비어있습니다.</p>";
		StringBuffer lists = new StringBuffer();
		for (int i = 0; i < basketProducts.size(); i++) {
			lists.append(createItem(basketProducts.get(i)));
			if (i != basketProducts.size() - 1)
				lists.append("<hr class=\"light_line\">");
		}
		return lists.toString();
	}

	public int getTotal() {
		int sum = 0;
		for (BasketProduct prd : basketProducts) {
			sum += (prd.getNumber() * prd.getPrd().getPrdPrice());
		}
		return sum;
	}

	public boolean insertData(BasketProduct prd) {
		basketProducts.add(prd);
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true));
			bw.write(prd.toString());
			bw.flush();
			bw.close();

			System.out.println("insertData Success!");
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public void update() {
		BufferedWriter bw;
		try {
			bw = new BufferedWriter(new FileWriter(filePath));
			for (BasketProduct prd : basketProducts) {
				bw.write(prd.toString());
			}
			bw.flush();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean purchaseCoupon(String purchaseFile) {
		
		BufferedWriter bw;
		try {

			File file = new File(purchaseFile);
			if (!file.exists()) {
				file.createNewFile();
			}
			bw = new BufferedWriter(new FileWriter(file.getAbsoluteFile()));
			// 파일 쓰기
			for(int i = 0; i<basketProducts.size(); i++) {
				bw.write((new PurchaseProduct(basketProducts.get(i), "false").toString()));
			}
			bw.flush();
			bw.close();
			
			System.out.println("구매 성공~");

			// 파일 초기화
			bw = new BufferedWriter(new FileWriter(filePath));
			bw.close();
			
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}
	public int getCount() {
		return basketProducts.size();
	}
}
