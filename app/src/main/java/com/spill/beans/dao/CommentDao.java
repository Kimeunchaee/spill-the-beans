package com.spill.beans.dao;

import java.util.List;
import com.spill.beans.dto.CommentDTO;

// 역할
// - 회원 데이터를 처리하는 객체 사용법을 정의한다.
public interface CommentDao {
  void insert(CommentDTO comment) throws Exception;
  List<CommentDTO> findAll() throws Exception;
  CommentDTO findByNo(int no) throws Exception;
  CommentDTO findByName(String name) throws Exception;
  void update(CommentDTO member) throws Exception;
  void delete(int no) throws Exception;
}
