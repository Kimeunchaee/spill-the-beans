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
				    
				    <c:if test="${comment.writer.no == loginUser.no}">
				    
				      <!-- 수정 버튼 아이콘 -->
							<a href="comment/updateForm?commentNo=${comment.no}" class="updateBtn"><i class="far fa-edit"></i></a>
							
							<!-- 삭제 버튼 아이콘 -->
							<a href='comment/delete?commentNo=${comment.no}'><i class="fas fa-trash-alt"></i></a>
							
							<br>
				    </c:if>
				    
            <button class="accordion" style="font-size: 14px; color: white;">답글 ${comment.replyCount}개 ▼ | 답글 쓰기</button>
            <div class="panel">
            
							<!-- 대댓글 -->
							<div style="width: 810px;">
							  <div class="mb-3 row">
							    <label for='f-comment-title' class="col-form-label">[답글]</label>
							      
							    <c:if test='${not empty loginUser}'>
							      <div class="col-sm-11">
							        <form action='comment/add' method="post">
							          <input type="hidden" name="boardNo" value="${board.no}">
							          
							          <span>
							            작성자 : ${loginUser.nickname} &nbsp; | &nbsp;
							            
							            <input type="checkbox" id="demo-copy" name="isPublic" value="2">
							            <label for="demo-copy" style="font-size: 16px; padding: 0; padding-left: 21px; line-height: 11px;">비밀</label>
							          </span>
							          
							          <div class="comment-bottom">
							            <textarea id='f-comment-content' name='content' class="form-control col-md-6" rows="2" style="margin-right:5px;"></textarea>
							            <button class ="button" style="font-size: 14px; height: auto; line-height: 32px;">등록</button>
							          </div>
							        </form>     
							      </div>
							    </c:if>
							    
							    <%-- <div class="col-sm-12">
							      <jsp:include page="../comment/CommentList.jsp"/>
							    </div> --%>
							    
							  </div>
							</div>
							<!-- 대댓글 end -->

            </div>
            
         </div>
       </div>
     </c:forEach>
  </div>
  
<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function () {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight) {
            panel.style.maxHeight = null;
        } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
        }
    });
}
</script>