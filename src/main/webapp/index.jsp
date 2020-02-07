<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop</title>
  
  <link href="./css/style.css" rel="Stylesheet" type="text/css">

  <!-- Bootstrap core CSS -->
  <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

</head>

<body>

<jsp:include page="/menu/top.jsp" />
  

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">이어팔어</h1>
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
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
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
        <c:forEach var="productVO" items="${list }">
          <c:set var="productno" value="${productVO.productno }" />

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <c:forEach var="product_imageVO" items="${product_image }">
                <c:set var="thumb" value="${product_imageVO.thumb.toLowerCase() }" />
                  <a href="./read.do?productno=${productno}&word=${param.word}&nowPage=${param.nowPage}"><IMG class="card-img-top" src='../product_image/storage/${thumb }' alt=""></a>
              </c:forEach>
              <div class="card-body">
                <h5>
                  <a href="./read.do?productno=${productno}&word=${param.word}&nowPage=${param.nowPage}">${productVO.name}</a>
                </h5>
                <h5>${productVO.price}원${productno}</h5>
                <p class="card-text"><IMG src='./images/추천.jpeg' title=''>&nbsp${productVO.recom}</p>
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

<jsp:include page="/menu/bottom.jsp" />

</body>

</html>