<%@ page contentType="text/html; charset=UTF-8" %>
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
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    카테고리 그룹 >
    <A href='../notice/list.do?categrpno=${notice_categrpVO.categrpno }&nowPage=${param.nowPage}'>${notice_categrpVO.name }</A> >
    파일 등록
  </ASIDE>
  <ASIDE style='float: right;'>
    <c:if test="${sessionScope.ps == 0}">
      <A href='./list.do?categrpno=${param.categrpno }'>목록</A>
    </c:if>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' 
               enctype="multipart/form-data" class="form-horizontal">
               
      <!-- FK categrpno 지정 -->
      <input type='hidden' name='categrpno' id='categrpno' value='${param.categrpno }'>
      <input type='hidden' name='noticeno' id='noticeno' value='${param.noticeno }'>
      <input type='hidden' name='nowPage' value='${param.nowPage }'>
      
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='file' class="form-control input-lg" name='fnamesMF'  
                     value='' placeholder="파일 선택" multiple="multiple">
        </div>
      </div>

      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">파일 전송</button>
        <button type="button" 
                    onclick="location.href='../notice/list.do?categrpno=${notice_categrpVO.categrpno }&nowPage=${param.nowPage}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>
  
<jsp:include page="/menu/bottom2.jsp" flush='false' />
</body>
 
</html> 
 
  