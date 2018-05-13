package model;

public class Product {
	private String prdName;
	private String prdStore;
	private int prdType;
	private int prdPrice;
	private String prdPath;

	public Product(String prdName, String prdStore, String prdType, String prdPrice, String prdPath) {
		super();
		this.prdName = prdName;
		this.prdStore = prdStore;
		this.prdType = Integer.parseInt(prdType);
		this.prdPrice = Integer.parseInt(prdPrice);
		this.prdPath = prdPath;
	}

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public String getPrdStore() {
		return prdStore;
	}

	public void setPrdStore(String prdStore) {
		this.prdStore = prdStore;
	}

	public int getPrdType() {
		return prdType;
	}

	public void setPrdType(int prdType) {
		this.prdType = prdType;
	}

	public int getPrdPrice() {
		return prdPrice;
	}

	public void setPrdPrice(int prdPrice) {
		this.prdPrice = prdPrice;
	}

	public String getPrdPath() {
		return prdPath;
	}

	public void setPrdPath(String prdPath) {
		this.prdPath = prdPath;
	}
	
	public String toString() {
		return prdName+"\t"+prdStore+"\t"+prdType+"\t"+prdPrice+"\t"+prdPath;
	}
	
}
