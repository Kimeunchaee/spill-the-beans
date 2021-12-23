<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action='login' method="post" id="login-form">
	
	<h2 class="major">로그인</h2>
    <div class="field half">
      <label for="f-email">이메일</label>
      <input type="email" name="email" id="f-email" value="${cookie.email.value}" placeholder="이메일을 입력하세요." />
    </div>
  <br>
  
    <div class="field half">
      <label for="f-password">비밀번호</label>
      <input type="password" name="password" id="f-password" placeholder="비밀번호를 입력하세요."/>
    </div>
  
		<div class="field half" style="margin-top: 12px;">
		  <input type="checkbox" id="demo-copy" name="saveEmail" ${not empty cookie.email ? "checked" : ""}>
		  <label for="demo-copy">이메일 저장</label>
		</div>
  
    <div class="ear-button" style="display: block; margin-top: 10px;">
      <button class="button primary" style="width: 100%;">입장하기</button>
    </div>
    
  <br><br>     
</form>

<script>
document.querySelector("#login-form").onsubmit = () => {
	  if (document.querySelector("#f-email").value == "" ||
	      document.querySelector("#f-password").value == "") {
	    window.alert("이메일, 패스워드를 입력해주세요.")
	    return false;
	  }
	};
	
	// X 버튼 클릭 시 home으로 가게 설정하려고 했으나 먹히지 않음
/*     $main_articles.each(function() {

      var $this = $(this);

        $('<div class="close">Close</div>')
          .appendTo($this)
          .on('click', function() {
            location.hash = '${contextPath}/app/home';
          });

        $this.on('click', function(event) {
          event.stopPropagation();
        });
    }); */
	
</script>