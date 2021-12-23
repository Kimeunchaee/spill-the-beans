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
  <script src="${contextPath}/node_modules/@fortawesome/fontawesome-free/js/fontawesome.js"></script>
  <script src="${contextPath}/node_modules/bootstrap/dist/js/bootstrap.js"></script>
  <script src="${contextPath}/node_modules/sweetalert2/dist/sweetalert2.js"></script>
  
  <link rel="stylesheet" href="${contextPath}/assets/css/main.css" />
  <noscript><link rel="stylesheet" href="${contextPath}/assets/css/noscript.css" /></noscript>

</head>
<body class="is-preload">


    <!-- Wrapper -->
      <div id="wrapper">
      
        <jsp:include page="header.jsp"/>

        <!-- Main -->
          <div id="main">

            <!-- Pop Up -->
              <article id="${contentID}">
                <jsp:include page="${contentUrl}"/>
              </article>

          </div>

        <!-- Footer -->
          <footer id="footer">
            <p class="copyright">&copy; <a href="#">The King with Donkey Ears</a>.</p>
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
