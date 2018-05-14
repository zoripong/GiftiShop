package model;

public class PurchaseProduct {
	private BasketProduct prd;
	private boolean isUsing;

	public PurchaseProduct(BasketProduct prd, boolean isUsing) {
		super();
		this.prd = prd;
		this.isUsing = isUsing;
	}

	public BasketProduct getPrd() {
		return prd;
	}

	public void setPrd(BasketProduct prd) {
		this.prd = prd;
	}

	public boolean isUsing() {
		return isUsing;
	}

	public void setUsing(boolean isUsing) {
		this.isUsing = isUsing;
	}

	@Override
	public String toString() {
		return prd.toString() + "\t" + isUsing + "\t";
	}

}
