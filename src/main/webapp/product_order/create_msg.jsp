<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>주문 성공/실패</title>
 
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
      <c:choose>
        <c:when test="${param.count == 1 }">
          <LI class='li_none'>주문 완료되었습니다.</LI>
          <LI class='li_none'>
        <br>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>주문 실패했습니다.</LI>
          <LI class='li_none'>다시한번 시도해주세요.</LI>
          <LI class='li_none'>
        <br>
        <button type='button' onclick="location.href='javascript:history.back();'">재주문</button>
        </c:otherwise>
      </c:choose>
      
        <button type='button' onclick="location.href='../index.jsp'">홈</button>
      </LI>
     </UL>
  </fieldset>
 
</DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>