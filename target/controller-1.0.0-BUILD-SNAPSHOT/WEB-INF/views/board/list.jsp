<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  
<section id="container">
				<div>
					<%@include file="nav_board.jsp" %>
				</div>
				<form role="form" method="get" >
					<table>
					
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>글내용</th><th>글작성일</th><th>이미지</th></tr>	
							<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.boardno}" /></td>
								<td><c:out value="${list.userid}" /></td>
								<td>
									<a href="/board/readView?boardno=${list.boardno}&
															 page=${scri.page}&
															 perPageNum=${scri.perPageNum}&
															 searchType=${scri.searchType}&
															 keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								<td><c:out value="${list.content}" /></td>
								<td><fmt:formatDate value="${list.wdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${list.boardimg}" /></td>
							</tr>
							</c:forEach>
				</table>
					<div class="search">
					   <select name="searchType">
					     <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					     <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					     <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					     <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					     <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					   </select>
					
					   <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
					   <button id="searchBtn" type="button">검색</button>
					   <script>
					     $(function(){
					       $('#searchBtn').click(function() {
					         self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					       });
					     });   
					   </script>
					 </div>
				<div>
				  <ul>
				    <c:if test="${pageMaker.prev}">
				    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				    </c:if> 
				  </ul>
				</div>
				</form>
</section>

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



