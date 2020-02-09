<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>배송 관리</title>
 
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
<div class ='title_line'>배송 관리</div>
<FORM name='frm' id='frm' method='' action=''>
<div>
   <div style="width: 60%; height: 70%;  float: left;">
      <div class="form-group">
            
        <div class="col-md-10">
         배송 번호 <input type='text' class="form-control input-lg" name='delino' id='delino' value='${deliVO.delino }'  style='width: 90%;' readonly >
        </div>
      </div>   
                  
      <div class="form-group">   
        <div class="col-md-10">
         배송 상태 
         <c:choose>
          <c:when test="${deliVO.delivery ==1}">
            <input type='text' class="form-control input-lg" value='배송준비중' required="required" style='width: 90%;' readonly>
          </c:when>
          <c:when test="${deliVO.delivery ==2}">
            <input type='text' class="form-control input-lg" value='배송 출발' required="required" style='width: 90%;' readonly>
          </c:when>
          <c:when test="${deliVO.delivery ==3}">
            <input type='text' class="form-control input-lg" value='배송 중' required="required" style='width: 90%;' readonly>
          </c:when>
          <c:otherwise>
           <input type='text' class="form-control input-lg" value='배송 완료' required="required" style='width: 90%;' readonly>
          </c:otherwise>
         </c:choose>
         
         
        </div>
      </div>   
      <div class="form-group">   
        <a href="../index.jsp"><button type="Button" class="btn btn-primary">홈</button></a>
      <a href="javascript:history.back();"><button type="button" class="btn btn-secondary">취소</button></a> 
      </div>   
    </div>
  
 </div>

</form>


<jsp:include page="/menu/bottom2.jsp" />
</body>
</html>