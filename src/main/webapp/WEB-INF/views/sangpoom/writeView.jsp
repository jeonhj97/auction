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
						<c:if test="${member.grade == 'MASTER'}">
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
									<label for="sartist">작가</label><input type="text" id="sartist" name="sartist" class="chk" title="작가를 입력하세요"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="syear">상품제작년도</label><input type="text" id="syear" name="syear" class="chk" title="상품제작년도를 입력하세요"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="stype">상품종류</label><input type="text" id="stype" name="stype" class="chk" title="상품종류를 입력하세요"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="ssize">상품크기</label><input type="text" id="ssize" name="ssize" class="chk" title="상품크기를 입력하세요"/>
								</td>
							</tr>
								
							<tr>
								<td>						
									<button type="submit" class="write_btn">등록</button>
								</td>
							</tr>
							</c:if>
							<c:if test="${member.grade != 'MASTER'}">
							<script>
									alert("관리자페이지입니다!");
									location.href='/';
							</script>
							</c:if>			
						</tbody>			
					</table>
				</form>
		
			<hr />
		</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>




