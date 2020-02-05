<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>회원 삭제</title>
 
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">

</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
  <div class='menu_line'></div>
<DIV class='title_line'>회원 삭제</DIV>
 
<DIV class='content' style='width: 500px; text-align: center;'>
  <FORM name='frm' method='POST' action='./mem_delete.do'>
    '${membersVO.name }(${membersVO.id })' 회원을 삭제하면 복구 할 수 없습니다.<br><br>
    정말로 삭제하시겠습니까?<br><br>      
    <input type='hidden' name='membersno' value='${membersVO.membersno }'>     
        
    <button type="submit">삭제</button>
    <button type="button" onclick="location.href='./mem_list.do'">취소(목록)</button>
 
  </FORM>
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
 
 