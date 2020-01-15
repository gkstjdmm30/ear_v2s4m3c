<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>회원 관리</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
  
});
function update_form(membersno) {
  
  var url = './update.do?membersno=' + membersno;
  var win = window.open(url, '회원 정보 수정', 'width=800px, height=400px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 

function delete_form(membersno) {
  
  var url = './delete.do?membersno=' + membersno;
  var win = window.open(url, '회원 정보 삭제', 'width=800px, height=500px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 500) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 
</script>
    
</head>

<body>
<jsp:include page="/menu/top.jsp" />
<div class ='title_line'>회원 관리(관리자)</div>
 
<table class = 'table table-striped'>
  <colgroup>
    <col style='width: 4%;'/>
    <col style='width: 10%;'/>
    <col style='width: 4%;'/>
    <col style='width: 12%;'/>    
    <col style='width: 16%;'/>
    <col style='width: 14%;'/>
    <col style='width: 30%;'/>
    <col style='width: 10%;'/>
  </colgroup>  
  
  <thead>  
  <TR>
    <TH class='th_basic'>회원 번호</TH>
    <TH class='th_basic'>ID</TH>
    <TH class='th_basic'>이름</TH>
    <TH class='th_basic'>Password</TH>
    <TH class='th_basic'>전화번호</TH>
    <TH class='th_basic'>이메일</TH>
    <TH class='th_basic'>주소</TH>
    <TH class='th_basic'>가입 날짜</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="membersVO" items = "${list}">
    <c:set var="mem_no" value="${membersVO.mem_no }" />
    
    <TR>
      <TD style='text-align: center;'>${membersVO.membersno }</TD>
      <TD style='text-align: center;'>${membersVO.id }</TD>
      <TD style='text-align: left: ;'>${membersVO.name }</TD>
      <TD style='text-align: center;'>${membersVO.passwd }</TD>
      <TD style='text-align: center;'>${membersVO.tel }</TD>
      <TD style='text-align: center;'>${membersVO.email }</TD>
      <TD style='text-align: center;'>(${membersVO.zipcode}) ${membersVO.address1 } ${membersVO.address2 }</TD>
      <TD style='text-align: center;'>${membersVO.rdate.substring(0, 10) }</TD>
      <TD style='text-align: center;'>
        <A href="javascript: update_form(${membersno });"><IMG src='./images/update.png' title='수정'></A>
        <A href="javascript: delete_form(${membersno });"><IMG src='./images/delete.png' title='삭제'></A>
      </TD>
    </TR>
  </c:forEach> 
  </tbody>
 
</table>



<jsp:include page="/menu/bottom.jsp" />
</body>
</html>