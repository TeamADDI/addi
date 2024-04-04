<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/admin/aSession.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
   href='<c:url value="/resources/css/admin/common.css"/>' />
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
   <%@ include file="/WEB-INF/template/admin/nav.jsp"%>

   <div class="content container-md">
		<p class="title">회원 등록</p>
		<div class="wraplogin">
			<main class="form-signin text-center">
				<form id="joinForm" action="./memberRegist" method="post">
					<div class="row">
						<div class="col">
							<input class="form-control" type="text" id="u_id" name="u_id"
								placeholder="아이디 입력" required />
						</div>
						<div class="col">
							<button class="btn-secondary form-control" type="button"
								onclick="checkDuplicateId()">중복 확인</button>
						</div>
					</div>
					
					<br><input type="password" id="pw1" name="u_pw" class="form-control" placeholder="비밀번호 입력" oninput="pwCheck()" required /><br>
					 
						<input class="form-control" type="password" id="pw2" placeholder="비밀번호 확인" oninput="pwCheck()" required />
						
						<span id="pwConfirm"></span><br>
						
						<input class="form-control" type="text" id="u_name" name="u_name" placeholder="이름 입력" required /><br>
						<input class="form-control" type="email" id="u_email" name="u_email" placeholder="이메일 입력" required /><br>
						<input class="form-control" type="tel" id="u_tel" name="u_tel"
						placeholder="전화번호 입력" required /><br>
						<input class="form-control" type="date" id="u_birth" name="u_birth"
						placeholder="생년월일 입력" required /><br>
						<input class="form-control" type="text" id="u_age" name="u_age"
						placeholder="나이 입력" required><br>

					<div class="form-check-inline">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" id="male" name="u_gender" value="M">
							남자
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" id="female" name="u_gender" value="W">
							여자
						</label>
					</div>
					<br> <br>

					<div class="row">
						<div class="col">
							<input class="form-control" type="text" id="sample4_postcode"
								name="u_post" placeholder="우편번호" readonly />
						</div>
						<div class="col">
							<button class="btn btn-secondary form-control" type="button"
								onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
						</div>
					</div>
					<br> <input class="form-control" type="text"
						id="sample4_roadAddress" name="roadAddress" placeholder="도로명 주소"
						readonly /><br> <input class="form-control" type="text"
						id="sample4_extraAddress" name="detailAddress" placeholder="상세 주소" /><br>

					<button class="joinButton form-control btn-dark" type="submit">회원
						등록</button>
				</form>
			</main>
		</div>
	</div>


	<%@ include file="/WEB-INF/template/common/footer.jsp"%>

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
							var roadAddr = data.roadAddress;
							var extraRoadAddr = '';

							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;

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
			var u_id = document.getElementById("u_id").value; // 사용자가 입력한 아이디를 가져옵니다.
			if (u_id === "") { // 아이디가 비어있는지 확인합니다.
				alert("아이디를 입력해주세요.");
				return; // 아이디가 비어있으면 함수 실행을 중단합니다.
			}

			// AJAX를 이용하여 서버에 아이디 중복 여부를 요청합니다.
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						var response = xhr.responseText;
						if (response === "duplicate") {
							alert("이미 사용 중인 아이디입니다.");
						} else {
							alert("사용할 수 있는 아이디입니다.");
						}
					} else {
						alert("서버 오류가 발생했습니다.");
					}
				}
			};
			xhr.open("GET", "./checkDuplicateId?u_id=" + u_id, true); // 아이디를 서버에 전달합니다.
			xhr.send();
		}
		function pwCheck() {
			if ($('#pw1').val() == $('#pw2').val()) {
				$('#pwConfirm').text('비밀번호 일치').css('color', 'green')
			} else {
				$('#pwConfirm').text('비밀번호 불일치').css('color', 'red')
			}
		}
	</script>

	<script>
		// Message가 모델에 존재할 때 알람창 표시
		<c:if test="${not empty message}">
		alert("${message}");
		</c:if>
	</script>
</body>
</html>
