<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%

HttpSession ses = request.getSession(false);


if (ses != null && ses.getAttribute("u_id") != null) {

	System.out.println("cindex.jsp(사용자있음)");
	response.sendRedirect(request.getContextPath() + "cindex");
} else {

	System.out.println("index.jsp(사용자없음)");
}
%>
<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>아띠</title>

</head>
<body>

	<jsp:include page="WEB-INF/views/common/index/indexHeader.jsp" />
	<jsp:include page="WEB-INF/views/common/index/indexSilde.jsp" />
	<jsp:include page="WEB-INF/views/common/index/indexFooter.jsp" />
</body>
</html>
