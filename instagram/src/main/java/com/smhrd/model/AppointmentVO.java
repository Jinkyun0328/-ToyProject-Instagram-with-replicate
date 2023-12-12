package com.smhrd.model;

import java.sql.Timestamp;
import java.util.Date;

// 예약정보 
public class AppointmentVO {

    // 예약 순번 
    private Double appoint_seq;

    // 예약자 아이디 
    private String mem_id;

    // 서비스 순번 
    private Double service_seq;

    // 예약 일자 
    private Timestamp appointed_at;

    // 작성 일자 
    private Date created_at;

    // 예약 확인 
    private char approved;

    public Double getAppointSeq() {
        return appoint_seq;
    }

    public void setAppointSeq(Double appoint_seq) {
        this.appoint_seq = appoint_seq;
    }

    public String getMemId() {
        return mem_id;
    }

    public void setMemId(String mem_id) {
        this.mem_id = mem_id;
    }

    public Double getServiceSeq() {
        return service_seq;
    }

    public void setServiceSeq(Double service_seq) {
        this.service_seq = service_seq;
    }

    public Timestamp getAppointedAt() {
        return appointed_at;
    }

    public void setAppointedAt(Timestamp appointed_at) {
        this.appointed_at = appointed_at;
    }

    public Date getCreatedAt() {
        return created_at;
    }

    public void setCreatedAt(Date created_at) {
        this.created_at = created_at;
    }

    public char getApproved() {
        return approved;
    }

    public void setApproved(char approved) {
        this.approved = approved;
    }

    // appointment_info 모델 복사
    public void CopyData(AppointmentVO param)
    {
        this.appoint_seq = param.getAppointSeq();
        this.mem_id = param.getMemId();
        this.service_seq = param.getServiceSeq();
        this.appointed_at = param.getAppointedAt();
        this.created_at = param.getCreatedAt();
        this.approved = param.getApproved();
    }
}