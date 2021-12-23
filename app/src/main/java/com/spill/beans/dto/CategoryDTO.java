package com.spill.beans.dto;

public class CategoryDTO {
  private int no;               // 카테고리 번호
  private String label;         // 1: 일 2: 학업 3: 일상

  @Override
  public String toString() {
    return "CategoryDTO [no=" + no + ", label=" + label + "]";
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getLabel() {
    return label;
  }

  public void setLabel(String label) {
    this.label = label;
  }

}