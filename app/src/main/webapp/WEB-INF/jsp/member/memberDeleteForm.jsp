<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<h2 class="major">회원 탈퇴</h2>
<p>[${loginUser.nickname}] 님의 비밀번호를 입력해 주세요.</p>

<form action="delete" method='post' name='memberInfo' onsubmit="return check()">
  <input type="hidden" value="${loginUser.no}" name="no">
  <input type="hidden" value="${loginUser.email}" name="email">

	<div class="mb-3 row">
	   <label for='f-password' class="col-sm-2 col-form-label">비밀번호</label>
	     <div class="col-sm-10">
	       <input id='f-password' type='password' name='password' class="form-control"
	       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{7,16}$"
	       title="영어(대소문자), 숫자, 특수문자를 포함해 8자 이상 16자 이하로 입력해주세요."
	       placeholder="* 필수 입력" style="color: white;">
	     </div>
	 </div>
	 
	<button type="submit" class="button primary" style="width: 100%;">탈퇴</button>
</form>

<script type="text/javascript">
function check() {
    
  var form = document.memberInfo;
    
  if(!form.password.value){
    alert("비밀번호는 필수 입력입니다.");
    return false;
  }

};
</script>