<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
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
.mypageViewWrap {
	width: 100%;
    max-width: 925px;
    margin: 0 auto;
    margin-bottom: 200px;
    padding: 0 0 50px 0;
}
#mypageViewUl{
	padding: 0 40px;
	margin: 0 auto;
}
#mypageViewLi {
	position: relative;
    padding: 20px 0;
    border-bottom: 1px solid #d6d6d6;
}
.mypageView a {
	display: block;
    float: left;
}
.mypageView figure {
	float: left;
    width: 120px;
    height: 120px;
    line-height: 120px;
    text-align: center;
    margin-right: 20px;
}
.mypageView figure img {
	max-width: 100%;
    max-height: 100%;
    vertical-align: top;
}
.mypageView .information {
	overflow: hidden;
    width: 450px;
    margin-right: 20px;
}
.mypageView .information .articleMain p {
	color: #333;
}
.mypageView .sno {
	font-size: 30px;
    line-height: 34px;
    font-weight: 600;
    margin-bottom: 20px;
    position: relative;
}
.mypageView .sname {
	font-size: 36px;
    line-height: 46px;
    font-weight: 800;
}
.mypageView .ipchal {
    overflow: hidden;
    padding: 10px 0;
}
.mypageView .ipchal dl + dl {
	margin-top: 10px;
}
.mypageView .ipchal dt {
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
.mypageView .ipchal dd {
	overflow: hidden;
    font-size: 18px;
    line-height: 26px;
    color: #666;
}
.mypageView .ipprice dt,
.mypageView .ipprice dd {
	color: #e5410e;
    font-weight: 600;
}
.mypageView .ipprice .KRW {
	display: inline-block;
    min-width: 40px;
    font-size: 16px;
}
</style>
<!--  본문 시작   template.jsp-->
<div class="main">
<div class="mypageViewWrap">
	<form name="mypageForm" method="get" >
		<ul id="mypageViewUl">
			<div class="mypageView">
				<c:if test="${member != null}">
				<c:forEach items="${ipchallist}" var = "ipchallist">
					<li id="mypageViewLi">
					<a href="/sangpoomc/readView?sno=${list.sno}" class="mypageViewBtn">
						<figure>
							<a href="/sangpoomc/readView?sno=${ipchallist.sno}"><img id="sangpoomcListImg" src="${ipchallist.selectimg}"/></a>
						</figure>
						<section class="information">
							<article class="articleMain">
								<p class="sno"><c:out value="${ipchallist.sno}" /></p>
								<p class="sname"><c:out value="${ipchallist.sname}" /></p>
							</article>
						</section>
					</a>
						<section class="ipchal">
								<dl class="ipno">
								<dt>입찰번호</dt>
									<dd>
										<c:out value="${ipchallist.ipno}" />
									</dd>
								</dl>
								<dl class="ipdate">
								<dt>입찰일</dt>
									<dd>
										<fmt:formatDate value="${ipchallist.ipdate}" pattern="yyyy-MM-dd"/>
									</dd>
								</dl>
								<dl class="ipprice">
								<dt>입찰가</dt>
									<dd>
										<span class="KRW">KRW</span>
										<c:out value="${ipchallist.ipprice}" />
									</dd>
								</dl>
						</section>
					</li>
				</c:forEach>
				</c:if>	
						<div class="pageMaker">
							  <ul>
							    <c:if test="${pageMaker.prev}">
							    	<li><a href="ipchalPageView${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
							    </c:if> 
							
							    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    	<li><a href="ipchalPageView${pageMaker.makeQuery(idx)}">${idx}</a></li>
							    </c:forEach>
							
							    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							    	<li><a href="ipchalPageView${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
							    </c:if> 
							  </ul>
						</div> <!-- pageMaker end -->
					</div> <!-- mypageView end -->
				</ul> <!-- mypageViewUl end -->
		</form> <!-- mypageForm end -->
	
	<c:if test="${member == null}">
		<script>
			alert("로그인을 해주세요");
			location.href='/member/login';
		</script>
	</c:if>	

</div> <!-- mypageViewWrap end -->
</div> <!-- main end -->
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



