<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.show {
  display: block; 

}

.label {
font-size: 16px; 
padding: 0; 
padding-left: 21px; 
line-height: 11px; 
display: none;

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
		           <c:when test="${comment.isPublic == 2}">
		           <c:choose>
		             <c:when test="${comment.writer.no == loginUser.no or board.writer.no == loginUser.no}">
		             <form action="commentUpdate" method="post">
		             <span style="font-size: 14px; color: white;">${comment.writer.nickname} | ${comment.registeredDate}</span><br>
		                <input type="checkbox" class="label" id="divToggle"; name="isPublic" value="${comment.isPublic}">
                    <label for="demo-copy">비밀</label>
                    
		                <input type="hidden" style="color: white" value="${comment.no}" name="no">
		                <i class="fas fa-lock"></i><input type="text" value="${comment.content}" name="content" 
                    style="color: white; width: 719px; margin-left: 6px; display: inline; height: 33px;font-size: 14px;"><br>
		             <button type="submit" >전송</button>
		             

		             
		             </form>
		             </c:when>
		             
		             <c:otherwise>
	                   <span><i class="fas fa-lock"></i> 비밀 댓글입니다.</span><br>
	               </c:otherwise>
	               </c:choose>
	             </c:when>
	             
		           <c:otherwise>
		           <span style="font-size: 14px; color: white;">${comment.writer.nickname} | ${comment.registeredDate}</span><br>
				         <form action="commentUpdate" method="post">
                    <input type="hidden" style="color: white" value="${comment.no}" name="no">
                    <i class="fas fa-lock"></i><input type="text" value="${comment.content}" name="content" 
                    style="color: white; width: 719px; margin-left: 6px; display: inline; height: 33px;font-size: 14px;"><br>
                    <input type="checkbox" class="label" id="divToggle"; name="isPublic" value="${comment.isPublic}">
                    <label for="demo-copy" >비밀</label>
                 <button type="submit">전송</button>
                 </form>
		           </c:otherwise>
	          </c:choose>
	          
				    <span style="font-size: 14px; color: white;">답글 ${comment.replyCount}개 ▼ | 답글 쓰기</span>
				    
				    <c:if test="${comment.writer.no == loginUser.no}">
				      <!-- <button><i class="far fa-edit"></i></button> -->
				      
							<button id="button"><i class="far fa-edit"></i></button>
							
							<a href='comment/delete?commentNo=${comment.no}'><i class="fas fa-trash-alt"></i></a>
				    </c:if>
				    
         </div>
       </div>
     </c:forEach>
  </div>
  
<script>  
  $(function (){
  $("#button").click(function (){
    /* $("#divToggle").toggle(); */
    document.getElementById('#divToggle').classList.replace('label', 'show');
  });
});

</script>