<!-- header.jsp -->
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../resources/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script defer src="../resources/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- daum 도로명주소 찾기 api --> 
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <title>4Auction</title>
</head>

<body>
    <div class="wrapper">
        <!-- 네비게이션바 -->
        <nav class="navbar">
            <div id="navbartoggler" class="navbar__toggler">
                <span></span>
            </div>
            <div id="navbarlogo" class="navbar__logo">
                <a href="/" target="_self">
                    <img src="../resources/images/mainlogo.png" height="110px" width="550px">
                </a>
            </div>
            <ul id="navbarmenu" class="navbar__menu">
              <c:if test="${member == null}">
                <li><a href="/member/login">LOGIN</a></li>
              </c:if>                                      
                <li>
					<c:if test="${member != null}">
						<p><a href="/member/login">${member.userid}</a></p>
					</c:if>
				</li>
            </ul>
        </nav>
        <!-- 바텀네비게이션바 -->
        <nav class="bottom">
            <ul class="bottom__menu">
              <c:if test="${member == null}">
                <li><a href="/member/login">LOGIN</a></li>
               </c:if> 
                 <li>
					<c:if test="${member != null}">
						<p style="margin-top: 0px;
    							  margin-bottom: 0px;"><a href="/member/login">${member.userid}</a></p>
					</c:if>
				</li>
            </ul>
        </nav>
        <!-- 사이드바 -->
        <div class="sidebar">
            <ul class="sidebar__menu">
                <li><a href="/sangpoomc/list">SHOP</a></li>
                <li><a href="/board/list">NOTICE</a></li>
                <li><a href="/sangpoom/writeView">SALEPAGE</a></li> 
                <li><a href="/sangpoomc/wishlist">WISHLIST</a></li>
                <li><a href="/sangpoomc/mypageView">MYPAGE</a></li>
                <li><a href="/sangpoomc/nakchalView">낙찰페이지</a></li>              
            </ul>
        </div>
        <div class="sidebar__overlay">
        </div>
<!-- header.jsp end -->
        
        <!-- 메인 -->
        <div class="main">
            <div class="product">
                <div class="product__list">
                    <a href="" alt="MONARIZA">
                        <div class="title">모나리자</div>
                        <div class="image">
                            <img class="product__image" width="1000" height="1000" title="MONARIZA" alt="MONARIZA" src="resources/images/1monariza.jpg">
                        </div>
                    </a>
                </div>
                <div class="product__list">
                    <a href="" alt="FLOWER">
                        <div class="title">해바라기</div>
                        <div class="image">
                            <img class="product__image" width="1000" height="1000" title="FLOWER" alt="FLOWER" src="resources/images/2flower.jpg">
                        </div>
                    </a>
                </div>
                <div class="product__list">
                    <a href="" alt="SCREAM">
                        <div class="title">절규</div>
                        <div class="image">
                            <img class="product__image" width="1000" height="1000" title="SCREAM" alt="SCREAM" src="resources/images/3scream.jpg">
                        </div>
                    </a>
                </div>
                <div class="product__list">
                    <a href="" alt="CAT">
                        <div class="title">황묘농접</div>
                        <div class="image">
                            <img class="product__image" width="1000" height="1000" title="CAT" alt="CAT" src="resources/images/4cat.jpg">
                        </div>
                    </a>
                </div>
                <div class="product__list">
                    <a href="" alt="SSIRM">
                        <div class="title">씨름도</div>
                        <div class="image">
                            <img class="product__image" width="1000" height="1000" title="SSIRM" alt="SSIRM" src="resources/images/5ssirm.jpg">
                        </div>
                    </a>
                </div>
                <div class="product__list">
                  <a href="" alt="COW">
                      <div class="title">황소</div>
                      <div class="image">
                          <img class="product__image" width="1000" height="1000" title="COW" alt="COW" src="resources/images/6cow.jpg">
                      </div>
                  </a>
                </div>
                <div class="product__list">
                  <a href="" alt="APPLE">
                      <div class="title">사과와 오렌지</div>
                      <div class="image">
                          <img class="product__image" width="1000" height="1000" title="APPLE" alt="APPLE" src="resources/images/7apple.jpg">
                      </div>
                  </a>
                </div>
                <div class="product__list">
                  <a href="" alt="SELF">
                      <div class="title">프랜시스베이컨 자화상</div>
                      <div class="image">
                          <img class="product__image" width="1000" height="1000" title="SELF" alt="SELF" src="resources/images/8self.jpg">
                      </div>
                  </a>
                </div>
                <div class="product__list">
                  <a href="" alt="WATCH">
                      <div class="title">기억의 지속</div>
                      <div class="image">
                          <img class="product__image" width="1000" height="1000" title="WATCH" alt="WATCH" src="resources/images/9watch.jpg">
                      </div>  
                  </a>
                </div>
            </div>
        </div>


<!-- footer.jsp -->
        <div class="footer">
            <div class="footercompany">
                <ul class="info">
                    <li>주식회사 4Auction | 대표 4조 | 사업자번호 xxx-xx-xxxxx | 통신판매업 2020-서울시 종로구-03549</li>
                    <li>서울 종로구 종로12길 15 코아빌딩1</li>
                </ul>
                
                <ul class="util">
                    <li>+8210-1234-5678</li>
                    <li>CUSTOMER@4Auction.CO.KR</li>
                </ul>
                <ul class="util">
                    <li>© 2020-2021 4Auction</li>
                    <li>SITE BY <a href="" target="_blank">4Auction</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>

</html>
<!-- footer.jsp end -->