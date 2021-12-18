package com.spill.beans.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class BoardDTO {
  private int no; // 게시판 번호
  private String title; // 제목
  private String content; // 내용
  private Date registeredDate; // 등록일
  private MemberDTO writer; // 작성자
  private int viewCount; // 조회수
  private int likeCount; // 좋아요수
  private List<BoardLikeDTO> likeList = new ArrayList<>(); // 좋아요
  private int commentCount; // 댓글수
  private CategoryDTO category; // 카테고리

  @Override
  public String toString() {
    return "BoardDTO [no=" + no + ", viewCount=" + viewCount + ", likeCount=" + likeCount
        + ", likeList=" + likeList + ", commentCount=" + commentCount + ", category=" + category
        + ", title=" + title + ", content=" + content + ", registeredDate=" + registeredDate
        + ", writer=" + writer + "]";
  }

  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getViewCount() {
    return viewCount;
  }
  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }
  public int getLikeCount() {
    return likeCount;
  }
  public void setLikeCount(int likeCount) {
    this.likeCount = likeCount;
  }
  public List<BoardLikeDTO> getLikeList() {
    return likeList;
  }
  public void setLikeList(List<BoardLikeDTO> likeList) {
    this.likeList = likeList;
  }
  public int getCommentCount() {
    return commentCount;
  }
  public void setCommentCount(int commentCount) {
    this.commentCount = commentCount;
  }
  public CategoryDTO getCategory() {
    return category;
  }
  public void setCategory(CategoryDTO category) {
    this.category = category;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public Date getRegisteredDate() {
    return registeredDate;
  }
  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }
  public MemberDTO getWriter() {
    return writer;
  }
  public void setWriter(MemberDTO writer) {
    this.writer = writer;
  }
}
