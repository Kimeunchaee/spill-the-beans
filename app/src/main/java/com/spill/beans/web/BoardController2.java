package com.spill.beans.web;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import com.spill.beans.dao.BoardDao;
import com.spill.beans.dao.CommentDao;
import com.spill.beans.dto.BoardDTO;
import com.spill.beans.dto.CommentDTO;
import com.spill.beans.dto.MemberDTO;

@Controller
public class BoardController2 {

  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired CommentDao commentDao;
  @Autowired BoardDao boardDao;

  @GetMapping("/board/detail2")
  public ModelAndView detail(int no, HttpSession session) throws Exception {
    BoardDTO board = boardDao.findByNo(no);

    if (board == null) {
      throw new Exception("해당 번호의 게시글이 없습니다.");
    }

    boardDao.updateCount(no);

    MemberDTO member = ((MemberDTO) session.getAttribute("loginUser"));

    List<CommentDTO> commentList = commentDao.findAll(no);

    ModelAndView mv = new ModelAndView();

    mv.addObject("commentList", commentList);
    mv.addObject("loginUser", member);
    mv.addObject("board", board);
    mv.addObject("pageTitle", "게시글");
    mv.addObject("contentUrl", "board/BoardDetail.jsp");
    mv.setViewName("template1");
    return mv;
  }


}







