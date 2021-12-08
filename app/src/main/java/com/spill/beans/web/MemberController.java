package com.spill.beans.web;

import java.util.Collection;
import javax.servlet.ServletContext;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import com.spill.beans.dao.MemberDao;
import com.spill.beans.dto.MemberDTO;

@Controller
public class MemberController {

  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired MemberDao memberDao;
  @Autowired ServletContext sc;

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

  @GetMapping("/member/detail")
  public ModelAndView detail(int no) throws Exception {

    MemberDTO member = memberDao.findByNo(no);

    if (member == null) {
      throw new Exception("회원을 다시 선택해 주세요.");
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("member", member);
    mv.addObject("pageTitle", "회원 상세");
    mv.addObject("contentUrl", "member/memberDetail.jsp");
    mv.setViewName("template1");
    return mv;
  }


  //
  //  @GetMapping("/member/form")
  //  public ModelAndView form() {
  //    ModelAndView mv = new ModelAndView();
  //    mv.addObject("pageTitle", "신규 회원");
  //    mv.addObject("contentUrl", "member/MemberForm.jsp");
  //    mv.setViewName("template1");
  //    return mv;
  //  }
  //
  //  @PostMapping("/member/add")
  //  public ModelAndView add(MemberDTO member) throws Exception {
  //
  //    memberDao.insert(member);
  //    sqlSessionFactory.openSession().commit();
  //
  //    ModelAndView mv = new ModelAndView();
  //    mv.addObject("refresh", "2;url=list");
  //    mv.addObject("pageTitle", "회원등록");
  //    mv.addObject("contentUrl", "member/MemberAdd.jsp");
  //    mv.setViewName("template1");
  //    return mv;
  //  }
  //
  //  @GetMapping("/member/list")
  //  public ModelAndView list() throws Exception {
  //
  //    Collection<MemberDTO> memberList = memberDao.findAll();
  //
  //    ModelAndView mv = new ModelAndView();
  //    mv.addObject("memberList", memberList);
  //    mv.addObject("pageTitle", "회원목록");
  //    mv.addObject("contentUrl", "member/MemberList.jsp");
  //    mv.setViewName("template1");
  //    return mv;
  //  }
  //
  //  @GetMapping("/member/detail")
  //  public ModelAndView detail(int no) throws Exception {
  //    MemberDTO member = memberDao.findByNo(no);
  //    if (member == null) {
  //      throw new Exception("해당 번호의 회원이 없습니다.");
  //    }
  //
  //    ModelAndView mv = new ModelAndView();
  //    //    mv.addObject("member", memberDTO);
  //    mv.addObject("pageTitle", "회원정보");
  //    mv.addObject("contentUrl", "member/MemberDetail.jsp");
  //    mv.setViewName("template1");
  //    return mv;
  //  }
  //
  //  @PostMapping("/member/update")
  //  public ModelAndView update(MemberDTO member, Part photoFile) throws Exception {
  //
  //    MemberDTO oldMember = memberDao.findByNo(member.getNo());
  //    if (oldMember == null) {
  //      throw new Exception("해당 번호의 회원이 없습니다.");
  //    } 
  //
  //    member.setRegisteredDate(oldMember.getRegisteredDate());
  //
  //    memberDao.updateMember(member);
  //    sqlSessionFactory.openSession().commit();
  //
  //    ModelAndView mv = new ModelAndView();
  //    mv.setViewName("redirect:list");
  //    return mv;
  //  }
  //
  //  @GetMapping("/member/delete")
  //  public ModelAndView delete(int no) throws Exception {
  //    MemberDTO member = memberDao.findByNo(no);
  //    if (member == null) {
  //      throw new Exception("해당 번호의 회원이 없습니다.");
  //    }
  //
  //    member.setNickname("Deleted Member("+ member.getNickname() +")");
  //    member.setEmail("Deleted Email");
  //    member.setPassword("Deleted Password");
  //    member.setActive(2);
  //
  //    memberDao.updateActive(member);
  //    sqlSessionFactory.openSession().commit();
  //
  //    ModelAndView mv = new ModelAndView();
  //    mv.setViewName("redirect:list");
  //    return mv;
  //  }
}
