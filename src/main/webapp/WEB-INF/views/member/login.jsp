<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  
<script type="text/javascript">
	$(document).ready(function(){
		
		
		$("#logoutBtn").on("click", function(){
			location.href="logout";
		})
		
		$("#registerBtn").on("click", function(){
			location.href="register";
		})
		$("#searchBtn").on("click", function(){
			location.href="memberSrc";
		})
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="memberUpdate";
		})
		
		$("#memberDeleteBtn").on("click", function(){
			location.href="memberDeleteView";
		})
		
		$("#findIdBtn").on("click", function(){
			location.href="findId";
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
				<button id="registerBtn" type="button">회원가입</button>
				<button id="searchBtn" type="button">아이디찾기</button>
				<button id="findIdBtn" type="button">아이디찾기2</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.userid}님 환영 합니다.</p>
				
				<button id="memberUpdateBtn" type="button">회원정보수정</button>
				<button id="logoutBtn" type="button">로그아웃</button>
				<button id="memberDeleteBtn" type="button">회원탈퇴</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<alert style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</alert>
		</c:if>
	</form>
</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



