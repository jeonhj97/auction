<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  
<section id="container">
				<form name="mypageForm" method="get" >
				
				
				
					<table>
						<tbody>
						<tr><td>입찰번호</td><td>아이디</td><td>상품번호</td><td>입찰가</td><td>입찰일지</td></tr>
						<tr>
							<td>
								<label for="ipno">입찰번호</label><input type="text" id="ipno" name="ipno" value="${ipchallist.ipno}"/>
								<label for="userid">아이디</label><input type="text" id="userid" name="userid" value="${ipchallist.userid}">
								<label for="sno">상품번호</label><input type="text" id="sno" name="sno" value="${ipchallist.sno}">	
								<label for="ipprice">입찰가</label><input type="text" id="ipprice" name="ipprice" value="${ipchallist.ipprice}">
								<label for="ipdate">입찰일지</label><input type="text" id="ipdate" name="ipdate" value="${ipchallist.ipdate}">															
							</td>
						</tr>						
						</tbody>												
					</table>
					</form>
</section>

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



