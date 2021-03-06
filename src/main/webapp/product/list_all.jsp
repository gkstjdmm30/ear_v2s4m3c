<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Shop</title>

  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
  
  <!-- Bootstrap core JavaScript -->
  <script src="${root}/bootstrap/vendor/jquery/jquery.min.js"></script>
  <script src="${root}/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <div class="container">

    <div class="row">
    
      <div class="col-lg-3">

        <h1 class="my-4">이어팔아</h1>
        <c:import url="/product_categrp/list_left_menu.do" />

      </div>
      <!-- /.col-lg-3 -->
      
      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="./images/banner_BjPyM1000.jpg" alt="First slide" style='width: 900px; height: 350px;' >
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="./images/banner_DjGtD1000.jpg" alt="Second slide" style='width: 900px; height: 350px;'>
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="./images/banner_QyOoZ1000.jpg" alt="Third slide" style='width: 900px; height: 350px;'>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div> 
        <FORM name='frm' method="get" action='./update.do'>
        <input type="hidden" name="productno" value="${productno}">
        <div class="row">
        <c:forEach var="product_imageProductVO" items="${list }">
          <c:set var="productno" value="${product_imageProductVO.productno }" />
          <c:set var="thumb" value="${product_imageProductVO.thumb }" />
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
                 <c:choose>
                 <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <a href="./read.do?productno=${productno}&word=${param.word}&nowPage=${param.nowPage}"><IMG class="card-img-top" src='../product_image/storage/${thumb }' alt=""></a>
                 </c:when> 
                 <c:otherwise>
                  <a href="./read.do?productno=${productno}&word=${param.word}&nowPage=${param.nowPage}"><IMG class="card-img-top" src='./images/no_image.png' alt=""></a>
                </c:otherwise>       
                </c:choose>
              <div class="card-body">
                <h5>
                  <a href="./read.do?productno=${productno}&word=${param.word}&nowPage=${nowPage}">${product_imageProductVO.name}</a>
                </h5>
                <h5>${product_imageProductVO.price}원</h5>
                <p class="card-text"><IMG src='./images/추천.jpeg' title=''>&nbsp${product_imageProductVO.recom}</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div> 
          
        </c:forEach>  
        
        </div>
        </FORM>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->
      
      </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  <DIV class='bottom_menu' style>${paging }</DIV>      



<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>