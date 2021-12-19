<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
 <h2 class="major">댓글 수정</h2>
 
 <form action="../update" name='commentInfo' method="post" onsubmit="return check()">
    <input type="hidden" style="color: white" value="${comment.no}" name="no">
    <input type="hidden" style="color: white" value="${comment.boardNo}" name="boardNo">

    <input type="checkbox" name="isPublic" value="${comment.isPublic}">
    <label for="demo-copy">비밀</label>

    <input type="text" value="${comment.content}" name="content"><br>
    
    <button type="submit" class ="button" style="font-size: 16px; width: 49%;">수정하기</button>
    <a href='detail?no=${board.no}' class ="button" style="font-size: 16px; width: 49%;">수정취소</a>
 </form>

 
<script type="text/javascript">
function check() {
    
  var form = document.commentInfo;
    
  if(!form.nickname.value){
    alert("내용을 입력하세요.");
    return false;
  }
  
};
</script>