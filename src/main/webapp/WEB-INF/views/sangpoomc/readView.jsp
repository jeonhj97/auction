<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  
<section id="container">
	<form name="readForm" method="post" action="/sangpoomc/nakchal" id="frm">
	<input type="hidden" id="sno" name="sno" value="${read.sno}"/>
	
	
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
						<label for="nowprice">현재가격</label><input type="text" id="nowprice" name="nowprice" value="${read.nowprice}" readonly/>													
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
				
				var nowprice = document.getElementById("nowprice").value;
				nowprice = nowprice.trim();
				if(nowprice==0 || nowprice==null){
					alert("해당 경매가 종료 되었습니다!");						
					formObj.attr("action", "/sangpoomc/statusupdate");
					formObj.attr("method", "post");
					formObj.submit();
					
					
					
				}else					
					// 낙찰 
					alert("해당 경매가 종료 되었습니다!");
					formObj.attr("action", "/sangpoomc/nakchal");
					formObj.attr("method", "post");
					formObj.submit();
					
					
					
					
					
				//}//if end

					
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
				<tr>
					<td>
						<button type="button" class="update_btn" onclick="location.href='/sangpoomc/ipchalView?sno=${read.sno}'">입찰</button>	
						  <button type="submit" class="nakchal_btn">낙찰</button>	
						<!--  <button type="submit" class="nakchal_btn">삭제</button>	 -->			
					</td>
				</tr>	
			</tbody>
					
		</table>
	</form>	
				
</section>
</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>