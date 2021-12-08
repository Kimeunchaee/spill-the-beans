package com.spill.beans.service;

import java.util.List;
import com.spill.beans.dto.BoardDTO;

public interface BoardService {
  // 메서드는 업무 용어를 사용한다.
  void add(BoardDTO board) throws Exception;
  List<BoardDTO> list() throws Exception;
  //  List<BoardDTO> search(String keyword) throws Exception;
  //  BoardDTO get(int no) throws Exception;
  void update(BoardDTO board) throws Exception;
  void remove(int no) throws Exception;
}
