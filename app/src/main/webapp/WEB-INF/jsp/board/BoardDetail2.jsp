<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<h1>게시글</h1>
<form id="member-form" action='update' method='post'>
<div class="mb-3 row">
  <label for='f-no' class="col-sm-2 col-form-label">번호</label>
  <div class="col-sm-6">
    <input id='f-no' type='text' name='no' class="form-control" value='${board.no}' readonly>
  </div>
</div>
<div class="mb-3 row">
  <label for='f-category' class="col-sm-2 col-form-label">카테고리</label>
  <div class="col-sm-6">
    <input id='f-category' type='text' name='category.label' class="form-control" value='${board.category.label}' readonly>
  </div>
</div>
<div class="mb-3 row">
  <label for='f-title' class="col-sm-2 col-form-label">제목</label>
  <div class="col-sm-10">
    <input id='f-title' type='text' name='title' class="form-control" value="${board.title}" readonly>
  </div>
</div>
<div class="mb-3 row">
  <label for='f-content' class="col-sm-2 col-form-label">내용</label> 
  <div class="col-sm-10">
    <textarea id='f-content' name='content' class="form-control" rows="8" readonly >${board.content}</textarea>
  </div>
</div>
<div class="mb-3 row">
  <label for='f-writer' class="col-sm-2 col-form-label">작성자</label> 
  <div class="col-sm-10">
    <input id='f-writer' type="text" readonly class="form-control-plaintext" value="${board.writer.nickname}" readonly>
  </div>
</div>
<div class="mb-3 row">
  <label for='f-registeredDate' class="col-sm-2 col-form-label">등록일</label> 
  <div class="col-sm-10">
    <input id='f-registeredDate' type="text" readonly class="form-control-plaintext" value="${board.registeredDate}" readonly>
  </div>
</div>
<div class="mb-3 row">
  <label for='f-viewCount' class="col-sm-2 col-form-label">조회수</label> 
  <div class="col-sm-10">
    <input id='f-viewCount' type="text" readonly class="form-control-plaintext" value="${board.viewCount}" readonly>
  </div>
</div>
<div class="mb-3 row">
  <label for='f-like' class="col-sm-2 col-form-label">좋아요</label> 
  <div class="col-sm-10">
    <input id='f-like' type="text" readonly class="form-control-plaintext" value="${board.likeCount}" readonly>
  </div>
</div>
<a href='list' class="btn btn-primary">목록</a><br>
</form>

<script>
document.querySelector("#member-form").onsubmit = () => {
	if (document.querySelector("#f-title").value == "" ||
			document.querySelector("#f-content").value == "") {
		Swal.fire("필수 입력 항목이 비어 있습니다.")
		return false;
	}
};
</script>