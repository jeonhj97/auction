<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  
<section id="container">
				<form name="ipchalForm" action="/sangpoomc/ipchal" method="post"  onsubmit="return ipchal()">
				<input type="hidden" id="sno" name="sno" value="${ipchal1.sno}" />
				
				
					<table>
						<tbody>
						<tr>
							<td>
								<label for="ipprice">입찰가</label><input type="text" id="ipprice" name="ipprice" />
								<label for="nowprice">현재가격</label><input type="text" id="nowprice" name="nowprice" value="${ipchal1.nowprice}">
								<script type="text/javascript">
								function ipchal(){
								   var ipprice=document.getElementById("ipprice").value
								   var nowprice=document.getElementById("nowprice").value
								   if(ipprice<=nowprice){
								       alert("현재가격보다 높은금액으로만 입찰하실수있습니다")
								       document.getElementById("ipprice").focus;
								       return false;
								   }else{
									   return true;
								   }//if end
								   
								}
						   		</script>							
							</td>
						</tr>
						
						</tbody>
						<tr>
							<td>								
								<input type="submit" class="ipchal_btn2" value="확인">
							</td>
						</tr>						

						
					</table>
					</form>
</section>

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



