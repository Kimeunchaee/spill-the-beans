package com.spill.beans.dto;

import java.sql.Date;

public class MemberDTO {
  private int no;
  private String nickname;
  private String email;
  private String password;
  private Date registeredDate;
  private int active; // 1: 멤버 2: 탈퇴 3: 관리자

  @Override
  public String toString() {
    return "MemberDTO [no=" + no + ", nickname=" + nickname + ", email=" + email + ", password="
        + password + ", registeredDate=" + registeredDate + ", active=" + active + "]";
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Date getRegisteredDate() {
    return registeredDate;
  }

  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }

  public int getActive() {
    return active;
  }

  public void setActive(int active) {
    this.active = active;
  }

}