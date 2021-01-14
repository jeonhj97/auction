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
				if($("#uname").val()==""){
					alert("성명을 입력해주세요.");
					$("uname").focus();
					return false;
				}
			});
			
		})

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr2").value = roadAddr;
                document.getElementById("addr1").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
	<body>
		<section id="container">
			<form action="/member/memberUpdate" method="post">
			<div>
			<table>
			<tbody>

<!-- 아이디 -->
                <tr>
                  <th scope="row">아이디 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                  <td>
                    <input id="userid" name="userid" class="inputTypeText" type="text" value="${member.userid}" readonly="readonly">
                  </td>
                </tr>
				
<!-- 비밀번호 -->
                <tr>
                  <th scope="row">비밀번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
                  <td>
                    <input id="upw" name="upw" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호" autocomplete="off" maxlength="16" 0="disabled" type="password">
                    <div class="tooltip_typeUpper" style="display: none">
                      <div class="tooltip_typeUpper_content">
                        <strong class="txtWarn">※ 비밀번호 입력 조건</strong>
                        <ul class="txtWarn_content">- 대소문자/숫자 4자~16자<br> - 특수문자 및 공백 입력 불가능 </ul>
                      </div>
                        <a href="#none" class="btnClose" tabindex="-1">
                        <img id="btnClose" src="//img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif" alt="닫기"></a>
                      <div class="edge"></div>
	           		</div>
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
                      <input id="uname" name="uname" class="inputTypeText" type="text" value="${member.uname}">
                  </td>
                </tr>
<!-- 전화번호 -->
                <tr>
                  <th scope="row">휴대전화 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                  <td>
		    	    <input id="phone" name="phone" maxlength="11" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" type="text">
                    <button type="button" id="btnVerify" class="btnNormal " onclick="memberVerifyMobile.joinSendVerificationNumber(); return false;">인증번호받기</button>
                    <br>
        			<span>"-"없이 번호만 입력해주세요</span>
                  </td>
                </tr>
                
<!-- 이메일 -->
                <tr>
                  <th scope="row">이메일 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                  <td>
		    	    <input id="email" name="email" type="text">
                    <br>
                  </td>
                </tr>
                
<!-- 우편번호 -->
                <tr>
                  <th scope="row">우편번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                  <td><div class="form-group"> 
		    	    <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="zipcode" id="zipcode" type="text" readonly="readonly" >
    				<button type="button" class="btn btn-default" onclick="execDaumPostcode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                    </div>
                  </td>
                </tr>

<!-- 주소1 -->
                <tr>
                  <th scope="row">주소1 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                  <td>
		    	    <input class="form-control" id="addr1" name="addr1" type="text" readonly="readonly">
                    <br>
                  </td>
                </tr>
                
<!-- 주소2 -->
                <tr>
                  <th scope="row">주소2 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                  <td>
		    	    <input id="addr2" name="addr2" type="text">
                    <br>
                  </td>
                </tr>
<!-- 생년월일 -->
                <tr>
                  <th scope="row">생년월일<img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
                  <td>
		    	    <input id="birth" name="birth" type="date">
                    <br>
                  </td>
                </tr>
              </tbody>
			</table>
		</div> <!--jtypeWrite2 end-->
				
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



