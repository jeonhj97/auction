<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  
<section id="container">
				
				<form name="ipchalForm" action="/sangpoomc/ipchal" method="post"  onsubmit="return ipchal()" >
				<input type="hidden" id="sno" name="sno" value="${ipchal.sno}" />
				<input type="hidden" id="userid" name="userid" value="${member.userid}"/>
				
					<table>
						<tbody>
					<c:if test="${member != null}">
						<tr>
							<td>				
									<label for="ipprice">입찰가</label><input type="text" id="ipprice" name="ipprice" required/><!-- required 빈값쓰면 안됨  -->
								<c:if test="${count == 0}">					
									<label for="nowprice">현재가격</label><input type="text" id="startprice" name="startprice" value="${ipchal.startprice}" readonly>
								</c:if>
								<c:if test="${count>= 1}">							
									<label for="nowprice">현재가격</label><input type="text" id="nowprice" name="nowprice" value="${ipchal.nowprice}" readonly/>													
								</c:if>	
								<script type="text/javascript">										
							
								
								//alert(document.getElementById("nowprice").value);//    1,900,000
								//alert(typeof(removeComma("${ipchal.nowprice}")));//    1,900,000 number 1900000
								
								//alert(parseFloat(nowprice));//NaN
								
								
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
									
								  /*  if(nowprice>=ipprice){
									   alert("현재가격보다 높은금액으로만 입찰하실수있습니다");
								       document.getElementById("ipprice").focus;										       
								       return false;					   									   
								   }else{
									   ipprice= Integer.toString(ipprice);
									   nowprice=Integer.toString(nowprice);
									   return true;
								   }//if end */
								   
								   
								   
								   
								   
								   
								   
								   
								   
								  /* if(ipprice!="0"){
									   ipprice=Number(ipprice)
									   nowprice=Number(nowprice)
									   startprice=Number(startprice)
									   if(ipprice<=nowprice){
									       alert("현재가격보다 높은금액으로만 입찰하실수있습니다");
									       document.getElementById("ipprice").focus;										       
									       return false;	  								   
									   }else if(startprice>ipprice){
										   alert("현재가격보다 높은금액으로만 입찰하실수있습니다");
									       document.getElementById("ipprice").focus;
									       return false;
									   }else{									   
										   return true;									   
									   }//if end
								   }else{
									   alert("입찰가격이 0은 허용하지 않습니다");
									   return false;
								   }//if end
								   */
								}//ipchal()end
								
						   		</script>							
							</td>
						</tr>
						
						</tbody>
						<tr>
							<td>								
								<input type="submit" class="ipchal_btn2" value="확인">
							</td>
						</tr>						

					</c:if>
					<c:if test="${member == null}">
							<script>
									alert("로그인 후 응찰이 가능합니다 \n 로그인 하시겠습니까?");
									location.href='/member/login';
							</script>
					</c:if>
					</table>
					</form>
					
</section>

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>

<!--  on.("click",function(){
	   location.href="sangpoomc/ipchal";
   }) -->

