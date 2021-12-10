<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>내 프로필</h1>

<form method='post' enctype="multipart/form-data">
	<input type='hidden' name='no' value='${loginUser.no}'>

		<div class="mb-3 row">
		  <label for='f-no' class="col-sm-2 col-form-label">번호</label>
		  <div class="col-sm-6">
		    <input id='f-no' type='text' name='no' class="form-control-plaintext" value='${loginUser.no}' readonly>
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-nickname' class="col-sm-2 col-form-label">닉네임</label>
		  <div class="col-sm-6">
		    <input id='f-nickname' type='text' name='nickname' class="form-control-plaintext" value="${loginUser.nickname}" readonly>
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-email' class="col-sm-2 col-form-label">이메일</label>
		  <div class="col-sm-10">
		    <input id='f-email' type='email' name='email' class="form-control-plaintext" value="${loginUser.email}" readonly>
		  </div>
		</div>
		<div class="mb-3 row">
		  <label for='f-registeredDate' class="col-sm-2 col-form-label">가입일</label> 
		  <div class="col-sm-10">
		    <input id='f-registeredDate' type="text" readonly class="form-control-plaintext" value="${loginUser.registeredDate}">
		  </div>
		</div>
	
	<div class="btn_wrap">
	  <input type="submit" value="프로필 수정" formaction="updateForm" class ="btn btn-outline-dark"/>
		  <c:if test="${loginUser.active == 1}">
		    <a href='delete?no=${loginUser.no}' class ="btn btn-outline-dark">탈퇴</a>
		  </c:if>
		  <c:if test="${loginUser.active == 3}">
	      <a href="list" class ="btn btn-outline-dark">회원 목록</a>
	    </c:if>
	</div>

<!-- <a href='update' class="btn btn-primary">수정</a>
<a href='delete' class="btn btn-primary">삭제</a> 
<a href='list' class="btn btn-primary">목록</a><br> -->
</form>