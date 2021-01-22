<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<style>
.deleteWrap {
	text-align: center;
	width: 100%;
    max-width: 400px;
    margin: 0 auto;
    margin-bottom: 200px;
    padding: 150px 0 50px 0;
}
.deleteWrap td {
	padding: 8px 10px 7px;
    color: #666;
}
table {
	position: relative;
    margin: 10px 0 0;
    border-top: 0;
    color: #fff;
    line-height: 1.5;
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}
table th:first-child {
	border-left: 0;
}

th, td {
	border: 0;
    vertical-align: top;
}

tbody th {
	padding: 12px 0;
    color: #353535;
    text-align: left;
    font-weight: normal;
}

.btnWrap {
	text-align: center;
    margin: 50px 0 70px;
}
/* 버튼관련 */
.deleteBtn, .cancelBtn {
    color: #444444;
    background: #F3F3F3;
    border: 1px #DADADA solid;
    padding: 5px 10px;
    border-radius: 2px;
    font-weight: bold;
    font-size: 9pt;
    outline: none;
}
.deleteBtn:hover, .cancelBtn:hover {
    border: 1px #C6C6C6 solid;
    box-shadow: 1px 1px 1px #EAEAEA;
    color: #333333;
    background: #F7F7F7;
}
.deleteBtn:active, .cancelBtn:active {
    box-shadow: inset 1px 1px 1px #DFDFDF;
}/* 버튼관련끝 */
</style>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancelBtn").on("click", function(){
				
				location.href = "/";
						    
			})
			
			$(".deleteBtn").on("click", function(){
				if($("#upw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#upw").focus();
					return false;
				}	
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dataType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							if(confirm("회원탈퇴하시겠습니까?")){
								$("#delForm").submit();
							}
							
						}
					}
				})
			});
			
				
			
		})
	</script>
<body>
<section id="container">
	<form action="/member/memberDelete" method="post" id="delForm">
	<div class="deleteWrap">
		<table>
		<tbody>
			<tr class="idWrap">
				<th><label class="control-label" for="userid">아이디</label><img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
				<td><input class="form-control" type="text" id="userid" name="userid" value="${member.userid}" readonly="readonly"/>
				</td>
			</tr>

			<!-- 비밀번호 -->
			<tr>
				<th scope="row">비밀번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
				<td>
					<input id="upw" name="upw" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호" autocomplete="off" maxlength="16" 0="disabled" type="password">
					<br>
					<span>(영문 대소문자/숫자 4자~16자)</span>
				</td>
			</tr>
			<tr>
				<th scope="row">비밀번호 확인 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
				<td>
					<input id="user_passwd_confirm" name="user_passwd_confirm" fw-filter="isFill&amp;isMatch[upw]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" 0="disabled" value="" type="password">
					<span id="pwConfirmMsg"></span> 
				</td>
			</tr>
			<!-- 이름 -->
			<tr>
				<th scope="row">이름 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
				<td>
					<input id="uname" name="uname" class="inputTypeText" type="text" value="${member.uname}" readonly="readonly">
				</td>
			</tr>
		</tbody>
		</table>
			<div class="btnWrap">
				<button class="deleteBtn" type="button" id="submit">회원탈퇴</button>
				<button class="cancelBtn" type="button">취소</button>
			</div> <!-- btnWrap end -->
		</div> <!-- deleteWrap end -->
	</form>
	
	<div class="testFalse">
		<c:if test="${msg == false}">
			비밀번호가 맞지 않습니다.
		</c:if>
	</div> <!-- testFalse end -->
</section>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



