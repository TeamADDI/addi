<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="../../common/cTemplates/cLoginHeader.jsp" />



	<main
		class="form-signin w-100 m-auto text-center d-flex justify-content-center align-items-center py-4 bg-body-tertiary"
		style="height: 100vh;">


		<form method="POST" action="./clientLogin.action">

			<h1 class="display-4 fw-bold mb-5">로그인</h1>
			<label for="u_id" class="sr-only">아이디</label> <input type="text"
				id="u_id" name="u_id" class="form-control" placeholder="아이디를 입력해주세요"
				required autofocus /> <label for="u_pw" class="sr-only">비밀번호</label>
			<input type="password" id="u_pw" class="form-control" name="u_pw"
				placeholder="비밀번호를 입력해주세요" required />
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>

			<ul>
				<li onclick="kakaoLogin();"><a href="javascript:void(0)"> <img
						src="<%=request.getContextPath()%>/resources/images/kakao.png"
						alt="Kakao">
				</a></li>
			</ul>
			<!-- 네이버 로그인 버튼 생성 위치 -->
    		<div id="naverIdLogin"></div>
			<a href="findId" alt="id찾기입니다.">ID 찾기</a> <a href="findPw"
				alt="pw찾기입니다.">비밀번호 찾기</a> <a href="cjoin" alt="회원가입입니다.">회원가입</a>

		</form>
	</main>

	<jsp:include page="../../common/cTemplates/cFooter.jsp" />
	<script type="text/javascript">
    var naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "5ZqsGoNlOMm5yfw03Pgr",
              // 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
            callbackUrl: "http://localhost:8080/callback",
              // 본인의 callBack url로 수정하세요.
            isPopup: false,
            loginButton: {color: "white", type: 3, height: 60}
              // 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
        }
    );
naverLogin.init();
</script>
</body>
</html>
