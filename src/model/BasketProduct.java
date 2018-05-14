package model;

public class BasketProduct {
	private Product prd;
	private int number;
	private String message;

	public BasketProduct(Product prd, String number, String message) {
		super();
		this.prd = prd;
		this.number = Integer.parseInt(number);
		this.message = message;
	}

	public Product getPrd() {
		return prd;
	}

	public void setPrd(Product prd) {
		this.prd = prd;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	@Override
	public String toString() {
		return prd.toString()+number+"\t"+message+"\t";
	}

}
