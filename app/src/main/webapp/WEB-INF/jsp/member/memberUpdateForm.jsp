<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<h1>회원 상세</h1>

<form id="member-form" action='update' method='post' enctype="multipart/form-data">
  <input type='hidden' name='no' value='${member.no}'>
  
		<div class="mb-3 row">
		  <label for='f-nickname' class="col-sm-2 col-form-label">이름</label>
		  <div class="col-sm-6">
		    <input id='f-nickname' type='text' name='nickname' class="form-control" value="${member.nickname}">
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-email' class="col-sm-2 col-form-label">이메일</label>
		  <div class="col-sm-10">
		    <input id='f-email' type='email' name='email' class="form-control" value="${member.email}">
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-password' class="col-sm-2 col-form-label">비밀번호</label>
		  <div class="col-sm-6">
		    <input id='f-password' type='password' name='password' class="form-control">
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-registeredDate' class="col-sm-2 col-form-label">등록일</label> 
		  <div class="col-sm-10">
		    <input id='f-registeredDate' type="text" readonly class="form-control-plaintext" value="${member.registeredDate}">
		  </div>
	  </div>
  
	<button type="submit" class="btn btn-primary">수정</button>
	<a href='list' class="btn btn-primary">돌아가기</a><br>
</form>

<script>
document.querySelector("#member-form").onsubmit = () => {
  if (document.querySelector("#f-nickname").value == "" ||
      document.querySelector("#f-email").value == "" ||
      document.querySelector("#f-password").value == "") {
    Swal.fire("필수 입력 항목은 비울 수 없습니다.")
    return false;
  }
};
</script>