<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='readForm']");
	
	// 수정 
	$(".update_btn").on("click", function(){
		formObj.attr("action", "/board/updateView");
		formObj.attr("method", "get");
		formObj.submit();				
	})
	
	
	// 삭제	
	$(".delete_btn").on("click", function(){				
		var deleteYN = confirm("삭제하시겠습니가?");
		if(deleteYN == true){
			formObj.attr("action", "/board/delete");
			formObj.attr("method", "post");
			formObj.submit();
		}//if end
	})//click end
	
	// 목록
	$(".list_btn").on("click", function(){
		
		location.href = "/board/list?page=${scri.page}"
				      +"&perPageNum=${scri.perPageNum}"
				      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
	})
	
	
	$(".replyWriteBtn").on("click", function(){
		  var formObj = $("form[name='replyForm']");
		  formObj.attr("action", "/board/replyWrite");
		  formObj.submit();
		});
	

	
 
	//댓글 수정 View
	$(".replyUpdateBtn").on("click", function(){
		location.href = "/board/replyUpdateView?boardno=${read.boardno}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}"
						+ "&rno="+$(this).attr("data-rno");
	});
			
	//댓글 삭제 View
	$(".replyDeleteBtn").on("click", function(){
		location.href = "/board/replyDeleteView?boardno=${read.boardno}"
			+ "&page=${scri.page}"
			+ "&perPageNum=${scri.perPageNum}"
			+ "&searchType=${scri.searchType}"
			+ "&keyword=${scri.keyword}"
			+ "&rno="+$(this).attr("data-rno");
	});

});//document end


</script>

<style>
  .readview1{
    width: 80%;
    margin: auto;
}
  .bdtitle{
  font-size: 33px;
  padding: 10px;
  border-top: 4px solid #dee2e6;
  font-weight: bold;
  }
  .bdwriter{
  padding:5px;
  font-size: 12px;
  }
  .bddate{
  font-size: 13px;
  color: #898989; 
  }
  .content1{
  border-top: 2px solid #dee2e6; 
  border-bottom: 2px solid #dee2e6;
  padding-bottom: 90px;
  padding-top: 60px;
  margin-top: 10px;
  margin-bottom: 15px;
  font-size: 20px;
  }
  .bdreply{
  border:2px solid #dee2e6;
   width: 90%;
   display: inline-block;
  }
  .replyList{
  background-color: #f8f9fa;
  
  }
  .update_btn, .delete_btn, .list_btn{
  float: right;
  }
  .update_btn:hover, .delete_btn:hover, .list_btn:hover{
  float: right;
  color: red;
  }
  .replyUpdateBtn, .replyDeleteBtn, .update_btn, .delete_btn, .list_btn{
  border: 0;
  outline: 0;
  background-color:  transparent !important;
  color: #898989;
  padding-right: 2px;
  }
  .replyUpdateBtn:hover, .replyDeleteBtn:hover{
    border: 0;
  outline: 0;
  background-color:  transparent !important;
  color: red;
  }
  .replyUpdateBtn{
  padding-left: 5px;
  }
  .bdmem{
  font-weight: bold;
  font-size: 10px;
  }
  .bdrp{
  margin: 3px;
  }
    .replyWriteBtn{
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
    /* 생략 */
   display:inline-block;
  margin: 0;
  padding: 0.5rem 1rem;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  width: auto;
  border: none;
  border-radius: 4px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  background-color: red;
  color: white;
  height: 60px;
  
  }
</style>
<div class="main">  				 	
				<div>
					<%@include file="nav_board.jsp" %>
					
				</div>
	<form name="readForm" role="form" method="post">
	  <input type="hidden" id="boardno" name="boardno" value="${read.boardno}" />
	  <input type="hidden" id="page" name="page" value="${scri.page}"> 
	  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
	  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
	  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 			
	</form>
	  <div class="readview1">
	  <div class="readview2">
	  
    <div class="bdtitle">
        ${read.title}
    </div>
    	<div class="bdwriter">
    	${read.userid}
    	</div>
    	<div class="bddate">
		<fmt:formatDate value="${read.wdate}" pattern="yyyy-MM-dd" />
		<c:if test="${member.userid == read.userid}">
			<button type="button" class="list_btn" >목록</button>	
			<button type="button" class="delete_btn">삭제</button>
			<button type="button" class="update_btn" >수정</button>
		</c:if>					
    	</div>
		<div class="content1">
		${read.content}"

		</div>
        <input type="hidden" id="title" name="title" value="${read.title}"/>
		<input type="hidden" id="userid" name="userid" value="${read.userid}" />
		<input type="hidden" id = "content" name="content" value="${read.content}" />
		<input type="hidden" id="boardno" name="boardno" value="${read.boardno}"/>
		<input type="hidden" id="boardimg" name="boardimg" value="${read.boardimg}" />
  </div>
					
					
<!-- 댓글 -->
				<div id="reply">
				<div class="bddate">
				댓글
				</div>
				  <ol class="replyList">
				    <c:forEach items="${replyList}" var="replyList">
				      <li class = "bdrp">
				        <p>
				        ${replyList.writer}<br>
				        ${replyList.content}<br>
				        <div class="bddate">
				        <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
				        <c:if test="${member.userid == replyList.writer}">
						  <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}" >수정</button>
						  <button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
				        </c:if>
				        </div>
				        </p>
				
				      </li>
				    </c:forEach>   
				  </ol>
				</div>					
				<c:if test="${member.userid != null}">
				<form name="replyForm" method="post">
					  <input type="hidden" id="boardno" name="boardno" value="${read.boardno}" />
					  <input type="hidden" id="page" name="page" value="${scri.page}"> 
	 				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
	  				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
	 				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
			 		   <input type="hidden" id="writer" name="writer" value="${member.userid}"/>
					    		 
					  <div class="bdreply">
					  <div class="bdmem">
					    ${member.userid}
					  </div>
					    <input type="text" id="content" name="content" placeholder="댓글을 남겨보세요" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
					  </div>
					 	 <button type="button" class="replyWriteBtn">작성</button>
				
				</form>
				</c:if>	
						<c:if test="${member.userid == null}">
							<p>로그인 후에 작성하실 수 있습니다.</p>
							<button type="button" onclick="location.href='/member/login'">로그인</button>
						</c:if>		
				</div>

							
		


</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



