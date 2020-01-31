<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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

    
<script type="text/javascript">
  $(function(){ 
  
  });
</script>
 
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
<DIV class='title_line'>알림</DIV>
  <DIV class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
        <c:choose>
          <c:when test="${param.count == 0}">
            <li class='li_none'>[${param.mname}] 회원 정보 삭제에 실패했습니다.</li>
          </c:when>
          <c:when test="${param.count == 1}">
            <li class='li_none'>[${param.mname}] 회원 정보 삭제에 성공했습니다.</li>
          </c:when>
        </c:choose>
     
        <li class='li_none'>
          [<A href='./list.do'>목록</A>]
          [<A href='${pageContext.request.contextPath}/home.do'>확인</A>]
        </li>
        
      </ul>
    </fieldset>    
  </DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
 