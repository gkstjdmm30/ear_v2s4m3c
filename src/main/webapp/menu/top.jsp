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
      <div class="collapse navbar-collapse" id="navbarResponsive" style="text-align: right;">
        <ul class="navbar-nav ml-auto">
        
          <spen class='menubar'>
            <li class="nav-item active">
              <a class="nav-link" href="${root}">홈
                <span class="sr-only">(current)</span>
              </a>
            </li>
          </spen>
            
          <spen class='menubar'>
            <li class="nav-item"><a class="nav-link" href="#" id="current">상품</a>
              <ul>
                 <li><a href="#">유선 이어폰</a></li>
                 <li><a href="#">무선 이어폰</a></li>
                 <li><a href="#">헤드셋</a></li>
              </ul>
            </li>
          </spen>
            
          <spen class='menubar'>
            <li class="nav-item">
              <a class="nav-link" href="#">공지사항</a>
                <ul>
                   <li><a href="#">공지사항</a></li>
                   <li><a href="#">자료실</a></li>
                   <li><a href="#">Q&A</a></li>
                   <li><a href="${root}/notice_categrp/list.do">카테고리 관리(관리자)</a></li>
                </ul>
            </li>
            </spen>
            
          <spen class='menubar'>
            <li class="nav-item">
              <a class="nav-link" href="#">로그인</a>
            </li>
          </ul>
          </spen>
        
      </div>
    </div>
  </nav>
  
    <!-- Page Content -->
  <div class="container">
    <div class="content">

  