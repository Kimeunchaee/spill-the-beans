<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
tr a {
    text-decoration: none;
    color: white;
}
tr a:visited {
    color: white;
}
#paging {
  text-align: center;
}

</style>

<h2 class="major">회원 목록</h2>

<table class="table" style="color: white;">
<thead>
  <tr>
    <th>번호</th>
    <th>닉네임</th>
    <th>이메일</th>
    <th>가입일</th>
  </tr>
</thead>
	<tbody>
	
	<c:forEach items="${memberList}" var="member">
	<tr data-no="${member.no}">
	    <td>${member.no}</td>
	    <td><a href='detail?no=${member.no}'>${member.nickname}</a></td> 
	    <td>${member.email}</td> 
	    <td>${member.registeredDate}</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>

<p id="paging">
    <c:if test="${pageNo > 1}">
      <a href="list?pageNo=${pageNo-1}&pageSize=${pageSize}">◀</a>
    </c:if>
    <c:if test="${pageNo <= 1}">
     ◀
    </c:if>
    ${pageNo} / ${totalPage}
    <c:if test="${pageNo < totalPage}">
      <a href="list?pageNo=${pageNo+1}&pageSize=${pageSize}"> ▶</a>
    </c:if>
    <c:if test="${pageNo >= totalPage}">
     ▶
    </c:if>
</p>

<script>
document.querySelectorAll("tbody a").forEach((aTag) => {
  aTag.onclick = () => false;
});

var trList = document.querySelectorAll("tbody tr");
trList.forEach(function(trTag) {
  trTag.onclick = (e) => {
    window.location.href = e.currentTarget.querySelector("a").href;
  };
});

</script>






