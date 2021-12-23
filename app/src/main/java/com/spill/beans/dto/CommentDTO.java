package com.spill.beans.dto;

import java.sql.Date;

public class CommentDTO {

  private int no;                   // 댓글 번호
  private int boardNo;              // 댓글 작성한 보드 객체
  private String content;           // 댓글 내용
  private MemberDTO writer;         // 댓글 작성자
  private Date registeredDate;      // 댓글 작성일
  private int isPublic;             // 댓글 공개 여부 (1 : 공개 댓글 / 2 : 비밀 댓글)
  private int replyCount;           // 리댓글 수
  private int parentNo;             // 부모 댓글 번호
  private int groupNo;              // 그룹 번호
  private int orderNo;              // 정렬 순서 (기본값: 1 / 자동 증가)
  private int classNo;              // 계층 (기본값: 0)

  @Override
  public String toString() {
    return "CommentDTO [no=" + no + ", boardNo=" + boardNo + ", content=" + content + ", writer="
        + writer + ", registeredDate=" + registeredDate + ", isPublic=" + isPublic + ", replyCount="
        + replyCount + ", parentNo=" + parentNo + ", groupNo=" + groupNo + ", orderNo=" + orderNo
        + ", classNo=" + classNo + "]";
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public int getBoardNo() {
    return boardNo;
  }

  public void setBoardNo(int boardNo) {
    this.boardNo = boardNo;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public MemberDTO getWriter() {
    return writer;
  }

  public void setWriter(MemberDTO writer) {
    this.writer = writer;
  }

  public Date getRegisteredDate() {
    return registeredDate;
  }

  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }

  public int getIsPublic() {
    return isPublic;
  }

  public void setIsPublic(int isPublic) {
    this.isPublic = isPublic;
  }

  public int getReplyCount() {
    return replyCount;
  }

  public void setReplyCount(int replyCount) {
    this.replyCount = replyCount;
  }

  public int getParentNo() {
    return parentNo;
  }

  public void setParentNo(int parentNo) {
    this.parentNo = parentNo;
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }

  public int getOrderNo() {
    return orderNo;
  }

  public void setOrderNo(int orderNo) {
    this.orderNo = orderNo;
  }

  public int getClassNo() {
    return classNo;
  }

  public void setClassNo(int classNo) {
    this.classNo = classNo;
  }

}
