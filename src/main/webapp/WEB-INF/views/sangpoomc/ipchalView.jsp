<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<style>
button {
	cursor: pointer;
}

.ipchalView{
    width: 100%;
    max-width: 400px;
    margin: 0 auto;
    margin-bottom: 200px;
    padding: 150px 0 50px 0;
}

.ipchalViewWrap {
    background: white;
}

fieldset {
    border: none;
}

.ipchalView .form {
    position: relative;
    margin: 0px 14px 0;
    font-size: 11px;
}

.ipchalView .form:after {
    content: "";
    display: block;
    clear: both;
}

.ipchalView .form {
    margin: 0 0px 0 0;
}

.ipchalView .form input[type="text"] {
    width: 100%;
    height: 43px;
    margin: 0 0 7px;
}
.btnWrap {
	text-align: center;
}
/* 버튼관련 */
.ipchal_btn2, .cancelBtn {
    color: #444444;
    background: #F3F3F3;
    border: 1px #DADADA solid;
    padding: 5px 10px;
    border-radius: 2px;
    font-weight: bold;
    font-size: 9pt;
    outline: none;
}
.ipchal_btn2:hover, .cancelBtn:hover {
    border: 1px #C6C6C6 solid;
    box-shadow: 1px 1px 1px #EAEAEA;
    color: #333333;
    background: #F7F7F7;
}
.ipchal_btn2:active, .cancelBtn:active {
    box-shadow: inset 1px 1px 1px #DFDFDF;
</style>
<div class="main">
<form name="ipchalForm" action="/sangpoomc/ipchal" method="post"  onsubmit="return ipchal()">
<input type="hidden" id="sno" name="sno" value="${ipchal.sno}" />
<input type="hidden" id="userid" name="userid" value="${member.userid}"/>
	<div class="ipchalView">
		<div class="ipchalViewWrap">
			<c:if test="${member != null}">
			<fieldset>
				<div class="form">
				<c:if test="${count == 0}">					
					<label for="startprice">현재가격</label><input type="text" id="startprice" name="startprice" value="${ipchal.startprice}" readonly>
				</c:if>
				<c:if test="${count>= 1}">							
					<label for="nowprice">현재가격</label><input type="text" id="nowprice" name="nowprice" value="${ipchal.nowprice}" readonly/>
				</c:if>	
					<label for="ipprice">입찰가격</label><input type="text" id="ipprice" name="ipprice" required/><!-- required 빈값쓰면 안됨  -->
				
				
				<script type="text/javascript">	
				alert(removeComma("${ipchal.startprice}"));
				
				
				
				
				
				
				//3자리콤마없애주는함수
				function removeComma(str)
				{
					n = parseInt(str.replace(/,/g,""));
					return n;
				}

			
				
				
				
				function ipchal(){
		   			var ipprice = document.getElementById("ipprice").value;
					var nowprice=removeComma("${ipchal.nowprice}");		
					var startprice=removeComma("${ipchal.startprice}");
					if(startprice>=ipprice){
						alert("현재가격보다 높은금액으로만 입찰하실수있습니다");
					     document.getElementById("ipprice").focus;
					     return false;
					     if(nowprice>=ipprice){
					    	 alert("현재가격보다 높은금액으로만 입찰하실수있습니다");
						     document.getElementById("ipprice").focus;
						     return false;
					     }									    		 
					}else{
						ipprice= Integer.toString(ipprice);
						nowprice=Integer.toString(nowprice);
						startprice=Integer.toString(startprice);
						   return true;
						
					}//if end
				
				
 
				}//ipchal()end
				
		   		</script>							
				</div> <!-- form end -->
				<div class="btnWrap">
				<input class="ipchal_btn2" type="submit" value="확인">
				<button class="cancelBtn" type="reset" onclick="history.go(-1)">취소</button>
				</div>
			</c:if>
			<c:if test="${member == null}">
					<script>
							alert("로그인을 해주세요");
							location.href='/member/login';
					</script>
			</c:if>
			<fieldset>
		</div> <!-- ipchalViewWrap end -->
	</div> <!-- ipchalView end -->
</form>
</div> <!-- main end -->
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

<!--  on.("click",function(){
	   location.href="sangpoomc/ipchal";
   }) -->


