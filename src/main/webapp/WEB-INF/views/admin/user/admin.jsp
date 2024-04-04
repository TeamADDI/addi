<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
HttpSession ses = request.getSession(false);
if (ses != null && ses.getAttribute("u_id") != null) {
	String u_id = (String) ses.getAttribute("u_id");
	if (u_id.equals("admin")) {
		response.sendRedirect(request.getContextPath() + "main");
		System.out.println("admin 계정이 들어왔습니다 admin 메인 페이지로 보냅니다(admin.jsp)");

	} else {
		System.out.println("관리자가 아닙니다. 돌아가세요");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
} else {
	System.out.println("세션 값이 없이 admin 로그인 페이지에 도착 한 상태입니다.");
}
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
<style>
.navbar-brand {
	font-size: 2.8rem;
	margin-left: 210px;
	font-family: Gulim;
	font-weight: bold;
	margin:0 auto;
}

.footer {
	background-color: #343a40;
	color: white;
	text-align: center;
	padding: .7rem 0 1rem;
	width: 100%;
}

.content {
	margin: 90px auto;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/template/admin/nav2.jsp"%>

	<div class="content container-md">
		<p class="title">관리자</p>
		<div class="wraplogin">
			<main class="form-signin text-center">
				<form method="POST" action="./main">
					<input type="text"
						id="u_id" name="u_id" class="form-control"
						placeholder="아이디를 입력해주세요" required autofocus /><br>
					<input type="password" id="u_pw"
						name="u_pw" class="form-control" placeholder="비밀번호를 입력해주세요"
						required /><br>
					<button class="btn btn-dark form-control" type="submit">로그인</button>
				</form>
			</main>
			<br>
			<br>
			<a class="btn form-control" href="/">고객 홈으로 가기</a>
		</div>
	</div><br><br><br><br><br>

	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>