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
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/product/">

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


<!-- Tab CSS -->
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

.footer {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
	text-align: center;
}
</style>



<!-- Custom styles for this template -->
<link
	href="https://getbootstrap.com/docs/4.6/examples/carousel/carousel.css"
	rel="stylesheet">
<!-- 로그인 template -->
<link
	href="https://getbootstrap.com/docs/4.6/examples/sign-in/signin.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="https://getbootstrap.com/docs/4.6/examples/product/product.css"
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
					<!-- 로그인 및 로그아웃 링크 추가 -->
					<a class="nav-link" href="/clientLogout.action">로그아웃</a> <a
						class="nav-link" href="/mypage.action">내정보</a>
					<!-- 로그인 및 로그아웃 링크 추가 끝 -->
				</form>
			</div>
		</nav>
	</header>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="https://getbootstrap.com/docs/4.6/dist/js/bootstrap.bundle.min.js"><\/script>')
	</script>
	<script src="/docs/4.6/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>


</body>
</html>