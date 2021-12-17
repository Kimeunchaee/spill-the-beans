package com.spill.beans.web;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.spill.beans.dao.BoardDao;
import com.spill.beans.dao.CommentDao;
import com.spill.beans.dto.BoardDTO;
import com.spill.beans.dto.CommentDTO;
import com.spill.beans.dto.MemberDTO;

@Controller
public class BoardController {

  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired CommentDao commentDao;
  @Autowired BoardDao boardDao;

  // 게시글 등록 폼
  @GetMapping("/board/form")
  public ModelAndView form() {
    ModelAndView mv = new ModelAndView();
    mv.addObject("pageTitle", "새 글");
    mv.addObject("contentUrl", "board/BoardForm.jsp");
    mv.setViewName("template1");
    return mv;
  }

  // 게시글 등록
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

  //게시글 목록
  @GetMapping("/board/list")
  public ModelAndView list(@RequestParam(defaultValue = "1") int pageNo, 
      @RequestParam(defaultValue = "8") int pageSize, HttpSession session) throws Exception {

    int count = boardDao.count();

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

    List<BoardDTO> boardList = boardDao.findAll(params);

    ModelAndView mv = new ModelAndView();

    session.setAttribute("totalPage", totalPage);
    session.setAttribute("pageNo", pageNo);
    session.setAttribute("pageSize", pageSize);

    mv.addObject("boardList", boardList);
    mv.addObject("pageTitle", "게시글목록");
    mv.addObject("contentUrl", "board/BoardList.jsp");
    mv.setViewName("template2");

    return mv;
  }

  // 게시글 상세
  @GetMapping("/board/detail")
  public ModelAndView detail(int no, HttpSession session) throws Exception {

    MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
    BoardDTO board = boardDao.findByNo(no);

    if (board == null) {
      throw new Exception("해당 번호의 게시글이 없습니다.");
    }

    boardDao.updateCount(no);

    List<CommentDTO> commentList = commentDao.findAll(no);

    ModelAndView mv = new ModelAndView();
    mv.addObject("commentList", commentList);
    mv.addObject("loginUser", member);
    mv.addObject("board", board);
    mv.addObject("pageTitle", "게시글");
    mv.addObject("contentUrl", "board/BoardDetail.jsp");
    mv.setViewName("template2");
    return mv;
  }

  // 게시글 업데이트
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

  // 게시글 삭제
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


  // ---------------------------------------------------------------------------------

  // 게시글 검색
  @GetMapping("/board/search")
  public ModelAndView search(String option, String keyword) throws Exception {


    if (option.equals("all")) {
      option = "b.title "+" like(concat('%'," +" '" +keyword+"' " +",'%'))"+" or m.nickname "+" like(concat('%'," +" '" +keyword+"' " +",'%'))";

    } else if (option.equals("title")) {
      option = "b.title like(concat('%'," +" '" +keyword+"' " +",'%'))";

    } else if (option.equals("writer")) {
      option = "m.nickname like(concat('%'," +" '" +keyword+"' " +",'%'))";
    }

    List<BoardDTO> boardList = boardDao.findByKeyword(option, keyword);

    if (boardList.isEmpty()) {
      throw new Exception("검색한 게시글이 없습니다.");
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("boardList", boardList);
    mv.addObject("pageTitle", "게시글");
    mv.addObject("contentUrl", "board/BoardList.jsp");
    mv.setViewName("template2");
    return mv;
  }

}
