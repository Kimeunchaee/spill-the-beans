<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<c:choose>
	<c:when test="${loginUser.active == 2}">
		<h2 class="major">탈퇴 완료</h2>
		<p>탈퇴 완료되었습니다.<br>
       메인으로 이동합니다.</p>
       
    <meta http-equiv="refresh" content="2; url=${contextPath}/app/auth/logout">
		<br>
	</c:when>
	
	<c:otherwise>
		<h2 class="major">탈퇴 실패!</h2>
	  <p>비밀번호가 일치하지 않습니다.</p>
	  
	  <a href="${contextPath}/app/member/detail#detail" class="button primary" style="width: 49%;">마이페이지</a>
	  <a href="${contextPath}/app/member/deletePopUp#deletePopUp" class="button primary" style="width: 49%;">뒤로가기</a>
	  <br><br>
	</c:otherwise>
</c:choose>

<script>



</script>