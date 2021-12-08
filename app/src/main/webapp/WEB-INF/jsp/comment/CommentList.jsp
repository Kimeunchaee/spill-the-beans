<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="empty-comment">
 <c:if test="${empty commentList}">등록된 댓글이 없습니다.</c:if>
</div>
  
<div class="commentList-wrap">
   <c:forEach items="${commentList}" var="comment">
   <div class="card2">
   <div class="card-body" style="padding: 5px 23px;">
     <span style="font-size: 15px;">${comment.content}</span><br>
     <span style="font-size: 12px;">${comment.writer.nickname} | ${comment.registeredDate}</span>
     
     <div class="btn-group" role="group" aria-label="Basic outlined example">
       <!-- <c:if test="${comment.writer.no eq loginUser.no}"> -->
       
       
       <button class="btn btn-link" data-bs-toggle="modal" data-bs-target="#exampleModal"
       data-bs-whatever="@mdo" style="font-size: 12px; padding: 3px 6px;">수정</button>
       
       <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                 <!-- form -->
                 <form action='comment/update' method="post">
                   <input type='hidden' name='commentNo' value='${comment.no}'/>
                   <div class="mb-3">
                     <label for="message-text" class="col-form-label">내용</label>
                     <textarea type="text" class="form-control" id='f-commentText' name='comment'></textarea>
                   </div>
                   <button class="btn btn-dark" data-bs-dismiss="modal">취소</button>
                   <button class="btn btn-dark">수정</button>
                 </form>
               </div>
           </div>
         </div>
       </div>
         <a href='comment/delete?commentno=${comment.no}' class="btn btn-dark"">삭제</a>
       <!-- </c:if> -->
     </div>
     </div>
    </div>
   </c:forEach>
  </div>