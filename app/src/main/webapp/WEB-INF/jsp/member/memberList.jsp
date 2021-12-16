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

</style>

<h2 class="major">회원 목록</h2>

<table class="table" style="color: white;">
<thead>
  <tr>
    <th>번호</th>
    <th>닉네임</th>
    <th>이메일</th>
    <th>등록일</th>
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

<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

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






