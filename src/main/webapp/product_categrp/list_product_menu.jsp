<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />


<spen class='menubar'>
  <li class="nav-item"><a class="nav-link" href="${root}/product/list_all.do?nowPage=1" id="current">상품</a>
    <ul>  
    <c:forEach var="product_categrpVO" items="${list }">
		  <c:set var="productcateno" value="${product_categrpVO.productcateno }" />
		  <A href='${root }/product/list.do?productcateno=${productcateno }&nowPage=1'>${product_categrpVO.name  }</A>
		  <%-- (${categrpVO.cnt })          --%>
    </c:forEach>
    </ul>
  </li>
</spen> 






