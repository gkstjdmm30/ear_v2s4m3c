<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<DIV class='container' style='width: 100%;'> 
  <!-- 화면 상단 메뉴 -->
  <DIV class='top_menu'>
    <DIV class='top_menu_label'>4조: 이어폰 판매 사이트</DIV>
    <NAV class='top_menu_list'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='' >HOME</A> <span class='top_menu1'> | </span>
      <A class='menu_link'  href=''>공지사항</A> <span class='top_menu1'> | </span>
      <A class='menu_link'  href=''>자료실</A> <span class='top_menu1'> | </span>
      <A class='menu_link'  href=''>Q&A</A> <span class='top_menu1'> | </span>
      
      <c:choose>
        <c:when test="${sessionScope.id == null}">
          <A class='menu_link'  href='' >Login</A> <span class='top_menu1'> | </span>
        </c:when>
        <c:otherwise>
          ${sessionScope.id } <A class='menu_link'  href='${root}/member/logout.do' >Logout</A> <span class='top_menu1'> | </span>
        </c:otherwise>
      </c:choose>

      <A class='menu_link'  href='${root}/notice/list.do'>공지사항 카테고리(관리자용)</A> <span class='top_menu1'>
          
      [
      <c:choose>
        <c:when test="${sessionScope.id_admin == null}">
          <A class='menu_link'  href='${root}/admin/login.do' >관리자 Login</A>
        </c:when>
        <c:otherwise>
          ${sessionScope.id_admin } <A class='menu_link'  href='${root}/admin/logout.do' >관리자 Logout</A>
        </c:otherwise>
      </c:choose>
      ]
          
    </NAV>
  </DIV>
  
  <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
  <DIV class="row" style='margin-top: 2px;'>
    <DIV class="col-md-2"> <!-- 메뉴 출력 컬럼 -->
      <img src='${root}/menu/images/myimage.png' style='width: 100%;'>
      <div style='margin-top: 5px;'>
        <img src='${root}/menu/images/myface.png'>힐링 리조트
      </div>
      <!-- Spring 출력 카테고리 그룹 / 카테고리 -->
      <c:import url="../notice/list_index_left.jsp" />
      ▷ 회원
      <UL style='padding-left: 30px;'>
        <c:if test="${sessionScope.id == null}">
          <LI>
            <A href="${root }/member/create.do" style='font-size: 0.8em;'>회원 가입</A>
          </LI>
        </c:if>
        <c:if test="${sessionScope.id != null}">
          <LI>
            <A href="${root }/member/read.do?memberno=${sessionScope.memberno}" style='font-size: 0.8em;'>정보 수정</A>
          </LI>
          <LI>
            <A href="${root }/member/passwd_update.do?memberno=${sessionScope.memberno}" style='font-size: 0.8em;'>패스워드 변경</A>
          </LI>
        </c:if>
        <c:if test="${sessionScope.id_admin != null}">
        <LI>
          <A href="${root }/member/list.do" style='font-size: 0.8em;'>회원 목록</A>
        </LI>
        </c:if>
      </UL>      
       
    </div>
      
    <DIV class="col-md-10 cont">  <!-- 내용 출력 컬럼 -->  
<DIV class='content'>



