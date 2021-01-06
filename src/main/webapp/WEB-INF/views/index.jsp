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
    <title>BOTION</title>
</head>

<body>
    <div class="wrapper">
        <!-- 네비게이션바 -->
        <nav class="navbar">
            <div id="navbartoggler" class="navbar__toggler">
                <span></span>
            </div>
            <div id="navbarlogo" class="navbar__logo">
                <a href="index.html" target="_self">
                    <img src="resources/images/4auction.png" height="110px" width="550px">
                </a>
            </div>
            <ul id="navbarmenu" class="navbar__menu">
                <li><a href="/sangpoomc/list">SHOP</a></li>
                <li><a href="/member/login">LOGIN</a></li>              
                <li><a href="/board/list">NOTICE</a></li>
                <li><a href="/sangpoomc/mypageView">MYPAGE</a></li>
                <li><a href="/sangpoom/writeView">SALEPAGE</a></li>
            </ul>
        </nav>
        <!-- 바텀네비게이션바 -->
        <nav class="bottom">
            <ul class="bottom__menu">
              <li><a href="/sangpoomc/list">SHOP</a></li>
                <li><a href="/member/login">LOGIN</a></li>
                <li><a href="/board/list">NOTICE</a></li>
                <li><a href="/sangpoomc/mypageView">MYPAGE</a></li>
                <li><a href="/sangpoom/writeView">SALEPAGE</a></li>
            </ul>
        </nav>
        <!-- 사이드바 -->
        <div class="sidebar">
            <ul class="sidebar__menu">
                <li><a href="">전체보기</a></li>
                <li><a href="">동양화</a></li>
                <li><a href="">서양화</a></li>
                <li><a href="">뭐로</a></li>
                <li><a href="">할까</a></li>
            </ul>
        </div>
        <div class="sidebar__overlay">
        </div>
        <!-- 메인 -->
        <div class="main">
            <div class="product">
                <div class="product__list">
                    <a href="" alt="FIGHT">
                        <div class="title">싸움</div>
                        <div class="image">
                            <img class="product__image" width="1000" height="1000" title="FIGHT" alt="FIGHT" src="resources/images/image1.jpg">
                        </div>
                    </a>
                </div>
                <div class="product__list">
                    <a href="" alt="CHINA">
                        <div class="title">중국</div>
                        <div class="image">
                            <img class="product__image" width="1000" height="1000" title="CHINA" alt="CHINA" src="resources/images/image5.jpg">
                        </div>
                    </a>
                </div>
                <div class="product__list">
                    <a href="" alt="STREET">
                        <div class="title">거리</div>
                        <div class="image">
                            <img class="product__image" width="1000" height="1000" title="STREET" alt="STREET" src="resources/images/image6.jpg">
                        </div>
                    </a>
                </div>
                <div class="product__list">
                    <a href="" alt="CAR">
                        <div class="title">자동차</div>
                        <div class="image">
                            <img class="product__image" width="1000" height="1000" title="CAR" alt="CAR" src="resources/images/image7.jpg">
                        </div>
                    </a>
                </div>
                <div class="product__list">
                    <a href="" alt="HIHI">
                        <div class="title">HIHI</div>
                        <div class="image">
                            <img class="product__image" width="1000" height="1000" title="HIHI" alt="HIHI" src="resources/images/image2.jpg">
                        </div>
                    </a>
                </div>
                <div class="product__list">
                  <a href="" alt="BOTTOM">
                      <div class="title">BOTTOM</div>
                      <div class="image">
                          <img class="product__image" width="1000" height="1000" title="BOTTOM" alt="BOTTOM" src="resources/images/image3.jpg">
                      </div>
                  </a>
              </div>
                <div class="product__list">
                  <a href="" alt="BOTTOM">
                      <div class="title">BOTTOM</div>
                      <div class="image">
                          <img class="product__image" width="1000" height="1000" title="BOTTOM" alt="BOTTOM" src="resources/images/image4.jpg">
                      </div>
                  </a>
              </div> 
            </div>
        </div>


        <!-- 푸터 -->
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
                    <li>© 2020-2021 4Aution.</li>
                    <li>SITE BY <a href="" target="_blank">4Aution</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>

</html>