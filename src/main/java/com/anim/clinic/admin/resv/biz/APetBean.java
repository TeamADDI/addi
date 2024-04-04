package com.anim.clinic.admin.resv.biz;

public class APetBean {
	private String pCategory;
	private String pSize;
	private int pPrice;
	
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public String getpSize() {
		return pSize;
	}
	public void setpSize(String pSize) {
		this.pSize = pSize;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	
	public String toString() {
		return "PetBean [pCategory=" + pCategory + ", pSize=" + pSize + ", pPrice=" + pPrice + "]";
	}
	
}
