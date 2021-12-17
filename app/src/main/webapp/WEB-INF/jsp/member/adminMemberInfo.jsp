<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
input[type="text"] {
  border: 0;
  font-size: 15px;
  line-height: 18px;
  padding-bottom: 7px;
}

input[type="email"] {
  border: 0;
  font-size: 15px;
  line-height: 18px;
  padding-bottom: 7px;
}

input[type="text"]:focus,
input[type="password"]:focus,
input[type="email"]:focus,
input[type="tel"]:focus,
select:focus,
textarea:focus {
  background: transparent !important;
  border:none !important;
}
    
</style>

<c:if test="${member.active != 2}">
<h2 class="major">회원 정보</h2>
</c:if>

<c:if test="${member.active == 2}">
<h2 class="major">탈퇴 회원 정보</h2>
</c:if>

<form method='post'>

	<input type='hidden' name='no' value='${member.no}'>

		<div class="mb-3 row">
		  <label for='f-nickname' class="col-sm-2 col-form-label">닉네임</label>
		  <div class="col-sm-10">
		    <input id='f-nickname' type='text' name='nickname' value="${member.nickname}" readonly>
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-email' class="col-sm-2 col-form-label">이메일</label>
		  <div class="col-sm-10">
		    <input id='f-email' type='email' name='email' value="${member.email}" readonly>
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-registeredDate' class="col-sm-2 col-form-label">가입일</label> 
		  <div class="col-sm-10">
		    <input id='f-registeredDate' type="text" readonly value="${member.registeredDate}">
		  </div>
		</div>
	
<c:if test="${member.active != 2}">
	<div class="btn_wrap">
	 <a href='deleteMemberPopUp?memberNo=${member.no}#deleteMemberPopUp' class ="button" style="font-size: 16px; width: 49%;">탈퇴시키기</a>
	 <a class ="button" onclick="history.back();" style="font-size: 16px; width: 49%;">뒤로가기</a>
	</div>
</c:if>

<c:if test="${member.active == 2}">
  <div class="btn_wrap">
   <a class ="button" onclick="history.back();" style="font-size: 16px; width: 100%;">뒤로가기</a>
  </div>
</c:if>

</form>
