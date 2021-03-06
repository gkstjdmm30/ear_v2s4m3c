<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>주문 신청</title>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
  

<script type="text/javascript">
  $(function(){
    var price = $('#price').val();
    var count = <%=Integer.parseInt(request.getParameter("count"))%>
    var shipping = ((price*count)>10000?0:2500);
    var totalprice = (price*count) + shipping;
    $('#shipping').val(shipping);
    $('#totalprice').val(totalprice);
  });
 </script>
<script type="text/javascript">
  function btn_address() {
    var zipcode = '<c:out value="${membersVO.zipcode}"/>';
    var address1 = '<c:out value="${membersVO.address1}"/>';
    var address2 = '<c:out value="${membersVO.address2}"/>';
    $('#zipcode').val(zipcode);
    $('#address1').val(address1);
    $('#address2').val(address2);
  }
  </script>
  <script type="text/javascript">
  function panel_img(file) {
    var tag = "";
    tag = "<A href=\"javascript: $('#attachfile_panel').hide();\">";
    tag += "  <IMG src='../product_image/storage/" + file
        + "' style='width: 100%;'>";
    tag += "</A>";

    $('#attachfile_panel').html(tag);
    $('#attachfile_panel').show();
  }
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
                     value="${productVO.price }" required="required" style='width: 90%;' readonly>
        </div>
      </div>   
      
      <div class="form-group">
        <div class="col-md-10" >
         갯수 <input type='text' class="form-control input-lg" name='count' id='count' 
                     value="<%=request.getParameter("count") %>" required="required" style='width: 90%;' readonly>
        </div>
      </div>   
      
      <div class="form-group">    
        <div class="col-md-10">
         배송비 <input type='text' class="form-control input-lg" name='shipping' id='shipping' 
                     value='' required="required" style='width: 90%;' readonly>
        </div>
      </div>      



      <div class="form-group">
        <div class="col-md-10">
         총 가격 <input type='text' class="form-control input-lg" name='totalprice' id='totalprice' 
                     value="" required="required" style='width: 90%;' readonly>
        </div>
      </div>
      
   </div>
   



   <div style="width: 40%; height: 70%; float: left;">
      <div class="form-group"> 
        <div class="col-md-10">
          <DIV id='list_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          <li class="li_none">
            <DIV id='attachfile_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" >
            <c:forEach var="product_imageVO" items="${product_image }">
              <c:set var="thumb" value="${product_imageVO.thumb }" />
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('${product_imageVO.fname }')"><IMG src='../product_image/storage/${thumb }' style='margin-top: 2px;'></A>
                  &nbsp&nbsp&nbsp&nbsp&nbsp
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
   <input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-info btn-md">
      <input type='text' class="form-control input-lg" name='zipcode' id='zipcode' value=''  style='width: 40%; margin: 5px;' placeholder="우편번호"  required="required">
      <input type='text' class="form-control input-lg" name='address1' id='address1' value=''  style='width: 40%; margin: 5px;' placeholder="주소"  required="required">
      <input type='text' class="form-control input-lg" name='address2' id='address2' value=''  style='width: 40%; margin: 5px;' placeholder="상세 주소"  required="required">
   </div>
 <!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>
 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');
 
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
 
    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
 
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
 
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
 
        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->
   <div class= "" style="float: right; padding: 12px; margin-right: 66px;">
    <button type="button" onclick='btn_address()' class="btn btn-secondary">기존 주소</button>

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
  


   