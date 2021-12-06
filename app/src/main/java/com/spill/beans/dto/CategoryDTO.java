package com.spill.beans.dto;

public class CategoryDTO {
  private int no;
  private String label;

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