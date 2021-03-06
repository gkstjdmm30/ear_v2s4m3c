<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<%-- <jsp:include page="/menu/top.jsp" flush='false' /> --%>
<div style='margin: 5%;'>
 
<DIV class='title_line' style='width: 40%;'>카테고리 그룹 등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do'>
  <fieldset class='fieldset_basic'>
    <ul>
      <li class='li_none'>
        <label class='label_basic'>카테고리 그룹 이름</label>
        <input type='text' name='name' value='' required="required" autofocus="autofocus">
      </li>
      <li class='li_none'>
        <label class='label_basic'>출력 순서</label>
        <input type='number' name='seqno' value='1' required="required" placeholder="${seqno }" min="1" max="1000" step="1" style='width: 70%;'>
      </li>
      <li class='li_none'>
        <label>출력 형식</label>
        <select name='visible'>
          <option value='Y' selected="selected">Y</option>
         <option value='N'>N</option>
        </select>
      </li>
      <li class='li_right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">목록</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
 
</div>
<%-- <jsp:include page="/menu/bottom.jsp" flush='false' /> --%>
</body>
 
</html> 
  
   