<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='../product_categrp/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?productcateno=${productcategrpVO.productcateno }'>${categrpVO.name }</A> >
    신규 등록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?categrpno=${param.productcateno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' 
               enctype="multipart/form-data" class="form-horizontal">
               
      <!-- FK categrpno 지정 -->
      <input type='hidden' name='productcateno' id='productcateno' value='${param.productcateno }'>
      <input type='hidden' name='productno' id='productno' value='${param.productno }'>
      <input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='file' class="form-control input-lg" name='fnamesMF'  
                     value='' placeholder="파일 선택" multiple="multiple">
        </div>
      </div>

      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">파일 전송</button>
        <button type="button" 
                    onclick="location.href='../product/read.do?productno=${param.productno}&word=${param.word}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  