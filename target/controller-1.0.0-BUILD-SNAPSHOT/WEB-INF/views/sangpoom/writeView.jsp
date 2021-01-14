<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	

<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='writeForm']");
	$(".write_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "/sangpoom/write");
		formObj.attr("method", "post");
		formObj.submit();
		
		
	});
})
function fn_valiChk_write(){
	var regForm = $("form[name='writeForm'] .chk").length;
	for(var i = 0; i<regForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
			return true;
		}
	}
}
</script>
<!--  본문 시작   template.jsp-->
		<div class="main">
		<div>
			<%@ include file="nav.jsp"%>	
		</div>
				<form name="writeForm" method="post" action="/sangpoom/write" enctype="multipart/form-data">  
					<table>
						<tbody>
						<c:if test="${member.userid != null}">
							<tr>
								<td>
									<label for="sname">상품명</label><input type="text" id="sname" name="sname" class="chk" title="상품명을 입력하세요" />
								</td>
							</tr>	
							<tr>
								<td>
									<label for="scontent">상품내용</label><textarea id="scontent" name="scontent" class="chk" title="상품내용을 입력하세요"></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="img">상품이미지</label><input  type="file" id="img" name="file" />
									<div class="select_img"><img src="" /></div>
									<%=request.getRealPath("/")%>		
									
									<script type="text/javascript">
									$("#img").change(function(){
										   if(this.files && this.files[0]) {
										    var reader = new FileReader;
										    reader.onload = function(data) {
										     $(".select_img img").attr("src", data.target.result).width(500);        
										    }
										    reader.readAsDataURL(this.files[0]);
										   }
									});
									</script>
																								
								</td>
							</tr>
							<tr>
								<td>
									<label for="startprice">시작가</label><input type="text" id="startprice" name="startprice" class="chk" title="시작가를 입력하세요"/>
								</td>
							</tr>	
							<tr>
								<td>						
									<button type="submit" class="write_btn">등록</button>
								</td>
							</tr>
							</c:if>
							<c:if test="${member.userid == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
								<button type="button" onclick="location.href='/member/login'">로그인</button>
							</c:if>			
						</tbody>			
					</table>
				</form>
		
			<hr />
		</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>




