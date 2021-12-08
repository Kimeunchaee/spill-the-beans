<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<h1>새 글</h1>
<form action='add' method='post'>

<div class="mb-3 row">
<label for='f-member_no' class="col-sm-2 col-form-label"></label>
<div class="col-sm-6">
<select class="form-control" id="f-category" name="category.no">
  <option selected value="">카테고리를 선택하세요 ↓</option>
  <option value="1" >일</option>
  <option value="2" >학업</option>
  <option value="3" >일상</option>
</select>
</div>
</div>

<div class="mb-3 row">
  <label for='f-member_no' class="col-sm-2 col-form-label">회원 번호</label>
  <div class="col-sm-10">
    <input id='f-member_no' type='text' name='writer.no' value='${loginUser.no}' class="form-control" readonly>
  </div>
</div>
<div class="mb-3 row">
  <label for='f-member_nickname' class="col-sm-2 col-form-label">글쓴이</label>
  <div class="col-sm-10">
    <input id='f-member_nickname' type='text' name='writer.nickname' value='${loginUser.nickname}' class="form-control" readonly>
  </div>
</div>
<div class="mb-3 row">
  <label for='f-title' class="col-sm-2 col-form-label">제목</label>
  <div class="col-sm-10">
    <input id='f-title' type='text' name='title' class="form-control">
  </div>
</div>
<div class="mb-3 row">
  <label for='f-content' class="col-sm-2 col-form-label">내용</label> 
  <div class="col-sm-10">
    <textarea id='f-content' name='content' class="form-control" rows="8" ></textarea>
  </div>
</div>
<button class="btn btn-primary btn-sm">등록</button><br>
</form>










