package com.spill.beans.dto;

public class BoardLikeDTO {
  private int boardNo;      // 게시판 번호
  private int memberNo;     // 회원 번호

  @Override
  public String toString() {
    return "BoardLikeDTO [boardNo=" + boardNo + ", memberNo=" + memberNo + "]";
  }

  public int getBoardNo() {
    return boardNo;
  }

  public void setBoardNo(int boardNo) {
    this.boardNo = boardNo;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

}