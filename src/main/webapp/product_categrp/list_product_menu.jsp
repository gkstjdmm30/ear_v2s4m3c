<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<spen class='menubar'>
  <li class="nav-item"><a class="nav-link" href="../product/list_all.do" id="current">상품</a>
    <ul>  
    <c:forEach var="product_categrpVO" items="${list }">
		  <c:set var="productcateno" value="${product_categrpVO.productcateno }" />
		  <A href='../product/list.do?productcateno=${productcateno }'>${product_categrpVO.name  }</A>
		  <%-- (${categrpVO.cnt })          --%>
    </c:forEach>
    </ul>
  </li>
</spen> 






