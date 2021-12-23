<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.updateBtn {
  box-shadow: none;
   background: none;
   font-size: 17px;
}

.accordion {
  box-shadow: none;
  background: none;
  cursor: pointer;
  outline: none;
  border: none;
  transition: 0.4s;
}

.active, .accordion:hover {
  background: none;
  font-weight: bold;
}

.accordion:after {
    content: '\002B';
    font-weight: bold;
    float: right;
    margin-left: 5px;
}

.active:after {
    content: "\2212";
}

.panel {
    padding: 0 16px;
    background-color: #blue;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
    border-bottom: 1px solid #eeeeee;
}

</style>

  <div id="empty-comment">
   <c:if test="${empty commentList}">등록된 댓글이 없습니다.</c:if>
  </div>
    
  <div class="commentList-wrap">
  
     <!-- 원 댓글 반복문-->
     <c:forEach items="${commentList}" var="comment">
       <div class="card2">
         <div class="card-body" style="padding: 5px 0;">
         
             <c:choose>
                <%-- 비밀 댓글일 때 출력--%>
                 <c:when test="${comment.isPublic == 2}">
	                 <c:choose>
	                 
	                   <%-- 내가 쓴 비밀댓글 & 게시글 작성자가 볼 수 있는 비밀 댓글--%>
	                   <c:when test="${comment.writer.no == loginUser.no or board.writer.no == loginUser.no}">
	                    <span style="font-size: 14px; color: white;">${comment.writer.nickname} | ${comment.registeredDate}</span><br>
	                    <span style="color: white"><i class="fas fa-lock"></i></span> <span>${comment.content} </span><br>
	                   </c:when>
	                   
	                   <%-- 다른 사람들이 보는 비밀댓글 출력문--%>
	                   <c:otherwise>
	                      <span style="display: inline-block; margin-bottom: 10px;">
	                          <i class="fas fa-lock"></i> 비밀 댓글입니다.
	                      </span><br>
	                  </c:otherwise>
	                 </c:choose>
                 </c:when>
                
                <%-- 공개 댓글일 때 --%>
                 <c:otherwise>
                    <span style="font-size: 14px; color: white;">${comment.writer.nickname} | ${comment.registeredDate}</span><br>
                  <span style="color: white"> ${comment.content} </span><br>
                 </c:otherwise>
             </c:choose>
                
                <c:if test="${comment.writer.no == loginUser.no}">
                  <!-- 수정 버튼 아이콘 -->
                     <a href="comment/updateForm?commentNo=${comment.no}" class="updateBtn"><i class="far fa-edit"></i></a>
                     
                     <!-- 삭제 버튼 아이콘 -->
                     <a href='comment/delete?commentNo=${comment.no}'><i class="fas fa-trash-alt"></i></a>
                     <br>
                </c:if>
                
                
                <%-- 대댓글 버튼 --%>
                <c:if test="${(comment.isPublic == 2 and (comment.writer.no == loginUser.no or board.writer.no == loginUser.no)) or comment.isPublic == 1}">
		              <button class="accordion" style="font-size: 14px; color: white;">답글 ${comment.replyCount -1}개 ▼ | 답글 쓰기</button>
		            </c:if>
            
                 <%-- 대댓글 보이기 --%>
                  <div class="panel">
                     <div style="width: 810px;">
                       <div class="mb-3 row" style="width: 800px;">
                         <label for='f-comment-title' class="col-form-label">[답글]</label>
                           
                         <c:if test='${not empty loginUser}'>
                           <div class="col-sm-11">
                             <%-- 대댓글 입력 폼 --%>
                             <form action='comment/reply/add' method="post">
                               <input type="hidden" name="boardNo" value="${board.no}">
                               <input type="hidden" name="parentNo" value="${comment.no}">
                               <input type="hidden" name="groupNo" value="${comment.no}">
                               <input type="hidden" name="classNo" value="${comment.classNo + 1}">
                               
				                       <c:if test="${comment.replyCount == 0}">
				                          <input type="hidden" name="orderNo" value="${comment.replyCount + 2}">
				                       </c:if>
				                        
				                       <c:if test="${comment.replyCount > 0}">
				                          <input type="hidden" name="orderNo" value="${comment.replyCount + 1}">
				                       </c:if>
                               
                               <span>
                                 작성자 : ${loginUser.nickname} &nbsp; | &nbsp;
                                 
                                 <input type="checkbox" id="${comment.no}" name="isPublic" value="2">
                                 <label for="${comment.no}" style="font-size: 16px; padding: 0; padding-left: 21px; line-height: 11px;">비밀</label>
                               </span>
                               
                               <div class="comment-bottom">
                                 <textarea id='f-comment-content' name='content' class="form-control col-md-6" rows="2" style="margin-right:5px;"></textarea>
                                 <button type="submit" class ="button" style="font-size: 14px; height: auto; line-height: 32px;">등록</button>
                               </div>
                             </form> <%-- 대댓글 입력 폼 end --%>
                           </div>
                         </c:if>
                         
                         <%-- 대댓글 내용 출력 --%>
                         <div class="col-sm-12">
                              <div class="replyList-wrap">
                                   <c:forEach items="${replyList}" var="reply">
                                    <c:if test="${comment.no == reply.parentNo}">
                                     <div class="card2">
                                       <div class="card-body" style="padding: 5px 0;">
                                       
                                          <c:choose>
                                             <%-- 비밀 댓글일 때 --%>
                                             <c:when test="${reply.isPublic == 2}">
                                             <c:choose>
                                             
                                               <c:when test="${reply.writer.no == loginUser.no or board.writer.no == loginUser.no}">
                                                  <span style="font-size: 14px; color: white;">${reply.writer.nickname} | ${reply.registeredDate}</span><br>
                                                  <span style="color: white"><i class="fas fa-lock"></i></span> <span>${reply.content} </span><br>
                                               </c:when>
                                               
                                               <c:otherwise>
                                                   <span style="display: inline-block; margin-bottom: 10px;">
                                                      <i class="fas fa-lock"></i> 비밀 댓글입니다.
                                                   </span><br>
                                               </c:otherwise>
                                               </c:choose>
                                             </c:when>
                                             
                                             <%-- 공개 댓글일 때 --%>
                                             <c:otherwise>
                                                <span style="font-size: 14px; color: white;">${reply.writer.nickname} | ${reply.registeredDate}</span><br>
                                                <span style="color: white"> ${reply.content} </span><br>
                                             </c:otherwise>
                                          </c:choose>
                                          
                                          <c:if test="${reply.writer.no == loginUser.no}">
                                            <%-- 수정 버튼 아이콘 --%>
                                            <a href="comment/updateForm?commentNo=${reply.no}" class="updateBtn"><i class="far fa-edit"></i></a>
                                            
                                            <%-- 삭제 버튼 아이콘 --%>
                                            <a href='comment/delete?commentNo=${reply.no}'><i class="fas fa-trash-alt"></i></a>
                                            <br>
                                          </c:if>
                                          
                                          
		                                          <%-- re:대대댓글 시작--%>
		                                               <%-- re:대대댓글 버튼 --%>
                                                   <c:if test="${(reply.isPublic == 2 and (reply.writer.no == loginUser.no or board.writer.no == loginUser.no)) or reply.isPublic == 1}">
                                                     <button class="accordion" style="font-size: 14px; color: white;">답글 쓰기</button>
                                                   </c:if>
                                                   
                                                   <%-- re:대대댓글 보이기 --%>
                                                   <div class="panel" style="max-height: 0">
                                                     <div style="width: 810px;">
                                                       <div class="mb-3 row" style="width: 765px;">
                                                         <label for='f-comment-title' class="col-form-label">[답글]</label>
                                                           
                                                         <%-- re:대대댓글 내용 출력 --%>
                                                         <div class="col-sm-12">
                                                           <div class="replyList-wrap">
                                                                <c:forEach items="${replyList}" var="re_reply">
                                                                 <c:if test="${reply.no == re_reply.parentNo}">
                                                                  <div class="card2">
                                                                    <div class="card-body" style="padding: 5px 0;">
                                                                    
                                                                       <c:choose>
                                                                          <%-- 비밀 댓글일 때 --%>
                                                                          <c:when test="${re_reply.isPublic == 2}">
                                                                          <c:choose>
                                                                          
                                                                            <c:when test="${re_reply.writer.no == loginUser.no or board.writer.no == loginUser.no}">
                                                                               <span style="font-size: 14px; color: white;">${re_reply.writer.nickname} | ${re_reply.registeredDate}</span><br>
                                                                               <span style="color: white"><i class="fas fa-lock"></i></span> <span>${re_reply.content} </span><br>
                                                                            </c:when>
                                                                            
                                                                            <c:otherwise>
                                                                                <span style="display: inline-block; margin-bottom: 10px;">
                                                                                    <i class="fas fa-lock"></i> 비밀 댓글입니다.
                                                                                </span><br>
                                                                            </c:otherwise>
                                                                            </c:choose>
                                                                          </c:when>
                                                                          
                                                                          <%-- 공개 댓글일 때 --%>
                                                                          <c:otherwise>
                                                                             <span style="font-size: 14px; color: white;">${re_reply.writer.nickname} | ${re_reply.registeredDate}</span><br>
                                                                             <span style="color: white"> ${re_reply.content} </span><br>
                                                                          </c:otherwise>
                                                                       </c:choose>
                                                                       
                                                                       <c:if test="${re_reply.writer.no == loginUser.no}">
                                                                         <%-- 수정 버튼 아이콘 --%>
                                                                         <a href="comment/updateForm?commentNo=${re_reply.no}" class="updateBtn"><i class="far fa-edit"></i></a>
                                                                         
                                                                         <%-- 삭제 버튼 아이콘 --%>
                                                                         <a href='comment/delete?commentNo=${re_reply.no}'><i class="fas fa-trash-alt"></i></a>
                                                                         <br>
                                                                       </c:if>
                                                                       </div>
                                                                       
                                                                    </div>
                                                                  </c:if>
                                                                </c:forEach> <%-- re:대대댓글 반복문 end --%>
                                                             </div>
                                                         </div> <%-- re:대대댓글 내용 출력 end --%>
                                                         
                                                         <c:if test='${not empty loginUser}'>
                                                           <div class="col-sm-11">
                                                             <%-- re:대대댓글 입력 폼 --%>
                                                             <form action='comment/reply/add' method="post">
                                                               <input type="hidden" name="boardNo" value="${board.no}">
                                                               <input type="hidden" name="parentNo" value="${reply.no}">
                                                               <input type="hidden" name="groupNo" value="${reply.parentNo}">
                                                               <input type="hidden" name="classNo" value="${reply.classNo + 1}">
                                                               
                                                               <c:if test="${comment.replyCount > 2}">
                                                                   <input type="hidden" name="orderNo" value="${comment.replyCount + 1}">
                                                               </c:if>
                                                                  
                                                               <span>
                                                                 작성자 : ${loginUser.nickname} &nbsp; | &nbsp;
                                                                 
                                                                 <input type="checkbox" id="${reply.no}" name="isPublic" value="2">
                                                                 <label for="${reply.no}" style="font-size: 16px; padding: 0; padding-left: 21px; line-height: 11px;">비밀</label>
                                                               </span>
                                                               
                                                               <div class="comment-bottom">
                                                                 <textarea id='f-comment-content' name='content' class="form-control col-md-6" rows="2" style="margin-right:5px;"></textarea>
                                                                 <button type="submit" class ="button" style="font-size: 14px; height: auto; line-height: 32px;">등록</button>
                                                               </div>
                                                             </form> <%-- re:대대댓글 입력 폼 end --%>
                                                           </div>
                                                         </c:if>
                                                         
                                                       </div>
                                                     </div>
                                                   </div> <%-- re:대대댓글 보이기 end --%>
                                          
                                          
                                          
                                          </div>
                                       </div>
                                     </c:if>
                                   </c:forEach> <%-- 대댓글 반복문 end --%>
                                </div>
                         </div> <%-- 대댓글 내용 출력 end --%>
                         
                       </div>
                     </div>
            </div> <%-- 대댓글 보이기 end --%>
            
            
            
            
            
         </div>
       </div> <%-- 원댓글 end --%>
     </c:forEach> <%-- 원댓글 반복문 end --%>
  </div>
  
<script>
var showType = true;
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function () {
        if(showType === true) {
           
           this.classList.toggle("active");
           var panel = this.nextElementSibling;
           
           if (panel.style.maxHeight) {
             panel.style.maxHeight = null;
           } else {
            panel.style.maxHeight = panel.scrollHeight * i + "px";
             showType = true;
           }
        } 
    });
}
</script>