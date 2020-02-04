<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
  
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='./list.do?categrpno=${notice_categrpVO.categrpno }'>${notice_categrpVO.name }</A> >
    신규 등록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?categrpno=${param.categrpno }&nowPage=${param.nowPage}'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
               
      <!-- FK memberno 지정 -->
      <input type='hidden' name='membersno' id='membersno' value='${sessionScope.membersno }'>
      <!-- FK categrpno 지정 -->
      <input type='hidden' name='categrpno' id='categrpno' value='${param.categrpno }'>
      <input type='hidden' name='nowPage' value='${param.nowPage }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-lg" name='title' value='' placeholder="제목" required="required" style='width: 80%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control input-lg" name='content' id='content' rows='10' placeholder="내용"></textarea>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-lg" name='word'  value='' placeholder="검색어">
        </div>
      </div>

      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">등록</button>
        <button type="button" 
                    onclick="location.href='./list.do?categrpno=${param.categrpno}&nowPage=${param.nowPage}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  