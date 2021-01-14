<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  
<script type="text/javascript">
	$(document).ready(function(){
		
		
		
		$("#registerBtn").on("click", function(){
			location.href="register";
		})
		$("#loginBtn").on("click", function(){
			location.href="logout";
			
		})
	})
	

	
</script>
	<form name='memberSrc' method="post" action="/member/memberSrc">
		<c:if test="${member == null}">
			<div>
				<label for="email">이메일</label>
				<input type="text" id="email" name="email">
			</div>
			<div>
				<label for="phone">전화번호</label>
				<input type="text" id="phone" name="phone">
			</div>
			<div>
				<button type="submit">확인</button>
				<button type="reset">취소</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<alert>회원님의 ID는 ${member.userid}입니다</alert>
				<button id="registerBtn" type="button">회원가입</button>
				<button id="loginBtn" type="button">로그인</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<alert style="color: red;">회원찾기 실패! 이메일과 전화번호 확인해주세요.</alert>
		</c:if>
	</form>
</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



