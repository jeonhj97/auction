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