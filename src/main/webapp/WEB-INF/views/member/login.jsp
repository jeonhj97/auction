<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  
<script type="text/javascript">
	$(document).ready(function(){
		
		
		$("#logoutBtn").on("click", function(){
			location.href="logout";
		})
		
	})
</script>
	<form name='login' method="post" action="/member/login">
		<c:if test="${member == null}">
			<div>
				<label for="userid">아이디</label>
				<input type="text" id="userid" name="userid">
			</div>
			<div>
				<label for="upw">비밀번호</label>
				<input type="password" id="upw" name="upw">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="button" onclick="location.href='/member/register'">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.userid}님 환영 합니다.</p>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<alert style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</alert>
		</c:if>
	</form>
</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



