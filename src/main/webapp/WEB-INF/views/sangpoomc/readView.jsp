<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  
<section id="container">
				<form name="readForm" method="post">
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
									<label for="nowprice">현재가격</label><input type="text" id="nowprice" name="nowprice" value="${read.nowprice}" readonly/>													
								</td>
							</tr>
							<tr>
								<td>
										
									
									<label for="closedate">종료일</label><input type="text"  name="closedate" id="closedate" value="${read.closedate}" readonly/>													
										<h2 id="sample02"></h2>
									
									<script> 
										
										
										
										
										const countDownTimer = function (id, date) { 
										var closedate = new Date(document.getElementById(closedate).value);
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
										/*여기에 제이쿼리로 nakchal하고 시간다되면 삭제??
										*/
										 return; 
										} 

										var days = Math.floor(distDt / _day); 
										var hours = Math.floor((distDt % _day) / _hour);
										 var minutes = Math.floor((distDt % _hour) / _minute);
										 var seconds = Math.floor((distDt % _minute) / _second); 

										//document.getElementById(id).textContent = date.toLocaleString() + "까지 : "; 
										document.getElementById(id).textContent = days + '일 '; 
										document.getElementById(id).textContent += hours + '시간 '; 
										document.getElementById(id).textContent += minutes + '분 '; 
										document.getElementById(id).textContent += seconds + '초'; 
										}

										 timer = setInterval(showRemaining, 1000);
										 } 

										var dateObj = new Date(); 
										dateObj.setDate(dateObj.getDate() + 1);

										 countDownTimer('sample01', dateObj); // 내일까지 
										countDownTimer('sample02',  closedate ); // 2024년 4월 1일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용한다. 
										countDownTimer('sample03', '04/01/2024'); // 2024년 4월 1일까지 countDownTimer('sample04', '04/01/2019'); // 2024년 4월 1일까지 
										

										
										</script>
																				
								</td>
							</tr>	
							<tr>
								<td>
									<button type="button" class="update_btn" onclick="location.href='/sangpoomc/ipchalView?sno=${read.sno}'">입찰</button>					
								</td>
							</tr>	
						</tbody>
								
					</table>
						
				
			</section>
</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>