<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<style>
th,td {
	width: 200px;
	text-align: center;
}
#sangpoomcListImg {
	width: 200px;
  	height: 200px;
}
</style>
<div class="main">  
			
			
			<section id="container">
				
					
					<table>
						<tr><th>상품번호</th><th>상품이미지</th><th>상품명</th><th>시작가</th><th>등록일</th><th>경매상태</th></tr>						
						<c:forEach items="${list}" var = "list">
						<c:if test="${list.status == 'ING'}">
							<tr>
								<td><c:out value="${list.sno}" /></td>
								<td><img id="sangpoomcListImg" src="${list.img}"></td>								
								<td><a href="/sangpoomc/readView?sno=${list.sno}"><c:out value="${list.sname}" /></a></td>
								<td><c:out value="${list.startprice}" /></td>
								<td><fmt:formatDate value="${list.opendate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${list.status}" /></td>
								<td>	
												
                      			<form name="form1" method="post" action="/sangpoomc/wishinsert">
          							<input type="hidden" name="userid" value="${member.userid}"/>
       					 			<input type="hidden" name="sno" value="${list.sno}"/>
          				 			<input type="submit" value="장바구니에 담기">
          				 		</form>     
          				 	
          				 		    				          										
          						 </td>
							</tr>
						</c:if> 
						</c:forEach>
						
					</table>
			
			</section>
			<hr />
			

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>


