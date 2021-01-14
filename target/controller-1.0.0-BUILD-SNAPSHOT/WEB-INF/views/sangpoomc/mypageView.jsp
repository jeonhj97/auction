<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  
<section id="container">
				<form name="mypageForm" method="get" >
				
					<table>
						<tbody>
						<tr><td>입찰번호</td><td>아이디</td><td>상품번호</td><td>입찰가</td><td>입찰일지</td></tr>
						
						<c:forEach items="${ipchallist}" var = "ipchallist">
							<tr>
								<td><c:out value="${ipchallist.ipno}" /></td>
								<td><c:out value="${ipchallist.userid}" /></td>							
								<td><c:out value="${ipchallist.sno}" /></td>
								<td><c:out value="${ipchallist.ipprice}" /></td>
								<td><fmt:formatDate value="${ipchallist.ipdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>	
						
						<tr><td>낙찰번호</td><td>아이디</td><td>상품번호</td><td>낙찰가</td><td>낙찰일지</td></tr>
						
						<c:forEach items="${nakchallist}" var = "nakchallist">
							<tr>
								<td><c:out value="${nakchallist.nakno}" /></td>
								<td><c:out value="${nakchallist.userid}" /></td>							
								<td><c:out value="${nakchallist.sno}" /></td>
								<td><c:out value="${nakchallist.nakprice}" /></td>
								<td><fmt:formatDate value="${nakchallist.nakdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
										
						</tbody>												
					</table>
					</form>
</section>

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



