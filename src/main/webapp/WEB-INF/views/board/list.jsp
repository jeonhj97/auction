<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<style>
  table {
    width: 80%;
    margin: auto;
  border-top: 2px solid #dee2e6; 
  border-bottom: 2px solid #dee2e6; 
  }
  .tnone{
  text-align: center;
  }
  th{
  padding : 8px;
  border-bottom: 2px solid #dee2e6;
  background-color: #f8f9fa;
  } 
  
  td{
  padding : 8px;
   border-bottom: 1px solid #e2e2e2;
   color: #898989
  }
    #pre, #next {
  margin: 15px;
  display: inline;
  border: 0px;
  }
  .allPageMoving1 a{
  display: inline-block;
    width: 28px;
    height: 28px;
    line-height: 28px;
    color: #8f8f8f;
    border: 1px #c0c0c0 solid;
    background: #fff;
    font-size: 16px;
  }
.allPageMoving1{
    padding: 8px;
vertical-align: top;
    text-align: center;

}
  .btitle{
  color: #898989;
  }

.search{
 text-align: center;
}
#searchB{
 width: 30%;
 height: 28px;
 font-size: 12px;
}
#searchS{
height: 28px;
vertical-align: top;
text-align: center;
padding-bottom:-20px ;
margin: 0;
}
select {
    max-width: 100%;
    height: 40px;
    margin: 0;
    padding: 0 15px 0 8px;
    line-height: 20px;
    font-size: 13px;
    color: #333;
    word-break: break-all;
    font-weight: inherit;
    border: 1px solid #d7d5d5;
    border-radius: 0;
    background: #fff url(//img.echosting.cafe24.com/skin/mobile/common/ico_select.gif) no-repeat 100% 50%;
    background-size: auto 25px;
    -webkit-appearance: none;
    text-align: center;
}
  .left{
  width: 40%;
  }
  #nowpage{
    display: inline-block;
    width: 28px;
    height: 28px;
    line-height: 28px;
    color: red;
    border: 1px #c0c0c0 solid;
    background: #fff;
    font-size: 16px;
  }
</style>
		<!-- 내용시작 -->
		<div>
			<%@include file="nav_board.jsp" %>
		</div>
		<form role="form" method="get" >
		<div id="board">
            
			<div class="boardDiv">
				<table class="boardTable" >
				<caption>공지사항</caption>
				<colgroup>
				<col width="10%" class="tnone" /><col width="*" /><col width="15%" class="tw34" /><col width="12%" class="tnone" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="tnone">번호</th>						
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="list">
							<tr>
								<td class="tnone"><c:out value="${list.boardno}" /></td>
								<td class="left">
									<a class="btitle" href="/board/readView?boardno=${list.boardno}&
															 page=${scri.page}&
															 perPageNum=${scri.perPageNum}&
															 searchType=${scri.searchType}&
															 keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								<td class="tnone"><c:out value="${list.userid}" /></td>
								<td class="tnone"><fmt:formatDate value="${list.wdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
							</c:forEach>
							
							</tbody>
				</table>

<!-- 페이징 -->				
			 <div class="allPageMoving1">
				    <c:if test="${pageMaker.prev}">
				    	<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}" id="pre">이전</a>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
				    	
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}" id="next">다음</a>
				    </c:if> 
				</div>
				
<!-- 검색창 -->
				<div class="search">
					   <select id="searchS" name="searchType">
					     <option selected="selected" value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					     <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					     <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					     <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					   </select>
					
					   <input id="searchB" type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
					   <button id="searchBtn" type="button">검색</button>
					   <script>
					     $(function(){
					       $('#searchBtn').click(function() {
					         self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					       });
					     });   
					   </script>
					 </div>
					 

				</form>
				
<%@ include file="../footer.jsp"%>



