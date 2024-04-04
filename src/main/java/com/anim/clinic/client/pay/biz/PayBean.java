package com.anim.clinic.client.pay.biz;

public class PayBean {

	private String authorization;
	private String accept;
	private String content_type;
	private String cid;
	private String partner_order_id;
	private String partner_user_id;
	private String item_name;
	private int quantity;
	private int total_amount;
	private int tax_free_amount;
	private String approval_url;
	private String cancel_url;
	private String fail_url;

	public String getAuthorization() {
		return authorization;
	}

	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}

	public String getAccept() {
		return accept;
	}

	public void setAccept(String accept) {
		this.accept = accept;
	}

	public String getContent_type() {
		return content_type;
	}

	public void setContent_type(String content_type) {
		this.content_type = content_type;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}

	public int getTax_free_amount() {
		return tax_free_amount;
	}

	public void setTax_free_amount(int tax_free_amount) {
		this.tax_free_amount = tax_free_amount;
	}

	public String getApproval_url() {
		return approval_url;
	}

	public void setApproval_url(String approval_url) {
		this.approval_url = approval_url;
	}

	public String getCancel_url() {
		return cancel_url;
	}

	public void setCancel_url(String cancel_url) {
		this.cancel_url = cancel_url;
	}

	public String getFail_url() {
		return fail_url;
	}

	public void setFail_url(String fail_url) {
		this.fail_url = fail_url;
	}

	@Override
	public String toString() {
		return "PayBean [authorization=" + authorization + ", accept=" + accept + ", content_type=" + content_type
				+ ", cid=" + cid + ", partner_order_id=" + partner_order_id + ", partner_user_id=" + partner_user_id
				+ ", item_name=" + item_name + ", quantity=" + quantity + ", total_amount=" + total_amount
				+ ", tax_free_amount=" + tax_free_amount + ", approval_url=" + approval_url + ", cancel_url="
				+ cancel_url + ", fail_url=" + fail_url + "]";
	}

}
