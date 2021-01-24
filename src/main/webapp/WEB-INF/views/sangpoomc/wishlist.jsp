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
.wishlistWrap {
	width: 100%;
    max-width: 925px;
    margin: 0 auto;
    margin-bottom: 200px;
    padding: 0 0 50px 0;
}
#wishlistUl{
	padding: 0 40px;
	margin: 0 auto;
}
#wishlistLi {
	position: relative;
    padding: 20px 0;
    border-bottom: 1px solid #d6d6d6;
}
.wishlist a {
	display: block;
    float: left;
}
.wishlist figure {
	float: left;
    width: 120px;
    height: 120px;
    line-height: 120px;
    text-align: center;
    margin-right: 20px;
}
.wishlist figure img {
	max-width: 100%;
    max-height: 100%;
    vertical-align: top;
}
.wishlist .information {
	overflow: hidden;
    width: 450px;
    margin-right: 20px;
}
.wishlist .information .articleMain p {
	color: #333;
}
.wishlist .sno {
	font-size: 30px;
    line-height: 34px;
    font-weight: 600;
    margin-bottom: 20px;
    position: relative;
}
.wishlist .sname {
	font-size: 36px;
    line-height: 46px;
    font-weight: 800;
}
.wishlist .wishinfo {
    overflow: hidden;
    padding: 10px 0;
}

.wishlist .wishinfo dl {
    margin: 15px 0;
}
.wishlist .wishinfo dt {
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
.wishlist .wishinfo dd {
	overflow: hidden;
    font-size: 18px;
    line-height: 26px;
    color: #666;
}
</style>

<h2>장바구니 확인</h2>
<div class="main">
<div class="wishlistWrap">
	<form name="wishlist" method="get" >
		<ul id="wishlistUl">
			<div class="wishlist">
				<c:if test="${member != null}">
				<c:forEach items="${wishlist}" var = "wishlist">
				<li id="wishlistLi">
					<a href="/sangpoomc/readView?sno=${list.sno}" class="wishlistBtn">
						<figure>
							<a href="/sangpoomc/readView?sno=${wishlist.sno}"><img id="sangpoomcListImg" src="${wishlist.wishimg}"/></a>
						</figure>
						<section class="information">
							<article class="articleMain">
								<p class="sno"><c:out value="${wishlist.sno}" /></p>
								<p class="sname"><c:out value="${wishlist.sname}" /></p>
							</article>
						</section>
					</a>
						<section class="wishinfo">
							<dl class="wishNum">
								<dt>찜번호</dt>
								<dd>
									<c:out value="${wishlist.cno}" />
								</dd>
							</dl>
							<dl class="wishId">
								<dt>아이디</dt>
								<dd>
									<c:out value="${member.userid}" />
								</dd>
							</dl>
						</section>
				</li>
					<form name="form2" method="post" action="/sangpoomc/wishinsert">
						<input type="hidden" name="sno" value="${wishlist.sno}"/>
						<input type="hidden" name="userid" value="${member.userid}"/>
					</form>
				</c:forEach>
				</c:if>
				</div> <!-- wishlist end -->
		</ul> <!-- wishlistUl end -->
		<c:if test="${member == null}">
			<script>
				alert("로그인을 해주세요");
				location.href='/member/login';
			</script>
		</c:if>
		
	</form> <!-- wishlist end -->
	
</div> <!-- wishlistWrap end -->
</div> <!-- main end -->

<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



