<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>

<style>
fieldset {
   border: none;
    vertical-align: top;
}
.main {
   width: 100%;
    max-width: 500px;
    margin: 0 auto;
    padding: 20px 0 50px 0;
}
.listSangpoomWrite {
   height: 35px;
    margin: 0 auto;
    font-size: 13px;
    text-align: center;
    line-height: 25px;
}
.navList .navWriteView {
   position: relative;
    width: 50%;
    float: left;
    display: inline-block;
    padding: 4px 0;
    color: #000;
    font-weight: normal;
}
.listSangpoomWrite .navList:nth-child(2):before {
   display: block;
    content: "";
    position: absolute;
    top: 11px;
    left: 0;
    width: 1px;
    height: 13px;
    background: #ddd;
}
.listSangpoomWrite .navList {
   position: relative;
    width: 50%;
    float: left;
    display: inline-block;
    padding: 4px 0;
    color: #000;
    font-weight: normal;
}

input[type=text], [type=submit], textarea {
   width: 100%;
   padding: 10px;
    margin: 0 0 7px;
    font-size: 13px;
    line-height: 13px;
    font-weight: inherit;
    color: #353535;
    border: 1px solid #d7d5d5;
    border-radius: 0px;
    outline-style: none;
    box-sizing: border-box;
}
#scontent {
   height: 200px;
}
.locationHidden {
   display: hidden;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
   var formObj = $("form[name='writeForm']");
   $(".writeBtn").on("click", function(){
      if(fn_valiChk()){
         return false;
      }
      formObj.attr("action", "/sangpoom/write");
      formObj.attr("method", "post");
      formObj.submit();
      
      
   });
})
function fn_valiChk_write(){
   var regForm = $("form[name='writeForm'] .chk").length;
   for(var i = 0; i<regForm; i++){
      if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
         alert($(".chk").eq(i).attr("title"));
         return true;
      }
   }
}
</script>
<!--  본문 시작   template.jsp-->
<fieldset>
   <div class="main">
   <div class="listSangpoomWrite">
      <%@ include file="nav.jsp"%>   
   </div>
   
      <form name="writeForm" method="post" action="/sangpoom/write" enctype="multipart/form-data">
         <c:if test="${member.grade == 'MASTER'}">
            <input type="text" id="sname" name="sname" class="chk" placeholder="작품명" title="작품명을 입력하세요"/>
            <input type="text" id="sartist" name="sartist" class="chk" placeholder="작가명" title="작가명을 입력하세요"/>
            <input type="text" id="syear" name="syear" class="chk" placeholder="제작년도" title="제작년도를 입력하세요"/>
            <input type="text" id="stype" name="stype" class="chk" placeholder="작품종류" title="작품종류를 입력하세요"/>
            <input type="text" id="ssize" name="ssize" class="chk" placeholder="작품크기" title="작품크기를 입력하세요"/>
            <textarea id="scontent" name="scontent" class="chk" placeholder="작품내용" title="작품내용을 입력하세요"/></textarea>
            <input type="file" id="img" name="file" />
            <div class="select_img"><img src="" /></div>
            
            <div class="locationHidden">
               <%=request.getRealPath("/")%>
            </div> 
            
            <script type="text/javascript">
            $("#img").change(function(){
                  if(this.files && this.files[0]) {
                   var reader = new FileReader;
                   reader.onload = function(data) {
                    $(".select_img img").attr("src", data.target.result).width(500);        
                   }
                   reader.readAsDataURL(this.files[0]);
                   }
            });
            </script>
            <input type="text" id="startprice" name="startprice" class="chk" placeholder="시작가" title="시작가를 입력하세요"/>               
            <button type="submit" class="writeBtn">등록</button>
         </c:if>
      
         <c:if test="${member.grade != 'MASTER'}">
         <script>
               alert("관리자페이지입니다!");
               location.href='/';
         </script>
         </c:if>
      </form>
   </div>
</fieldset>
<!--  본문 끝   -->
<%@ include file="../footer.jsp"%>