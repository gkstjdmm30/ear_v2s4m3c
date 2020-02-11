<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>주문 확인(상품)</title>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
  

<script type="text/javascript">

</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />


<DIV class='title_line'>주문</DIV>
<FORM name='frm' id='frm' method='' action='' 
              onsubmit="return send();" class="form-horizontal">
<%-- <input type='hidden' name='productno' value='${productVO.productno } '>   
<input type='hidden' name='membersno' value='${membersVO.membersno } '>   
<input type='hidden' name='tel' value='${membersVO.tel } '>   --%> 

<div>
   <div style="width: 60%; height: 70%;  float: left;">
      <div class="form-group">
            
        <div class="col-md-10">
         구매자 <input type='text' class="form-control input-lg" name='id' id='id' value='${membersVO.id }'  style='width: 90%;' readonly >
        </div>
      </div>   
                  
      <div class="form-group">   
        <div class="col-md-10">
         상품 <input type='text' class="form-control input-lg" name='name' id='name' value='${productVO.name }' required="required" style='width: 90%;' readonly>
        </div>
      </div>   
      
      <div class="form-group">    
        <div class="col-md-10" >
         가격 <input type='text' class="form-control input-lg" name='price' id='price' 
                     value="${orderVO.price }" required="required" style='width: 90%;' readonly>
        </div>
      </div>   
      
      <div class="form-group">
        <div class="col-md-10" >
         갯수 <input type='text' class="form-control input-lg" name='count' id='count' 
                     value="${orderVO.count }" required="required" style='width: 90%;' readonly>
        </div>
      </div>   
      
      <div class="form-group">    
        <div class="col-md-10">
         배송비 <input type='text' class="form-control input-lg" name='shipping' id='shipping' 
                     value='${orderVO.shipping }' required="required" style='width: 90%;' readonly>
        </div>
      </div>      



      <div class="form-group">
        <div class="col-md-10">
         총 가격 <input type='text' class="form-control input-lg" name='totalprice' id='totalprice' 
                     value="${orderVO.totalprice }" required="required" style='width: 90%;' readonly>
        </div>
      </div>
      
   </div>
   


<script>
function panel_img() {
  var tag = "";
  tag = "<A href=\"javascript: $('#list_panel').hide();\">";
  tag += "  <IMG src='../product_image/storage/" + file
      + "' style='width: 100%;'>";
  tag += "</A>";

  $('#attachfile_panel').html(tag);
  $('#attachfile_panel').show();
}
</script>
   <div style="width: 40%; height: 70%; float: left;">
      <div class="form-group"> 
        <div class="col-md-10">
          <DIV id='list_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          <li class="li_none" style='text-align: center;' >
            <c:forEach var="product_imgVO" items="${img_list }">
              <c:set var="thumb" value="${product_imgVO.thumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('${product_imgVO.fname }')"><IMG src='../attachfile/storage/${thumb }' style='margin-top: 2px;'></A>
                </c:when>
              </c:choose>
            </c:forEach>
          </li>
        </div>
      </div>   
   </div>
 </div>
 
 
 
 <div class ="width: 40%;">
   <div>
      <input type='text' class="form-control input-lg" name='zipcode' id='zipcode' value='${orderVO.zipcode }'  style='width: 40%; margin: 5px;' placeholder="우편번호"  required="required" readonly>
      <input type='text' class="form-control input-lg" name='address1' id='address1' value='${orderVO.address1 }'  style='width: 40%; margin: 5px;' placeholder="주소"  required="required" readonly>
      <input type='text' class="form-control input-lg" name='address2' id='address2' value='${orderVO.address2 }'  style='width: 40%; margin: 5px;' placeholder="상세 주소"  required="required" readonly>
   </div>
   
   <div class= "" style="float: right; padding: 12px; margin-right: 66px;">
   
      <c:choose>
        <c:when test="${orderVO.howorder == 1 }">
          <input class="btn btn-light" type="text" name="howorder" id="howorder" value = "신용카드" readonly>
        </c:when>
        <c:otherwise>
          <input class="btn btn-light" type="text" name="howorder" id="howorder" value = "계좌이체" readonly>
        </c:otherwise>
      </c:choose>      
      <a href="../index.jsp"><button type="button" class="btn btn-primary">홈</button></a>
      <a href="javascript:history.back();"><button type="button" class="btn btn-secondary">취소</button></a> 
   </div>
 </div>
  </FORM>

<jsp:include page="/menu/bottom2.jsp" />
</body>
 
</html> 
  


   