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
              <a class="nav-link" href="${root}/notice/list.do?categrpno=1&nowPage=1">공지사항</a>
                <ul>
                   <li><a href="${root}/notice/list.do?categrpno=1&nowPage=1">공지사항</a></li>
                   <li><a href="#">자료실</a></li>
                   <li><a href="#">Q&A</a></li>
                   <c:if test="${sessionScope.ps == 0}">
                      <li><a href="${root}/notice_categrp/list.do">카테고리 관리(관리자)</a></li>
                   </c:if>
                </ul>
            </li>
            </spen>
             
             
          <spen class='menubar'>
              <li class="nav-item">
              <c:choose>
                <c:when test="${sessionScope.id != null}">                     
                     <a class="nav-link" href="#">마이페이지</a>
                      <ul>
                         <li><a href="${root}/members/mem_read.do?membersno=${sessionScope.membersno}"> 회원정보 수정</a></li>
                         <li><a href="${root}/members/passwd_update.do?membersno=${sessionScope.membersno}">비밀번호 수정</a></li>
                         <li><a href="#">배송 조회</a></li>
                            <c:if test="${sessionScope.ps == 0}">
                              <li><a href="${root}/members/mem_list.do ">회원 관리(관리자)</a></li>
                              <li><a href="#">배송 관리(관리자)</a></li>
                            </c:if>
                      </ul>
                </c:when>
                <c:otherwise>
                  <A class='nav-link'  href='${root}/members/mem_create.do' >회원 가입</A>
                </c:otherwise>
                </c:choose>
                </li>  
          </spen>                   
                   
                   
          <spen class='menubar'>
            <li class="nav-item">
              <c:choose>
                <c:when test="${sessionScope.id == null}">
                  <a class="nav-link" href="${root}/members/mem_login.do">로그인</a>
                </c:when>
                <c:otherwise>
                  <A class='nav-link'  href='${root}/members/mem_logout.do' >로그아웃</A>
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

  