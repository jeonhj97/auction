<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<script type="text/javascript">
$(document).ready(function(){
			var formObj = $("form[name='updateForm_replydelete']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/board/readView?boardno=${replyDelete.boardno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
</script>
<div class="main">  
			<div>
				<%@include file="nav_board.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="updateForm_replydelete" role="form" method="post" action="/board/replyDelete">
					<input type="hidden" name="boardno" value="${replyDelete.boardno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
						
					<div>
						<p>삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn">예 삭제합니다.</button>
						<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
					</div>
				</form>
			</section>
 

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



