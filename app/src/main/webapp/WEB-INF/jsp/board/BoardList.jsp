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
tr:hover {
    cursor: pointer;
}
table {
    color: white;
}
table th {
  text-align: center;
}
tbody {
  text-align: center;
  color: white;
}
.button {
	line-height: 32px;
  height: auto;
  margin-left: 100px;
}
.search {
	padding: 1px;
}
.search-item {
  font-size: 14px;
  height: auto;
  line-height: 30px;
}
input[type=text] {
  font-size: 14px;
  height: auto;
  line-height: 30px;
}

.home-wrap {
    margin-right: 1119px;
    margin-bottom: 17px;
    transition: 0.6;
    font-size: 20px;
}

select option {
    color: black;
    background: #ffffff;
}

</style>

<h2 class="major" style="margin-bottom: 15px;"><a href="${contextPath}/app/board/list">게시글 목록</a></h2>

<div class="home-wrap">
  <a href='${contextPath}/app/home'><i class="fas fa-home"></i></a>
</div>
<table class="table" style="width: 1200px;">
<thead>
  <tr>
    <th>번호</th>
    <th>카테고리</th>
    <th style="max-width: 400px; width: 400px;">제목</th>
    <th>작성자</th>
    <th>등록일</th>
    <th>조회수</th>
  </tr>
</thead>
<tbody>

<c:if test="${empty boardList}">
  <tr>
    <td colspan="6" style="height: 100px; vertical-align: middle;">게시글이 없습니다.</td>
   </tr>
</c:if>

<c:if test="${empty loginUser}">
	<c:forEach items="${boardList}" var="board">
	<tr data-no="${board.no}">
	    <td>${board.no}</td>
	    <td>${board.category.label}</td>
	    <td>${board.title}<td> 
	    <td>${board.writer.nickname}</td> 
	    <td>${board.registeredDate}</td> 
	    <td>${board.viewCount}</td>
	</tr>
	</c:forEach>
</c:if>

<c:if test="${not empty loginUser}">
	<c:forEach items="${boardList}" var="board">
	<tr data-no="${board.no}">
	    <td>${board.no}</td>
	    <td>${board.category.label}</td>
	    <td><a href='detail?no=${board.no}'>${board.title}</a></td> 
	    <td>${board.writer.nickname}</td> 
	    <td>${board.registeredDate}</td> 
	    <td>${board.viewCount}</td>
	</tr>
	</c:forEach>
</c:if>

</tbody>
</table>
<br>

<form id="search-form" action="search">

<div class="row">
	
	<div class="col-3 search">
	    <select class="search-item" name="option" id="demo-category">
	      <option value="all">전체</option>
	      <option value="title">제목</option>
	      <option value="writer">작성자</option>
	    </select>
	</div>

    <div class="col-md-6 search">
      <input class="search-item" type="text" placeholder="⌨ 키워드를 입력해 주세요!" name="keyword">
    </div>
    <div class="col-md-1 search">
      <button class="search-icon search-item" style="line-height: 32px;">
         <i class="fas fa-search"></i>
      </button>
    </div>
    
	<div class="col-2 search">
	  <c:if test="${!empty loginUser}">
		  <a href='form' class ="button" style="font-size: 14px;">속삭이기</a><br>
		</c:if>
		<c:if test="${empty loginUser}">
      <a href='form' class ="button" style="font-size: 14px; visibility:hidden;">속삭이기</a><br>
    </c:if>
	</div>
</div>

</form>

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

var trList = document.querySelectorAll("tbody tr"); // 리턴 객체는 HTMLCollection 타입 객체이다.
trList.forEach(function(trTag) {
	trTag.onclick = (e) => {
		window.location.href = e.currentTarget.querySelector("a").href;
	};
});
</script>

