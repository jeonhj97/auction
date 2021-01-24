


							
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	

<!--  본문 시작   template.jsp-->
<style>
.main {
	width: auto;
    padding: 0 0 40px 0;
    margin: 0 40px;
}
.listSangpoomWrite {
	width: 100%;
    max-width: 500px;
    padding: 20px 0 0 0;
    height: 35px;
    margin: 0 auto;
    font-size: 13px;
    text-align: center;
    line-height: 25px;
}
.navList .navWriteView {
   position: relative;
    width: 50%;
    float: left;
    display: inline-block;
    padding: 4px 0;
    color: #000;
    font-weight: normal;
}
.listSangpoomWrite .navList:nth-child(2):before {
   display: block;
    content: "";
    position: absolute;
    top: 11px;
    left: 0;
    width: 1px;
    height: 13px;
    background: #ddd;
}
.listSangpoomWrite .navList {
   position: relative;
    width: 50%;
    float: left;
    display: inline-block;
    padding: 4px 0;
    color: #000;
    font-weight: normal;
}
#sangpoomListUl {
	width: auto;
    margin: 0 auto;
    padding: 9px 0 0 0;
}
.sangpoomListLi {
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
    vertical-align: middle;
}
</style>
<div class="main">
<div class="listSangpoomWrite">
	<%@ include file="nav.jsp"%>   
</div>
	<div class="sangpoomListWrap">
		<div class="sangpoomList">
			<form role="form" method="post" action="/sangpoom/write">
				<ul id="sangpoomListUl">
					<c:if test="${member.grade == 'MASTER'}">
						<c:forEach items="${list}" var = "list">
						
							<li class="sangpoomListLi">
								<a href="/sangpoom/readView?sno=${list.sno}" class="sangpoomViewBtn">
									<figure>
										<img id="sangpoomListImg" src="${list.img}">
									</figure>
									<section class="information">
										<article class="articleMain">
											<P class="sno"><c:out value="${list.sno}" /></p>
											<p class="subject"><c:out value="${list.sname}" /></p>
										</article>
										<article class="articleSub">
										</article>
									</section>
								</a>
									<section class="price">
										<p class="startPrice">시작가 <c:out value="${list.startprice}" /></p>
									</section>
									<section class="date">
										<p class="openDate">등록일 <fmt:formatDate value="${list.opendate}" pattern="yyyy-MM-dd"/></p>
									</section>
								
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${member.grade != 'MASTER'}">
						<script>
								alert("관리자페이지입니다!");
								location.href='/';
						</script>
					</c:if>
				</ul>
			</form>
		</div>
	</div>
</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>


							




