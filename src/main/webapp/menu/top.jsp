<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
 
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="${root}">이어팔아</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <form name='frm' id='frm' method='get' action='./list.do' class="">
        <input type='hidden' name='productcateno' value='${product_categrpVO.productcateno }'>

    <ASIDE style='float: right;'>
      <c:choose>
        <c:when test="${param.word != '' }">
          <input type="search" name='word' id='word' placeholder="Search"  value='${param.word }' 
                     class="search-box">
        </c:when>
        <c:otherwise>
          <input type="search" value="" placeholder="Search" class="search-box">
        </c:otherwise>
      </c:choose>
      <button type="submit" class="search-btn">
        <i class="fas fa-search"></i>
      </button>
    </ASIDE> 
  </form>
      
      
      <div class="collapse navbar-collapse" id="navbarResponsive" style="text-align: right;">
        <ul class="navbar-nav ml-auto">
        
          <spen class='menubar'>
            <li class="nav-item active">
              <a class="nav-link" href="${root}">홈
                <span class="sr-only">(current)</span>
              </a>
            </li>
          </spen>
            
          <c:import url="/product_categrp/list_product_menu.do" />
            
          <spen class='menubar'>
            <li class="nav-item">
              <a class="nav-link" href="${root}/notice/list.do?categrpno=1">공지사항</a>
                <ul>
                   <li><a href="${root}/notice/list.do?categrpno=1">공지사항</a></li>
                   <li><a href="#">자료실</a></li>
                   <li><a href="#">Q&A</a></li>
                   <li><a href="${root}/notice_categrp/list.do">카테고리 관리(관리자)</a></li>
                </ul>
            </li>
            </spen>
            
          <spen class='menubar'>
            <li class="nav-item">
              <c:choose>
                <c:when test="${sessionScope.id == null}">
                  <a class="nav-link" href="${root}/members/mem_login.do">로그인</a>
                </c:when>
                <c:otherwise>
                  <A class='nav-link'  href='${root}/members/mem_logout.do' >${sessionScope.id } 로그아웃</A>
                </c:otherwise>
              </c:choose>
            </li>
          </ul>
          </spen>
        
      </div>
    </div>
  </nav>
  
    <!-- Page Content -->
  <div class="container">
    <div class="content">

  