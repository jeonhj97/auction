<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<div class="main">  

   <!-- 로그인 -->
        <div class="loginfull">
            <form>
                <div class="login">
                    <div class="loginWrap">
                        <fieldset>
                            <div class="formBox">
                                <div class="form">
                                    <input id="member_id" name="member_id" type="text" placeholder="아이디">
                                    <input id="member_password" name="member_password" type="password" placeholder="비밀번호">
                                </div>
                                <div class="option">
                                    <span class="auto"></span>
                                    <input id="use_login_keeping0" name="use_login_keeping" fw-filter="" fw-label="로그인상태유지" fw-msg="" onclick="MemberAction.confirmLoginKeeping(this);" value="T" type="checkbox">
                                    <label for="use_login_keeping0">로그인 상태 유지</label>
                                    <span class="save"></span>
                                </div>
                                <div class="loginbtn">
                                    <button type="button" class="btnSubmit" onclick="MemberAction.login('member_form_6519139593'); return false;">로그인</button>
                                    <!--<a href="" onclick="" class="btnEm displaynone">비회원 구매</a>-->
                                </div>
                                <div class="loginUtil">
                                    <a href="/member/id/find_id.html" class="btnLogin2">아이디찾기</a>
                                    <a href="/member/passwd/find_passwd_info.html" class="btnLogin">비밀번호찾기</a>
                                    <a href="join.html" class="btnLogin">회원가입</a>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </form>
            <div class="nomember-login">
                <a href="" id="nomember-login">비회원 주문조회</a>
            </div>
        </div>

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



