<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
  <link href="./css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./mem_create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./mem_list.do'>목록</A>
  </ASIDE> 
 
  <div class='menu_line'></div>
<DIV class='title_line'>회원 삭제</DIV>
 
<DIV class='content' style='width: 500px; text-align: center;'>
  <FORM name='frm' method='POST' action='./delete.do'>
    '${membersVO.name }(${membersVO.id })' 회원을 삭제하면 복구 할 수 없습니다.<br><br>
    정말로 삭제하시겠습니까?<br><br>         
    <input type='hidden' name='memberno' value='${membersVO.membersno }'>     
        
    <button type="submit">삭제</button>
    <button type="button" onclick="location.href='./mem_list.do'">취소(목록)</button>
 
  </FORM>
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
 
 