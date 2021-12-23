package com.spill.beans.dao;

import java.util.List;
import com.spill.beans.dto.CommentDTO;

// 역할
// - 댓글 데이터를 처리하는 객체 사용법 정의
public interface CommentDao {

  List<CommentDTO> findAll(int boardNo) throws Exception;

  CommentDTO findByNo(int commentNo) throws Exception;

  void insertComment(CommentDTO comment) throws Exception;

  void update(CommentDTO comment) throws Exception;
  void updateGroupNo(int commentNo) throws Exception;

  void delete(int commentNo) throws Exception;            // 관리자가 삭제
  void deleteByBoardNo(int boardNo) throws Exception;     // 게시글 번호로 삭제
  void deleteByMemberNo(int memberNo) throws Exception;   // 내가 쓴 댓글만 삭제

  // 답글
  List<CommentDTO> findAllReply(int boardNo) throws Exception;

  void insertReply(CommentDTO reply) throws Exception;
}
