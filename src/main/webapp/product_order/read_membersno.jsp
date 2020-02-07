<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>주문 목록</title>
 
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
<div class ='title_line'>주문 관리</div>
 
<table class = 'table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 30%;'/>    
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>  
  
  <thead>  
  <TR>
    <TH class='th_basic'>주문 번호</TH>
    <TH class='th_basic'>상품 이름</TH>
    <TH class='th_basic'>회원 이름</TH>
    <TH class='th_basic'>(상품X갯수+배송비=총액)</TH>
    <TH class='th_basic'>배송방법</TH>
    <TH class='th_basic'>날짜</TH>
    <TH class='th_basic'>배송조회</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="product_orderVO" items = "${list}">
  <c:forEach var="product_orderVO2" items = "${list2}">
    <c:set var="orderno" value="${product_orderVO.orderno }" />
    
    <TR>
      <TD style='text-align: center;'>${product_orderVO.orderno }</TD>
      <TD style='text-align: center;'><A href="./product_read_orderno.do?orderno=${orderno }">${product_orderVO2 }</a></TD>
      <TD style='text-align: center;'> ${membersVO.name }</TD>
      <TD style='text-align: center;'>(${product_orderVO.price}) X ${product_orderVO.count } + ${product_orderVO.shipping } = \ ${product_orderVO.totalprice }</TD>
      <TD style='text-align: center;'>${product_orderVO.howorder }</TD>
      <TD style='text-align: center;'>${product_orderVO.odate }</TD>
      
      <TD style='text-align: center;'><A href="#">배송 조회</A></TD>
    </TR>
  </c:forEach>
  </c:forEach> 
  </tbody>
 
</table>



<jsp:include page="/menu/bottom2.jsp" />
</body>
</html>