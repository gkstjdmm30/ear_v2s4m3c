<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>delete_by_contentsno_msg.jsp</title>
 
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
 
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV  style='display: table; width: 100%; height: 300px;'>
<DIV style='display: table-cell; vertical-align: middle;'>
 
<DIV class='title_line'>알림</DIV>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.count > 0 }">
          <LI class='li_none'>
            <span class='span_success'>첨부 파일을 삭제했습니다.</span>
          </LI>
          <LI class='li_none'>
            <button type='button' 
                        onclick="location.href='../notice/delete.do?noticeno=${param.noticeno}&categrpno=${param.categrpno}'"
                        class="btn btn-info">계속 삭제 진행</button>
            <button type='button' 
                        onclick="location.href='../notice/read.do?categrpno=${param.categrpno}&noticeno=${param.noticeno }'"
                        class="btn btn-info">글 삭제 중지</button>                                                
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>
            <span class='span_fail'>첨부 파일 삭제에 실패했습니다.</span>
          </LI>
          <LI class='li_none'>
            <button type='button' 
                        onclick="history.back();"
                        class="btn btn-info">재시도</button>
            <button type='button' 
                        onclick="location.href='../notice/read.do?categrpno=${param.categrpno}&noticeno=${param.noticeno }'"   
                        class="btn btn-info">삭제 중지</button>                        
          </LI>
        </c:otherwise>
      </c:choose>
     </UL>
  </fieldset>
 
</DIV>

</DIV>
</DIV> 

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
   

   
   
   
   