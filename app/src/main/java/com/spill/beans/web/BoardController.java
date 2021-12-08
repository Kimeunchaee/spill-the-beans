package com.spill.beans.web;

import java.util.Collection;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.spill.beans.dao.BoardDao;
import com.spill.beans.dto.BoardDTO;
import com.spill.beans.dto.MemberDTO;

@Controller
public class BoardController {

  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired BoardDao boardDao;

  @GetMapping("/board/form")
  public ModelAndView form() {
    ModelAndView mv = new ModelAndView();
    mv.addObject("pageTitle", "새 글");
    mv.addObject("contentUrl", "board/BoardForm.jsp");
    mv.setViewName("template1");
    return mv;
  }

  @PostMapping("/board/add")
  public ModelAndView add(BoardDTO board, HttpSession session) throws Exception {

    board.setViewCount(0);
    board.setLikeCount(0);
    board.setCommentCount(0);
    board.setWriter((MemberDTO) session.getAttribute("loginUser"));

    boardDao.insert(board);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:list");
    return mv;
  }

  @GetMapping("/board/list")
  public ModelAndView list() throws Exception {
    Collection<BoardDTO> boardList = boardDao.findAll();
    ModelAndView mv = new ModelAndView();
    mv.addObject("boardList", boardList);
    mv.addObject("pageTitle", "게시글목록");
    mv.addObject("contentUrl", "board/BoardList.jsp");
    mv.setViewName("template1");
    return mv;
  }

  @GetMapping("/board/detail")
  public ModelAndView detail(int no, HttpSession session) throws Exception {
    BoardDTO board = boardDao.findByNo(no);

    if (board == null) {
      throw new Exception("해당 번호의 게시글이 없습니다.");
    }

    boardDao.updateCount(no);

    ModelAndView mv = new ModelAndView();
    mv.addObject("board", board);
    mv.addObject("pageTitle", "게시글");

    if (((MemberDTO) session.getAttribute("loginUser")).getNo() == board.getWriter().getNo()) {
      mv.addObject("contentUrl", "board/MyBoardDetail.jsp");


    } else if(((MemberDTO) session.getAttribute("loginUser")) == null || 
        ((MemberDTO) session.getAttribute("loginUser")).getNo() != board.getWriter().getNo()) {

      mv.addObject("contentUrl", "board/BoardDetail2.jsp");
    }

    mv.setViewName("template1");
    return mv;
  }

  @PostMapping("/board/update")
  public ModelAndView update(BoardDTO board) throws Exception {

    BoardDTO oldBoardDTO = boardDao.findByNo(board.getNo());
    if (oldBoardDTO == null) {
      throw new Exception("해당 번호의 게시글이 없습니다.");
    } 

    boardDao.update(board);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:list");
    return mv;
  }

  @GetMapping("/board/delete")
  public ModelAndView delete(int no) throws Exception {

    BoardDTO board = boardDao.findByNo(no);
    if (board == null) {
      throw new Exception("해당 번호의 게시글이 없습니다.");
    }

    boardDao.delete(no);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:list");
    return mv;
  }
}







