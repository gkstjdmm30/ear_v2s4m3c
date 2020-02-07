<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
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
  function delete_by_noticeno() {
    frm_delete_by_noticeno.submit();
  }
</script>
</head> 
 
<body>

<FORM name='frm_delete_by_noticeno' method='POST' 
            action='../notice_attachfile/delete_by_noticeno.do'>
  <input type='hidden' name='noticeno' value='${param.noticeno }'>            
  <input type='hidden' name='categrpno' value='${param.categrpno }'>
  <input type='hidden' name='nowPage' value='${param.nowPage }'>
</FORM>

<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    카테고리 그룹 > 
    <A href='./list.do?categrpno=${categrpno }&nowPage=${param.nowPage}'>${categrpVO.name }</A> >
    삭제
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?categrpno=${param.categrpno }&nowPage=${param.nowPage}'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
  
  <div class='menu_line'></div>
 
  <FORM name='frm' method='POST' action='./delete.do'>
      <input type='hidden' name='noticeno' value='${param.noticeno}'>
      <input type="hidden" name="categrpno" value="${param.categrpno }">
      <input type="hidden" name="nowPage" value="${param.nowPage }">
            
      <div class="form-group">   
        <div class="col-md-12" style='text-align: center; margin: 30px;'>
          삭제 되는글: ${noticeVO.title }<br><br>
          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>
          다른 회원의 글은 삭제 할 수 없습니다.<br><br>
          
          <c:choose>
            <c:when test="${count_by_noticeno > 0 }">
              <DIV style="text-decoration: underline;">
                관련된 첨부파일 ${count_by_noticeno } 건이 발견되었습니다.
              </DIV>
              <DIV> 
                관련된 첨부파일을 삭제해야 글을 삭제 할 수 있습니다.<br>
                <span style='color: #FF0000'>첨부 파일이 삭제되면 복구 할 수 없습니다.</span><br>
                첨부 파일을 삭제 하시겠습니까?
                <button type='button' onclick="delete_by_noticeno();" class="btn btn-info">예(삭제진행)</button> 
              </DIV>
            </c:when>
            <c:otherwise>
              <button type = "submit" class="btn btn-info">삭제 진행</button>
            </c:otherwise>
          </c:choose>
          
          <button type = "button" onclick = "history.back()" class="btn btn-info">취소</button>
        </div>
      </div>   
  </FORM>
 
<jsp:include page="/menu/bottom2.jsp" flush='false' />
</body>
 
</html> 
 
  