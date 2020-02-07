<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
 
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
<DIV class='title_line'>알림</DIV>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <LI class='li_none'>
        <span class='span_fail'>등록자 일치하지 않음으로 권한이 없습니다.</span>
      </LI>
      <LI class='li_none'>
        <button type='button' 
                    onclick="location.href='./list.do?categrpno=${param.categrpno}&nowPage=${param.nowPage}'"
                    class="btn btn-info">목록</button>                        
        </LI>
      </UL>
   </fieldset>
 
</DIV>
 
<jsp:include page="/menu/bottom2.jsp" flush='false' />
</body>
 
</html> 
   
 