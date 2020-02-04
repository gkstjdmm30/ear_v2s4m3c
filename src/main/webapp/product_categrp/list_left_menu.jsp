<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="list-group">
  <c:forEach var="product_categrpVO" items="${list }">
		<c:set var="productcateno" value="${product_categrpVO.productcateno }" />
		<A href='../product/list.do?productcateno=${productcateno }' class="list-group-item">${product_categrpVO.name  }</A>
		<%-- (${categrpVO.cnt })          --%>
  </c:forEach>
</div>






