package com.spill.beans.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.spill.beans.dto.MemberDTO;

// 역할
// - 회원 데이터를 처리하는 객체 사용법 정의
public interface MemberDao {
  List<MemberDTO> findAll(Map<String,Object> params) throws Exception;

  MemberDTO findByNo(int no) throws Exception;

  MemberDTO findByNickName(String nickname) throws Exception;

  MemberDTO findByEmail(String email) throws Exception;
  MemberDTO findByEmailAndPassword(@Param("email") String email, @Param("password") String password) throws Exception;

  void insert(MemberDTO member) throws Exception;

  void updateMember(MemberDTO member) throws Exception;

  // 탈퇴 - delete
  void updateActive(MemberDTO member) throws Exception;

  // 회원 목록 페이징
  int count() throws Exception;

}
