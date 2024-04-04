<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/client/session.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
<script type="text/javascript">
	jQuery(function($) {
		$("#updateBtn").click(function(event) {
			var confirmed = confirm("수정을 완료하시겠습니까?");
			if (!confirmed) {
				event.preventDefault(); //취소
			}
		});

		$("#deleteBtn").click(function(event) {
			var confirmed = confirm("탈퇴하시겠습니까?");
			if (!confirmed) {
				event.preventDefault(); //취소
			}
		});
	});

	function getPost(mode) {
		var theForm = document.frmSubmit;
		if (mode == "update") {
			theForm.method = "post";
			theForm.action = "/mypage/edit";
		} else if (mode == "delete") {
			theForm.method = "post";
			theForm.action = "/mypage/cancel";
		}
		theForm.submit();
	}
</script>
<style>
.tabtitle {
	font-size: 1.5rem;
	margin: 20px auto 0px auto;
	text-align: center;
}
.nav-item {
	padding: 15px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/template/client/nav.jsp"%>
	<div class="content container-md">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active tabtitle"
						href="/mypage">내정보</a></li>
					<li class="nav-item"><a class="nav-link tabtitle"
						href="/myResvList">예약정보</a></li>
					<li class="nav-item"><a class="nav-link tabtitle"
						href="/cartList">장바구니</a></li>
				</ul>
			</div>
		</div>

		<div class="tab-content">
			<div class="tab-pane fade show active" id="mypage">
				<div class="container mt-5">
					<form id="frmSubmit" name="frmSubmit" method="post">
						<div class="row">
							<div class="col-4">
								<label for="id" class="form-control border-0">아이디</label>
							</div>
							<div class="col-8">
								<input type="text" id="u_id" name="u_id" class="form-control"
									placeholder="" value="${n.u_id}" readonly>
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col-4">
								<label for="name" class="form-control border-0">이름</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="u_name"
									name="u_name" placeholder="" value="${n.u_name}" required>
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col-4">
								<label for="tel" class="form-control border-0">전화번호</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="u_tel" name="u_tel"
									placeholder="" value="${n.u_tel}" required>
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col-4">
								<label for="email" class="form-control border-0">이메일</label>
							</div>
							<div class="col-8">
								<input type="email" class="form-control" id="u_email"
									name="u_email" placeholder="" value="${n.u_email}">
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col-4">
								<label for="age" class="form-control border-0">나이</label>
							</div>
							<div class="col-8">
								<input type="text" class="form-control" id="u_age" name="u_age"
									placeholder="" value="${n.u_age}" required>
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col-4">
								<label for="sample4_postcode" class="form-control border-0">우편번호</label>
							</div>
							<div class="col-4">
								<input type="text" id="sample4_postcode" class="form-control"
									name="u_post">
							</div>
							<div class="col-4">
								<input type="button" onclick="sample4_execDaumPostcode()"
									value="우편번호 찾기" class="btn btn-secondary form-control">
							</div>
						</div>
						<br>

						<div class="row">

							<div class="col-4">
								<label for="sample4_roadAddress" class="form-control border-0">도로명
									주소</label>
							</div>
							<div class="col-8">
								<input type="text" id="sample4_roadAddress" class="form-control"
									name="roadAddress">
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col-4">
								<label for="sample4_roadAddress" class="form-control border-0">상세
									주소</label>
							</div>
							<div class="col-8">
								<input type="text" id="sample4_detailAddress"
									class="form-control" name="detailAddress">
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col">
								<button class="btn btn-dark form-control" type="button"
									id="updateBtn" name="updateBtn" value="Submit01"
									onClick="getPost('update')">수정하기</button>
							</div>
							<div class="col">
								<button class="btn btn-secondary form-control" type="button"
									id="deleteBtn" name="deleteBtn" value="Submit01"
									onClick="getPost('delete')">탈퇴하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br>


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
	</script>

	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>
