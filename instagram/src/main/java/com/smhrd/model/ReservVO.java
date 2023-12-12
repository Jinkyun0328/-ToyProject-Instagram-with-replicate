package com.smhrd.model;

import java.sql.Date;

// 가게 직원 
public class ReservVO {

	// 가게 이름
	private String SHOP_NAME;
	// 가게 번호
	private String SHOP_TEL;
	// 가게 오픈.마감 시간
	private String OPEN_TIME;
	private String CLOSE_TIME;
	// 가게 주소
	private String SHOP_ADDR1;
	private String SHOP_ADDR2;
	// 예약날짜
	private String APPOINTED_AT;
	// 예약 승인 여부(O,X,L)
	private String APPROVED;
	// 회원 아이디 
	private String mem_id;
	
	
	public String getSHOP_NAME() {
		return SHOP_NAME;
	}
	public void setSHOP_NAME(String sHOP_NAME) {
		SHOP_NAME = sHOP_NAME;
	}
	public String getSHOP_TEL() {
		return SHOP_TEL;
	}
	public void setSHOP_TEL(String sHOP_TEL) {
		SHOP_TEL = sHOP_TEL;
	}
	public String getOPEN_TIME() {
		return OPEN_TIME;
	}
	public void setOPEN_TIME(String oPEN_TIME) {
		OPEN_TIME = oPEN_TIME;
	}
	public String getCLOSE_TIME() {
		return CLOSE_TIME;
	}
	public void setCLOSE_TIME(String cLOSE_TIME) {
		CLOSE_TIME = cLOSE_TIME;
	}
	public String getSHOP_ADDR1() {
		return SHOP_ADDR1;
	}
	public void setSHOP_ADDR1(String sHOP_ADDR1) {
		SHOP_ADDR1 = sHOP_ADDR1;
	}
	public String getSHOP_ADDR2() {
		return SHOP_ADDR2;
	}
	public void setSHOP_ADDR2(String sHOP_ADDR2) {
		SHOP_ADDR2 = sHOP_ADDR2;
	}
	public String getAPPOINTED_AT() {
		return APPOINTED_AT;
	}
	public void setAPPOINTED_AT(String aPPOINTED_AT) {
		APPOINTED_AT = aPPOINTED_AT;
	}
	public String getAPPROVED() {
		return APPROVED;
	}
	public void setAPPROVED(String aPPROVED) {
		APPROVED = aPPROVED;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
	
}