<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.updateBtn {
  box-shadow: none;
	background: none;
	font-size: 17px;
}




</style>

  <div id="empty-comment">
   <c:if test="${empty commentList}">등록된 댓글이 없습니다.</c:if>
  </div>
    
  <div class="commentList-wrap">
     <c:forEach items="${commentList}" var="comment">
       <div class="card2">
         <div class="card-body" style="padding: 5px 0;">
         
	          <c:choose>
	             <%-- 비밀 댓글일 때 --%>
		           <c:when test="${comment.isPublic == 2}">
		           <c:choose>
		           
		             <c:when test="${comment.writer.no == loginUser.no or board.writer.no == loginUser.no}">
                    <span style="font-size: 14px; color: white;">${comment.writer.nickname} | ${comment.registeredDate}</span><br>
                    <span style="color: white"><i class="fas fa-lock"></i></span> <span>${comment.content} </span><br>
		             </c:when>
		             
		             <c:otherwise>
	                   <span><i class="fas fa-lock"></i> 비밀 댓글입니다.</span><br>
	               </c:otherwise>
	               </c:choose>
	             </c:when>
	             
	             <%-- 공개 댓글일 때 --%>
		           <c:otherwise>
		              <span style="font-size: 14px; color: white;">${comment.writer.nickname} | ${comment.registeredDate}</span><br>
                  <span style="color: white"> ${comment.content} </span><br>
		           </c:otherwise>
	          </c:choose>
               
				    <span style="font-size: 14px; color: white;">답글 ${comment.replyCount}개 ▼ | 답글 쓰기</span>
				    
				    <c:if test="${comment.writer.no == loginUser.no}">
				    
				      <!-- 수정 버튼 아이콘 -->
							<a href="comment/updateForm?commentNo=${comment.no}" class="updateBtn"><i class="far fa-edit"></i></a>
							
							<!-- 삭제 버튼 아이콘 -->
							<a href='comment/delete?commentNo=${comment.no}'><i class="fas fa-trash-alt"></i></a>
							
				    </c:if>
				    
         </div>
       </div>
     </c:forEach>
  </div>