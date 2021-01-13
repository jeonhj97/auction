<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
    <h2>회원 목록</h2>
    <input type="button" value="회원등록" onclick="location.href='${path}/member/register'">
    <table border="1" width="700px">
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>이메일</th>
            <th>생년월일</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>${row.userid}</td>
            <!-- 회원정보 상세조회를 위해 a태그 추가 -->
            <td><a href="${path}/member/memberView?userid=${row.userid}">${row.uname}</a></td>
            <td>${row.email}</td>
            <td>${row.birth}</td>
        </tr>
        </c:forEach>
    </table>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



