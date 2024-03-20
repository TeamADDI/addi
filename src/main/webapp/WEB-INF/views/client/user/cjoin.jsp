<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!doctype html>
<html lang="en">
<head>

</head>
<body>
	<jsp:include page="../../common/cTemplates/cLoginHeader.jsp" />
	
	
		<main
		class="form-signin w-100 mx-auto text-center d-flex justify-content-center align-items-center py-4 bg-body-tertiary"
		style="height: 100vh;">


		<form id="joinForm" method="POST" action="./cjoin">

			<h1 class="display-8 fw-bold mb-3">회원가입</h1>

			<label for="u_id" class="sr-only">아이디</label> <input type="text"
				id="u_id" name="u_id" class="form-control" placeholder="아이디를 입력해주세요"
				required autofocus />
			<!-- 아이디 중복 체크 버튼 추가 -->
			<button type="button" onclick="checkDuplicateId()"
				class="btn btn-primary">아이디 중복 체크</button>
			<label for="u_pw" class="sr-only">비밀번호</label> <input type="password"
				id="u_pw" class="form-control" name="u_pw"
				placeholder="비밀번호를 입력해주세요" required /> <label for="u_name"
				class="sr-only">이름</label> <input type="text" id="u_name"
				class="form-control" name="u_name" placeholder="이름을 입력해주세요" required />

			<label for="u_email" class="sr-only">이메일</label> <input type="email"
				id="u_email" class="form-control" name="u_email"
				placeholder="이메일을 입력해주세요" required /> <label for="u_tel"
				class="sr-only">전화번호</label> <input type="tel" id="u_tel"
				class="form-control" name="u_tel" placeholder="전화번호를 입력해주세요"
				required /> <label for="u_birth" class="sr-only">생년월일</label> <input
				type="date" id="u_birth" class="form-control" name="u_birth"
				placeholder="생년월일" required /> <label for="u_age" class="sr-only">나이</label>
			<input type="text" id="u_age" class="form-control" name="u_age"
				placeholder="나이를 입력해주세요" required /> <label for="u_gender"
				class="sr-only">성별</label>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="u_gender"
					id="u_gender" value="M" checked> <label
					class="form-check-label" for="male">남자</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="u_gender"
					id="u_gender" value="W"> <label class="form-check-label"
					for="female">여자</label>
			</div>

			<!-- 주소 입력 -->
			<div class="form-group d-flex align-items-center">
				<label for="sample4_postcode"></label> <input type="text"
					id="sample4_postcode" class="form-control mr-2" placeholder="우편번호"
					name="u_post"> <input type="button"
					onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
					class="btn btn-primary">
			</div>
			<div class="form-group row">
				<label for="sample4_roadAddress"></label> <input type="text"
					id="sample4_roadAddress" class="form-control" placeholder="도로명주소"
					name="roadAddress"> <input type="text"
					id="sample4_detailAddress" class="form-control" placeholder="상세주소"
					name="detailAddress">
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">회원가입</button>
		</form>

	</main>

	<!-- Daum 우편번호 검색 API 스크립트 -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 스크립트 -->
	<script>
		// 우편번호 검색 기능
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드 작성
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							// 우편번호와 주소 정보를 해당 필드에 넣기
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣기
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}
						}
					}).open();
		}

		// 아이디 중복 체크 기능
		function checkDuplicateId() {
		    var u_id = document.getElementById("u_id").value;
		    if (u_id === "") {
		        alert("아이디를 입력해주세요.");
		        return;
		    }
		    // AJAX를 사용하여 서버에 아이디 중복 체크 요청
		    var xhr = new XMLHttpRequest();
		    xhr.onreadystatechange = function () {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                var response = xhr.responseText;
		                if (response === "duplicate") {
		                    alert("이미 사용 중인 아이디입니다.");
		                } else {
		                    alert("사용 가능한 아이디입니다.");
		                    // 사용 가능한 경우에만 폼을 서버로 제출
		                    document.getElementById("joinForm").submit();
		                }
		            } else {
		                alert("서버 오류가 발생했습니다.");
		            }
		        }
		    };
		    xhr.open("GET", "./checkDuplicateId.action?u_id=" + u_id, true);
		    xhr.send();
		}
	</script>
	
	<jsp:include page="../../common/cTemplates/cFooter.jsp" />
</body>
</html>