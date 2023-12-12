package com.smhrd.model;

// 직원별 네일아트 서비스 
public class ServiceVO {

    // 서비스 순번 
    private Double svc_seq;

    // 직원 번호 
    private Double staff_seq;

    // 네아 순번 
    private Double nailart_seq;

    public Double getSvcSeq() {
        return svc_seq;
    }

    public void setSvcSeq(Double svc_seq) {
        this.svc_seq = svc_seq;
    }

    public Double getStaffSeq() {
        return staff_seq;
    }

    public void setStaffSeq(Double staff_seq) {
        this.staff_seq = staff_seq;
    }

    public Double getNailartSeq() {
        return nailart_seq;
    }

    public void setNailartSeq(Double nailart_seq) {
        this.nailart_seq = nailart_seq;
    }

    // service_info 모델 복사
    public void CopyData(ServiceVO param)
    {
        this.svc_seq = param.getSvcSeq();
        this.staff_seq = param.getStaffSeq();
        this.nailart_seq = param.getNailartSeq();
    }
}