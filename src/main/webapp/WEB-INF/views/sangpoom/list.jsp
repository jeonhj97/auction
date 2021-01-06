<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<div>
	<%@ include file="nav.jsp"%>	
</div>
<!--  본문 시작   template.jsp-->
<div class="main">  
			
			
			<section id="container">
				<form role="form" method="post" action="/sangpoom/write">
					
					<table>
						<tr><th>상품번호</th><th>상품이미지</th><th>상품명</th><th>시작가</th><th>등록일</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.sno}" /></td>
								<td><img src="${list.img}"></td>								
								<td><a href="/sangpoom/readView?sno=${list.sno}"><c:out value="${list.sname}" /></a></td>
								<td><c:out value="${list.startprice}" /></td>
								<td><fmt:formatDate value="${list.opendate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</section>
			<hr />
			

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



