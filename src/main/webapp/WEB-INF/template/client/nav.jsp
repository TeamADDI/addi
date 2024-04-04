<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<a class="navbar-brand" href="/clickHandler">Oㅏㄸ| <i
			class='fas fa-paw' style='font-size: 35px; color: orange'></i></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link"
					href="/resvForm?category=cl">진료</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/resvForm?category=bt">미용</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/client/item/list">상품</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/resvForm?category=ca">돌봄</a></li>
				<li class="form-inline mt-2 mt-md-0">
					<%-- 세션에 u_id가 있는 경우 --%> <%
 if (session.getAttribute("u_id") != null) {
 	// 사용자가 로그인한 경우
 	String u_id = (String) session.getAttribute("u_id");
 	if ("admin".equals(u_id)) {
 		// admin으로 로그인한 경우
 		if ("/".equals(request.getRequestURI())) {
 	// admin이 index 페이지에 있는 경우
 %>
				
				<li class="nav-item"><a class="nav-link"
					href="/clientLogout.action">Logout</a></li>
				<%
				} else {
				// admin이 index 페이지 이외의 페이지에 있을 경우
				%>
				<%
				System.out.println("uri: " + request.getRequestURI());
				%>
				<li class="nav-item"><a class="nav-link" href="/admin">Logout</a></li>
				<li class="nav-item"><a class="nav-link" href="/aindex">Addi</a></li>
				<%
				}
				} else {
				// 클라이언트로 로그인한 경우
				%>
				<li class="nav-item"><a class="nav-link"
					href="/clientLogout.action">Logout</a></li>
				<li class="nav-item"><a class="nav-link" href="/mypage">MyPage</a></li>
				<%
				}
				} else {
				// 로그인하지 않은 경우
				%>
				<li class="nav-item"><a class="nav-link" href="/clogin">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="/cjoin">Join</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</nav>
</header>