package com.smhrd.model;

// 가게정보 
public class ShopVO {

    // 가게 번호 
    private Double shop_seq;

    // 가게 이름 
    private String shop_name;

    // 가게 전화번호 
    private String shop_tel;

    // 가게 위도 
    private Double lat;

    // 가게 경도 
    private Double lng;

    // 가게 오픈 시간 
    private String open_time;

    // 가게 종료 시간 
    private String close_time;

    // 가게 상태 
    private String shop_status;

    // 회원 아이디 
    private String mem_id;
    
    private String shop_addr1;
    private String shop_addr2;
    
    private String shop_img;
   
	public String getShop_img() {
		return shop_img;
	}

	public void setShop_img(String shop_img) {
		this.shop_img = shop_img;
	}

	public String getShop_addr1() {
		return shop_addr1;
	}

	public void setShop_addr1(String shop_addr1) {
		this.shop_addr1 = shop_addr1;
	}

	public Double getShopSeq() {
        return shop_seq;
    }

    public void setShopSeq(Double shop_seq) {
        this.shop_seq = shop_seq;
    }

    public String getShopName() {
        return shop_name;
    }

    public void setShopName(String shop_name) {
        this.shop_name = shop_name;
    }

    public String getShopTel() {
        return shop_tel;
    }

    public void setShopTel(String shop_tel) {
        this.shop_tel = shop_tel;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public String getOpenTime() {
        return open_time;
    }

    public void setOpenTime(String open_time) {
        this.open_time = open_time;
    }

    public String getCloseTime() {
        return close_time;
    }

    public void setCloseTime(String close_time) {
        this.close_time = close_time;
    }

    public String getShopStatus() {
        return shop_status;
    }

    public void setShopStatus(String shop_status) {
        this.shop_status = shop_status;
    }

    public String getMemId() {
        return mem_id;
    }

    public void setMemId(String mem_id) {
        this.mem_id = mem_id;
    }

    // shop_info 모델 복사
    public void CopyData(ShopVO param)
    {
        this.shop_seq = param.getShopSeq();
        this.shop_name = param.getShopName();
        this.shop_tel = param.getShopTel();
        this.lat = param.getLat();
        this.lng = param.getLng();
        this.open_time = param.getOpenTime();
        this.close_time = param.getCloseTime();
        this.shop_status = param.getShopStatus();
        this.mem_id = param.getMemId();
        this.shop_addr1 = param.getShop_addr1();
    }

	public String getShop_addr2() {
		return shop_addr2;
	}

	public void setShop_addr2(String shop_addr2) {
		this.shop_addr2 = shop_addr2;
	}
}