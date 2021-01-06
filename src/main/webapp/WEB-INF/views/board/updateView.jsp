<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(".cancel_btn").on("click", function(){
		event.preventDefault();
		location.href = "/board/readView?boardno=${update.boardno}"
			   + "&page=${scri.page}"
			   + "&perPageNum=${scri.perPageNum}"
			   + "&searchType=${scri.searchType}"
			   + "&keyword=${scri.keyword}";
	})
	
	$(".update_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "/board/update");
		formObj.attr("method", "post");
		formObj.submit();
	})
})
	
function fn_valiChk(){
	var updateForm = $("form[name='updateForm'] .chk").length;
	for(var i = 0; i<updateForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
			return true;
		}
	}
}
</script>
<div class="main">
				<div>
					<%@include file="nav_board.jsp" %>
				</div>
				<form name="updateForm" role="form" method="post" action="/board/update">
					<input type="hidden" name="boardno" value="${update.boardno}" readonly="readonly"/>
					<table>
						<tbody>
						
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content" class="chk" title="내용을 입력하세요"><c:out value="${update.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="boardimg">작성자</label><input type="text" id="boardimg" name="boardimg" value="${update.boardimg}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="userid">작성자</label><input type="text" id="userid" name="userid" value="${update.userid}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="wdate">작성날짜</label>
									<fmt:formatDate value="${update.wdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
				</form>
			

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



