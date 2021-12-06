package com.spill.beans.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.spill.beans.dto.CommentDTO;

public interface CommentDao {

  List<CommentDTO> findAll(int boarNo) throws Exception;
  CommentDTO findByNo(int commentNo) throws Exception;

  void insert(@Param("boardNo")int boardNo, @Param("comment")CommentDTO comment) throws Exception;
  void update(CommentDTO comment) throws Exception;

  void delete(int commentNo) throws Exception;            // 관리자가 삭제
  void deleteByMemberNo(int memberNo) throws Exception;   // 내가 쓴 댓글만 삭제

}
