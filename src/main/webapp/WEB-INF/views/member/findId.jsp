<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<style>
button {
	cursor: pointer;
}

.findId{
    width: 100%;
    max-width: 400px;
    margin: 0 auto;
    margin-bottom: 200px;
    padding: 150px 0 50px 0;
}

.findIdWrap {
    background: white;
}

fieldset {
    border: none;
}

.findId .form {
    position: relative;
    margin: 0px 14px 0;
    font-size: 11px;
}

.findId .form:after {
    content: "";
    display: block;
    clear: both;
}

.findId .form {
    margin: 0 0px 0 0;
}

.findId .form input[type="text"] {
    width: 100%;
    height: 43px;
    margin: 0 0 7px;
}
.btnWrap {
	text-align: center;
}
/* 버튼관련 */
.registerBtn, .cancelBtn, .loginBtn, .findIdBtn{
    color: #444444;
    background: #F3F3F3;
    border: 1px #DADADA solid;
    padding: 5px 10px;
    border-radius: 2px;
    font-weight: bold;
    font-size: 9pt;
    outline: none;
}
.registerBtn:hover, .cancelBtn:hover, .loginBtn:hover, .findIdBtn:hover {
    border: 1px #C6C6C6 solid;
    box-shadow: 1px 1px 1px #EAEAEA;
    color: #333333;
    background: #F7F7F7;
}
.registerBtn:active, .cancelBtn:active, .loginBtn:active, .findIdBtn:active {
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
	})
	

	
</script>
	<form name='findId' method="post" action="/member/findId">
	<div class="findId">
		<div class="findIdWrap">
			<c:if test="${dto == null}">
			<fieldset>
				<div class="form">
					<input type="text" id="email" name="email" placeholder="이메일">
					<input type="text" id="phone" name="phone" placeholder="전화번호">
				</div>
				<div class="btnWrap">
					<button class="findIdBtn" type="submit">찾기</button>
					<button class="cancelBtn" type="reset">취소</button>
				</div>
			</c:if>
			<c:if test="${dto != null }">
				<div>
					<alert>회원님의 ID는 ${dto.userid}입니다</alert>
					<button id="registerBtn" class="registerBtn" type="button">회원가입</button>
					<button id="loginBtn" class="loginBtn" type="button">로그인</button>
				</div>
			</c:if>
			<c:if test="${msg == false}">
				<alert style="color: red;">회원찾기 실패! 이메일과 전화번호 확인해주세요.</alert>
			</c:if>
			</fieldset>
		</div><!-- findIdWrap end -->
	</div> <!-- findId end -->
	</form>
</div> <!-- main end -->
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



