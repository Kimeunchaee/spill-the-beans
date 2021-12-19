<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
  <style>
  input[type="radio"]:checked + label:before {
    width: 20px;
    height: 20px;
    line-height: 20px;
    padding-left: 2px;
  }
  
  input[type="radio"] + label:before {
    border-radius: 4px;
    width: 20px;
    height: 20px;
    line-height: 20px;
    padding-left: 2px;
  }
  
  </style>
    
 <h2 class="major">댓글 수정</h2>
 
 <form action="../update" name='commentInfo' method="post" onsubmit="return check()">
    <input type="hidden" style="color: white" value="${comment.no}" name="no">
    <input type="hidden" style="color: white" value="${comment.boardNo}" name="boardNo">

    <input type="radio" id="demo-priority-low" name="isPublic" value="1" checked>
    <label for="demo-priority-low">공개</label>
    <input type="radio" id="demo-priority-high" name="isPublic" value="2">
    <label for="demo-priority-high">비밀</label>
    

    <input type="text" value="${comment.content}" name="content"><br>
    
    <button type="submit" class="button" style="font-size: 16px; width: 49%;">수정하기</button>
    <a onclick="history.back();" class="button" style="font-size: 16px; width: 49%;">수정취소</a>
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
