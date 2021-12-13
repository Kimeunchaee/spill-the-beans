<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
  <c:if test="${not empty refresh}">
    <meta http-equiv="Refresh" content="${refresh}">
  </c:if>
  <title>${pageTitle}</title>

  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

  <link rel="stylesheet" href="${contextPath}/node_modules/bootstrap/dist/css/bootstrap.css">
  <link rel="stylesheet" href="${contextPath}/node_modules/sweetalert2/dist/sweetalert2.css">
  <link rel="stylesheet" href="${contextPath}/css/common.css">
  
  <script src="${contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
  <script src="${contextPath}/node_modules/bootstrap/dist/js/bootstrap.js"></script>
  <script src="${contextPath}/node_modules/sweetalert2/dist/sweetalert2.js"></script>
  
  <link rel="stylesheet" href="${contextPath}/assets/css/main.css" />
  <noscript><link rel="stylesheet" href="${contextPath}/assets/css/noscript.css" /></noscript>

</head>
<body class="is-preload">


    <!-- Wrapper -->
      <div id="wrapper">

        <!-- Header -->
          <header id="header">
            <div class="logo">
              <span><img src="${contextPath}/images/donkey.png"; style="width: 85%;"></span>
            </div>
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
                <li><a href="#signup">회원가입</a></li>
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

        <!-- Main -->
          <div id="main">

            <!-- login -->
              <article id="${contentID}">
                <jsp:include page="${contentUrl}"/>
              </article>

          </div>

        <!-- Footer -->
          <footer id="footer">
            <p class="copyright">&copy; EAR. <a href="#">The king's ear is a donkey's ear</a>.</p>
          </footer>

      </div>

    <!-- BG -->
      <div id="bg"></div>

    <!-- Scripts -->
      <script src="${contextPath}/assets/js/jquery.min.js"></script>
      <script src="${contextPath}/assets/js/browser.min.js"></script>
      <script src="${contextPath}/assets/js/breakpoints.min.js"></script>
      <script src="${contextPath}/assets/js/util.js"></script>
      <script src="${contextPath}/assets/js/main.js"></script>

</body>
</html>
