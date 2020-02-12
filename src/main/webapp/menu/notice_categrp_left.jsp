<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      <div class="col-lg-2">

        <h3 class="my-4">${notice_categrpVO.name}</h3>
        <div class="list-group">
          <a href="${pageContext.request.contextPath}/notice/list.do?categrpno=1&nowPage=1" class="list-group-item">공지사항</a>
          <c:if test="${sessionScope.ps == 0}">
          <a href="${pageContext.request.contextPath}/notice_categrp/list.do" class="list-group-item">관리자</a>
          </c:if>
        </div>

      </div>
      <!-- /.col-lg-3 -->


