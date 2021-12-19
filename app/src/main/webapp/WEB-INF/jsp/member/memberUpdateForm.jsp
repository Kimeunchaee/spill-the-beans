<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
    
<h2 class="major">마이페이지 수정</h2>

<form action='update' name='memberInfo' method='post' onsubmit="return check()">
  <input type='hidden' name='no' value='${loginUser.no}'>
  
		<div class="mb-3 row">
		  <label for='f-nickname' class="col-sm-2 col-form-label">닉네임</label>
		  <div class="col-sm-7">
		    <input id='f-nickname' type='text' name='nickname' value="${loginUser.nickname}">
		    <div class="invalid-feedback" style="color: #fbff00;">
          이미 존재하는 닉네임입니다.
        </div>
		  </div>
       <div class="col-sm-3">
         <button id="x-nickname-check-btn" type="button" class="button primary" style="width: 100%;">중복검사</button>
       </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-password' class="col-sm-2 col-form-label">비밀번호</label>
		  <div class="col-sm-10">
		    <a href='completePW#findPW' class ="button" style="font-size: 15px; width: 100%;">비밀번호 수정</a><br>
		  </div>
		</div>
  
	<button type="submit" class ="button" style="font-size: 15px; width: 49%;" id="x-add-btn">수정</button>
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

<script>
var addBtn = document.querySelector("#x-add-btn");
var nicknameTag = document.querySelector("#f-nickname");
addBtn.setAttribute("disabled", "disabled");

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