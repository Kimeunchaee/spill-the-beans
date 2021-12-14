package com.spill.beans.web;

import java.util.Collection;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.spill.beans.dao.MemberDao;
import com.spill.beans.dto.MemberDTO;

@Controller
public class MemberController {

  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired MemberDao memberDao;
  @Autowired ServletContext sc;

  // 회원가입 폼
  @GetMapping("/member/addForm")
  public ModelAndView addForm() {

    ModelAndView mv = new ModelAndView();

    mv.addObject("pageTitle", "회원가입");
    mv.addObject("contentID", "signup");
    mv.addObject("contentUrl", "member/memberAddForm.jsp");
    mv.setViewName("template1");
    return mv;
  }

  // 회원가입
  @PostMapping("/member/add")
  public ModelAndView add(MemberDTO member, String site) throws Exception {

    member.setEmail(member.getEmail() + site);
    System.out.println(member.getEmail());
    memberDao.insert(member);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.addObject("refresh", "2;url=list");
    mv.addObject("pageTitle", "신규 회원");
    mv.addObject("contentUrl", "member/memberAdd.jsp");
    mv.setViewName("template1");
    return mv;
  }

  // 회원 목록
  @GetMapping("/member/list")
  public ModelAndView list() throws Exception {

    Collection<MemberDTO> memberList = memberDao.findAll();

    ModelAndView mv = new ModelAndView();
    mv.addObject("memberList", memberList);
    mv.addObject("pageTitle", "회원 목록");
    mv.addObject("contentUrl", "member/memberList.jsp");
    mv.setViewName("template1");
    return mv;
  }

  // 회원 상세
  @GetMapping("/member/detail")
  public ModelAndView detail(HttpSession session) throws Exception {

    MemberDTO user = (MemberDTO) session.getAttribute("loginUser");

    if (user == null) {
      throw new Exception("해당 회원을 찾을 수 없습니다.");
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("pageTitle", "회원 상세");
    mv.addObject("contentID", "detail");
    mv.addObject("contentUrl", "member/memberDetail.jsp");
    mv.setViewName("template1");
    return mv;
  }

  // 회원 정보 수정 폼
  @PostMapping("/member/updateForm")
  public ModelAndView updateForm(MemberDTO member, HttpSession session) throws Exception {

    ModelAndView mv = new ModelAndView();

    MemberDTO user = (MemberDTO) session.getAttribute("loginUser");

    if (user == null) {
      mv.addObject("pageTitle", "로그인");
      mv.addObject("contentUrl", "login.jsp");
      mv.setViewName("template1");
    }

    if (member == null) {
      throw new Exception("해당 회원을 찾을 수 없습니다.");
    }

    mv.addObject("pageTitle", "프로필 수정");
    mv.addObject("contentUrl", "member/memberUpdateForm.jsp");
    mv.setViewName("template1");

    return mv;
  }

  // 회원 정보 수정
  @PostMapping("/member/update")
  public ModelAndView update(MemberDTO member) throws Exception {

    MemberDTO user = memberDao.findByNo(member.getNo());

    if (user == null) {
      throw new Exception("해당 회원을 찾을 수 없습니다.");
    }

    memberDao.updateMember(member);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:../auth/logout");
    return mv;
  }

  // 회원 탈퇴
  @GetMapping("/member/delete")
  public ModelAndView delete(int no) throws Exception {

    MemberDTO member = memberDao.findByNo(no);

    if (member == null) {
      throw new Exception("해당 회원을 찾을 수 없습니다.");
    }

    member.setNickname("Deleted Member("+ member.getNickname() +")");
    member.setEmail("Deleted Email");
    member.setPassword("Deleted Password");
    member.setActive(2);

    memberDao.updateActive(member);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:../auth/logout");
    return mv;
  }

  @GetMapping("/member/checkEmail")
  @ResponseBody
  public String checkEmail(String email, String site) throws Exception {

    System.out.println(email+site);

    MemberDTO member = memberDao.findByEmail(email+site);
    if (member == null) {
      return "false";
    } else {
      return "true";
    }
  }

  @GetMapping("/member/checkNickname")
  @ResponseBody
  public String checkNickname(String nickname) throws Exception {
    MemberDTO member = memberDao.findByNickName(nickname);
    if (member == null) {
      return "false";
    } else {
      return "true";
    }
  }

}