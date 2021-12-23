<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.commet-btoom {
  display: flex;
  flex-direction: row;
}

form div {
  margin : 0 auto;
}

.form-control[readonly] {
    color: #ffffff;
    background-color: #fff0;
    background-clip: padding-box;
    padding-top: 25px;
    padding-bottom: 25px;
    padding-left: 0;
    border-radius: 0;
    border: 0;
    border-top: 1px solid #ced4da;
    border-bottom: 1px solid #ced4da;
}
.form-control[readonly]:hover{
  cursor: default;
}

.form-control:focus {
    border: 0;
}

.btn-wrap a {
    font-size: 14px;
    height: auto;
    line-height: 32px;
}

.btn-wrap button {
    font-size: 14px;
    height: auto;
    line-height: 32px;
}

input[type="checkbox"]:checked + label:before{
    font-size: 10px;
    padding-left: 1px;
}

.swal2-title {
    font-size: 18px;
}
.swal2-styled.swal2-confirm {
    line-height: 14px;
    font-weight: bold;
    background-color: rgb(31 71 63 / 100%);
}

</style>

<h2 class="major">게시글</h2>
<form action='update' method='post' style="width: 1000px;" id="board-form">

  <input id='f-no' type='hidden' name='no' class="form-control" value='${board.no}' readonly>
  
	<div class="mb-3 row">
	  <div class="col-sm-10">
	    <h4>${board.category.label}</h4>
	    <input type="text" name="title" id="f-title" value="${board.title}" style="font-size: 22px; margin: 0; font-weight: bold;">
	    <h4 style="margin-top: 6px;">${board.writer.nickname} | ${board.registeredDate} | 조회수:${board.viewCount} | 좋아요:${board.likeCount}</h4>
	  </div>
	</div>

	<div class="mb-3 row">
	  <div class="col-sm-10">
	    <textarea id='f-content' name='content' class="form-control" rows="8">${board.content}</textarea>
	  </div>
	</div>

	<div class="btn-wrap" style="margin-left: 684px;">
	<c:if test="${loginUser.no == board.writer.no}">
		<button type="submit" class="button" style="font-size: 14px;">수정</button>
		<a href='delete?no=${board.no}' class ="button" style="font-size: 14px;">삭제</a>
	  <a href='list' class ="button" style="font-size: 14px;">목록</a>
	</c:if>
	
	<c:if test="${loginUser.no != board.writer.no}">
		<a href='update' class ="button" style="font-size: 14px; visibility: hidden;">수정</a>
		<a href='delete?no=${board.no}' class ="button" style="font-size: 14px; visibility: hidden;">삭제</a>
	  <a href='list' class ="button" style="font-size: 14px;">목록</a>
	</c:if>
	
	</div>
</form>

<script>
document.querySelector("#board-form").onsubmit = () => {
	if (document.querySelector("#f-title").value == "" ||
			document.querySelector("#f-content").value == "") {
		Swal.fire("필수 입력 항목이 비어 있습니다.")
		return false;
	}
};
</script>