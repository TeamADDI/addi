<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer class="container footer">
		<div class="footerName text-align-center">
			<p>CopyRight&copy; 2024. Addi Project &middot;</p>
			<p>박찬영 이서윤 남민지 박채아 한상주</p>
			<p>한민욱 이태권 김영은 박광희</p>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="https://getbootstrap.com/docs/4.6/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Kakao JavaScript -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		//카카오로그인
		function kakaoLogin() {

			$.ajax({
				url : '/login/getKakaoAuthUrl',
				type : 'get',
				async : false,
				dataType : 'text',
				success : function(res) {
					location.href = res;
				}
			});

		}

		$(document).ready(
				function() {

					var kakaoInfo = '${kakaoInfo}';

					if (kakaoInfo != "") {
						var data = JSON.parse(kakaoInfo);

						alert("카카오로그인 성공 \n accessToken : "
								+ data['accessToken']);
						alert("user : \n" + "email : " + data['email']
								+ "\n nickname : " + data['nickname']);
					}
				});
	</script>
</body>
</html>
