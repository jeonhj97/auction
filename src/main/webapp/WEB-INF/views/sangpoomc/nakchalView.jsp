<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<style>
ul#nakchal_ul{
	
}



li#nakchallist{
	position: relative;
    padding: 20px 0;
    border-bottom: 1px solid #d6d6d6;
}



#sangpoomcListImg {
	width: 200px;
  	height: 200px;
  	vertical-align: middle;
}

figure{
      float: left;
    width: 260px;
    height: 260px;
    line-height: 260px;
    text-align: center;
    margin-right: 20px;

}





section#nakchal_stat{
	overflow: hidden;
    width: 450px;
    margin-right: 20px;

}

article.main_sno>p{

	font-size: 30px;
    line-height: 34px;
    font-weight: 600;
    margin-bottom: 20px;
}

section#nakchal_sub{
	padding-bottom: 19px;
    margin-bottom: 70px;

}


dt{
	width: 103px;
    height: 24px;
    border: 1px solid #ccc;
    background: #fcfcfc;
    color: #666;
    font-size: 14px;
    font-weight: 600;
    line-height: 24px;
    text-align: center;
    float: left;
    margin-right: 20px;
}


dd{
	overflow: hidden;
    font-size: 18px;
    line-height: 26px;
    color: #666;
}




article#main_sno{
	display: block;
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}



    





</style>
<div class="main">  
<section id="container">
<form name="nakchalForm" method="get" >
				
			<c:if test="${member != null}">													
						
						<ul id="nakchal_ul">	
							<c:forEach items="${nakchallist}" var = "nakchallist">					
							<li id="nakchallist">
								<a>
									<figure>
										<img id="sangpoomcListImg" src="${nakchallist.nakimg}"/>
									</figure>
									
									
									
									
									<section id="nakchal_stat">										
										<article class="main_sno">
											<p><c:out value="${nakchallist.sno}" /></p>								
										</article>
									</section>									
									
								</a>		
									
									
									
									
									<section id="nakchal_sub">
										<dl>
											
											<dd>
												<c:out value="${nakchallist.sname}" /><input type="hidden" id="nakprice" name="nakprice" value="${nakchallist.nakprice}">
											</dd>
										</dl>
										<dl>
											<dt>낙찰가</dt>
											<dd>
												<span>KRW</span> <c:out value="${nakchallist.nakprice}" /><input type="hidden" id="nakprice" name="nakprice" value="${nakchallist.nakprice}">
											</dd>
										</dl>
										<dl>
											<dt>낙찰자</dt>
											<dd>
												<c:out value="${member.userid}" />	
											</dd>									
										</dl>
										<dl>
											<dt>낙찰일자</dt>	
											<dd>									
												<fmt:formatDate value="${nakchallist.nakdate}" pattern="yyyy-MM-dd"/>								
											</dd>
										</dl>
									</section>													
							</li>	
							</c:forEach>																				
						</ul>		
						
								
								
							
						</c:if>	
						<c:if test="${member == null}">
								<script>
										alert("로그인을 해주세요");
										location.href='/member/login';
								</script>
						</c:if>										
						<div>
							  <ul>
							    <c:if test="${pageMaker.prev}">
							    	<li><a href="nakchalView${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
							    </c:if> 
							
							    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    	<li><a href="nakchalView${pageMaker.makeQuery(idx)}">${idx}</a></li>
							    </c:forEach>
							
							    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							    	<li><a href="nakchalView${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
							    </c:if> 
							  </ul>
						</div>
</form>
</section>

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>




