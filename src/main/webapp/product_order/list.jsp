<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>주문 관리</title>
 
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
<div class ='title_line'>주문 관리(관리자)</div>
 
<table class = 'table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 40%;'/>    
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>  
  
  <thead>  
  <TR>
    <TH class='th_basic'>주문 번호</TH>
    <TH class='th_basic'>상품 번호</TH>
    <TH class='th_basic'>회원 이름</TH>
    <TH class='th_basic'>(상품X갯수+배송비=총액)</TH>
    <TH class='th_basic'>배송방법</TH>
    <TH class='th_basic'>날짜</TH>
    <TH class='th_basic'>기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="membersVO" items = "${list}">
    <c:set var="membersno" value="${membersVO.membersno }" />
    
    <TR>
      <TD style='text-align: center;'>${membersVO.membersno }</TD>
      <TD style='text-align: center;'>${membersVO.id }</TD>
      <TD style='text-align: left: ;'>${membersVO.name }</TD>
      <TD style='text-align: center;'>${membersVO.passwd }</TD>
      <TD style='text-align: center;'>${membersVO.tel }</TD>
      <TD style='text-align: center;'>${membersVO.email }</TD>
      <TD style='text-align: center;'>(${membersVO.zipcode}) ${membersVO.address1 } ${membersVO.address2 }</TD>
      <TD style='text-align: center;'>${membersVO.rdate }</TD>
      <TD style='text-align: center;'>${membersVO.ps }</TD>
      <TD style='text-align: center;'>
        <A href="./mem_read.do?membersno=${membersno }"><IMG src='../notice/images/update.png'></A>
        <A href="./mem_delete.do?membersno=${membersno }"><IMG src='../notice/images/delete.png'></A>
      </TD>
    </TR>
  </c:forEach> 
  </tbody>
 
</table>



<jsp:include page="/menu/bottom2.jsp" />
</body>
</html>