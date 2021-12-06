package com.spill.beans.dto;

import java.util.Date;

public class CommentDTO {

  private int no;                   // 댓글 번호
  private int boardNo;              // 댓글 작성한 보드 객체
  private String content;           // 댓글 내용
  private MemberDTO writer;         // 댓글 작성자
  private Date registeredDate;      // 댓글 작성일
  private boolean isPublic;         // 댓글 공개 여부 (true : 공개 댓글 / false : 비밀 댓글)
  private int replyCount;           // 리댓글 수

  @Override
  public String toString() {
    return "CommentDTO [no=" + no + ", boardNo=" + boardNo + ", content=" + content + ", writer="
        + writer + ", registeredDate=" + registeredDate + ", isPublic=" + isPublic + ", replyCount="
        + replyCount + "]";
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

  public boolean isPublic() {
    return isPublic;
  }

  public void setPublic(boolean isPublic) {
    this.isPublic = isPublic;
  }

  public int getReplyCount() {
    return replyCount;
  }

  public void setReplyCount(int replyCount) {
    this.replyCount = replyCount;
  }



}
