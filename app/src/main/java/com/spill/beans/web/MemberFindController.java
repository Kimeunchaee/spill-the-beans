package com.spill.beans.web;

import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.spill.beans.dao.MemberDao;
import com.spill.beans.dto.MemberDTO;

@Controller
public class MemberFindController {

  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired MemberDao memberDao;

  // ID/PW 입력 폼
  @GetMapping("/member/findForm")
  public ModelAndView findForm() throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.addObject("pageTitle", "ID/PW 찾기");
    mv.addObject("contentID", "findForm");
    mv.addObject("contentUrl", "member/memberFindForm.jsp");
    mv.setViewName("template1");
    return mv;
  }

  // 이메일 찾는 폼
  @PostMapping("/member/findID")
  public ModelAndView findID(String nickname, HttpSession session) throws Exception {

    MemberDTO member = memberDao.findByNickName(nickname);

    ModelAndView mv = new ModelAndView();

    if (member != null) {
      session.setAttribute("findMemberID", member);
    }

    mv.setViewName("redirect:../member/completeID#findID");
    return mv;
  }

  // 이메일 찾기 결과(성공, 실패)
  @GetMapping("/member/completeID")
  public ModelAndView completeID(HttpSession session) throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.addObject("member", session.getAttribute("findMemberID"));
    mv.addObject("pageTitle", "ID 찾기");
    mv.addObject("contentID", "findID");
    mv.addObject("contentUrl", "member/memberFindID.jsp");
    mv.setViewName("template1");

    session.invalidate();
    return mv;
  }

  // ------------------------------------------------------------------------------

  // 비밀번호 찾는 폼(닉네임, 이메일을 파라미터로 받는 폼)
  @PostMapping("/member/findPW")
  public ModelAndView findPW(MemberDTO member, HttpSession session) throws Exception {

    MemberDTO findMember = memberDao.findByNickName(member.getNickname());

    if (findMember != null && findMember.getEmail().equals(member.getEmail())) {
      session.setAttribute("findMemberPW", findMember);
    }

    ModelAndView mv = new ModelAndView();

    mv.setViewName("redirect:../member/completePW#findPW");

    return mv;
  }

  // 새 비밀번호 입력 폼
  @GetMapping("/member/completePW")
  public ModelAndView completePW(HttpSession session) throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.addObject("member", session.getAttribute("findMemberPW"));
    mv.addObject("pageTitle", "PW 찾기");
    mv.addObject("contentID", "findPW");
    mv.addObject("contentUrl", "member/memberFindPW.jsp");
    mv.setViewName("template1");
    return mv;
  }

  // 새 비밀번호를 파라미터로 받아서 업데이트
  @PostMapping("/member/updatePW")
  public ModelAndView updatePW(MemberDTO member, HttpSession session) throws Exception {

    MemberDTO user = memberDao.findByNickName(member.getNickname());

    if (user == null) {
      throw new Exception("해당 회원을 찾을 수 없습니다.");
    }

    memberDao.updateMember(member);
    sqlSessionFactory.openSession().commit();

    session.setAttribute("findMemberPW", member);

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:../member/messagePW#messagePW");
    return mv;
  }

  // 비밀번호 업데이트 결과(성공, 실패)
  @GetMapping("/member/messagePW")
  public ModelAndView messagePW(HttpSession session) throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.addObject("member", session.getAttribute("findMemberPW"));
    //    mv.addObject("refresh", "1;url=auth/loginForm#loginForm");
    mv.addObject("pageTitle", "PW 변경");
    mv.addObject("contentID", "messagePW");
    mv.addObject("contentUrl", "member/memberPwUpdate.jsp");
    mv.setViewName("template1");

    session.invalidate();

    return mv;
  }

}
