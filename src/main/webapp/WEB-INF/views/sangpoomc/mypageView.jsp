<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<style>
#sangpoomcListImg {
	width: 200px;
  	height: 200px;
}
</style>
<!--  본문 시작   template.jsp-->
<div class="main">  
<section id="container">
				<form name="mypageForm" method="get" >
				
					<table>
						<tbody>
						<c:if test="${member != null}">
						<tr><td>상품명</td><td>입찰번호</td><td>아이디</td><td>상품번호</td><td>입찰가</td><td>입찰일지</td></tr>
						
						<c:forEach items="${ipchallist}" var = "ipchallist">
							<tr>
								<td><c:out value="${ipchallist.sname}" /></td>								
								
									<td><a href="/sangpoomc/readView?sno=${ipchallist.sno}"><img id="sangpoomcListImg" src="${ipchallist.selectimg}"/></a></td>
								
                        			
                    			
								<td><c:out value="${ipchallist.ipno}" /></td>
								<td><c:out value="${member.userid}" /></td>							
								<td><c:out value="${ipchallist.sno}" /></td>
								<td><c:out value="${ipchallist.ipprice}" /></td>
								<td><fmt:formatDate value="${ipchallist.ipdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						
						
						
						
						
						</c:if>	
									
						</tbody>												
					</table>
						<div>
							  <ul>
							    <c:if test="${pageMaker.prev}">
							    	<li><a href="mypageView${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
							    </c:if> 
							
							    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    	<li><a href="mypageView${pageMaker.makeQuery(idx)}">${idx}</a></li>
							    </c:forEach>
							
							    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							    	<li><a href="mypageView${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
							    </c:if> 
							  </ul>
						</div>
					</form>
					<c:if test="${member == null}">
								<script>
										alert("로그인을 해주세요");
										location.href='/member/login';
								</script>
						</c:if>	
</section>

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



