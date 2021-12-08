<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.commet-btoom {
  display: flex;
  flex-direction: row;
}

</style>

<h1>게시글</h1>
<form id="member-form" action='update' method='post'>
<div class="mb-3 row">
  <label for='f-no' class="col-sm-2 col-form-label">번호</label>
  <div class="col-sm-6">
    <input id='f-no' type='text' name='no' class="form-control" value='${board.no}' readonly>
  </div>
</div>
<div class="mb-3 row">
  <label for='f-title' class="col-sm-2 col-form-label">제목</label>
  <div class="col-sm-10">
    <input id='f-title' type='text' name='title' class="form-control" value="${board.title}">
  </div>
</div>
<div class="mb-3 row">
  <label for='f-content' class="col-sm-2 col-form-label">내용</label> 
  <div class="col-sm-10">
    <textarea id='f-content' name='content' class="form-control" rows="8" >${board.content}</textarea>
  </div>
</div>
<div class="mb-3 row">
  <label for='f-writer' class="col-sm-2 col-form-label">작성자</label> 
  <div class="col-sm-10">
    <input id='f-writer' type="text" readonly class="form-control-plaintext" value="${board.writer.nickname}">
  </div>
</div>
<div class="mb-3 row">
  <label for='f-registeredDate' class="col-sm-2 col-form-label">등록일</label> 
  <div class="col-sm-10">
    <input id='f-registeredDate' type="text" readonly class="form-control-plaintext" value="${board.registeredDate}">
  </div>
</div>
<div class="mb-3 row">
  <label for='f-viewCount' class="col-sm-2 col-form-label">조회수</label> 
  <div class="col-sm-10">
    <input id='f-viewCount' type="text" readonly class="form-control-plaintext" value="${board.viewCount}">
  </div>
</div>
<div class="mb-3 row">
  <label for='f-like' class="col-sm-2 col-form-label">좋아요</label> 
  <div class="col-sm-10">
    <input id='f-like' type="text" readonly class="form-control-plaintext" value="${board.likeCount}">
  </div>
</div>
<button class="btn btn-primary">변경</button>
<a href='delete?no=${board.no}' class="btn btn-primary">삭제</a> 
<a href='list' class="btn btn-primary">목록</a><br>
<br><br>
</form>

<!-- 댓글 -->
	<div class="mb-3 row">
	  <label for='f-comment-title' class="col-form-label">[댓글]</label>
		  
	  <c:if test='${not empty loginUser}'>
		  <div class="col-sm-11">
		    <form action='comment/add' method="post">
		      <input type="hidden" name="boardNo" value="${board.no}">
		      <%-- <input name="writer" type="hidden" value="${loginUser}"> --%>
			    <span>작성자 : ${loginUser.nickname}</span>
			    <select name="isPublic">
			      <option value="1">공개</option>
			      <option value="2">비밀</option>
			    </select>
			    <div class="commet-btoom">
				    <textarea id='f-comment-content' name='content' class="form-control col-md-6" rows="2" style="margin-right:5px;"></textarea>
			      <button class="btn btn-primary col-md-2" style="padding: 9px; width: 55px; font-size: 14px;">등록</button>
		      </div>
		    </form>	    
		  </div>
	  </c:if>
	  
	  <div class="col-sm-12">
      <jsp:include page="../comment/CommentList.jsp"/>
	  </div>
	  
  </div>
  
  
<!-- 댓글 end -->


<script>
document.querySelector("#member-form").onsubmit = () => {
	if (document.querySelector("#f-title").value == "" ||
			document.querySelector("#f-content").value == "") {
		Swal.fire("필수 입력 항목이 비어 있습니다.")
		return false;
	}
};
</script>