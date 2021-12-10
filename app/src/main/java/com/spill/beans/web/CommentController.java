package com.spill.beans.web;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
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

  @GetMapping("board/comment/list")
  public ModelAndView list(int boardNo) throws Exception {
    ModelAndView mv = new ModelAndView();

    List<CommentDTO> commentList = commentDao.findAll(boardNo);

    mv.addObject("commentList", commentList);
    mv.addObject("contentUrl", "comment/CommentList.jsp");
    mv.setViewName("template1");
    return mv;
  }

  @PostMapping("board/comment/add")
  public ModelAndView add(CommentDTO comment, HttpSession session) throws Exception {
    BoardDTO board = boardDao.findByNo(comment.getBoardNo());
    if (board == null) {
      throw new Exception("해당 번호의 게시글이 없습니다.");
    }

    comment.setWriter((MemberDTO) session.getAttribute("loginUser"));
    comment.setReplyCount(0);

    board.setCommentCount(board.getCommentCount()+1);   // 할까 말까

    commentDao.insert(comment.getBoardNo(), comment);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:../detail?no=" + comment.getBoardNo());
    return mv;
  }

  @PostMapping("board/comment/updateForm")
  public ModelAndView updateForm(CommentDTO comment, HttpSession session) throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.setViewName("redirect:../detail?no=" + comment.getBoardNo());
    return mv;
  }

  @PostMapping("board/comment/update")
  public ModelAndView update(CommentDTO comment) throws Exception {

    CommentDTO oldComment = commentDao.findByNo(comment.getNo());
    if (oldComment == null) {
      throw new Exception("해당 번호의 댓글이 없습니다.");
    }

    commentDao.update(comment);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:../detail?no=" + comment.getBoardNo());
    return mv;
  }

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

