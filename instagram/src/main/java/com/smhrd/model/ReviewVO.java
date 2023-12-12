package com.smhrd.model;

// 리뷰정보 
public class ReviewVO {

    // 리뷰 순번 
    private Double review_seq;

    // 가게 번호 
    private Double shop_seq;

    // 리뷰 내용 
    private String review_content;

    // 리뷰 작성자 
    private String mem_id;

    // 리뷰 작성일자 
//    private Date created_at;

    // 리뷰 조회수 
    private Double review_views;

    // 리뷰 공감수 
    private Double review_likes;

    // 별점 
    private Double review_rating;

    public Double getReviewSeq() {
        return review_seq;
    }

    public void setReviewSeq(Double review_seq) {
        this.review_seq = review_seq;
    }

    public Double getShopSeq() {
        return shop_seq;
    }

    public void setShopSeq(Double shop_seq) {
        this.shop_seq = shop_seq;
    }

    public String getReviewContent() {
        return review_content;
    }

    public void setReviewContent(String review_content) {
        this.review_content = review_content;
    }

    public String getMemId() {
        return mem_id;
    }

    public void setMemId(String mem_id) {
        this.mem_id = mem_id;
    }

//    public Date getCreatedAt() {
//        return created_at;
//    }

//    public void setCreatedAt(Date created_at) {
//        this.created_at = created_at;
//    }

    public Double getReviewViews() {
        return review_views;
    }

    public void setReviewViews(Double review_viewss) {
        this.review_views = review_views;
    }

    public Double getReviewLikes() {
        return review_likes;
    }

    public void setReviewLikes(Double review_likes) {
        this.review_likes = review_likes;
    }

    public Double getReviewRating() {
        return review_rating;
    }

    public void setReviewRating(Double review_rating) {
        this.review_rating = review_rating;
    }

    // review_info 모델 복사
    public void CopyData(ReviewVO param)
    {
        this.review_seq = param.getReviewSeq();
        this.shop_seq = param.getShopSeq();
        this.review_content = param.getReviewContent();
        this.mem_id = param.getMemId();
//        this.created_at = param.getCreatedAt();
        this.review_views = param.getReviewViews();
        this.review_likes = param.getReviewLikes();
        this.review_rating = param.getReviewRating();
    }
}