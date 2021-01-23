<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>	
<!--  본문 시작   template.jsp-->
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(".cancel_btn").on("click", function(){
		event.preventDefault();
		location.href = "/board/readView?boardno=${update.boardno}"
			   + "&page=${scri.page}"
			   + "&perPageNum=${scri.perPageNum}"
			   + "&searchType=${scri.searchType}"
			   + "&keyword=${scri.keyword}";
	})
	
	$(".update_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "/board/update");
		formObj.attr("method", "post");
		formObj.submit();
	})
})
	
function fn_valiChk(){
	var updateForm = $("form[name='updateForm'] .chk").length;
	for(var i = 0; i<updateForm; i++){
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
  margin-right: 20%;
  }
  .writeview1{
      width: 80%;
    margin: auto;
  }
  .content1{
  padding-top:20px;
  padding-bottom:20px;
  }
  .update_btn, .cancel_btn{
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
  .cancel_btn{
  background-color: #323232;;
  color: white;
  }
</style>
<div class="main">
	<div>
		<%@include file="nav_board.jsp" %>
	</div>
	<form name="updateForm" role="form" method="post" action="/board/update">
  		<div class="writeview1">
    		<div class="headerW">
      			<h2 class="title">
        			게시물 수정
      			</h2>
    		</div>
    			<input type="hidden" name="boardno" value="${update.boardno}"/>
				<input type="hidden" id="userid" name="userid" value="${update.userid}"/>
				<input type="hidden" id="boardimg" name="boardimg" value="${update.boardimg}"/>
				
				<div class="title">
					<input type="text" id="title" name="title" class="chk" value="${update.title}" style="width:50%;height:30px;font-size:15px;background-color:#f8f9fa;"/>
					<button id="update_btn" type="submit" class="update_btn">저장</button>
					<button type="submit" class="cancel_btn">취소</button>
				</div>
				<div class="content1">
					<textarea id="content" name="content" class="chk" style="width:80%;height:500px;font-size:15px;" wrap="off"><c:out value="${update.content}" /></textarea>
				</div>
  		</div>
				
					
				</form>
			

</div>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>



