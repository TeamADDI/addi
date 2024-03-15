<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>아띠</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/carousel/">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/sign-in/">


<!-- Bootstrap core CSS -->
<link
	href="https://getbootstrap.com/docs/4.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<!-- 로그인 -->
<link
	href="https://getbootstrap.com/docs/4.6/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">


<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/4.6/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.6/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/4.6/assets/img/favicons/safari-pinned-tab.svg"
	color="#563d7c">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon.ico">
<meta name="msapplication-config"
	content="/docs/4.6/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<link
	href="https://getbootstrap.com/docs/4.6/examples/carousel/carousel.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="https://getbootstrap.com/docs/4.6/examples/sign-in/signin.css"
	rel="stylesheet">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="#">아띠</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarCollapse" aria-controls="navbarCollapse"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">진료</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">미용</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품</a></li>

					<li class="nav-item"><a class="nav-link" href="#">돌봄</a></li>
				</ul>
				<form class="form-inline mt-2 mt-md-0">

					<!-- 필독!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
					<!-- 로그인 및 로그아웃 링크 추가 (이건 헤더 오른쪽에 있는 링크들) -->
					<!-- 로그인이 안 되어있을 때 클라이언트 페이지의 링크 두 개 입니다(index.jsp) -->
					<a class="nav-link" href="clogin">로그인</a> <a class="nav-link"
						href="cjoin">회원가입</a>

					<!-- 로그인이 되어있을 때 클라이언트 페이지의 링크 두 개 입니다(cindex) -->
					<!--
					<a class="nav-link" href="/clientLogout.action">로그아웃</a>
					 <a class="nav-link" href="mypage">내정보</a> -->


					<!-- 관리자 메인 페이지에서의 링크입니다(main) -->
					<!-- 
					 	<a class="nav-link" href="logout">로그아웃</a>
					 	<a class="nav-link" href="aindex">클라이언트</a>
					 -->

					<!-- 관리자 클라이언트 인덱스 페이지에서의 링크입니다(aindex) -->
					<!-- 
					 	<a class="nav-link" href="logout">로그아웃</a>
					  -->


				</form>
			</div>
		</nav>
	</header>
</body>
</html>