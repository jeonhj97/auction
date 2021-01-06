<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>		
<!--  본문 시작   template.jsp-->
<div class="main">  
<section id="container">
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
									<label for="nowprice">현재가격</label><input type="text" id="nowprice" name="nowprice" value="${read.nowprice}" readonly/>													
								</td>
							</tr>	
							<tr>
								<td>
									<input type="submit" class="ipchal_btn" value="입찰">	
								</td>
							</tr>
						</tbody>			
					</table>
					
				
			</section>
</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>