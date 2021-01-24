<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<style>
button {
	cursor: pointer;
}

.findPw{
    width: 100%;
    max-width: 400px;
    margin: 0 auto;
    margin-bottom: 200px;
    padding: 150px 0 50px 0;
}

.findPwWrap {
    background: white;
}

fieldset {
    border: none;
}

.findPw .form {
    position: relative;
    margin: 0px 14px 0;
    font-size: 11px;
}

.findPw .form:after {
    content: "";
    display: block;
    clear: both;
}

.findPw .form {
    margin: 0 0px 0 0;
}

.findPw .form input[type="text"] {
    width: 100%;
    height: 43px;
    margin: 0 0 7px;
}
.btnWrap {
	text-align: center;
}
/* 버튼관련 */
.registerBtn, .cancelBtn, .loginBtn, .findPwBtn, .mailsendBtn{
    color: #444444;
    background: #F3F3F3;
    border: 1px #DADADA solid;
    padding: 5px 10px;
    border-radius: 2px;
    font-weight: bold;
    font-size: 9pt;
    outline: none;
}
.registerBtn:hover, .cancelBtn:hover, .loginBtn:hover, .findPwBtn:hover, .mailsendBtn:hover {
    border: 1px #C6C6C6 solid;
    box-shadow: 1px 1px 1px #EAEAEA;
    color: #333333;
    background: #F7F7F7;
}
.registerBtn:active, .cancelBtn:active, .loginBtn:active, .findPwBtn:active, .mailsendBtn:active {
    box-shadow: inset 1px 1px 1px #DFDFDF;
}/* 버튼관련끝 */
</style>
<div class="main">  
<script type="text/javascript">
	$(document).ready(function(){
		
		
		
		$("#registerBtn").on("click", function(){
			location.href="register";
		})
		$("#loginBtn").on("click", function(){
			location.href="login";
		})
		$("#mailsendBtn").on("click", function(){
			location.href="sendMail";
			alert("가입하신 이메일로 임시 비밀번호를 전송했습니다");
		})
	})
	
	

	
</script>
	<form name='findPw' method="post" action="/member/findPw">
	<div class="findPw">
		<div class="findPwWrap">
			<c:if test="${dto == null}">
			</fieldset>
				<div class="form">
					<input type="text" id="userid" name="userid" placeholder="아이디">
					<input type="text" id="email" name="email" placeholder="이메일">
				</div>
				<div class="btnWrap">
					<button class="findPwBtn" type="submit">찾기</button>
					<button class="cancelBtn" type="reset" onclick="history.go(-1)">취소</button>
				</div>
			</c:if>
			<c:if test="${dto != null }">
				<div>
					<alert>회원님의 임시비밀번호를 이메일로 전송하시겠습니까? ${dto.email}</alert>
					<button class="mailsendBtn" id="mailsendBtn" type="button">네</button>
					<button class="loginBtn" id="loginBtn" type="button">아니요</button>
					<button class="registerBtn" id="registerBtn" type="button">회원가입</button>
					<button class="loginBtn" id="loginBtn" type="button">로그인</button>
				</div>
			</c:if>
			<c:if test="${msg == false}">
				<alert style="color: red;">비번찾기 실패! 아이디와 이메일을 확인해주세요.</alert>
			</c:if>
			</fieldset>
		</div> <!-- findPwWrap end -->
	</div> <!-- findPw end -->
	</form>
</div> <!-- main end -->
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



