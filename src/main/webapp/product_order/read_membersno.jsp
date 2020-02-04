<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>주문 확인(회원)</title>
 
  <link href="./css/style.css" rel="Stylesheet" type="text/css">
  <!-- Bootstrap core CSS -->
  <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

 
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
 #{param.membersno }
 

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>