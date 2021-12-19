<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--제이쿼리-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

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

select option {
    color: black;
    background: #ffffff;
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

<h2 class="major">속삭이기</h2>
<form id="board-form" action='add' method='post' style="width: 1000px;">

  <input id='f-member_no' type='hidden' name='writer.no' value='${loginUser.no}' class="form-control" readonly>

	<div class="mb-3 row">
	  <div class="col-sm-2" style="margin: 0; margin-left: 84px;">
	   <select class="form-control" id="f-category" name="category.no" style="width: 200px;">
			  <option selected value="">카테고리를 선택하세요 ↓</option>
			  <option value="1" >일</option>
			  <option value="2" >학업</option>
			  <option value="3" >일상</option>
      </select>
	  </div>
	  <div class="col-sm-8">
	    <input id="f-title" type="text" name="title" placeholder="제목을 입력하세요" style="font-size: 18px; margin: 0; font-weight: bold; width: 611px;">
	  </div>
	</div>
	
	<div class="mb-3 row">
	</div>

	<div class="mb-3 row">
	  <div class="col-sm-10">
	    <label for='f-content' class="col-sm-2 col-form-label">내용</label>
	    <textarea id='f-content' name='content' class="form-control" rows="8"></textarea>
	    <div id="test_cnt">(0 / 1500)</div>
	  </div>
	</div>

	<div class="btn-wrap" style="margin-left: 762px;">
    <a href="#form" class="button" style="font-size: 14px;">등록</a>
    <a href="list" class="button" style="font-size: 14px;">목록</a>
  </div>
  
<!-- PopUp -->
  <div id="main">
      
    <article id="form" style="position: fixed; top: 200px; z-index: 999; box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px; background-color: rgb(31 71 63 / 100%);">
        <h2 class="major">게시글 등록</h2>
        <p>등록 하시겠습니까?</p>
        <button type="submit" class ="button" style="font-size: 16px; width: 49%;">네</button>
        <a class ="button" onclick="closeTabClick()" style="font-size: 16px; width: 49%;">아니요</a>
    </article>
  
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

<script>
$(document).ready(function() {
    $('#f-content').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 1500)");
 
        if($(this).val().length > 1500) {
            $(this).val($(this).val().substring(0, 1500));
            $('#test_cnt').html("(1500 / 1500)");
        }
    });
});
</script>

<script>
function closeTabClick() {
	location.hash = '';
}
</script>