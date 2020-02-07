<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <A href='./list.do?productcateno=${productcateno }'>${product_categrpVO.name }</A> >
    수정
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?productcateno=${param.productcateno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
      <input type='hidden' name='productcateno' value='${product_categrpVO.productcateno }'>
      <input type='hidden' name='productno' value='${productVO.productno }'>
      <input type='hidden' name='nowPage' value='${param.nowPage }'>
      
      <div class="form-group">   
        <label class="col-md-1 control-label">상품 이름</label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='name' value='${productVO.name}' required="required" style='width: 50%;'>
        </div>
      </div> 
      <div class="form-group">   
        <label class="col-md-1 control-label">상품 가격</label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='price' value='${productVO.price}' required="required" style='width: 50%;'>
        </div>
      </div>     
      <div class="form-group">   
        <label class="col-md-1 control-label">내용</label>
        <div class="col-md-11">
          <textarea class="form-control input-lg" name='content' id='content' rows='10'>${productVO.content}</textarea>
        </div>
      </div>
      
      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>검색어</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='word' value='${productVO.word }' placeholder="검색어">
        </div>
      </div>
      
      <DIV style='text-align: right;'>
        <button type="submit" class="btn btn-info">변경된 내용 저장</button>
        <button type="button" onclick="location.href='./list.do?productcateno=${product_categrpVO.productcateno}'" class="btn btn-info">취소[목록]</button>
      </DIV>
  </FORM>
 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
 
 
 