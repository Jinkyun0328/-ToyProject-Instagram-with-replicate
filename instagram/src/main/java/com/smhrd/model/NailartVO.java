package com.smhrd.model;

	// 네일아트 정보 
	public class NailartVO {

    // 네아 순번 
    private Double nailart_seq;

    // 네아 이름 
    private String nailart_name;

    // 네아 이미지 
    private String nailart_img;

    // 가게 번호 
    private Double shop_seq;

    // 네아 설명 
    private String nailart_desc;

	// 직원 번호
    private String staff_seq;
    
    public String getStaff_seq() {
		return staff_seq;
	}

	public void setStaff_seq(String staff_seq) {
		this.staff_seq = staff_seq;
	}

	public Double getNailartSeq() {
        return nailart_seq;
    }

    public void setNailartSeq(Double nailart_seq) {
        this.nailart_seq = nailart_seq;
    }

    public String getNailartName() {
        return nailart_name;
    }

    public void setNailartName(String nailart_name) {
        this.nailart_name = nailart_name;
    }

    public String getNailartImg() {
        return nailart_img;
    }

    public void setNailartImg(String nailart_img) {
        this.nailart_img = nailart_img;
    }

    public Double getShopSeq() {
        return shop_seq;
    }

    public void setShopSeq(Double shop_seq) {
        this.shop_seq = shop_seq;
    }

    public String getNailartDesc() {
        return nailart_desc;
    }

    public void setNailartDesc(String nailart_desc) {
        this.nailart_desc = nailart_desc;
    }

    // nailart_info 모델 복사
    public void CopyData(NailartVO param)
    {
        this.nailart_seq = param.getNailartSeq();
        this.nailart_name = param.getNailartName();
        this.nailart_img = param.getNailartImg();
        this.shop_seq = param.getShopSeq();
        this.nailart_desc = param.getNailartDesc();
    }
}