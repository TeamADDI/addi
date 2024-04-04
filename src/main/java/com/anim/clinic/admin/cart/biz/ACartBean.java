package com.anim.clinic.admin.cart.biz;

import java.sql.Date;

public class ACartBean {
	private int c_no;
	private String u_id;
	private String item_num;
	private String c_name;
	private String c_category;
	private int c_quantity;
	private int c_price;

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getItem_num() {
		return item_num;
	}

	public void setItem_num(String item_num) {
		this.item_num = item_num;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_category() {
		return c_category;
	}

	public void setC_category(String c_category) {
		this.c_category = c_category;
	}

	public int getC_quantity() {
		return c_quantity;
	}

	public void setC_quantity(int c_quantity) {
		this.c_quantity = c_quantity;
	}

	public int getC_price() {
		return c_price;
	}

	public void setC_price(int c_price) {
		this.c_price = c_price;
	}

	@Override
	public String toString() {
		return "ACartBean [c_no=" + c_no + ", u_id=" + u_id + ", item_num=" + item_num + ", c_name=" + c_name
				+ ", c_category=" + c_category + ", c_quantity=" + c_quantity + ", c_price=" + c_price + "]";
	}
}