<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<style>

span, p, img, dl, dt, dd, fieldset, form, tr, th, td {
	margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    list-style: none;
    line-height: 1;
}
section, article, figure {
	display: block;
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
p, dl, dt, dd {
	margin: 0;
	padding: 0;
	border: 0;
}
.nakchalViewWrap {
	width: 100%;
    max-width: 925px;
    margin: 0 auto;
    margin-bottom: 200px;
    padding: 0 0 50px 0;
}
#nakchalViewUl{
	padding: 0 40px;
	margin: 0 auto;
}
#nakchalViewLi {
	position: relative;
    padding: 20px 0;
    border-bottom: 1px solid #d6d6d6;
}
.nakchalView a {
	display: block;
    float: left;
}
.nakchalView figure {
	float: left;
    width: 120px;
    height: 120px;
    line-height: 120px;
    text-align: center;
    margin-right: 20px;
}
.nakchalView figure img {
	max-width: 100%;
    max-height: 100%;
    vertical-align: top;
}
.nakchalView .information {
	overflow: hidden;
    width: 450px;
    margin-right: 20px;
}
.nakchalView .information .articleMain p {
	color: #333;
}
.nakchalView .sno {
	font-size: 30px;
    line-height: 34px;
    font-weight: 600;
    margin-bottom: 20px;
    position: relative;
}
.nakchalView .sname {
	font-size: 36px;
    line-height: 46px;
    font-weight: 800;
}
.nakchalView .nakchal {
    overflow: hidden;
    padding: 10px 0;
}
.nakchalView .nakchal dl + dl {
	margin-top: 10px;
}
.nakchalView .nakchal dt {
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
.nakchalView .nakchal dd {
	overflow: hidden;
    font-size: 18px;
    line-height: 26px;
    color: #666;
}
.nakchalView .nakprice dt,
.nakchalView .nakprice dd {
	color: #e5410e;
    font-weight: 600;
}
.nakchalView .nakprice .KRW {
	display: inline-block;
    min-width: 40px;
    font-size: 16px;
}
</style>
<div class="main">
<div class="nakchalViewWrap">
	<form name="nakchalForm" method="get" >
		<ul id="nakchalViewUl">
			<div class="nakchalView">
				<c:if test="${member != null}">
				<c:forEach items="${nakchallist}" var = "nakchallist">					
					<li id="nakchalViewLi">
						<a href="/sangpoomc/readView?sno=${list.sno}" class="nakchalViewBtn">
							<figure>
								<img id="sangpoomcListImg" src="${nakchallist.nakimg}"/>
							</figure>
							<section class="information">										
								<article class="articleMain">
									<p class="sno"><c:out value="${nakchallist.sno}" /></p>
									<p class="sname"><c:out value="${nakchallist.sname}" /><input type="hidden" id="nakprice" name="nakprice" value="${nakchallist.nakprice}"></p>
								</article>
							</section>
						</a>
							<section class="nakchal">
								<dl class="nakId">
									<dt>낙찰자</dt>
									<dd>
										<c:out value="${member.userid}" />
									</dd>
								</dl>
								<dl class="nakdate">
									<dt>낙찰일</dt>	
									<dd>									
										<fmt:formatDate value="${nakchallist.nakdate}" pattern="yyyy-MM-dd"/>
									</dd>
								</dl>
								<dl class="nakprice">
								<dt>낙찰가</dt>
									<dd>
										<span class="KRW">KRW</span>
										<c:out value="${nakchallist.nakprice}" /><input type="hidden" id="nakprice" name="nakprice" value="${nakchallist.nakprice}">
									</dd>
								</dl>
							</section>
					</li>
				</c:forEach>
				</c:if>	
						<div class="pageMaker">
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
						</div> <!-- pageMaker end -->
					</div> <!-- nakchalView end -->
				</ul> <!-- nakchalViewUl end -->
		</form> <!-- nakchalForm end -->
		
	<c:if test="${member == null}">
		<script>
			alert("로그인을 해주세요");
			location.href='/member/login';
		</script>
	</c:if>
	
</div> <!-- nakchalViewWrap end -->
</div> <!-- main end -->
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>




