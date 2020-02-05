<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>주문 확인(상품)</title>
 
 
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
  

</head>
<body>.
  <c:forEach var="product_orderVO" items = "${list}">
<jsp:include page="/menu/top.jsp" />


<DIV class='title_line'>주문</DIV>
<FORM name='frm' id='frm' method='POST' action='./product_order_update.do' 
              onsubmit="return send();" class="form-horizontal">
<%-- <input type='hidden' name='productno' value='${productVO.productno } '>   
<input type='hidden' name='membersno' value='${membersVO.membersno } '>   
<input type='hidden' name='tel' value='${membersVO.tel } '> --%>   

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
                     value='${orverVO.shipping }' required="required" style='width: 90%;' readonly>
        </div>
      </div>      



      <div class="form-group">
        <div class="col-md-10">
         총 가격 <input type='text' class="form-control input-lg" name='totalprice' id='totalprice' 
                     value="${orderVO.totalprice }" required="required" style='width: 90%;' readonly>
        </div>
      </div>
      
   </div>
   



   <div style="width: 40%; height: 70%; float: left;">
      <div class="form-group"> 
        <div class="col-md-10">
          <img style="width: 100%; height: 100%; text-align: center;" src="${product_imageVO.thumb }">
        </div>
      </div>   
   </div>
 </div>
 
 
 
 
 <div class ="width: 40%;">
   <div>
      <input type='text' class="form-control input-lg" name='zipcode' id='zipcode' value='${orderVO.zipcode }'  style='width: 40%; margin: 5px;' readonly >
      <input type='text' class="form-control input-lg" name='address1' id='address1' value='${orderVO.address1 }'  style='width: 40%; margin: 5px;' readonly >
      <input type='text' class="form-control input-lg" name='address2' id='address2' value='${orderVO.address2 }'  style='width: 40%; margin: 5px;' readonly >
   </div>   
   <div class= "" style="float: right; padding: 12px; margin-right: 66px;">
      <select class="btn btn-light" name="howorder" id="howorder" >
        <option value=1 <c:if test="${product_orderVO.howorder == 1}">selected</c:if>>신용카드</option>
        <option value=2 <c:if test="${product_orderVO.howorder == 2}">selected</c:if>>계좌이체</option>
      </select>
      <button type="submit" class="btn btn-primary">수정하기</button>
      <a href="javascript:history.back();"><button type="button" class="btn btn-secondary">취소</button></a> 
   </div>
 </div>
  </FORM>

<jsp:include page="/menu/bottom2.jsp" />
</c:forEach>
</body>
</html>