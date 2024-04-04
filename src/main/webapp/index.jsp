<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/carousel/">
<link
	href="https://getbootstrap.com/docs/4.6/examples/carousel/carousel.css"
	rel="stylesheet">
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
<style>
.quick-center h4 {
	padding: 20px;
}

#bestItems {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/template/client/nav.jsp"%>

	<div class="contentind">

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="resources/images/ban1.png" alt="오드펫-비건당근"
						class="img-fluid">
				</div>
				<div class="carousel-item">
					<img src="resources/images/ban2.png" alt="미용사진" class="img-fluid">
				</div>

				<div class="carousel-item">
					<img src="resources/images/ban3.png" alt="어노인트-비건샴푸"
						class="img-fluid">
				</div>
			</div>

			<button class="carousel-control-prev" type="button"
				data-target="#myCarousel" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-target="#myCarousel" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</button>
		</div>


		<!-- ================================================== -->

		<div class="quick-center">
			<h1>패키지 예약</h1>
			<h4>'진료 + 미용 + 돌봄'을 패키지로 예약하실 수 있습니다.</h4>
			<p>
				<a class="btn btn-dark" href="/quickResv">패키지 예약 Quick &raquo;</a>
			</p>
		</div>

		<!-- ================================================== -->

		<hr class="featurette-divider">

		<div class="container">
			<h1>BEST TOP</h1>
			<br>
			<br>
			<br>
			<div id="bestItems" class="img-fluid"></div>
			<br>
			<br>
			<br>
		</div>
	</div>

	<script>
	<!-- JavaScript로 받은 JSON 데이터를 JSP에 전달하여 출력하는 코드 -->
		// 페이지가 로드될 때 실행되는 함수
		window.onload = function() {
			// AJAX 요청 생성
			var xhr = new XMLHttpRequest();

			// 요청을 보낼 URL 설정
			xhr.open('GET', '/getBest', true);

			// 요청이 완료되었을 때의 이벤트 핸들러
			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						// 요청이 성공했을 때의 동작 (예: 응답 처리)
						var response = JSON.parse(xhr.responseText);
						console.log(response);

						// 받은 JSON 데이터를 HTML에 삽입하여 출력
						var html = '';
						response
								.forEach(function(item) {
									html += '<style>img{width:400px; height:400px;}</style>';
									html += '<div class="col-md-4 gallery-item">';
									// 해당부분 밑에 수정함(상주)
									html += '<a href="/client/item/detail/num/' + item.item_num + '">';
									html += '<img src="/resources/upload/' + item.i_img + '" alt="' + item.c_name + '" class="img-thumbnail">';
									html += '<br><br>';
									html += '<p class="iname" style="font-weight:bold ; font-size:1.2rem">'
											+ item.c_name + '</p>';
									html += '<p>' + item.c_price + '원</p>';
									html += '</a>';
									html += '</div>';

								});

						// 생성된 HTML을 bestItems 엘리먼트에 삽입
						document.getElementById('bestItems').innerHTML = html;
					} else {
						// 요청이 실패했을 때의 동작
						console.error('Request failed: ' + xhr.status);
					}
				}
			};

			// 요청 보내기
			xhr.send();
		};
	</script>


	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>