package com.spill.beans.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.spill.beans.dto.MemberDTO;

// 역할
// - 회원 데이터를 처리하는 객체 사용법을 정의한다.
public interface MemberDao {
  void insert(MemberDTO member) throws Exception;
  List<MemberDTO> findAll() throws Exception;
  MemberDTO findByNo(int no) throws Exception;



  MemberDTO findByName(String name) throws Exception;
  MemberDTO findByEmailAndPassword(@Param("email") String email, @Param("password") String password) throws Exception;
  void update(MemberDTO member) throws Exception;
  void delete(int no) throws Exception;
}
