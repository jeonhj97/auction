<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->

<span style="color: green; font-weight: bold;">변경할 비밀번호를 입력해주세요.</span> <br> <br>    
        <br> <br>
        
        
        <div style="text-align:center;">
                <center>
                    <form action="findPw ${e_mail}" method="post">
                    
                        <br>
                        <div>
                            변경할 비밀번호 입력 : <input type = "number" name = "member_pass"
                                                  placeholder = "비밀번호를 입력하세요." >
                        </div>                                        
 
                        <br> <br>
                        <button type="submit" name="submit">비밀번호 변경</button>
 
        			</form>
                    </center>
                        </div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



