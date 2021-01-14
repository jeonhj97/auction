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
					<table>
						<tbody>
							
							<tr>
								<td>
									<label for="boardno">글 번호</label><input type="text" id="boardno" name="boardno" value="${read.boardno}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" value="${read.title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content"><c:out value="${read.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="userid">작성자</label><input type="text" id="userid" name="userid" value="${read.userid}" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="wdate">작성날짜</label>
									<fmt:formatDate value="${read.wdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>
							<tr>
								<td>
									<label for="boardimg">이미지</label><input type="text" id="boardimg" name="boardimg" value="${read.boardimg}" />
								</td>
							</tr>		
						
						</tbody>	
						</table>		
					
					<c:if test="${member.userid == read.userid}">
					<div>
					<button type="button" class="update_btn" >수정</button>
					<button type="button" class="delete_btn">삭제</button>
					<button type="button" class="list_btn" >목록</button>	
					</div>
					</c:if>	
					<c:if test="${member.userid != read.userid}">
						</c:if>	
					
					
					
					
				
				
				<!-- 댓글 -->
				<div id="reply">
				  <ol class="replyList">
				    <c:forEach items="${replyList}" var="replyList">
				      <li>
				        <p>
				        작성자 : ${replyList.writer}<br />
				        작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
				        </p>
				
				        <p>${replyList.content}</p>
				        <div>
						  <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}" >수정</button>
						  <button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
						</div>
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
					 				 
					  <div>
					    <label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" readonly value="${member.userid}"/>
					    <br/>
					    <label for="content">댓글 내용</label><input type="text" id="content" name="content" />
					  </div>
					  <div>
					 	 <button type="button" class="replyWriteBtn">작성</button>
					  </div>
				
				</form>
				</c:if>	
						<c:if test="${member.userid == null}">
							<p>로그인 후에 작성하실 수 있습니다.</p>
							<button type="button" onclick="location.href='/member/login'">로그인</button>
						</c:if>		

							
		


</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



