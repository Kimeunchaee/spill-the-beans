package com.spill.beans.dao;

import java.util.List;
import com.spill.beans.dto.BoardDTO;

// 역할
// - 게시판 데이터를 처리하는 객체 사용법을 정의한다.
public interface BoardDao {

  void insert(BoardDTO boardDTO) throws Exception;
  List<BoardDTO> findAll() throws Exception;
  List<BoardDTO> findAllByCategory() throws Exception;
  BoardDTO findByNo(int no) throws Exception;
  BoardDTO findByName(String name) throws Exception;
  void update(BoardDTO boardDTO) throws Exception;
  void updateCount(int no) throws Exception;
  void delete(int no) throws Exception;

}
