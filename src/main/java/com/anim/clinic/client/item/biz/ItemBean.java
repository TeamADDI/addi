package com.anim.clinic.client.item.biz;

import java.util.Date;

public class ItemBean {
	private int item_num;
	private String item_code;
	private String i_category;
	private String item_name;
	private String i_img;
	private String i_detail;
	private String i_delete;
	private int i_stock;
	private int i_price;
	private float i_sale;
	private int i_tax_free;
	private Date i_regdate;
	private Date i_updatedate;
	
	
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getI_category() {
		return i_category;
	}
	public void setI_category(String i_category) {
		this.i_category = i_category;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getI_img() {
		return i_img;
	}
	public void setI_img(String i_img) {
		this.i_img = i_img;
	}
	public String getI_detail() {
		return i_detail;
	}
	public void setI_detail(String i_detail) {
		this.i_detail = i_detail;
	}
	public String getI_delete() {
		return i_delete;
	}
	public void setI_delete(String i_delete) {
		this.i_delete = i_delete;
	}
	public int getI_stock() {
		return i_stock;
	}
	public void setI_stock(int i_stock) {
		this.i_stock = i_stock;
	}
	public int getI_price() {
		return i_price;
	}
	public void setI_price(int i_price) {
		this.i_price = i_price;
	}
	public float getI_sale() {
		return i_sale;
	}
	public void setI_sale(int i_sale) {
		this.i_sale = i_sale;
	}
	public int getI_tax_free() {
		return i_tax_free;
	}
	public void setI_tax_free(int i_tax_free) {
		this.i_tax_free = i_tax_free;
	}
	public Date getI_regdate() {
		return i_regdate;
	}
	public void setI_regdate(Date i_regdate) {
		this.i_regdate = i_regdate;
	}
	public Date getI_updatedate() {
		return i_updatedate;
	}
	public void setI_updatedate(Date i_updatedate) {
		this.i_updatedate = i_updatedate;
	}
	
	@Override
	public String toString() {
		return "ItemBean [item_num=" + item_num + ", item_code=" + item_code + ", i_category=" + i_category
				+ ", item_name=" + item_name + ", i_img=" + i_img + ", i_detail=" + i_detail + ", i_delete=" + i_delete
				+ ", i_stock=" + i_stock + ", i_price=" + i_price + ", i_sale=" + i_sale + ", i_tax_free=" + i_tax_free
				+ ", i_regdate=" + i_regdate + ", i_updatedate=" + i_updatedate + "]";
	}
	
	
}
