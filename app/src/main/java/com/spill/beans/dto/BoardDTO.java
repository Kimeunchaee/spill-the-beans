package com.spill.beans.dto;

import java.sql.Date;

public class BoardDTO {
  private int no;
  private int viewCount;
  private int likeCount;
  private int commentCount;
  private int categoryNo;
  private String title;
  private String content;
  private Date registeredDate;
  private MemberDTO writer;

  @Override
  public String toString() {
    return "BoardDTO [no=" + no + ", viewCount=" + viewCount + ", likeCount=" + likeCount
        + ", commentCount=" + commentCount + ", categoryNo=" + categoryNo + ", title=" + title
        + ", content=" + content + ", registeredDate=" + registeredDate + "]";
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

  public int getCommentCount() {
    return commentCount;
  }

  public void setCommentCount(int commentCount) {
    this.commentCount = commentCount;
  }

  public int getCategoryNo() {
    return categoryNo;
  }

  public void setCategoryNo(int categoryNo) {
    this.categoryNo = categoryNo;
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