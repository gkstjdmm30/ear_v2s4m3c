<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>

  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
  
<script type="text/javascript">
  $(function() { // 자동 실행
    list_by_noticeno(${noticeVO.noticeno});  // JS의 EL 접근
  }
</script>

</head>

<body>
<c:set var="notice_categrpno" value="${notice_categrpVO.categrpno}" />
<c:set var="noticeno" value="${noticeVO.noticeno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  
  <ASIDE style='float: left;'>
    카테고리 그룹 > 
    <A href='./list.do?categrpno=${categrpno }&word=${param.word}&nowPage=${param.nowPage}'>${notice_categrpVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?categrpno=${notice_categrpVO.categrpno }&word=${param.word}&nowPage=${param.nowPage}'>목록</A>
    <c:if test="${sessionScope.id != null}">
      <span class='menu_divide' > | </span> 
      <A href='./update.do?categrpno=${notice_categrpVO.categrpno }&noticeno=${noticeno}&nowPage=${param.nowPage}'>수정</A>
      <span class='menu_divide' > | </span> 
      <a href="../notice_attachfile/create.do?noticeno=${noticeno}&categrpno=${notice_categrpVO.categrpno}&nowPage=${param.nowPage}">첨부 파일 등록</A>
      <span class='menu_divide' > | </span> 
      <a href="./file_delete.do?noticeno=${noticeno}&categrpno=${notice_categrpVO.categrpno}&nowPage=${param.nowPage}">첨부 파일 삭제</A>
      <span class='menu_divide' > | </span> 
      <A href='./delete.do?categrpno=${notice_categrpVO.categrpno }&noticeno=${noticeno}&nowPage=${param.nowPage}'>삭제</A>
    </c:if>
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="noticeno" value="${noticeno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span class="glyphicon glyphicon-list-alt"></span> 
            <span>${noticeVO.title}</span>
            (<span>${noticeVO.recom}</span>)
            <span>${noticeVO.rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV>${noticeVO.content }</DIV>
          </li>
          <li class="li_none">
            <DIV style='text-decoration: none;'>
              <span class="glyphicon glyphicon-search"></span>
              검색어(키워드): ${noticeVO.word }
            </DIV>
          </li>
          <li class="li_none">
            <DIV>
              <span class="glyphicon glyphicon-download-alt"></span>
              파일명을 클릭하면 다운로드가 가능합니다.
              <A href='../notice_attachfile/downzip.do?noticeno=${noticeno}'><IMG src='./images/zip.png' title='zip 파일 다운로드'></A> 
            </DIV>
            <DIV>
              <c:forEach var="notice_attachfileVO" items="${attachfile_list }">
                <c:set var="fname" value="${notice_attachfileVO.fname.toLowerCase() }" />
                ( <A href='${root}/download2?dir=/notice_attachfile/storage&filename=${notice_attachfileVO.fupname}&downname=${notice_attachfileVO.fname}'>${notice_attachfileVO.fname}</A> )              
              </c:forEach>
            </DIV>  
          </li>                    
        </ul>
      </fieldset>
  </FORM>
  
    <HR>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>








  