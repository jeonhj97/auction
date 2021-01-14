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
							<c:if test="${member.userid != null}">
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
							<tr>
					<td>
							
						
						<label for="closedate">종료일</label><input type="text"  name="closedate" id="closedate" value="${read.closedate}" readonly/>													
							<h2 id="sample01"></h2>
									
<script> 
const countDownTimer = function (id, date) { 
	var _vDate = new Date(date); // 전달 받은 일자 
	var _second = 1000; 
	var _minute = _second * 60;
	var _hour = _minute * 60;
	var _day = _hour * 24;
	var timer; 
	
	function showRemaining() {
		var now = new Date(); 
		var distDt = _vDate - now; //여기에 opendate들어가야되고
		if (distDt < 0) { 
			clearInterval(timer); 
			document.getElementById(id).textContent = '해당 이벤트가 종료 되었습니다!';//
			$(document).ready(function(){
				var formObj = $("form[name='readForm']");
				
					
					
					
					
					
				})
			 return; 
		}//if end
	
		var days = Math.floor(distDt / _day); 
		var hours = Math.floor((distDt % _day) / _hour);
		var minutes = Math.floor((distDt % _hour) / _minute);
		var seconds = Math.floor((distDt % _minute) / _second); 
	
		//document.getElementById(id).textContent = date.toLocaleString() + "까지 : "; 
		document.getElementById(id).textContent = days + '일 '; 
		document.getElementById(id).textContent += hours + '시간 '; 
		document.getElementById(id).textContent += minutes + '분 '; 
		document.getElementById(id).textContent += seconds + '초'; 
	}//showRemaining() end

	 timer = setInterval(showRemaining, 1000);
}// countDownTimer end

    var closedate = document.getElementById("closedate").value;//2021/01/10 14:01:09 오후
    //alert(closedate);
    closedate=closedate.substring(0,19);                       //2021/01/10 14:01:09
    //alert(closedate);
	closedate=new Date(closedate);                             //2021/01/10 14:01:09날짜형 변환
	countDownTimer('sample01', closedate); 
	</script>
																				
					</td>
				</tr>
							</c:if>	
							<c:if test="${member.userid == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
								<button type="button" onclick="location.href='/member/login'">로그인</button>
							</c:if>		
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



