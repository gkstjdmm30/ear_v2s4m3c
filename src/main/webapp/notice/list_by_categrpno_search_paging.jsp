<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
  
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

  <div class="row">
  <jsp:include page="/menu/notice_categrp_left.jsp" />
  
    <div class="col-lg-10">
      
      <form name='frm' id='frm' method='get' action='./list.do'>
        <input type='hidden' name='categrpno' value='${noitce_categrpVO.categrpno }'>
        
        <ASIDE style='float: left;'>
          <A href='../notice_categrp/list.do'>카테고리 그룹</A> > 
          <A href='./list.do?categrpno=${notice_categrpVO.categrpno }'>${notice_categrpVO.name }</A>
          <c:if test="${param.word.length() > 0 }">
            > [${param.word }] 검색 목록 (${search_count } 건)
          </c:if>
        </ASIDE>
        <ASIDE style='float: right;'>
          <A href="javascript:location.reload();">새로고침</A>
            <span class='menu_divide' > | </span>
            <A href='./create.do?categrpno=${notice_categrpVO.categrpno }'>등록</A>
          
          <c:choose>
            <c:when test="${param.word != '' }">
              <input type='text' name='word' id='word' value='${param.word }' 
                         style='width: 35%;'>
            </c:when>
            <c:otherwise>
              <input type='text' name='word' id='word' value='' style='width: 35%;'>
            </c:otherwise>
          </c:choose>
          <button type='submit'>검색</button>
          <c:if test="${param.word.length() > 0 }">
            <button type='button' 
                         onclick="location.href='./list.do?categrpno=${notice_categrpVOVO.categrpno}'">검색 취소</button>  
          </c:if>
        </ASIDE> 
      </form>
      <DIV class='menu_line' style='clear: both;'></DIV>
      
      <div style='width: 100%;'>
        <table class="table table-striped" style='width: 100%;'>
          <colgroup>
              <col style="width: 15%;"></col>
              <col style="width: 60%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 15%;"></col>
            
          </colgroup>
          <!-- table 컬럼 -->
          <thead>
            <tr>
              <th style='text-align: center; font-size: 0.9em;'>등록일</th>
              <th style='text-align: center; font-size: 0.9em;'>제목</th>
              <th style='text-align: center; font-size: 0.9em;'>추천</th>
                <th style='text-align: center; font-size: 0.9em;'>
                  기타
                </th>
            </tr>
          
          </thead>
          
          <!-- table 내용 -->
          <tbody>
            <c:forEach var="noticeVO" items="${list }">
              <c:set var="noticeno" value="${noticeVO.noticeno }" />
              
              <tr> 
                <td style='text-align: center;'>${noticeVO.rdate.substring(0, 10)}</td>
                <td>
                  <a href="./read.do?noticeno=${noticeno}&word=${param.word}&nowPage=${param.nowPage}">${noticeVO.title}</a>
                </td> 
                <td style='text-align: center;'>${noticeVO.recom}</td>
                  <td style='text-align: center;'>
                    <a href="./update.do?noticeno=${noticeno}&categrpno=${notice_categrpVO.categrpno}"><img src="./images/update.png" title="수정"></a>
                    <a href="./delete.do?noticeno=${noticeno}&categrpno=${notice_categrpVO.categrpno}"><img src="./images/delete.png" title="삭제"></a>
                    <a href="../attachfile/create.do?noticeno=${noticeno}&categrpno=${notice_categrpVO.categrpno}"><img src="./images/upload.png" title="파일 업로드"></a>
                  </td>
              </tr>
            </c:forEach>
            
          </tbody>
        </table>
        
        <DIV class='bottom_menu'>${paging }</DIV>
        
        <br><br>
      </div>
      
     </div>
    <!-- /.col-lg-10 -->
  
  </div>
  <!-- /.row -->
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>


