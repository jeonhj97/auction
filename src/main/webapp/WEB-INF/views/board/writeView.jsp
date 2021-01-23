<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<script type="text/javascript">
$(document).ready(function(){
	var formObj_board = $("form[name='writeForm']");
	$(".write_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj_board.attr("action", "/board/write");
		formObj_board.attr("method", "post");
		formObj_board.submit();
		
		
	});
})
function fn_valiChk(){
	var regForm_board = $("form[name='writeForm'] .chk").length;
	for(var i = 0; i<regForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
			return true;
		}
	}
}
</script>

<style>
  h2{
    margin-block-end: 0.83em;
    margin-bottom: 16px;
    }
  #headerW{
      border-bottom: 1px solid #323232;
      margin-top: 20px;
      position: relative;
    }
    
  #title{
  height: 40px;
  weight: 40%;
  margin-right: 24%;
  }
  .writeview1{
      width: 80%;
    margin: auto;
  }
  .content1{
  padding-top:20px;
  padding-bottom:20px;
  }
  #boardbtn{
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
    /* 생략 */
  margin: 0;
  padding: 0.5rem 1rem;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  width: auto;
  border: none;
  border-radius: 4px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  background-color: red;
  color: white;
  height: 40px;
  line-height: 28px;
  }
</style>
<c:if test="${member.userid == null}">
	<p>로그인 후에 작성하실 수 있습니다.</p>
	<button type="button" onclick="location.href='/member/login'">로그인</button>
</c:if>	
<div class="main">
<div>
	<%@include file="nav_board.jsp" %>
</div>
<form name="writeForm" role="form" method="post" action="/board/write">
  <div class="writeview1">
    <div class="headerW">
      <h2 class="title">
        글쓰기
      </h2>
    </div>
					<input type="hidden" id="userid" name="userid" value="${member.userid}"/>
					<input type="hidden" id="boardimg" name="boardimg" value="img"/>
					<div class="title">
					<input placeholder="제목을 입력해 주세요." type="text" id="title" name="title" class="chk" style="width:50%;height:30px;font-size:15px;background-color:#f8f9fa;"/>
					<button id="boardbtn" type="submit" class="write_btn">작성</button>
					</div>
					<div class="content1">
					<textarea placeholder="내용을 입력해 주세요." id="content" name="content" class="chk" style="width:80%;height:500px;font-size:15px;" wrap="off"></textarea>
					</div>
  </div>

</form>
	

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>





