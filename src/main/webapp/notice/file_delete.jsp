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
  function panel_img(file) {
    var tag = "";
    tag   = "<A href=\"javascript: $('#attachfile_panel').hide();\">";
    tag += "  <IMG src='../notice_attachfile/storage/" + file + "' style='width: 100%;'>"; 
    tag += "</A>";
    
    $('#attachfile_panel').html(tag);
    $('#attachfile_panel').show();
  }
</script>
</head>

<body>
<c:set var="categrpno" value="${notice_categrpVO.categrpno}" />
<c:set var="noticeno" value="${noticeVO.noticeno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    카테고리 그룹 > 
    <A href='./list.do?categrpno=${categrpno }'>${categrpVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?categrpno=${categrpno }&nowPage=${param.nowPage}'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?categrpno=${categrpno }&noticeno=${noticeno}&nowPage=${param.nowPage}'>수정</A>
    <span class='menu_divide' > | </span> 
    <a href="../notice_attachfile/create.do?noticeno=${noticeno}&categrpno=${categrpno}&nowPage=${param.nowPage}">첨부 파일 등록</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?categrpno=${categrpno }&noticeno=${noticeno}&nowPage=${param.nowPage}'>삭제</A>
    
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
            <DIV id='attachfile_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" style='text-align: center;'>
            <c:forEach var="notice_attachfileVO" items="${notice_attachfile_list }">
              <c:set var="thumb" value="${notice_attachfileVO.thumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('${notice_attachfileVO.fname }')"><IMG src='../notice_attachfile/storage/${thumb }' style='margin-top: 2px;'></A>
                  <A href="./file_delete_proc.do?noticeno=${noticeno}&attachfileno=${notice_attachfileVO.attachfileno }"><IMG src='../notice_attachfile/images/x.png' style='margin-top: 2px; width: 20px;'></A>
                </c:when>
              </c:choose>
            </c:forEach>
          </li>
          <li class="li_center" >
            <button type="button" onclick="location.href='./read.do?noticeno=${noticeno}&nowPage=${param.nowPage}'"
                        class="btn btn-info">첨부 파일 삭제 취소</button>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom2.jsp" flush='false' />
</body>

</html>
  