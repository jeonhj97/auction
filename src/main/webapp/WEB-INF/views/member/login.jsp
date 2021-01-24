<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>   
<!--  본문 시작   template.jsp-->
<style>
a {
	cursor: pointer;
}

button {
	cursor: pointer;
}

.login{
    width: 100%;
    max-width: 400px;
    margin: 0 auto;
    margin-bottom: 200px;
    padding: 150px 0 50px 0;
}

.loginWrap {
    background: white;
}

.loginOkWrap {
	text-align: center;
	width: 100%;
    max-width: 400px;
    margin: 0 auto;
    margin-bottom: 200px;
    padding: 150px 0 50px 0;
}

.loginOk {
	font-size: 13px;
	margin-bottom: 23px;
}

fieldset {
    border: none;
}

.login .formBox {
    position: relative;
    margin: 0px 14px 0;
    font-size: 11px;
}

.login .formBox:after {
    content: "";
    display: block;
    clear: both;
}

.login .formBox .form {
    margin: 0 0px 0 0;
}

.login .formBox .form input[type="text"],
.login .formBox .form input[type="password"] {
    width: 100%;
    height: 43px;
}

.login .formBox .form input[type="text"] {
    margin: 0 0 7px;
}

.login .formBox .option {
    overflow: hidden;
    line-height: 43px;
    font-size: 13px;
    padding: 10px 0;
}

.loginBtn {
    text-align: center;
}

.btnSubmit {
    display: inline-block;
    width: 100%;
    height: 40px;
    box-sizing: border-box;
    padding: 3px 8px 0 8px;
    border: 1px solid #000;
    border-radius: 0px;
    font-size: 13px;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    text-transform: uppercase;
    text-align: center;
    white-space: nowrap;
    color: #000;
    background-color: #FFF;
}

.login .loginUtil {
	width: 100%;
	position: relative;
    display: inline-block;
    color: black;
    font-weight: normal;
    height: 35px;
    margin: 0 auto;
    font-size: 13px;
    text-align: center;
    line-height: 25px;
}

#upw {
	margin :0 0 9px;
}
.btnSubmit {
	display: inline-block;
	box-sizing: border-box;
	padding: 3px 8px 0 8px;
	margin :0 0 7px;
	border: 1px solid #000;
	border-radius: 0px;
	font-size: 13px;
	font-weight: normal;
	text-decoration: none;
	vertical-align: middle;
	text-transform: uppercase;
	text-align: center;
	white-space: nowrap;
	color: #000;
	background-color: #FFF;
	cursor: pointer;
    font-family: 'HelveticaLTWXX-Roman','Noto Sans KR',Helvetica,sans-serif;
}
.btnLogin{
	position: relative;
    width: 33.33%;
    float: left;
    display: inline-block;
    padding: 4px 0;
    color: #000;
    font-weight: normal;
}
.btnLogin:nth-child(2):before {
    display: block;
    content: "";
    position: absolute;
    top: 10px;
    width: 0.8px;
    left: 0;
    height: 13px;
    background: gray;
}
.btnLogin:nth-child(3):before {
    display: block;
    content: "";
    position: absolute;
    top: 10px;
    width: 0.8px;
    left: 0;
    height: 13px;
    background: gray;
}
</style>
<div class="main">  
<script type="text/javascript">
   $(document).ready(function(){
      
      

      $("#registerBtn").on("click", function(){
         location.href="register";
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
      $("#findPwBtn").on("click", function(){
         location.href="findPw";
      })
      
   
   })
   
  	
   
   
   
   
</script>
	<form name="login" method="post" action="/member/login">
	<div class="login">
		<c:if test="${member == null}">
			<div class="loginWrap">
				<fieldset>
					<div class="formBox">
						<div class="form">
							<input type="text" id="userid" name="userid" placeholder="아이디">
							<input type="password" id="upw" name="upw" placeholder="비밀번호">
						</div>
						<div class="loginBtn">
							 <button class="btnSubmit" type="submit">로그인</button> 
						
						</div>
						<div class="loginUtil">
							<a id="registerBtn" class="btnLogin" type="button">회원가입</a>
							<a id="findIdBtn" class="btnLogin" type="button">아이디찾기</a>
							<a id="findPwBtn" class="btnLogin" type="button">비밀번호찾기</a>
						</div>
						</c:if>
						
						<c:if test="${member != null }">
						<script>	
								window.history.go(0);
								location.reload(true);
								location.href = location.href;
								window.history.back();
								
						</script>
						<%-- <div class="loginOkWrap">
							<p class="loginOk">${member.userid}님 환영합니다</p>
							<div class="loginUtil">
								<a id="memberUpdateBtn" class="btnLogin" type="button">회원정보수정</a>
								<a id="logoutBtn" class="btnLogin" type="button" class="logoutBtn">로그아웃</a>
								<a id="memberDeleteBtn" class="btnLogin" type="button">회원탈퇴</a>
							</div>
						</div> --%>
						</c:if>
						<c:if test="${msg == false}">
							<alert style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</alert>
						</c:if>
					</div>
				</fieldset>
			</div>
		</div>
	</form>
</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>


