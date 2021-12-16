package com.spill.beans.web;

import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

  //----------------------------------------------------------------------------------------------------------
  // 회원가입
  @PostMapping("/member/add")
  public ModelAndView add(MemberDTO member, String site, HttpSession session) throws Exception {

    member.setEmail(member.getEmail() + site);

    memberDao.insert(member);
    sqlSessionFactory.openSession().commit();

    session.setAttribute("memberNickname", member.getNickname());

    ModelAndView mv = new ModelAndView();

    mv.setViewName("redirect:../member/add#add");

    return mv;
  }

  // 팝업 띄우기 위해
  @GetMapping("/member/add")
  public ModelAndView add(HttpSession session) {

    ModelAndView mv = new ModelAndView();

    mv.addObject("memberNickname", session.getAttribute("memberNickname"));
    mv.addObject("contentID", "add");
    mv.addObject("pageTitle", "신규 회원");
    mv.addObject("contentUrl", "member/memberAdd.jsp");
    mv.setViewName("template1");

    session.invalidate();

    return mv;
  }

  //----------------------------------------------------------------------------------------------------------

  // 회원 목록
  @GetMapping("/member/list")
  public ModelAndView list(@RequestParam(defaultValue = "1") int pageNo, 
      @RequestParam(defaultValue = "8") int pageSize, HttpSession session) throws Exception {

    int count = memberDao.count();

    if (pageSize < 5 || pageSize > 8) {
      pageSize = 8;
    }

    int totalPage = count / pageSize + ((count % pageSize) > 0 ? 1 : 0);

    if (pageNo < 1 || pageNo > totalPage) {
      pageNo = 1;
    }

    HashMap<String,Object> params = new HashMap<>();

    params.put("offset", pageSize * (pageNo - 1));
    params.put("length", pageSize);

    List<MemberDTO> memberList = memberDao.findAll(params);

    ModelAndView mv = new ModelAndView();

    session.setAttribute("memberList", memberList);
    session.setAttribute("totalPage", totalPage);
    session.setAttribute("pageNo", pageNo);
    session.setAttribute("pageSize", pageSize);

    //    mv.addObject("memberList", memberList);
    //    mv.addObject("totalPage", totalPage);
    //    mv.addObject("pageNo", pageNo);
    //    mv.addObject("pageSize", pageSize);

    mv.setViewName("redirect:../member/listForm#memberList");

    return mv;
  }

  // 회원 목록 폼
  @GetMapping("/member/listForm")
  public ModelAndView listForm(HttpSession session) throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.addObject("memberList", session.getAttribute("memberList"));
    mv.addObject("totalPage", session.getAttribute("totalPage"));
    mv.addObject("pageNo", ((int) session.getAttribute("pageNo")));
    mv.addObject("pageSize", ((int)session.getAttribute("pageSize")));

    mv.addObject("pageTitle", "회원 목록");
    mv.addObject("contentID", "memberList");
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


  //----------------------------------------------------------------------------------------------------------
  // 회원 정보 수정 폼
  @PostMapping("/member/updateForm")
  public ModelAndView updateForm(MemberDTO member) throws Exception {

    ModelAndView mv = new ModelAndView();

    if (member == null) {

      throw new Exception("해당 회원을 찾을 수 없습니다.");

    }

    mv.setViewName("redirect:../member/updateForm#updateForm");

    return mv;
  }

  // 경로 주소는 같지만 Post, Get이 달라서 실행은 됨,,,,,,,,,,
  @GetMapping("/member/updateForm")
  public ModelAndView updateForm(HttpSession session) throws Exception {

    ModelAndView mv = new ModelAndView();

    // 멤버를 세션에 저장 (비밀번호 변경 할 때 필요 / MemberFindController:completePW#findPW)
    session.setAttribute("findMemberPW", session.getAttribute("loginUser")); 

    mv.addObject("pageTitle", "마이페이지 수정");
    mv.addObject("contentID", "updateForm");
    mv.addObject("contentUrl", "member/memberUpdateForm.jsp");
    mv.setViewName("template1");

    return mv;
  }
  //----------------------------------------------------------------------------------------------------------

  // 회원 정보 수정
  @PostMapping("/member/update")
  public ModelAndView update(MemberDTO member,HttpSession session) throws Exception {

    MemberDTO user = memberDao.findByNo(member.getNo());

    if (user == null) {
      throw new Exception("해당 회원을 찾을 수 없습니다.");
    }

    memberDao.updateMember(member);
    sqlSessionFactory.openSession().commit();

    // 업데이트된 멤버를 세션에 다시 저장 (마이페이지 새로고침될때 필요)
    session.setAttribute("loginUser", memberDao.findByNo(member.getNo()));

    ModelAndView mv = new ModelAndView();

    mv.setViewName("redirect:../member/detail#detail");

    return mv;
  }



  // 회원 탈퇴 폼 열기
  @GetMapping("/member/deleteForm")
  public ModelAndView deleteForm() throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.setViewName("redirect:../member/deletePopUp#deletePopUp");

    return mv;
  }

  // 회원 탈퇴 폼
  @GetMapping("/member/deletePopUp")
  public ModelAndView deletePopUp() throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.addObject("pageTitle", "회원 탈퇴");
    mv.addObject("contentID", "deletePopUp");
    mv.addObject("contentUrl", "member/memberDeleteForm.jsp");
    mv.setViewName("template1");

    return mv;
  }

  // 회원 탈퇴
  @PostMapping("/member/delete")
  public ModelAndView delete(MemberDTO member, HttpSession session) throws Exception {

    ModelAndView mv = new ModelAndView();

    MemberDTO deleteMember = memberDao.findByEmailAndPassword(member.getEmail(), member.getPassword());

    if (deleteMember != null && deleteMember.getActive() != 2) {

      member.setNickname("Deleted Member("+ deleteMember.getNickname() +")");
      member.setEmail("Deleted Email");
      member.setPassword("Deleted Password");
      member.setActive(2);

      memberDao.updateActive(member);
      sqlSessionFactory.openSession().commit();

      session.setAttribute("loginUser", memberDao.findByNo(member.getNo()));
      // mv.addObject("refresh", "2;url=../auth/logout");
      // 방법 1) 원래 deleteMSG에서 if문을 사용하여 구현해 줘야 하지만
      // 방법 2) jsp에서 refresh 조건문 사용하여 간결하게 구현 가능!

    } 

    mv.setViewName("redirect:../member/deleteMSG#deleteMSG");

    return mv;
  }

  // 회원 탈퇴 결과(성공, 실패)
  @GetMapping("/member/deleteMSG")
  public ModelAndView deleteMSG() throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.addObject("pageTitle", "회원 탈퇴");
    mv.addObject("contentID", "deleteMSG");
    mv.addObject("contentUrl", "member/memberDelete.jsp");
    mv.setViewName("template1");
    return mv;
  }

  // ------------------------------------------------------------------------------------------

  // 멤버 이메일 중복 확인
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

  //멤버 닉네임 중복 확인
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