<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>주문 신청</title>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
  
<script>
function button_address() {
  var zipcode = ${membersVO.zipcode}; 
  var address1 = ${membersVO.address1}; 
  var address2 = ${membersVO.address2}; 
  $('#zipcode').val(zipcode);
  $('#address1').val(address1);
  $('#address2').val(address2);
}
</script>
<script type="text/javascript">

<%--   $(function(){
    
    var price = 10000;
    var count = <%= Integer.parseInt(request.getParameter("count"))%>
    var shipping = ((price*count)>10000?0:2500);
    var totalprice = (price*count) + shipping;
    $('#totalprice').val(totalprice);
  }); --%>
  $(function(){
    var price = $('#price').val();
    var count = <%= Integer.parseInt(request.getParameter("count"))%>
    var shipping = ((price*count)>10000?0:2500);
    var totalprice = (price*count) + shipping;
    $('#shipping').val(shipping);
    $('#totalprice').val(totalprice);
  });
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />


<DIV class='title_line'>주문</DIV>
<FORM name='frm' id='frm' method='POST' action='./product_order_create.do' 
              onsubmit="return send();" class="form-horizontal">
<input type='hidden' name='productno' value='${productVO.productno } '>   
<input type='hidden' name='membersno' value='${membersVO.membersno } '>   
<input type='hidden' name='tel' value='${membersVO.tel } '>   

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
                     value="${productVO.price }" required="required" style='width: 90%;'>
        </div>
      </div>   
      
      <div class="form-group">
        <div class="col-md-10" >
         갯수 <input type='text' class="form-control input-lg" name='count' id='count' 
                     value="<%=request.getParameter("count") %>" required="required" style='width: 90%;' >
        </div>
      </div>   
      
      <div class="form-group">    
        <div class="col-md-10">
         배송비 <input type='text' class="form-control input-lg" name='shipping' id='shipping' 
                     value='' required="required" style='width: 90%;'>
        </div>
      </div>      



      <div class="form-group">
        <div class="col-md-10">
         총 가격 <input type='text' class="form-control input-lg" name='totalprice' id='totalprice' 
                     value="" required="required" style='width: 90%;' >
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
      <input type='text' class="form-control input-lg" name='zipcode' id='zipcode' value=''  style='width: 40%; margin: 5px;'  >
      <input type='text' class="form-control input-lg" name='address1' id='address1' value=''  style='width: 40%; margin: 5px;'  >
      <input type='text' class="form-control input-lg" name='address2' id='address2' value=''  style='width: 40%; margin: 5px;'  >
   </div>   
   <div class= "" style="float: right; padding: 12px; margin-right: 66px;">
      <button id="button_address" name="button_address" onclick="button_address" class="btn btn-secondary">기존 주소</button>
      <select class="btn btn-light" name="howorder" id="howorder">
        <option value="1">신용카드</option>
        <option value="2">계좌이체</option>
      </select>
      <button type="submit" class="btn btn-primary">결제하기</button>
      <a href="javascript:history.back();"><button type="button" class="btn btn-secondary">취소</button></a> 
   </div>
 </div>
  </FORM>

<jsp:include page="/menu/bottom2.jsp" />
</body>
 
</html> 
  


   