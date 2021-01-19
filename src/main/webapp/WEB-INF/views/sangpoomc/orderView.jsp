<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main">	
				<form name="orderForm" method="post" action="/sangpoomc/order" >  
					<table>
						<tbody>
							<tr>
								<td>
									<label for="uname">수령인</label><input type="text" id="sname" name="sname" class="chk" title="상품명을 입력하세요" />
								</td>
							</tr>	
							<tr>
								<td>
									<label for="phone">수령인연락처</label><textarea id="scontent" name="scontent" class="chk" title="상품내용을 입력하세요"></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="zipcode">우편번호</label><input  type="file" id="img" name="file" />																							
								</td>
							</tr>
							<tr>
								<td>
									<label for="addr">1차주소</label><input type="text" id="startprice" name="startprice" class="chk" title="시작가를 입력하세요"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="addr2">2차주소</label><input type="text" id="startprice" name="startprice" class="chk" title="시작가를 입력하세요"/>
								</td>
							</tr>	
							<tr>
								<td>						
									<button type="submit" class="write_btn">주문</button>
								</td>
							</tr>
							<tr>
								<td>						
									<button type="submit" class="write_btn">취소</button>
								</td>
							</tr>											
						</tbody>			
					</table>
				</form>
		
			<hr />
		</div>





</body>
</html>