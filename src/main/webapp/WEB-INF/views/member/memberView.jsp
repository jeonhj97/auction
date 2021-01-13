<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
 <h2>회원정보 상세</h2>
    <form name="form1" method="post">
        <table border="1" width="400px">
            <tr>
                <td>아이디</td>
                 <!-- id는 수정이 불가능하도록 readonly속성 추가 -->
                <td><input name="userId" value="${dto.userid}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>이름</td>

                <td><input name="userName" value="${dto.uname}"></td>
            </tr>

            <tr>
                <td>이메일</td>

                <td><input name="email" value="${dto.email}"></td>
            </tr>
            <tr>
                <td>전화번호</td>

                <td><input name="phone" value="${dto.phone}"></td>
            </tr>
            <tr>
                <td>주소1</td>
                <td>
                    <input name="addr1" value="${dto.addr1}"/>
                </td>
            </tr>
            <tr>
                <td>주소2</td>
                <td>
                    <input name="addr2" value="${dto.addr2}"/>
                </td>
            </tr>
            <tr>
                <td>생일</td>
                <td>
                    <input name="birth" value="${dto.birth}"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="수정" id="btnUpdate">
                    <input type="button" value="삭제" id="btnDelete">
                </td>
            </tr>
        </table>
    </form>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



