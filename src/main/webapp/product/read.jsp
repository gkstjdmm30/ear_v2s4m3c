<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Shop</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link href="../css/button.css" rel="Stylesheet" type="text/css">
<link href="../css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
  <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="../css/shop-homepage.css" rel="stylesheet">

<script type="text/javascript">
  $(function() { // 자동 실행
    list_by_productno(${productVO.productno });  // JS의 EL 접근
    
    if ('${sessionScope.membersno}' != '') { // 로그인된 경우
      // alert('sessionScope.memberno: ' + '${sessionScope.memberno}');

      var frm_reply = $('#frm_reply');
      $('#content', frm_reply).attr('placeholder', '댓글 작성');
    }
  });
  
  function panel_img(file) {
    var tag = "";
    tag = "<A href=\"javascript: $('#attachfile_panel').hide();\">";
    tag += "  <IMG src='../product_image/storage/" + file
        + "' style='width: 100%;'>";
    tag += "</A>";

    $('#attachfile_panel').html(tag);
    $('#attachfile_panel').show();
  }
  
  function create_reply() {
    var frm_reply = $('#frm_reply');
    var params = frm_reply.serialize();
    // alert('checkId() 호출됨: ' + params);
    // return;
    if ($('#membersno', frm_reply).val().length == 0) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("로그인해야 등록 할 수 있습니다."); // 내용
      $('#modal_panel').modal();            // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    // 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식, 오라클은 1자가 3바이트임으로 300자로 제한
    // alert('내용 길이: ' + $('#content', frm_reply).val().length);
    // return;
    if ($('#content', frm_reply).val().length > 300) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
      $('#modal_panel').modal();           // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    $.ajax({
      url: "../reply/create.do", // action 대상 주소
      type: "post",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";
        
        if (rdata.count > 0) {
          $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
          msg = "댓글을 등록했습니다.";
          
          list_by_productno(${productVO.productno }) // 목록을 새로 읽어옴.
          
        } else {
          $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
          msg = "댓글 등록에 실패했습니다.";
        }
        
        $('#modal_title').html('댓글 등록'); // 제목 
        $('#modal_content').html(msg);        // 내용
        $('#modal_panel').modal();              // 다이얼로그 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
  }
  
  // 댓글 목록
  function list_by_productno(productno) {
    // alert(contentsno);
    var params = 'productno=' + productno;

    $.ajax({
      url: "../reply/list_by_productno_join.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = '';
        
        $('#panel_reply').html(''); // 패널 초기화, val(''): 안됨
        
        for (i=0; i < rdata.list.length; i++) {
          var row = rdata.list[i];
          
          msg += "<DIV style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
          msg += "<span style='font-weight: bold;'>" + row.id + "</span>";
          msg += "  " + row.rdate;
          if ('${sessionScope.membersno}' == row.membersno) { // 글쓴이 일치여부 확인
            msg += " <A href='javascript:reply_delete("+row.replyno+")'><IMG src='./images/delete.png'></A>";
          }
          msg += "  " + "<br>";
          msg += row.content;
          msg += "</DIV>";
        }
        // alert(msg);
        $('#panel_reply').append(msg);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
    
  }
  
  // 삭제 레이어 출력
  function reply_delete(replyno) {
    // alert('replyno: ' + replyno);
    var frm_reply_delete = $('#frm_reply_delete');
    $('#replyno', frm_reply_delete).val(replyno); // 삭제할 댓글 번호 저장
    $('#modal_panel_delete').modal();               // 삭제폼 다이얼로그 출력
  }
  
  // 삭제 처리
  function reply_delete_proc(replyno) {
    // alert('replyno: ' + replyno);
    var params = $('#frm_reply_delete').serialize();
    $.ajax({
      url: "./reply_delete.do", // action 대상 주소
      type: "post",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";
        
        if (rdata.count ==1) { // 패스워드 일치
          if (rdata.delete_count == 1) { // 삭제 성공

            $('#btn_frm_reply_delete_close').trigger("click"); // 삭제폼 닫기, click 발생 
            
            list_by_productno(${productVO.productno }); // 목록을 다시 읽어옴
            
            return; // 함수 실행 종료
          } else {  // 삭제 실패
            msg = "패스 워드는 일치하나 댓글 삭제에 실패했습니다. <br>";
            msg += " 다시한번 시도해주세요."
          }
        } else { // 패스워드 일치하지 않음.
          msg = "패스워드가 일치하지 않습니다.";
        }
        
        $('#modal_panel_delete').hide();       // 삭제폼이 있는창을 숨김
        
        $('#modal_panel_delete_msg_content').html(msg);   // 내용
        $('#modal_panel_delete_msg').modal();                   // 다이얼로그 출력        

      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });

    
  }
</script>
</head>

<body>

<c:set var="productcateno" value="${product_categrpVO.productcateno}" />
<c:set var="productno" value="${productVO.productno }" />

<jsp:include page="/menu/top.jsp" flush='false' />

  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  <!-- 삭제폼 -->
  <div class="modal fade" id="modal_panel_delete" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">댓글 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <form name='frm_reply_delete' id='frm_reply_delete' method='POST' 
                    action='./reply_delete.do'>
            <input type='hidden' name='replyno' id='replyno' value=''>
            
            <label>패스워드</label>
            <input type='password' name='passwd' id='passwd' class='form-control'>
            <div style='text-align: right; margin: 5px;'>
              <button type='button' class='btn btn-success' 
                           onclick="reply_delete_proc(this.form.replyno.value);this.form.passwd.value='';">삭제</button>
            </div> 
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" 
                       id='btn_frm_reply_delete_close'>Close</button>
        </div>
      </div>
    </div>
  </div> <!-- 삭제폼 종료 -->
  
  <!-- 삭제폼 알림창 시작 -->
  <div class="modal fade" id="modal_panel_delete_msg" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
                       onclick="$('#modal_panel_delete').show();">×</button>
          <h4 class="modal-title">비밀번호 에러</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_panel_delete_msg_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <!-- 현재 창은 삭제되면서 삭제폼이 다시 출력됨. -->
          <button type="button" class="btn btn-default" data-dismiss="modal"
                      onclick="$('#modal_panel_delete').show();">Close</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  <DIV class='content'>
<!-- Page Content -->
  <div class="container">
    <ASIDE style='float: left;'>
    <A href='../product_categrp/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?productcateno=${productcateno }&word=${param.word}'>${product_categrpVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?productcateno=${productcateno }&word=${param.word}&nowPage=${param.nowPage}'>목록</A>
    <c:if test="${sessionScope.ps == 0}">
      <span class='menu_divide' > | </span>  
     <a href="../product_image/create.do?productno=${productno}&productcateno=${product_categrpVO.productcateno}&nowPage=${param.nowPage}">첨부 파일 등록</A>
      <span class='menu_divide' > | </span> 
      <a href="./file_delete.do?productno=${productno}&productcateno=${product_categrpVO.productcateno}&nowPage=${param.nowPage}">첨부 파일 삭제</A>
      <span class='menu_divide' > | </span>
      <A href='./update.do?productcateno=${productcateno }&productno=${productno}&nowPage=${param.nowPage}'>수정</A>
      <span class='menu_divide' > | </span> 
      <A href='./delete.do?productcateno=${productcateno }&productno=${productno}&nowPage=${param.nowPage}'>삭제</A>
    </c:if>
  </ASIDE> 
  
  <div class='menu_line'></div>

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">이어팔아</h1>
        <c:import url="/product_categrp/list_left_menu.do" />

      </div>
      <!-- /.col-lg-3 -->
      
      <div class="col-lg-9">

<c:choose>
  <c:when test="${sessionScope.id == null }">
      <script type="text/javascript">
      alert('로그인 해주세요');
      </script>
    <FORM name='frm' method="get" action='../members/mem_login.do'>
  </c:when>
  <c:otherwise>
    <FORM name='frm' method="get" action='../product_order/product_order_create.do'>
      <input type='hidden' name='productno' id='productno' value='${productno}'>
      <input type='hidden' name='membersno' id='membersno' value='${sessionScope.membersno}'>
  </c:otherwise>
</c:choose>
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span class="glyphicon glyphicon-list-alt"></span> 
            <span>${productVO.name}</span>
            (<span>${productVO.cnt}</span>)
            <span>${productVO.rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV id='attachfile_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" >
            <c:forEach var="product_imageVO" items="${product_image }">
              <c:set var="thumb" value="${product_imageVO.thumb }" />
              <ASIDE style='float: left;'>
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('${product_imageVO.fname }')"><IMG src='../product_image/storage/${thumb }' style='margin-top: 2px; width: 400px; height: 300px;'></A>
                 </c:when> 
                 <c:otherwise>
                  <IMG class="card-img-top" src='./images/no_image.png' alt="">
                </c:otherwise>       
              </c:choose>
               </ASIDE>
            </c:forEach>
          </li>
         </ul>
          <ASIDE style='float: right;'>
          <ul>
          <li class="li_none">
              ${productVO.name}
          </li>
          <li class="li_none">
            구매 갯수: <input type='number' name='count' id='count' value='1'  min='1' step='1'> 
          </li> 
          <li class="li_none">
            <DIV style='text-decoration: none;'>
              <span class="glyphicon glyphicon-search"></span>
              검색어(키워드): ${productVO.word }
            </DIV>
          </li>
          <li class="li_center" >
<!--           <button type="button" onclick="" class="button_circle" style='width: 100px;'>추천</button> -->
          <button type="submit" class="btn btn-info" style='width: 100px;' >주문</button>
          </li>
          </ul>
          </ASIDE>
      </fieldset>
   </FORM>   
      <!-- 댓글 영역 시작 -->
  <DIV style='width: 100%;'>
    <HR>
    <FORM name='frm_reply' id='frm_reply'>
      <input type='hidden' name='productno' id='productno' value='${productno}'>
      <input type='hidden' name='membersno' id='membersno' value='${sessionScope.membersno}'>
      
      <textarea name='content' id='content' style='width: 100%; height: 60px;' placeholder="댓글 작성, 로그인해야 등록 할 수 있습니다."></textarea>
      <input type='password' name='passwd' id='passwd' placeholder="비밀번호">
      <button type='button'  id='btn_create' onclick="create_reply()">등록</button>
    </FORM>
    <HR>
    <DIV id='panel_reply'>
    
    </DIV>
    
  </DIV>
  
  <!-- 댓글 영역 종료 -->
  </div>
      
    
    <!-- /.col-lg-9 -->
      </div>

    <!-- /.row -->
    

  </div>
  <!-- /.container -->     
  
  </DIV> <!-- content END -->
  <br><br><br><br><br>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>








  