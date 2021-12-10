<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="${contextPath}/app/home">EAR</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
        <!-- 게시판 -->
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${contextPath}/app/board/list">게시판</a>
        </li>
        
        <!-- 회원 -->
        <c:if test="${loginUser.active == 3}">
	        <li class="nav-item">
	          <a class="nav-link active" href="${contextPath}/app/member/list">회원</a>
	        </li>
        </c:if>
        
        <c:if test="${loginUser.active == 1}">
          <li class="nav-item">
            <a class="nav-link active" href="${contextPath}/app/member/detail">마이페이지</a>
          </li>
        </c:if>
        
        <!-- 로그인 -->
        <li class="nav-item">
	        <c:if test="${empty loginUser}">
	          <li class="nav-item">
						  <a class="nav-link active" href="${contextPath}/app/auth/loginForm">로그인</a>
						</li>
						<li class="nav-item">
						  <a href='${contextPath}/app/member/addForm' class="nav-link active">회원가입</a>
						</li>
					</c:if>
					
					<c:if test="${not empty loginUser}">
					  <a class="nav-link active" href="${contextPath}/app/auth/logout">${loginUser.nickname} | 로그아웃</a>
					</c:if>
        </li>
        
        
      </ul>
    </div>
  </div>
</nav>
</header>