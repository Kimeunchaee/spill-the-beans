<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<h2 class="major">회원 탈퇴</h2>

<p>
원활한 회원 탈퇴를 위해서 아래 내용을 확인하고 진행해 주세요. <br>
<br>
1. 게시판형 서비스에 등록한 게시물은 탈퇴 후에도 남아 있습니다.<br>
&nbsp;&nbsp; 글이 남아 있는 것을 원치 않으신다면 삭제 후 탈퇴해 주세요.<br>
<br>
2. 회원정보 및 개인형 서비스의 데이터는 파기되어 복구할 수 없습니다.<br>
<br>
3. 탈퇴한 아이디로는 다시 가입할 수 없으며, 아이디 및 데이터는 <br>
&nbsp;&nbsp; 복구할 수 없으므로 회원 탈퇴 시 신중히 진행해 주시기 바랍니다.<br>
</p>


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