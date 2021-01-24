<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>   
<!--  본문 시작   template.jsp-->
<style>
#sartist1{
   background: #ef5350;
   color: #fff;
   border: none;
   position: relative;
   height: 60px;
   width: 125px;
   font-size: 1.6em;
   cursor: pointer;
   transition: 800ms ease all;
   outline: none;
}
#sartist1:hover{
   background: #fff;
   color: #ef5350;
}
#sartist1:before, #sartist1:after{
   content: '';
   position: absolute;
   top: 0;
   right: 0;
   height: 2px;
   width: 0;
   background: #ef5350;
   transition: 400ms ease all;
}
#sartist1:after{
   right: inherit;
   top: inherit;
   left: 0;
   bottom: 0;
}
#sartist1:hover:before, #sartist1:hover:after{
   width: 100%;
   transition: 800ms ease all;
}
#syear1{
   background: #888;
   color: #f2f2f2;
   border: none;
   position: relative;
   height: 60px;
   width: 125px;
   font-size: 1.6em;
   cursor: pointer;
   transition: 800ms ease all;
   outline: none;
}
.divWrap {
   display:flex;
}
th,td {
   width: 200px;
   text-align: center;
}
#img {
   width: 400px;
     height: 500px;
     margin-left:280px;
}
/*입찰버튼*/
.ipchalBtn{
   background: #ef5350;
   color: #fff;
   border: none;
   position: relative;
   height: 60px;
   width: 125px;
   font-size: 1.6em;
   cursor: pointer;
   transition: 800ms ease all;
   outline: none;
}
.ipchalBtn:hover{
   background: #fff;
   color: #ef5350;
}
.ipchalBtn:before, .ipchalBtn:after{
   content: '';
   position: absolute;
   top: 0;
   right: 0;
   height: 2px;
   width: 0;
   background: #ef5350;
   transition: 400ms ease all;
}
.ipchalBtn:after{
   right: inherit;
   top: inherit;
   left: 0;
   bottom: 0;
}
.ipchalBtn:hover:before, .ipchalBtn:hover:after{
   width: 100%;
   transition: 800ms ease all;
}
/*돌아가기버튼*/
.backBtn{
   background: #888;
   color: #f2f2f2;
   border: none;
   position: relative;
   height: 60px;
   width: 125px;
   font-size: 1.6em;
   cursor: pointer;
   transition: 800ms ease all;
   outline: none;
}
.backBtn:hover{
   background: #fff;
   color: #888;
}
.backBtn:before, .backBtn:after{
   content: '';
   position: absolute;
   top: 0;
   right: 0;
   height: 2px;
   width: 0;
   background: #888;
   transition: 400ms ease all;
}
.backBtn:after{
   right: inherit;
   top: inherit;
   left: 0;
   bottom: 0;
}
.backBtn:hover:before, .backBtn:hover:after{
   width: 100%;
   transition: 800ms ease all;
}
.sangpoomcReadViewInfo {
   margin-left :50px;
}
.sno {
   margin: 0;
   font-size: 29px;
    line-height: 22px;
    color: #333;
    font-weight: 600;
}
.subject {
   margin: 0;
   font-size: 36px;
    line-height: 40px;
    color: #333;
    font-weight: 800;
    padding-top: 18px;
}
.sangpoomcReadViewPrice {
   padding-bottom: 20px;
    margin-bottom: 10px;
    border-bottom: 1px solid #e1e1e1;
}
dt {
   float: left;
    height: 24px;
    line-height: 23px;
    border: 1px solid #ccc;
    background: #fcfcfc;
    color: #666;
    font-size: 15px;
    font-weight: 600;
    width: 103px;
    text-align: center;
    margin-right: 20px;
}
dd {
   overflow: hidden;
    min-height: 26px;
    line-height: 25px;
    font-size: 18px;
    color: #666;
}
dd>span {
   display: inline-block;
    min-width: 38px;
    font-size: 16px;
    color: #666;
}
h1#sample01{
	display: inline-block;
}
pre.scontent{
	font-family: 'Nanum Gothic','나눔고딕',sans-serif,'Dotum','Gulim','Arial',sans-serif;
    font-size: 18px;
    line-height: 34px;
    color: #666;
    font-weight: 200;
}
</style>





<c:if test="${member == null}">
                     <script>
                           alert("로그인을 해주세요");
                           location.href='/member/login';
                     </script>
               </c:if>
<div class="main">  
<section id="container">
   <form name="readForm" method="post">
   <input type="hidden" id="sno" name="sno" value="${read.sno}" />
   <input type="hidden" id="userid" name="userid" value="${member.userid}"/>
   
   </form>
   <div class="divWrap">
      <div class="sangpoomcReadViewImg">
         <label for="img" style="display:none;">상품이미지</label>
         <img src="${read.img}" name="img" id="img" />                                       
      </div>
      
      <div class="sangpoomcReadViewInfo">
         <pre class="sno">${read.sno}<input type="hidden" id="sno" name="sno" value="${read.sno}" readonly/></pre>         
         <pre class="subject">${read.sname}<input type="hidden" id="sname" name="sname" value="${read.sname}" readonly/></pre>
         <pre class="scontent">${read.scontent}<input type="hidden" id="scontent" name="scontent" value="${read.scontent}" readonly/></pre>
         <div class="sangpoomcReadViewPrice">
         <dl class="startprice">
            <dt>시작가</dt>
            <dd>
               <span>KRW ${read.startprice}   <input type="hidden" id="startprice" name="startprice" value="${read.startprice}" readonly/> </span>
            </dd>
         </dl>
         <dl class="nowprice">                 
         <c:if test="${count == 0}">	
            <dt>현재가</dt>
            <dd>
               <span>KRW ${read.startprice}<input type="hidden" id="nowprice" name="nowprice" value="${read.nowprice}" readonly/></span>
            </dd>
          </c:if>
          <c:if test="${count>= 1}">
         	 <dt>현재가</dt>
         	 <dd>
          		<span>KRW ${read.nowprice}<input type="hidden" id="nowprice" name="nowprice" value="${read.nowprice}" readonly/></span>     
          	</dd>   
          </c:if>			
         </dl>
         </div>
         <div class="closetime">
	          <h1>종료일:${read.closedate}</h1><h1 style="display: inline-block">남은시간:</h1>
	          <h1 id="sample01"></h1>
          </div>
         <button type="button" class="ipchalBtn" onclick="location.href='/sangpoomc/ipchalView?sno=${read.sno}&userid=${member.userid}'">입찰</button>
         <button type="button" class="backBtn" onclick="history.go(-1)">돌아가기</button>
         <label for="closedate"><input type="hidden"  name="closedate" id="closedate" value="${read.closedate}" /> </label>                                      
                     
      </div>
         <script> 
            const countDownTimer = function (id, date) { 
               var _vDate = new Date(date); // 전달 받은 일자 
               var _second = 1000; 
               var _minute = _second * 60;
               var _hour = _minute * 60;
               var _day = _hour * 24;
               var timer; 
               
               function showRemaining() {
                  var now = new Date(); 
                  var distDt = _vDate - now; //여기에 opendate들어가야되고
                  if (distDt < 0) { 
                     clearInterval(timer); 
                     document.getElementById(id).textContent = '해당 이벤트가 종료 되었습니다!';//
                     $(document).ready(function(){                       
                        var formObj = $("form[name='readForm']");
                        var nowprice = document.getElementById("nowprice").value;                
                        nowprice = nowprice.trim();
                        if(nowprice==0 || nowprice==null ){
                           alert("해당 경매가 종료 되었습니다!");                  
                           formObj.attr("action", "/sangpoomc/statusupdate");
                           formObj.attr("method", "post");
                           formObj.submit();
                           
                        }else{             
                           // 낙찰 
                           alert("해당 경매가 종료 되었습니다!");
                           formObj.attr("action", "/sangpoomc/nakchal");
                           formObj.attr("method", "post");
                           formObj.submit();
                                
                        }//if end
                                   
                        })
                      return; 
                  }//if end
               
                  var days = Math.floor(distDt / _day); 
                  var hours = Math.floor((distDt % _day) / _hour);
                  var minutes = Math.floor((distDt % _hour) / _minute);
                  var seconds = Math.floor((distDt % _minute) / _second); 
               
                  //document.getElementById(id).textContent = date.toLocaleString() + "까지 : "; 
                  document.getElementById(id).textContent = days + '일 '; 
                  document.getElementById(id).textContent += hours + '시간 '; 
                  document.getElementById(id).textContent += minutes + '분 '; 
                  document.getElementById(id).textContent += seconds + '초'; 
               }//showRemaining() end
            
                timer = setInterval(showRemaining, 1000);
            }// countDownTimer end
            
                var closedate = document.getElementById("closedate").value;//2021/01/10 14:01:09 오후
                //alert(closedate);
                closedate=closedate.substring(0,19);                       //2021/01/10 14:01:09
                //alert(closedate);
               closedate=new Date(closedate);                             //2021/01/10 14:01:09날짜형 변환
               countDownTimer('sample01', closedate); 
               </script>
   </div>
</section>
</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>