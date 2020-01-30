<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">
  
<script type="text/javascript">
function update_form(categrpno) {
  // alert('admin2no: ' + admin2no);
  
  var url = './update.do?categrpno=' + categrpno;
  var win = window.open(url, '카테고리 그룹 수정', 'width=800px, height=400px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 

function delete_form(categrpno) {
  // alert('admin2no: ' + admin2no);
  
  var url = './delete.do?categrpno=' + categrpno;
  var win = window.open(url, '카테고리 그룹 삭제', 'width=800px, height=500px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 500) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 

</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp"  /> <%-- flush='false' --%>

  <div class="row">
  <jsp:include page="../menu/notice_categrp_left.jsp" />
  
    <div class="col-lg-10">
    
      <DIV class='title_line'>공지사항 카테고리 그룹(관리자용)</DIV>
     
      <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
        <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
          <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
            
          <label>그룹 이름</label>
          <input type='text' name='name' value='' required="required" style='width: 25%;'>
     
          <label>순서</label>
          <input type='number' name='seqno' value='1' required="required" 
                    min='1' max='1000' step='1' style='width: 5%;'>
           
          <button type="submit" id='submit'>등록</button>
          <button type="button" onclick="cancel();">취소</button>
        </FORM>
      </DIV>
     
      
      <TABLE class='table table-striped'>
        <colgroup>
          <col style='width: 10%;'/>
          <col style='width: 30%;'/>
          <col style='width: 10%;'/>
          <col style='width: 10%;'/>    
          <col style='width: 20%;'/>
          <col style='width: 20%;'/>
        </colgroup>
       
        <thead>  
        <TR>
          <TH class='th_basic'>그룹번호</TH>
          <TH class='th_basic'>대분류명</TH>
          <TH class='th_basic'>출력 순서</TH>
          <TH class='th_basic'>등록일</TH>
          <TH class='th_basic'>기타</TH>
        </TR>
        </thead>
        
        <tbody>
        <c:forEach var="notice_categrpVO" items = "${list}">
          <c:set var="categrpno" value="${notice_categrpVO.categrpno }" />
          
          <TR>
            <TD style='text-align: center;'>${notice_categrpVO.categrpno }</TD>
            <TD style='text-align: left: ;'>
              <A href='../notice/list.do?categrpno=${categrpno }'>${notice_categrpVO.name }</A>(${notice_categrpVO.cnt })
            </TD>
            <TD style='text-align: center;'>${notice_categrpVO.seqno }</TD>
            <TD style='text-align: center;'>${notice_categrpVO.rdate.substring(0, 10) }</TD>
            <TD style='text-align: center;'>
              <A href="./update_seqno_up.do?categrpno=${categrpno }"><IMG src='./images/up.png' title='우선순위 높임' style='width: 16px;'></A>
              <A href="./update_seqno_down.do?categrpno=${categrpno }"><IMG src='./images/down.png' title='우선순위 낮춤' style='width: 16px;'></A>
              <A href="javascript: update_form(${categrpno });"><IMG src='./images/update.png' title='수정'></A>
              <A href="javascript: delete_form(${categrpno });"><IMG src='./images/delete.png' title='삭제'></A>
            </TD>
          </TR>
        </c:forEach> 
        </tbody>
     
    </TABLE>
    
    </div>
    <!-- /.col-lg-10 -->
  
  </div>
  <!-- /.row -->
    
<jsp:include page="/menu/bottom.jsp"  /> <%-- flush='false' --%>
</body>
 
</html> 
 
 