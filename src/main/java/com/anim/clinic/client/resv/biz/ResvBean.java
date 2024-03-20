package com.anim.clinic.client.resv.biz;

import org.springframework.stereotype.Component;

@Component("resvBean")
public class ResvBean {
	private int rNo;
	private String rCode;
	private String pCategory;
	
	private String uId;
	private String uName;
	private String uTel;
	private String uEmail;
	private String uPost;
	private String uAddr;

	private String rName;
	private String rTel;
	
	private String rPetName;
	private int rPetAge;
	private String rPetGender;
	private String rPetType;
	private String rPetSize;
	
	private String rDetail;
	private String rStatus;
	private String rRegdate;
	private String rDate;
	private String rTime;
	
	private String krCategory;
	private int rPrice;
	
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public String getrCode() {
		return rCode;
	}
	public void setrCode(String rCode) {
		this.rCode = rCode;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuTel() {
		return uTel;
	}
	public void setuTel(String uTel) {
		this.uTel = uTel;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuPost() {
		return uPost;
	}
	public void setuPost(String uPost) {
		this.uPost = uPost;
	}
	public String getuAddr() {
		return uAddr;
	}
	public void setuAddr(String uAddr) {
		this.uAddr = uAddr;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrTel() {
		return rTel;
	}
	public void setrTel(String rTel) {
		this.rTel = rTel;
	}
	public String getrPetName() {
		return rPetName;
	}
	public void setrPetName(String rPetName) {
		this.rPetName = rPetName;
	}
	public int getrPetAge() {
		return rPetAge;
	}
	public void setrPetAge(int rPetAge) {
		this.rPetAge = rPetAge;
	}
	public String getrPetGender() {
		return rPetGender;
	}
	public void setrPetGender(String rPetGender) {
		this.rPetGender = rPetGender;
	}
	public String getrPetType() {
		return rPetType;
	}
	public void setrPetType(String rPetType) {
		this.rPetType = rPetType;
	}
	public String getrPetSize() {
		return rPetSize;
	}
	public void setrPetSize(String rPetSize) {
		this.rPetSize = rPetSize;
	}
	public String getrDetail() {
		return rDetail;
	}
	public void setrDetail(String rDetail) {
		this.rDetail = rDetail;
	}
	public String getrStatus() {
		return rStatus;
	}
	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}
	public String getrRegdate() {
		return rRegdate;
	}
	public void setrRegdate(String rRegdate) {
		this.rRegdate = rRegdate;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public String getrTime() {
		return rTime;
	}
	public void setrTime(String rTime) {
		this.rTime = rTime;
	}
	public String getKrCategory() {
		return krCategory;
	}
	public void setKrCategory(String krCategory) {
		this.krCategory = krCategory;
	}
	public int getrPrice() {
		return rPrice;
	}
	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
	}
	
	@Override
	public String toString() {
		return "ResvBean [rNo=" + rNo + ", rCode=" + rCode + ", pCategory=" + pCategory + ", uId=" + uId + ", uName="
				+ uName + ", uTel=" + uTel + ", uEmail=" + uEmail + ", uPost=" + uPost + ", uAddr=" + uAddr + ", rName="
				+ rName + ", rTel=" + rTel + ", rPetName=" + rPetName + ", rPetAge=" + rPetAge + ", rPetGender="
				+ rPetGender + ", rPetType=" + rPetType + ", rPetSize=" + rPetSize + ", rDetail=" + rDetail
				+ ", rStatus=" + rStatus + ", rRegdate=" + rRegdate + ", rDate=" + rDate + ", rTime=" + rTime
				+ ", krCategory=" + krCategory + ", rPrice=" + rPrice + "]";
	}
	
}