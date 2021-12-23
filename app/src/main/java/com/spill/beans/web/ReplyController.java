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

  // 대댓글 등록
  @PostMapping("board/comment/reply/add")
  public ModelAndView add(CommentDTO reply, HttpSession session) throws Exception {

    BoardDTO board = boardDao.findByNo(reply.getBoardNo());
    if (board == null) {
      throw new Exception("해당 번호의 게시글이 없습니다.");
    }

    reply.setWriter((MemberDTO) session.getAttribute("loginUser"));
    reply.setReplyCount(0);

    if(reply.getIsPublic() == 0) {
      reply.setIsPublic(1);
    }

    commentDao.insertReply(reply);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:../../detail?no=" + reply.getBoardNo());
    return mv;
  }

}

