package com.spill.beans.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.spill.beans.dto.BoardDTO;
import com.spill.beans.dto.BoardLikeDTO;

// 역할
// - 게시판 데이터를 처리하는 객체 사용법을 정의한다.
public interface BoardDao {

  void insert(BoardDTO boardDTO) throws Exception;
  List<BoardDTO> findAll(Map<String,Object> params) throws Exception;
  List<BoardDTO> findAllByCategory() throws Exception;
  BoardDTO findByNo(int no) throws Exception;
  BoardDTO findByName(String name) throws Exception;
  void update(BoardDTO boardDTO) throws Exception;
  void delete(int no) throws Exception;
  List<BoardDTO> findByKeyword(@Param("option") String option, @Param("keyword") String keyword) throws Exception;

  // 게시판 목록 페이징
  int count() throws Exception;

  // 게시판 조회수
  void updateCount(int no) throws Exception;

  // 게시판 조회수 -1
  void discount(int no) throws Exception;

  void insertLike(@Param("boardNo") int boardNo, @Param("memberNo") int memberNo) throws Exception;
  void deleteLike(@Param("boardNo") int boardNo, @Param("memberNo") int memberNo) throws Exception;

  List<BoardLikeDTO> findLikeAll() throws Exception;

  // 게시판 좋아요
  void updateLikeCount(int no) throws Exception;

  // 게시판 좋아요 취소
  void disLikecount(int no) throws Exception;

}
