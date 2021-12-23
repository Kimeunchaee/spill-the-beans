package com.spill.beans.dao;

import java.util.List;
import com.spill.beans.dto.CategoryDTO;

// 역할
// - 카테고리 데이터를 처리하는 객체 사용법 정의
public interface CategoryDao {

  List<CategoryDTO> findAll() throws Exception;

}
