<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<h2 class="major">ID 찾기</h2>

<form action='findID' method='post' name='memberInfo' onsubmit="return check()">
  
		<div class="mb-3 row">
		  <label for='f-nickname' class="col-sm-2 col-form-label">닉네임</label>
			  <div class="col-sm-10">
			    <input id='f-nickname' type='text' name='nickname' class="form-control" placeholder="* 필수 입력"
			    style="color: white;">
			  </div>
		</div>
  
	<button type="submit" class="button primary" style="width: 100%;">이메일 찾기</button>

</form>

<hr>

<h2 class="major">PW 찾기</h2>

<form action='findPW' method='post' name='memberPW' onsubmit="return checkPW()">
  
    <div class="mb-3 row">
      <label for='f-nickname' class="col-sm-2 col-form-label">닉네임</label>
        <div class="col-sm-10">
          <input id='f-nickname' type='text' name='nickname' class="form-control" placeholder="* 필수 입력"
          style="color: white;">
        </div>
    </div>
    
    <div class="mb-3 row">
      <label for='f-email' class="col-sm-2 col-form-label">이메일</label>
        <div class="col-sm-10">
          <input id='f-email' type='text' name='email' class="form-control" placeholder="* 필수 입력"
          style="color: white;">
        </div>
    </div>
  
  <button type="submit" class="button primary" style="width: 100%;">비밀번호 찾기</button>

</form>

<script type="text/javascript">
function check() {
	  
	var form = document.memberInfo;
	  
  if(!form.nickname.value){
    alert("닉네임은 필수 입력입니다.");
    return false;
  }

};

function checkPW() {
    
  var form = document.memberPW;
    
  if(!form.nickname.value){
    alert("닉네임은 필수 입력입니다.");
    return false;
  }
  
  if(!form.email.value){
      alert("이메일은 필수 입력입니다.");
      return false;
  }

};
</script>