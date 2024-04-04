<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
<style>
.footer {
	background-color: #343a40;
	color: white;
	text-align: center;
	padding: .7rem 0 1rem;
	width: 100%;
}

.content {
	margin: 50px auto 70px auto;
}

.join {
	text-align: right;
}

.find {
	text-align: left;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/template/client/nav.jsp"%>

	<div class="content container-md">
		<p class="title">로그인</p>
		<div class="wraplogin">
			<main class="form-signin text-center">
				<form method="POST" action="./cindex">
					<input type="text" id="u_id" name="u_id" class="form-control"
						placeholder="아이디를 입력해주세요" value="${param.u_id}" required autofocus /><br>
					<br> <input type="password" id="u_pw" class="form-control"
						name="u_pw" placeholder="비밀번호를 입력해주세요" required /><br>
					<br>
					<button class="btn btn-dark form-control" type="submit">로그인</button>
					<br>
				</form>
			</main>
			<br>
			<div class="row">
				<div class="col-8 find">
					<a class="btn" href="findId" alt="아이디 찾기입니다.">ID 찾기</a> / 
					<a class="btn" href="findPw" alt="비밀번호 찾기입니다.">비밀번호 찾기</a>
				</div>
				<div class="col-4 join">
					<a class="btn" href="/cjoin">회원가입</a>
				</div>
			</div>
		</div>
	</div><br><br><br><br>

	<script>
		window.onload = function() {
			// 현재 URL을 가져옴
			var url = window.location.href;

			// URL에서 '?' 이후의 문자열을 제거하여 새로운 URL을 생성
			var cleanUrl = url.split('?')[0];

			// 새로운 URL을 페이지의 주소로 설정하여 현재 페이지를 다시 로드함
			window.history.replaceState({}, document.title, cleanUrl);
		}
	</script>
	<script>
		// Message가 모델에 존재할 때 알람창 표시
		<c:if test="${not empty message}">
		alert("${message}");
		</c:if>
	</script>

	<script>
		// msg가 모델에 존재할 때 알람창 표시
		<c:if test="${not empty msg}">
		alert("${msg}");
		</c:if>
	</script>
	
	
	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>
