<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  
<section id="container">
				<form name="nakchalForm" method="get" >
				
					<table>
						<tbody>
						<c:if test="${member != null}">	
						
						<tr><td>낙찰번호</td><td>아이디</td><td>상품번호</td><td>낙찰가</td><td>낙찰일지</td><td>기능</td></tr>
						
						<c:forEach items="${nakchallist}" var = "nakchallist">
							<tr>
								<td><img src="${nakchallist.nakimg}"/></td>
								<td><c:out value="${member.userid}" /></td>							
								<td><c:out value="${nakchallist.sno}" /></td>
								<td><c:out value="${nakchallist.nakprice}" /></td>
								<td><fmt:formatDate value="${nakchallist.nakdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${nakchallist.nakstatus}" /></td>

													
							
							
							</tr>
						</c:forEach>
						</c:if>	
						<c:if test="${member == null}">
								<script>
										alert("로그인을 해주세요");
										location.href='/member/login';
								</script>
						</c:if>				
						</tbody>												
					</table>
					<div>
							  <ul>
							    <c:if test="${pageMaker.prev}">
							    	<li><a href="nakchalView${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
							    </c:if> 
							
							    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    	<li><a href="nakchalView${pageMaker.makeQuery(idx)}">${idx}</a></li>
							    </c:forEach>
							
							    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							    	<li><a href="nakchalView${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
							    </c:if> 
							  </ul>
						</div>
					</form>
</section>

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>




