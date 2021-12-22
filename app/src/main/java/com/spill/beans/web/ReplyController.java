package com.spill.beans.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.spill.beans.dao.BoardDao;
import com.spill.beans.dao.CommentDao;
import com.spill.beans.dto.BoardDTO;
import com.spill.beans.dto.CommentDTO;
import com.spill.beans.dto.MemberDTO;

@Controller
public class ReplyController {

  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired CommentDao commentDao;  
  @Autowired BoardDao boardDao;  
  @Autowired ServletContext sc;

  @PostMapping("board/comment/reply/add")
  public ModelAndView add(CommentDTO reply, HttpSession session) throws Exception {

    BoardDTO board = boardDao.findByNo(reply.getBoardNo());
    if (board == null) {
      throw new Exception("해당 번호의 게시글이 없습니다.");
    }

    //board.setCommentCount(board.getCommentCount()+1);   // 할까 말까

    reply.setWriter((MemberDTO) session.getAttribute("loginUser"));
    reply.setReplyCount(0);

    //    reply.setClassNo(reply.getClassNo() + 1);
    //    reply.setGroupNo(reply.getParentNo());
    //    reply.setOrderNo(reply.getOrderNo() + 1);

    System.out.println("*******************대댓글 오더번호 : " + reply.getOrderNo());


    if(reply.getIsPublic() == 0) {
      reply.setIsPublic(1);
    }

    commentDao.insertReply(reply);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:../../detail?no=" + reply.getBoardNo());
    return mv;
  }

  //  // 댓글 번호만 PopUp으로 전달
  //  @GetMapping("board/comment/updateForm")
  //  public ModelAndView updateForm(int commentNo, RedirectAttributes redirectAttributes) throws Exception {
  //
  //    redirectAttributes.addAttribute("commentNo", commentNo); // 기본자료형만 가능함 (String, int ...)
  //
  //    ModelAndView mv = new ModelAndView();
  //
  //    mv.setViewName("redirect:../comment/updateForm/PopUp#updateForm");
  //
  //    return mv;
  //  }
  //
  //  // 번호 받아서 코멘트 객체 찾아서 팝업 출력
  //  @GetMapping("board/comment/updateForm/PopUp")
  //  public ModelAndView updateFormPopUp(@RequestParam("commentNo") int commentNo) throws Exception {
  //
  //    CommentDTO comment = commentDao.findByNo(commentNo);
  //    if (comment == null) {
  //      throw new Exception("해당 댓글이 없습니다.");
  //    }
  //
  //    ModelAndView mv = new ModelAndView();
  //    mv.addObject("comment", comment);
  //    mv.addObject("pageTitle", "댓글 수정");
  //    mv.addObject("contentID", "updateForm");
  //    mv.addObject("contentUrl", "comment/CommentUpdateForm.jsp");
  //    mv.setViewName("template1");
  //
  //    return mv;
  //  }
  //
  //  @PostMapping("board/comment/update")
  //  public ModelAndView update(CommentDTO comment) throws Exception {
  //
  //    commentDao.update(comment);
  //    sqlSessionFactory.openSession().commit();
  //
  //    ModelAndView mv = new ModelAndView();
  //    mv.setViewName("redirect:../detail?no=" + comment.getBoardNo());
  //    return mv;
  //  }
  //
  //  @GetMapping("board/comment/delete")
  //  public ModelAndView delete(int commentNo) throws Exception {
  //    CommentDTO comment = commentDao.findByNo(commentNo);
  //
  //    if (comment == null) {
  //      throw new Exception("해당 번호의 댓글이 없습니다.");
  //    }
  //
  //    commentDao.delete(comment.getNo());
  //    sqlSessionFactory.openSession().commit();
  //
  //    ModelAndView mv = new ModelAndView();
  //    mv.setViewName("redirect:../detail?no=" + comment.getBoardNo());
  //    return mv;
  //  }

}

