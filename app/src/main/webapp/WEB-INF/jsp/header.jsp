<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header id="header">

  <!-- 동키 얼굴  -->
  <a href="${contextPath}/app/home" class="logo">
	   <span><img src="${contextPath}/images/donkey.png"; style="width: 85%;"></span>
  </a>
  
  <!-- 타이틀, 내용 -->
  <div class="content">
    <div class="inner">
      <h1 style="font-family:'SANGJUGyeongcheonIsland';">임금님 귀는 당나귀 귀</h1>
      <p>주위 사람들에게 털어 놓을 수 없는, 털어 놓지 못해 답답한 사람들을 위해</br>
      자신만의 비밀이나 속마음을 어딘가에 쏟을 수 있도록 도와주는 사소하면서 웃기고 슬픈 TMI를 익명으로 공유해 보세요!</p>
    </div>
  </div>
  
  <nav>
	  <c:if test="${empty loginUser}">
	    <ul> <!-- 비회원 -->
	      <li><a href="#intro">소개</a></li>
	      <li><a href="${contextPath}/app/auth/loginForm#loginForm">로그인</a></li>
	      <li><a href="${contextPath}/app/member/addForm#signup">회원가입</a></li>
	      <li><a href="#findidpw">ID/PW 찾기</a></li>
	      <li><a href="#board">입장하기</a></li>
	    </ul>
	  </c:if>
	  
	  <c:if test="${not empty loginUser && loginUser.active == 1}">
	    <ul> <!-- 회원 -->
	      <li><a href="#intro">소개</a></li>
	      <li><a href="#mypage">마이페이지</a></li>
	      <li><a href="#write">속삭이기</a></li>
	      <li><a href="${contextPath}/app/auth/logout">로그아웃</a></li>
	    </ul>
	  </c:if>
	  
	  <c:if test="${not empty loginUser && loginUser.active == 3}">
	    <ul>  <!-- 관리자 -->
	      <li><a href="#intro">소개</a></li>
	      <li><a href="#work">마이페이지</a></li>
	      <li><a href="#member">회원 관리</a></li>
	      <li><a href="#board">게시글 관리</a></li>
	      <li><a href="${contextPath}/app/auth/logout">로그아웃</a></li>
	    </ul>
	  </c:if>
  </nav>
  
</header>