<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>   

<!--  본문 시작   template.jsp-->
<style>
p, dl, dt, dd {
   margin: 0;
   padding: 0;
   border: 0;
}
#sangpoomcListUl {
   width: auto;
    margin: 0 auto;
    padding: 9px 0 0 0;
}
.sangpoomcListLi {
   width: 19%;
    /*height: 600px !important;*/
    display: inline-block;
    border: 1px solid #e2e2e2;
    background: #fcfcfc;
    padding: 10px;
    box-sizing: border-box;
    margin: 0 0.5% 9px 0.5%;
    float: left;
    transition: box-shadow .3s;
}
figure {
   width: 100%;
    height: 250px;
    line-height: 250px;
    text-align: center;
    display: block;
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    vertical-align: baseline;
}
figure img {
   max-width: 100%;
    max-height: 230px;
}
.information .articleMain p {
   color: #333;
    line-height: 35px;
    min-height: 35px;
}
.sno {
   font-size: 22px;
    font-weight: 600;
}
.sname {
   font-size: 26px;
    font-weight: 600;
}
.sartist {
   font-size: 18px;
}
article + article {
    border-top: 1px solid #e1e1e1;
}
.articleSub {
   padding: 7px 0;
    min-height: 40px;
}
.information .articleSub p {
   color: #666;
    font-size: 14px;
    line-height: 20px;
}
.sangpoomList p, .sangpoomList dt {
   overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.articleSub .syear {
   float: left;
}
.articleSub .syear + p:before {
   content: '|';
    color: #ccc;
    margin: 0 5px;
}
.price {
   height: auto !important;
    border-top: 1px solid #898989;
}
.price dt, .price dd {
   color: #666;
    font-size: 14px;
    line-height: 15px;
    padding: 7px 0 7px;
}
.price dl + dl {
   border-top: 1px solid #e1e1e1;
   padding: 5px 0;
}
.startPrice {
   padding: 5px 0;
}
.price dt {
   float: left;
    width: 78px;
    padding-left: 2px;
}
.KRW {
   display: inline;
}
.price dd {
   overflow: hidden;
    text-align: right;
}
.nowPrice dt, .nowPrice dd {
   color: #e5410e;
}
.bidding {
   padding-top: 10px;
    padding-bottom: 10px;
    border-top: 1px solid #898989;
}
.bidding dt, .bidding dd {
   float: left;
    line-height: 34px;
    font-weight: 600;
    color: #333;
    margin-right: 3px;
}



#wish_icon{
	float: right;

	    position: absolute;
    	top: 489px;
}













</style>





<div class="main">
   <div class="sangpoomcListWrap">
      <ul id="sangpoomcListUl">
         <div class="sangpoomcList">
          
               <c:forEach items="${list}" var = "list">
               
                  <li class="sangpoomcListLi">
                  	 	  	
                  	 	<span>
                  	 		<form name="form1" method="post" action="/sangpoomc/wishinsert">
	                  	 		<input type="hidden" name="userid" value="${member.userid}"/>
	      					 	<input type="hidden" name="sno" value="${list.sno}"/>	      					 	         							         				 	
	         				 	<input  TYPE="IMAGE" src="../resources/images/zzimhagi.png" id="wish_icon" name="Submit" value="Submit"  align="absmiddle">      				 
         				 	</form> 
         				 </span>
                  	 	
                  	 	
<script>
function setMemWishinfo(){
	
	if(${member}==null){
	alert("로그인이 필요합니다");
	location.href="/member/login";
	}//if end
	
	var formObj_board = $("form[name='form1']");
	
		
		
		
	
	
	
	$("#wish_icon_submit").click(function(){	   
		formObj_board.attr("action", "/sangpoomc/wishinsert");
		formObj_board.attr("method", "post");
		formObj_board.submit();
		
				
        
}); 
	
	
	
	
}//setMemWifhinfo() end


</script>          				 		
        				
                  	
                     <a href="/sangpoomc/readView?sno=${list.sno}" class="sangpoomcViewBtn">
                        <figure>
                           <img id="sangpoomcListImg" src="${list.img}">
                        </figure>
                        <section class="information">
                       
                           <article class="articleMain">
                              <P class="sno"><c:out value="${list.sno}" /></p>
                              <p class="sname"><c:out value="${list.sname}" /></p>
                              <p class="sartist"><c:out value="${list.sartist}" /></p>
                           </article>
                           <article class="articleSub">
                           	 
                           	 	
                           	 	<%-- <form name="form1" method="post" action="/sangpoomc/wishinsert">
          							<input type="hidden" name="userid" value="${member.userid}"/>
       					 			<input type="hidden" name="sno" value="${list.sno}"/>
          				 			<input type="image" id="zzimhagi" src="../resources/images/zzimhagi.png">
          				 		</form>   --%>
          				 		
          				 	
          				 	
                           	 	
                           	 	
                           	 
                              <P class="syear"><c:out value="${list.syear}" /></p>
                              <P class="stype"><c:out value="${list.stype}" /></p>
                              <P class="ssize"><c:out value="${list.ssize}" /></p>
                           </article>
                        </section>
                    
                        <section class="price">
                           <dl class="startPrice">
                           <dt>시작가</dt>
                              <dd>
                                 <span class="KRW">KRW</span>
                                 <c:out value="${list.startprice}" />
                              </dd>
                           </dl>
                           <dl class="nowPrice">
                           <dt>현재가</dt>
                              <dd>
                                 <span class="KRW">KRW</span>
                                 <c:out value="${list.nowprice}" />
                              </dd>
                           </dl>
                        </section>
                        <section class="bidding">
                           <dl>
                              <dt class="openDate">등록일x 마감o</dt>
                              <dd><fmt:formatDate value="${list.opendate}" pattern="yyyy-MM-dd"/></dd>
                           </dl>
                           <button type="button" class="ipchalBtn" onclick="location.href='/sangpoomc/ipchalView?sno=${read.sno}&userid=${member.userid}'">입찰</button>
                        </section>
                     
                  </li>
               </c:forEach>
            </form>
         </div>
      </ul>
   </div>
</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



