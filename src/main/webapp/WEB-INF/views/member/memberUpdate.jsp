<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>   
<!--  본문 시작   template.jsp-->
<style>
.updateWrap {
	max-width: 700px;
    margin: 0 auto;
}
.updateWrap td {
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
#addr1, #addr2 {
	width: 550px;
}


.btnWrap {
	text-align: center;
    margin: 50px 0 70px;
}
/* 버튼관련 */
.updateBtn, .cancelBtn, .zipcodeBtn {
    color: #444444;
    background: #F3F3F3;
    border: 1px #DADADA solid;
    padding: 5px 10px;
    border-radius: 2px;
    font-weight: bold;
    font-size: 9pt;
    outline: none;
}
.updateBtn:hover, .cancelBtn:hover, .zipcodeBtn:hover {
    border: 1px #C6C6C6 solid;
    box-shadow: 1px 1px 1px #EAEAEA;
    color: #333333;
    background: #F7F7F7;
}
.updateBtn:active, .cancelBtn:active, .zipcodeBtn:active {
    box-shadow: inset 1px 1px 1px #DFDFDF;
}/* 버튼관련끝 */

</style>
<script type="text/javascript">
$(document).ready(function(){

   
   // 취소
   $(".cancelBtn").on("click", function(){
      location.href = "/";
   })
   
   $(".updateBtn").on("click", function(){
      if($("#upw").val()==""){
         alert("비밀번호를 입력해주세요.");
         $("#upw").focus();
         return false;
      }
      if($("#uname").val()==""){
         alert("성명을 입력해주세요.");
         $("#uname").focus();
         return false;
      }
      if($("#phone").val()==""){
         alert("폰번호를 입력해주세요.");
         $("#phone").focus();
         return false;
      }
      if($("#email").val()==""){
         alert("이메일을 입력해주세요.");
         $("#email").focus();
         return false;
      }
      if($("#zipcode").val()=="" || $("#addr1").val()=="" || $("#addr2").val()==""){
         alert("올바른 주소를 입력해주세요");
         $("#findAddr").focus();
         return false;
      }
      if($("#birth").val()==""){
         alert("생년월일을 입력해주세요");
         $("#birth").focus();
         return false;
      }
      
      // 비번확인
      if($("#upw").val() !== $("#upwcfm").val()){
         alert("비밀번호를 확인해주세요");
         $("#upwcfm").val('');
         $("#upwcfm").focus();
         return false;
      }
      alert("회원정보가 수정되었습니다");
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
		<div class="updateWrap">
			<table border="1" summary>
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
								<div class="edge">
								</div>
							</div>
						<span>(영문 대소문자/숫자 4자~16자)</span>
					</td>
				</tr>
				<!-- 비밀번호확인 -->
				<tr>
					<th scope="row">비밀번호 확인 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
					<td>
						<input id="upwcfm" name="upwcfm" fw-filter="isFill&amp;isMatch[upw]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" 0="disabled" value="" type="password">
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
						<input id="phone" name="phone" maxlength="11" fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" type="text" value="${member.phone}">
						<span>"-"없이 번호만 입력해주세요</span>
					</td>
				</tr>
	
				<!-- 이메일 -->
				<tr>
					<th scope="row">이메일 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
					<td>
						<input id="email" name="email" type="text" value="${member.email}">
						<br>
					</td>
				</tr>
	
				<!-- 우편번호 -->
				<tr>
					<th scope="row">우편번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
					<td>
						<div class="form-group"> 
							<input class="form-control" style="width: 63px; display: inline;" placeholder="우편번호" name="zipcode" id="zipcode" type="text" value="${member.zipcode}" readonly="readonly" >
							<button type="button" class="zipcodeBtn" onclick="execDaumPostcode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
						</div>
					</td>
				</tr>
	
				<!-- 주소1 -->
				<tr>
					<th scope="row">주소1 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
					<td>
						<input class="form-control" id="addr1" name="addr1" type="text" readonly="readonly" value="${member.addr1}">
						<br>
					</td>
				</tr>
	
				<!-- 주소2 -->
				<tr>
					<th scope="row">주소2 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
					<td>
						<input id="addr2" name="addr2" type="text" value="${member.addr2}">
						<br>
					</td>
				</tr>
				<!-- 생년월일 -->
				<tr>
					<th scope="row">생년월일<img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="" alt="필수"></th>
					<td>
						<input id="birth" name="birth" type="date" value="${member.birth}">
						<br>
					</td>
				</tr>
				
			</tbody>
			</table>  <!-- jtypeWrite2 end -->
			<div class="btnWrap">
				<button class="updateBtn" type="submit" id="submit">회원정보수정</button>
				<button class="cancelBtn" type="button">취소</button>
			</div> <!-- btnWrap end -->
		</div> <!-- updateWrap end -->
	</form>
</section>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>


