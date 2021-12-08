<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<h1>내 프로필 수정</h1>

<form action='update' name='memberInfo' method='post' enctype="multipart/form-data" onsubmit="return check()">
  <input type='hidden' name='no' value='${member.no}'>
  
		<div class="mb-3 row">
		  <label for='f-nickname' class="col-sm-2 col-form-label">닉네임</label>
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
  
	<button type="submit" class="btn btn-primary">수정</button>
	<a href='list' class="btn btn-primary">돌아가기</a><br>
</form>

<script type="text/javascript">
function check() {
	  
	var form = document.memberInfo;
	  
  if(!form.nickname.value){
    alert("닉네임을 입력하세요.");
    return false;
  }
  
  if(!form.email.value){
    alert("이메일을 입력하세요.");
    return false;
  }
  
  if(!form.password.value){
    alert("비밀번호를 입력하세요.");
    return false;
  }
  
};
</script>