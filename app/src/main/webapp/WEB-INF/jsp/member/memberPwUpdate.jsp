<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<c:choose>
  <c:when test="${not empty member}">
		<h2 class="major">PW 변경 성공!</h2>
		<p>[ ${member.nickname} ] 님의 비밀번호가 변경 되었습니다.</p>
    <a href="${contextPath}/app/auth/loginForm#loginForm" class="button primary" style="width: 49%;">로그인</a>
    <a href="${contextPath}/app/home" class="button primary" style="width: 49%;">메인</a>
    <br><br>
  </c:when>

<c:otherwise>
<h2 class="major">PW 변경 실패!</h2>
    <p> 비밀번호 변경을 실패 했습니다.</p>
    
    <a href="${contextPath}/app/member/findForm#findForm" class="button primary" style="width: 49%;">ID/PW 찾기</a>
    <a href="${contextPath}/app/member/addForm#signup" class="button primary" style="width: 49%;">회원가입</a>
    <br><br>
</c:otherwise>
</c:choose>

