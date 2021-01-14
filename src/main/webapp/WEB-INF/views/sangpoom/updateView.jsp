<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>

<!--  본문 시작   template.jsp-->
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(".cancel_btn").on("click", function(){
		event.preventDefault();
		location.href = "/sangpoom/list";
	})
	
	$(".update_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "/sangpoom/update");
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
	<%@ include file="nav.jsp"%>	
</div>	

				<form name="updateForm" role="form" method="post" action="/sangpoom/update">
					<input type="hidden" name="sno" value="${update.sno}" readonly="readonly"/>
					<table>
						<c:if test="${member.grade == 'MASTER'}">
						<tbody>
							<tr>
								<td>
									<label for="sname">상품제목</label><input type="text" id="sname" name="sname" value="${update.sname}" class="chk" title="제목을 입력하세요"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="scontent">상품내용</label><textarea id="scontent" name="scontent"  class="chk" title="내용을 입력하세요"><c:out value="${update.scontent}"  /></textarea>
								</td>
							</tr>
							
									
						</tbody>
						</c:if>
							<c:if test="${member.grade != 'MASTER'}">
							<script>
									alert("관리자페이지입니다!");
									location.href='/';
							</script>
							</c:if>			
					</table>
					<div>
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
				</form>

						
							

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>





