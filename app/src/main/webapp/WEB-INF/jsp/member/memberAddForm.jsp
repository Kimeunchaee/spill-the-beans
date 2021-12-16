<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<h2 class="major">회원가입</h2>

<form action='add' method='post' name='memberInfo' onsubmit="return check()">
  
		<div class="mb-3 row">
		  <label for='f-nickname' class="col-sm-2 col-form-label">닉네임</label>
			  <div class="col-sm-7">
			    <input id='f-nickname' type='text' name='nickname' class="form-control" placeholder="* 필수 입력" style="color: white;">
			    <div class="invalid-feedback" style="color: #fbff00;">
          이미 존재하는 닉네임입니다.
          </div>
			   </div>
			  <div class="col-sm-3">
			    <button id="x-nickname-check-btn" type="button" class="button primary" style="width: 100%;">중복검사</button>
			  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-email' class="col-sm-2 col-form-label">이메일</label>
				  <div class="col-sm-3">
				    <input id='f-email' type='text' name='email' class="form-control" placeholder="* 필수 입력" style="color: white;">
				    <div class="invalid-feedback" style="width: 300px; color: #fbff00;">
            이미 존재하는 이메일입니다.
            </div>
				  </div>
	       <div class="col-sm-4">
	           <select name="site" id="f-site">
	             <option value="@naver.com">@ naver.com</option>
	             <option value="@daum.net">@ daum.net</option>
	             <option value="@gmail.com">@ gmail.com</option>
	           </select>
	      </div>
      <div class="col-sm-3">
      <button id="x-email-check-btn" type="button" class="button primary" style="width: 100%;">중복검사</button> 
      </div> 
		</div>
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
  
	<button type="submit" class="button primary" style="width: 100%;" id="x-add-btn">회원가입</button>

</form>

<script type="text/javascript">
function check() {
	  
	var form = document.memberInfo;
	  
  if(!form.nickname.value){
    alert("닉네임은 필수 입력입니다.");
    return false;
  }
  
  if(!form.email.value){
    alert("이메일은 필수 입력입니다.");
    return false;
  }
  
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

<script>
var addBtn = document.querySelector("#x-add-btn");
var emailTag = document.querySelector("#f-email");
var siteTag = document.querySelector("#f-site");
var nicknameTag = document.querySelector("#f-nickname");
addBtn.setAttribute("disabled", "disabled");

document.querySelector("#x-email-check-btn").onclick = () => {
    var xhr = new XMLHttpRequest();
    xhr.addEventListener("load", function() {
      if (this.responseText == "false") {
          addBtn.removeAttribute("disabled");
          emailTag.classList.remove("is-invalid");
      } else {
        addBtn.setAttribute("disabled", "disabled");
        emailTag.classList.add("is-invalid");
      }
    })
    xhr.open("get", "checkEmail?email=" + emailTag.value + "&site=" + siteTag.value);
    xhr.send();
};

document.querySelector("#x-nickname-check-btn").onclick = () => {
    var xhr = new XMLHttpRequest();
    xhr.addEventListener("load", function() {
      if (this.responseText == "false") {
          addBtn.removeAttribute("disabled");
          nicknameTag.classList.remove("is-invalid");
      } else {
        addBtn.setAttribute("disabled", "disabled");
        nicknameTag.classList.add("is-invalid");
      }
    })
    xhr.open("get", "checkNickname?nickname=" + nicknameTag.value);
    xhr.send();
};
</script>