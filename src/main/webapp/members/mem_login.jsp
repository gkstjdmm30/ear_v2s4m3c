<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>회원 로그인</title>
 

  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">

</head>
<script type="text/javascript">
$(function() { // 자동 실행
});
</script>
<body>
<jsp:include page="/menu/top.jsp" />

<DIV class='title_line' style='width: 20%;'>로그인</DIV>
 
<DIV style='width: 80%; margin: 0px auto;'>
  <FORM name='frm' method='POST' action='./mem_login.do'>
  
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.8em;'>아이디</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='id' id='id' 
                   value='${ck_id }' required="required" 
                   style='width: 30%;' placeholder="아이디" autofocus="autofocus">
        <Label>   
          <input type='checkbox' name='id_save' value='Y' 
                    ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
        </Label>
      </div>
 
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.8em;'>패스워드</label>    
      <div class="col-md-10">
        <input type='password' class="form-control input-lg" name='passwd' id='passwd' value='${ck_passwd }' required="required" style='width: 30%;' placeholder="패스워드">
        <Label>
          <input type='checkbox' name='passwd_save' value='Y' 
                    ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
        </Label>
      </div>
    </div>   
 
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" class="btn btn-primary btn-md">로그인</button>
        <button type='button' onclick="location.href='./mem_create.do'" class="btn btn-primary btn-md">회원가입</button>
      </div>
    </div>   
    
  </FORM>
</DIV>

<jsp:include page="/menu/bottom2.jsp" />
</body>
</html>