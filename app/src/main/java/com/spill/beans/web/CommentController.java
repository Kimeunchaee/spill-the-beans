package com.spill.beans.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.spill.beans.dao.BoardDao;
import com.spill.beans.dao.CommentDao;
import com.spill.beans.dto.BoardDTO;
import com.spill.beans.dto.CommentDTO;
import com.spill.beans.dto.MemberDTO;

@Controller
public class CommentController {

  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired CommentDao commentDao;  
  @Autowired BoardDao boardDao;  
  @Autowired ServletContext sc;

  // 원댓 등록
  @PostMapping("board/comment/add")
  public ModelAndView add(CommentDTO comment, HttpSession session) throws Exception {

    ModelAndView mv = new ModelAndView();

    if (session.getAttribute("loginUser") == null) {
      mv.setViewName("redirect:../../auth/loginForm#loginForm");
      return mv;
    }

    BoardDTO board = boardDao.findByNo(comment.getBoardNo());
    if (board == null) {
      throw new Exception("해당 번호의 게시글이 없습니다.");
    }

    comment.setWriter((MemberDTO) session.getAttribute("loginUser"));
    comment.setReplyCount(0);

    if(comment.getIsPublic() == 0) {
      comment.setIsPublic(1);
    }

    commentDao.insertComment(comment);

    comment.setGroupNo(comment.getNo());
    commentDao.updateGroupNo(comment.getNo());

    sqlSessionFactory.openSession().commit();

    mv.setViewName("redirect:../detail?no=" + comment.getBoardNo());
    return mv;
  }

  // ------------------------------------------------------------------------------
  // 댓글 번호만 팝업으로 전달
  @GetMapping("board/comment/updateForm")
  public ModelAndView updateForm(int commentNo, RedirectAttributes redirectAttributes) throws Exception {

    // addAttribute : 기본 자료형만 가능함 (String, int ...)
    redirectAttributes.addAttribute("commentNo", commentNo);

    ModelAndView mv = new ModelAndView();

    mv.setViewName("redirect:../comment/updateForm/PopUp#updateForm");

    return mv;
  }

  // 위에서 댓글 번호 받아서 코멘트 객체 찾아서 팝업 출력
  @GetMapping("board/comment/updateForm/PopUp")
  public ModelAndView updateFormPopUp(@RequestParam("commentNo") int commentNo) throws Exception {

    CommentDTO comment = commentDao.findByNo(commentNo);
    if (comment == null) {
      throw new Exception("해당 댓글이 없습니다.");
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("comment", comment);
    mv.addObject("pageTitle", "댓글 수정");
    mv.addObject("contentID", "updateForm");
    mv.addObject("contentUrl", "comment/CommentUpdateForm.jsp");
    mv.setViewName("template1");

    return mv;
  }

  // ------------------------------------------------------------------------------
  // 원댓 수정
  @PostMapping("board/comment/update")
  public ModelAndView update(CommentDTO comment) throws Exception {

    commentDao.update(comment);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:../detail?no=" + comment.getBoardNo());
    return mv;
  }

  // 원댓 삭제
  @GetMapping("board/comment/delete")
  public ModelAndView delete(int commentNo) throws Exception {
    CommentDTO comment = commentDao.findByNo(commentNo);

    if (comment == null) {
      throw new Exception("해당 번호의 댓글이 없습니다.");
    }

    commentDao.delete(comment.getNo());
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:../detail?no=" + comment.getBoardNo());
    return mv;
  }

}

