<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
    <jsp:include page="../../common/aTemplates/memberHeader.jsp"></jsp:include>
	<jsp:include page="../../common/aTemplates/memberList.jsp"></jsp:include>
</body>
</html>
