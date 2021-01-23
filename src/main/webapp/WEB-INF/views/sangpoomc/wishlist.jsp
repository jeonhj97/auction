<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->

<h2>장바구니 확인</h2>
  <div class="main">  
<section id="container">
				<form name="wishlist" method="get" >
				
					<table>
					
						<tbody>
						<c:if test="${member != null}">
						<tr><td>찜번호</td><td>아이디</td><td>상품번호</td><td>상품이미지</td><td>상품이름</td></tr>
						
						<c:forEach items="${wishlist}" var = "wishlist">
							<tr>
								<td><c:out value="${wishlist.cno}" /></td>
								<td><c:out value="${member.userid}" /></td>							
								<td><c:out value="${wishlist.sno}" /></td>
								<td><a href="/sangpoomc/readView?sno=${wishlist.sno}"><img  src="${wishlist.wishimg}"/></a></td>
								<td><c:out value="${wishlist.sname}" /></td>
						
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
					</form>
</section>

</div>

<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



