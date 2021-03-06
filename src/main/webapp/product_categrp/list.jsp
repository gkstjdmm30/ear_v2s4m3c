<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Shop</title>

  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
 
 <script type="text/javascript">
function update_form(productcateno) {
  // alert('productcateno: ' + productcateno);
  
  var url = './update.do?productcateno=' + productcateno;
  var win = window.open(url, '카테고리 그룹 수정', 'width=800px, height=400px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 

function delete_form(productcateno) {
  // alert('productcateno: ' + productcateno);
  
  var url = './delete.do?productcateno=' + productcateno;
  var win = window.open(url, '카테고리 그룹 삭제', 'width=800px, height=400px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 
</script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" />
  <DIV class='title_line'>상품 카테고리 그룹</DIV>
  
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
        
      <label>그룹 이름</label>
      <input type='text' name='name' value='' required="required" style='width: 25%;'>
 
      <label>순서</label>
      <input type='number' name='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
  
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
          <col style='width: 10%;'/>
          <col style='width: 40%;'/>
          <col style='width: 15%;'/>
          <col style='width: 10%;'/>    
          <col style='width: 10%;'/>
          <col style='width: 15%;'/>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>분류 번호</th>
          <th style='text-align: center;'>분류명</th>
          <th style='text-align: center'>등록일</th>
          <th style='text-align: center;'>출력 순서</th>
          <th style='text-align: center;'>등록된 상품 수</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="product_categrpVO" items="${list }">
          <c:set var="productcateno" value="${product_categrpVO.productcateno }" />
          
          <tr> 
            <td style='text-align: center;'>${product_categrpVO.productcateno}</td>
            <td style='text-align: center;'>${product_categrpVO.name}</td>
            <td style='text-align: center;'>${product_categrpVO.rdate}</td>
            <td style='text-align: center;'>${product_categrpVO.seqno}</td>
            <td style='text-align: center;'>${product_categrpVO.cnt}</td>
            <td style='text-align: center;'>
              <A href="/team4/product_categrp/update_seqno_up.do?productcateno=${productcateno }"><IMG src='./images/up.png' title='우선순위 높임' style='width: 16px;'></A>
              <A href="./update_seqno_down.do?productcateno=${productcateno }"><IMG src='./images/down.png' title='우선순위 낮춤' style='width: 16px;'></A>
              <A href="javascript: update_form(${productcateno });"><IMG src='./images/update.png' title='수정'></A>
              <A href="javascript: delete_form(${productcateno });"><IMG src='./images/delete.png' title='삭제'></A>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>


<jsp:include page="/menu/bottom.jsp" /> 
</body>
 
</html>
    
 
  