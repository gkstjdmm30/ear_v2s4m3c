<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>배송 관리(관리자)</title>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">

<script type="text/javascript">
  $(function(){

  });
</script>
  
</head>
<body>
<jsp:include page="/menu/top.jsp" />
<div class ='title_line'>배송 관리(관리자)</div>
<table class = 'table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>  
  
  <thead>  
  <TR>
    <TH class='th_basic'>배송 번호</TH>
    <TH class='th_basic'>주문 번호</TH>
    <TH class='th_basic'>상품 이름</TH>
    <TH class='th_basic'>주소</TH>
    <TH class='th_basic'>상태</TH>
    <TH class='th_basic'>주문일</TH>
    <TH class='th_basic'>기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="deliVO" items = "${list}">
    <c:set var="delino" value="${deliVO.delino }" />
    
    <TR>
      <TD style='text-align: center;'> ${delino }</TD>
      <TD style='text-align: center;'>${deliVO.orderno }</TD>
      <TD style='text-align: center;'>${name }</TD>
      <TD style='text-align: center;'>${orderVO }</TD>
      <TD style='text-align: center;'>${deliVO.delivery }</TD>
      <TD style='text-align: center;'>${deliVO.ddate }</TD>
      <TD style='text-align: center;'>
        <A href="./deli_update.do?delino=${delino }"><IMG src='../notice/images/update.png'></A>
      </TD>
    </TR>
  </c:forEach> 
  </tbody>
 
</table>



<jsp:include page="/menu/bottom2.jsp" />
</body>
</html>