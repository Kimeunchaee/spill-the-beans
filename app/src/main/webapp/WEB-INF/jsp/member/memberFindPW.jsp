<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<c:choose>
	<c:when test="${not empty member}">
		<h2 class="major">PW 변경</h2>
		<p>비밀번호를 다시 설정해 주세요.</p>

  <form action='updatePW' method='post' name='memberInfo' onsubmit="return check()">
  <input type="hidden" name="no" value="${member.no}">
  <input type="hidden" name="nickname" value="${member.nickname}">

		<div class="mb-3 row">
      <label for='f-password' class="col-sm-2 col-form-label">비밀번호</label>
        <div class="col-sm-10">
          <input id='f-password' type='password' name='password' class="form-control"
          pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{7,16}$"
          title="영어(대소문자), 숫자, 특수문자를 포함해 8자 이상 16자 이하로 입력해주세요."
          placeholder="* 필수 입력" style="color: white;">
        </div>
    </div>
    <div class="mb-3 row">
      <label for='f-repassword' class="col-sm-2 col-form-label">비밀번호 확인</label>
        <div class="col-sm-10">
          <input id='f-password' type='password' name='repassword' class="form-control" placeholder="* 비밀번호 확인" style="color: white;">
        </div>
    </div>
    
		<button type="submit" class="button primary" style="width: 100%;">비밀번호 변경</button>
		
  </form>
		<br><br>
	</c:when>
	
	<c:otherwise>
		<h2 class="major">PW 찾기 실패!</h2>
	  <p>해당 회원을 찾을 수 없습니다.</p>
	  
	  <a href="${contextPath}/app/member/findForm#findForm" class="button primary" style="width: 49%;">ID/PW 찾기</a>
	  <a href="${contextPath}/app/member/addForm#signup" class="button primary" style="width: 49%;">회원가입</a>
	  <br><br>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
function check() {
    
  var form = document.memberInfo;
    
  if(!form.password.value){
    alert("비밀번호는 필수 입력입니다.");
    return false;
  }
  
  if(form.repassword.value != form.password.value){
    alert("비밀번호를 동일하게 입력하세요.");
    form.repassword.focus();
    return false;
  }
};
</script>