<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<div class="list-group">
  <c:forEach var="product_categrpVO" items="${list }">
		<c:set var="productcateno" value="${product_categrpVO.productcateno }" />
		<A href='${root }/product/list.do?productcateno=${productcateno }&nowPage=1' class="list-group-item">${product_categrpVO.name  }</A>
		<%-- (${categrpVO.cnt })          --%>
  </c:forEach>
</div>






