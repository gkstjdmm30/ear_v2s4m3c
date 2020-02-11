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
    <col style='width: 5%;'/>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 45%;'/>
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
  <c:forEach var ="Deli_listVO" items = "${Deli_listVO }">
  <TR>
    <TD style="text-align: center;">${Deli_listVO.delino}</TD>
    <TD style="text-align: center;">${Deli_listVO.orderno}</TD>
    <TD style="text-align: center;">${Deli_listVO.name}</TD>
    <TD style="text-align: center;">(${Deli_listVO.zipcode})${Deli_listVO.address1 }<br>${Deli_listVO.address2}</TD>
    <c:choose>
      <c:when test= "${Deli_listVO.delivery == 1}">
        <TD style='text-align: center;'>배송 준비</TD>
      </c:when>
      <c:when test="${Deli_listVO.delivery == 2}">
        <TD style='text-align: center;'>배송출발</TD>
      </c:when>
     <c:when test="${Deli_listVO.delivery == 3}">
        <TD style='text-align: center;'>배송중</TD>
      </c:when>
      <c:otherwise>
        <TD style='text-align: center;'>배송완료</TD>
      </c:otherwise>
    </c:choose>
    <TD style='text-align: center;'>${Deli_listVO.ddate }</TD>
    <TD style='text-align: center;'>
      <A href="./deli_update.do?delino=${Deli_listVO.delino }"><IMG src='../notice/images/update.png'></A>
    </TD>
  </TR>
  </c:forEach>
 <%--  <c:forEach var="deliVO" items = "${list}">
  <c:forEach var="orderVO" items = "${orderVO}">
  </c:forEach>
    <c:set var="delino" value="${deliVO.delino }" />
    
    <TR>
      <TD style='text-align: center;'> ${delino }</TD>
      <TD style='text-align: center;'>${deliVO.orderno }</TD>
      <TD style='text-align: center;'>${name }</TD>
      <TD style='text-align: center;'>(${orderVO.zipcode})${orderVO.address1 }<br>${orderVO.address2 }</TD>
      
      <c:choose>
        <c:when test= "${deliVO.delivery == 1}">
          <TD style='text-align: center;'>배송 준비</TD>
        </c:when>
        <c:when test="${deliVO.delivery == 2}">
          <TD style='text-align: center;'>배송출발</TD>
        </c:when>
       <c:when test="${deliVO.delivery == 3}">
          <TD style='text-align: center;'>배송중</TD>
        </c:when>
        <c:otherwise>
          <TD style='text-align: center;'>배송완료</TD>
        </c:otherwise>
      </c:choose>
      <TD style='text-align: center;'>${deliVO.ddate }</TD>
      <TD style='text-align: center;'>
        <A href="./deli_update.do?delino=${delino }"><IMG src='../notice/images/update.png'></A>
      </TD>
    </TR>

  </c:forEach>  --%>
  </tbody>
 
</table>



<jsp:include page="/menu/bottom2.jsp" />
</body>
</html>