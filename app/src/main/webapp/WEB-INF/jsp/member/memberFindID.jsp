<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<c:choose>
	<c:when test="${not empty member}">
		<h2 class="major">ID 찾기 성공!</h2>
		<p>[ ${member.nickname} ] 님의 이메일은 [ ${member.email} ]입니다.</p>
		
		<a href="${contextPath}/app/auth/loginForm#loginForm" class="button primary" style="width: 49%;">로그인</a>
		<a href="${contextPath}/app/member/findForm#findForm" class="button primary" style="width: 49%;">비밀번호 찾기</a>
		<br><br>
	</c:when>
	
	<c:otherwise>
		<h2 class="major">ID 찾기 실패!</h2>
	  <p>해당 닉네임을 찾을 수 없습니다.</p>
	  
	  <a href="${contextPath}/app/member/findForm#findForm" class="button primary" style="width: 49%;">ID/PW 찾기</a>
	  <a href="${contextPath}/app/member/addForm#signup" class="button primary" style="width: 49%;">회원가입</a>
	  <br><br>
	</c:otherwise>
</c:choose>