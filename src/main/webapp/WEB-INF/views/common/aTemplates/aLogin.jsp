<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main
		class="form-signin w-100 m-auto text-center d-flex justify-content-center align-items-center py-4 bg-body-tertiary"
		style="height: 100vh;">


		<form method="POST" action="./login.action">
			<label for="u_id" class="sr-only">아이디</label> <input type="text"
				id="u_id" name="u_id" class="form-control" placeholder="아이디를 입력해주세요"
				required autofocus /> <label for="u_pw" class="sr-only">비밀번호</label>
			<input type="password" id="u_pw" name="u_pw" class="form-control"
				placeholder="비밀번호를 입력해주세요" required />
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		</form>
	</main>
</body>
</html>
</body>
</html>