<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<h2 class="major">마이페이지 수정</h2>

<style>

</style>

<form action='update' name='memberInfo' method='post' enctype="multipart/form-data" onsubmit="return check()">
  <input type='hidden' name='no' value='${loginUser.no}'>
  
		<div class="mb-3 row">
		  <label for='f-nickname' class="col-sm-2 col-form-label">닉네임</label>
		  <div class="col-sm-10">
		    <input id='f-nickname' type='text' name='nickname' class="form-control" value="${loginUser.nickname}">
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-email' class="col-sm-2 col-form-label">이메일</label>
		  <div class="col-sm-10">
		    <input id='f-email' type='email' name='email' class="form-control" value="${loginUser.email}">
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-password' class="col-sm-2 col-form-label">비밀번호</label>
		  <div class="col-sm-10">
		    <a href='completePW#findPW' class ="button" style="font-size: 15px; width: 100%;">비밀번호 수정</a><br>
		  </div>
		</div>
  
	<button type="submit" class ="button" style="font-size: 15px; width: 49%;">수정</button>
	<a href='detail#detail' class ="button" style="font-size: 15px; width: 49%;">돌아가기</a><br>
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