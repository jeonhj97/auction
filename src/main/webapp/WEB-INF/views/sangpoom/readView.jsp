<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<div>
	<%@ include file="nav.jsp"%>	
</div>	
<!--  본문 시작   template.jsp-->
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='readForm']");
	
	// 수정 
	$(".update_btn").on("click", function(){
		formObj.attr("action", "/sangpoom/updateView");
		formObj.attr("method", "get");
		formObj.submit();				
	})
	
	// 삭제
	
	$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니가?");
				if(deleteYN == true){
					
				formObj.attr("action", "/sangpoom/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
	
	// 취소
	$(".list_btn").on("click", function(){
		
		location.href = "/sangpoom/list";
		
		
	})
	
	
	//입찰
	$(".ipchal_btn").on("click",function(){
		
		
		formObj.attr("action", "/sangpoomc/ipchalView");
		formObj.attr("method", "get");
		formObj.submit();
		
	})
	
});
</script>
<div class="main">  

				<form name="readForm" action="post">
				<input type="hidden" id="sno" name="sno" value="${read.sno}" />
				</form>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="sno">상품번호</label><input type="text" id="sno" name="sno" value="${read.sno}" readonly/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="sname">상품이름</label><input type="text" id="sname" name="sname" value="${read.sname}" readonly/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="scontent">상품내용</label><textarea id="scontent" name="scontent" readonly><c:out value="${read.scontent}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="startprice">시작가</label><input type="text" id="startprice" name="startprice" value="${read.startprice}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="img">상품이미지</label><img src="${read.img}" name="img" id="img" />													
								</td>
							</tr>
							<tr>
								<td>
									<label for="nowprice">현재가격</label><input type="text" id="startprice" name="startprice" value="${read.startprice}" readonly/>													
								</td>
							</tr>		
						</tbody>			
					</table>
					<div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>	
				</div>
				
			
</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



