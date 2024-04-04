package com.anim.clinic.admin.pay.biz;

import java.util.Date;

public class ACompletedPayBean {

	private int p_number;
	private String aid;
	private String tid;
	private String cid;
	private String partner_order_id;
	private String partner_user_id;
	private String item_name;
	private String pg_token;
	private String payment_method_type;
	private int total_amount;
	private int quantity;
	private int tax_free_amount;
	private int tax_vat;
	private Date approved_at;
	private Date created_at;

	public int getP_number() {
		return p_number;
	}

	public void setP_number(int p_number) {
		this.p_number = p_number;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public String getPartner_user_id() {
		return partner_user_id;
	}

	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getPg_token() {
		return pg_token;
	}

	public void setPg_token(String pg_token) {
		this.pg_token = pg_token;
	}

	public String getPayment_method_type() {
		return payment_method_type;
	}

	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}

	public int getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTax_free_amount() {
		return tax_free_amount;
	}

	public void setTax_free_amount(int tax_free_amount) {
		this.tax_free_amount = tax_free_amount;
	}

	public int getTax_vat() {
		return tax_vat;
	}

	public void setTax_vat(int tax_vat) {
		this.tax_vat = tax_vat;
	}

	public Date getApproved_at() {
		return approved_at;
	}

	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "PayBean{" + "p_number=" + p_number + ", aid='" + aid + '\'' + ", tid='" + tid + '\'' + ", cid='" + cid
				+ '\'' + ", partner_order_id='" + partner_order_id + '\'' + ", partner_user_id='" + partner_user_id
				+ '\'' + ", item_name='" + item_name + '\'' + ", pg_token='" + pg_token + '\''
				+ ", payment_method_type='" + payment_method_type + '\'' + ", total_amount=" + total_amount
				+ ", quantity=" + quantity + ", tax_free_amount=" + tax_free_amount + ", tax_vat=" + tax_vat
				+ ", approved_at=" + approved_at + ", created_at=" + created_at + '}';
	}
}
