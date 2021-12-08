package com.spill.beans.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.spill.beans.dao.CommentDao;
import com.spill.beans.dto.CommentDTO;

@Controller
public class CommentController {

  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired CommentDao commentDao;  
  @Autowired ServletContext sc;

  @GetMapping("board/comment/list")
  public ModelAndView list(/* int boardNo */) throws Exception {
    ModelAndView mv = new ModelAndView();

    int boardNo = 1;    // 임시

    List<CommentDTO> commentList = commentDao.findAll(boardNo);

    mv.addObject("commentList", commentList);
    mv.addObject("pageTitle", "댓글 목록(보드 디테일)");
    mv.addObject("contentUrl", "comment/CommentList.jsp");      // 임시
    //    mv.addObject("contentUrl", "board/boardDetail.jsp");
    mv.setViewName("template1");
    return mv;
  }

  @PostMapping("board/comment/update")
  public ModelAndView update(CommentDTO commentDTO) throws Exception {
    CommentDTO oldComment = commentDao.findByNo(commentDTO.getNo());

    if (oldComment == null) {
      throw new Exception("해당 번호의 댓글이 없습니다.");
    }

    commentDao.update(commentDTO);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();

    mv.addObject("comment", commentDTO);
    //mv.setViewName("redirect:../list?boardNo="+ commentDTO.getBoardNo());

    mv.addObject("pageTitle", "댓글 목록(보드 디테일)");
    mv.addObject("contentUrl", "comment/CommentList.jsp");
    mv.setViewName("template1");
    return mv;
  }


}

