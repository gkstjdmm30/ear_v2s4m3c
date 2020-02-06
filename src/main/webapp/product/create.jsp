<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Shop</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
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
    <A href='../product_categrp/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?productcateno=${product_categrpVO.productcateno }'>${product_categrpVO.name }</A> >
    신규 등록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?productcateno=${param.productcateno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
               
      <!-- FK memberno 지정 -->
      <input type='hidden' name='membersno' id='membersno' value='${sessionScope.membersno }'>
      <!-- FK categrpno 지정 -->
      <input type='hidden' name='productcateno' id='productcateno' value='${param.productcateno }'>
      <!-- FK nowPage 지정 -->
      <input type='hidden' name='nowPage' id='nowPage' value='${param.nowPage }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          상품 이름: <input type='text' class="form-control input-lg" name='name' value='' placeholder="상품 이름" required="required" style='width: 50%;'>
          상품 가격: <input type='number' class="form-control input-lg" name='price' value='' placeholder="상품 가격" required= "required" style= 'width: 50%;'>  
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          내용: <textarea class="form-control input-lg" name='content' id='content' rows='3' placeholder="내용"></textarea>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          검색어: <input type='text' class="form-control input-lg" name='word'  value='' placeholder="검색어">
        </div>
      </div>

      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">등록</button>
        <button type="button" 
                    onclick="location.href='./list.do?productcateno=${param.productcateno}&nowPage=${param.nowPage }'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  