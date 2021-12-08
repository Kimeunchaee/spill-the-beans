//package com.spill.beans.web;
//
//import javax.servlet.ServletContext;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.servlet.ModelAndView;
//import com.spill.beans.dto.CommentDTO;
//import com.spill.beans.dto.MemberDTO;
//
//@Controller
//public class CommentController {
//
//  @Autowired SqlSessionFactory sqlSessionFactory;
//  @Autowired CommentDTO commentDTO;
//  @Autowired MemberDTO memberDTO;
//  @Autowired ServletContext sc;
//
//  @GetMapping("/comment/list")
//  public ModelAndView form() {
//    ModelAndView mv = new ModelAndView();
//    mv.addObject("pageTitle", "새회원");
//    mv.addObject("contentUrl", "member/MemberForm.jsp");
//    mv.setViewName("template1");
//    return mv;
//  }
//}

