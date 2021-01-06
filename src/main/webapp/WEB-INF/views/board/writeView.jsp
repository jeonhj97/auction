<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<script type="text/javascript">
$(document).ready(function(){
	var formObj_board = $("form[name='writeForm']");
	$(".write_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj_board.attr("action", "/board/write");
		formObj_board.attr("method", "post");
		formObj_board.submit();
		
		
	});
})
function fn_valiChk(){
	var regForm_board = $("form[name='writeForm'] .chk").length;
	for(var i = 0; i<regForm; i++){
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
				<form name="writeForm" role="form" method="post" action="/board/write">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" class="chk" title="제목을 입력하세요"/>
								</td>
							</tr>	
							
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content" class="chk" title="제목을 입력하세요"></textarea>
								</td>
							</tr>						
							<tr>
								<td>
									<label for="boardimg">첨부이미지</label><input type="text" id="boardimg" name="boardimg" />
								</td>
							</tr>
							<tr>
								<td>						
									<button type="submit" class="write_btn">작성</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



