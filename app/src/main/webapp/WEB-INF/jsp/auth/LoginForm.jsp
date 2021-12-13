<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
    
<form action='login' method='post'>
	
	<h2 class="major">로그인</h2>
    <div class="field half">
      <label for="demo-email">이메일</label>
      <input type="email" name="email" id="demo-email" value="${cookie.email.value}" placeholder="이메일을 입력하세요." />
    </div>
  </br>
  
    <div class="field half">
      <label for="demo-password">비밀번호</label>
      <input type="password" name="password" id="demo-password" placeholder="비밀번호를 입력하세요."/>
    </div>
  
		<div class="field half" style="margin-top: 12px;">
		  <input type="checkbox" id="demo-copy" name="saveEmail" ${not empty cookie.email ? "checked" : ""}>
		  <label for="demo-copy">이메일 저장</label>
		</div>
  
    <div class="ear-button" style="display: block; margin-top: 10px;">
      <button class="button primary" style="width: 100%;">입장하기</button>
    </div>
    
  </br></br>
  
</form>
