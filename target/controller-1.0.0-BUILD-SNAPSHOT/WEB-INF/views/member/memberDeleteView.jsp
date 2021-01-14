<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/";
						    
			})
			
			$("#submit").on("click", function(){
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
				<tbody>
				<div class="form-group has-feedback">
					<label class="control-label" for="userid">아이디</label>
					<input class="form-control" type="text" id="userid" name="userid" value="${member.userid}" readonly="readonly"/>
				</div>

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
			</form>
			<div class="form-group has-feedback">
			  <button class="btn btn-success" type="button" id="submit">회원탈퇴</button>
			  <button class="cencle btn btn-danger" type="button">취소</button>
			</div>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		</section>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



