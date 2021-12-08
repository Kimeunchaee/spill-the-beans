package com.spill.beans.web;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import com.spill.beans.dto.MemberDTO;


@Controller
public class HomeController {
  @GetMapping("/home")

  public ModelAndView home(HttpSession session) {

    MemberDTO member = ((MemberDTO) session.getAttribute("loginUser"));

    ModelAndView mv = new ModelAndView();

    mv.addObject("loginUser", member);
    mv.addObject("pageTitle", "메인화면");
    mv.addObject("contentUrl", "home.jsp");
    mv.setViewName("template1");
    return mv;
  }
}







