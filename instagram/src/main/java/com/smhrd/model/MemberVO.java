package com.smhrd.model;

// 회원 정보 
public class MemberVO {

    // 회원 아이디 
    private String mem_id;

    // 회원 비밀번호 
    private String mem_pw;

    // 회원 이름 
    private String mem_name;

    // 회원 전화번호 
    private String mem_phone;

    // 회원 이메일 
    private String mem_email;

    // 회원 상세주소 
    private String mem_addr1;

    // 회원 상세주소 
    private String mem_addr2;

    // 회원 가입일 
    private String joined_at;

    // 회원 구분 
    private String mem_type;

    public String getMemId() {
        return mem_id;
    }

    public void setMemId(String mem_id) {
        this.mem_id = mem_id;
    }

    public String getMemPw() {
        return mem_pw;
    }

    public void setMemPw(String mem_pw) {
        this.mem_pw = mem_pw;
    }

    public String getMemName() {
        return mem_name;
    }

    public void setMemName(String mem_name) {
        this.mem_name = mem_name;
    }

    public String getMemPhone() {
        return mem_phone;
    }

    public void setMemPhone(String mem_phone) {
        this.mem_phone = mem_phone;
    }

    public String getMemEmail() {
        return mem_email;
    }

    public void setMemEmail(String mem_phone) {
        this.mem_email = mem_phone;
    }

    public String getMemAddr1() {
        return mem_addr1;
    }

    public void setMemAddr1(String mem_addr1) {
        this.mem_addr1 = mem_addr1;
    }

    public String getMemAddr2() {
        return mem_addr2;
    }

    public void setMemAddr2(String mem_addr2) {
        this.mem_addr2 = mem_addr2;
    }

    public String getJoinedAt() {
        return joined_at;
    }

    public void setJoinedAt(String joined_at) {
        this.joined_at = joined_at;
    }

    public String getMemType() {
        return mem_type;
    }

    public void setMemType(String mem_type) {
        this.mem_type = mem_type;
    }

    // member_info 모델 복사
    public void CopyData(MemberVO param)
    {
        this.mem_id = param.getMemId();
        this.mem_pw = param.getMemPw();
        this.mem_name = param.getMemName();
        this.mem_phone = param.getMemPhone();
        this.mem_email = param.getMemEmail();
        this.mem_addr1 = param.getMemAddr1();
        this.mem_addr2 = param.getMemAddr2();
        this.joined_at = param.getJoinedAt();
        this.mem_type = param.getMemType();
    }
}