<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>패스워드 변경</title>
 
  <link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">

<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript">
function send() {
  var msg = '';
  if ($('#new_passwd').val() != $('#new_passwd2').val()) {
    msg = '입력된 패스워드가 일치하지 않습니다.<br>';
    msg += "패스워드를 다시 입력해주세요.<br>"; 
    
    $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
    $('#modal_title').html('패스워드 일치 여부  확인'); // 제목 
    $('#modal_content').html(msg);  // 내용
    $('#modal_panel').modal();         // 다이얼로그 출력
    
    return false; // submit 중지
  }
  
  frm.submit(); // submit 진행
}
</script> 
 
</head> 
 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
  <!-- Modal -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4>
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal END -->
 
    
  <DIV class='title_line'>패스워드 변경</DIV>
 
  <FORM name='frm' id='frm' method='POST' action='./passwd_update.do' 
              class="form-horizontal">
    <input type='hidden' name='membersno' value='${param.membersno }'>
              
    <div class="form-group">
      <label class="col-md-6 control-label" style="font-size: 0.8em;">현재 패스워드</label>    
      <div class="col-md-6">
        <input type='password' class="form-control input-lg" name='passwd' 
                  id='passwd' value='' required="required" 
                  style='width: 30%;' placeholder="패스워드">
      </div>
    </div>   
                    
    <div class="form-group">
      <label class="col-md-6 control-label" style="font-size: 0.8em;">새로운 패스워드</label>    
      <div class="col-md-6">
        <input type='password' class="form-control input-lg" name='new_passwd' 
                  id='new_passwd' value='' required="required" 
                  style='width: 30%;' placeholder="패스워드">
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-6 control-label" style="font-size: 0.8em;">새로운 패스워드 확인</label>    
      <div class="col-md-6">
        <input type='password' class="form-control input-lg" name='new_passwd2' 
                  id='new_passwd2' value='' required="required" 
                  style='width: 30%;' placeholder="패스워드">
      </div>
    </div>   
    
    <div class="form-group">
      <div class="col-md-offset-6 col-md-6">
        <button type="button" onclick="send();" class="btn btn-primary btn-md">변경</button>
        <button type="button" onclick="location.href='../index.jsp'" class="btn btn-primary btn-md">취소</button>
 
      </div>
    </div>   
</FORM>
 
<jsp:include page="/menu/bottom2.jsp" flush='false' />
</body>
 
</html> 
 
 