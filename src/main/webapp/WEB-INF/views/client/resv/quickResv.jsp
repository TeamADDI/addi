<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.textarea {
	max-width: 340px;
}
</style>
<meta charset="UTF-8">
<title>빠른 예약</title>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
<script type="text/javascript"
	src='<c:url value="/resources/js/format.js"/>'></script>
</head>
<body>
	<%@ include file="/WEB-INF/template/client/nav.jsp"%>
	<div class="content container-md">
		<p class="title">예약 등록</p>
		<div class="wrapform">
			<main class="form-signin text-center">
				<form id="quickResv" action="quickResvList" method="POST">
					<fieldset>
						<legend>예약 항목</legend>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" id="cl" name=categories value="CL"
								checked disabled>진료
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" id="bt" name="categories" value="BT"
								checked disabled>미용
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" id="ca" name="categories" value="CA"
								checked disabled>돌봄
							</label>
						</div>
						<input type="date" id="rDate" class="form-control" name="rDate"
							required><br> <select id="rTime"
							class="form-control" name="rTime" required>
							<option value="">시간을 선택해주세요.</option>
							<option value="1000">10:00</option>
							<option value="1100">11:00</option>
							<option value="1200">12:00</option>
							<option value="1500">15:00</option>
							<option value="1600">16:00</option>
							<option value="1700">17:00</option>
						</select><br>
					</fieldset>
					<fieldset>
						<legend>보호자 정보</legend>
						<input type="text" id="rName" class="form-control" name="rName"
							maxlength="15" placeholder="보호자 이름" required><br> <input
							type="text" id="rTel" class="form-control" name="rTel"
							maxlength="11" placeholder="보호자 연락처(숫자만 입력해주세요.)" required><br>
					</fieldset>
					<fieldset>
						<legend>파트너 정보</legend>
						<input type="text" id="rPetName" class="form-control"
							name="rPetName" maxlength="15" placeholder="파트너 이름" required><br>
						<input type="number" id="rPetAge" class="form-control"
							name="rPetAge" min="0" placeholder="파트너 나이" required><br>
						<legend>파트너 성별</legend>

						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" id="rPetGenderM" name="rPetGender"
								value="M" checked required>남
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" id="rPetGenderF" name="rPetGender"
								value="F">여
							</label>
						</div>
						<br> <input type="text" id="rPetType" class="form-control"
							name="rPetType" maxlength="20" placeholder="파트너 타입 ex) 개, 고양이"
							required><br>
						<legend>파트너 크기</legend>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" id="rPetSizeS" name="rPetSize"
								value="S" checked required>소형
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" id="rPetSizeM" name="rPetSize"
								value="M">중형
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" id="rPetSizeL" name="rPetSize"
								value="L">대형
							</label>
						</div>
						<br>
					</fieldset>
					<textarea id="rDetail" class="form-control" name="rDetail"
						cols="50" rows="10" placeholder="상세 설명을 200자 이내로 작성해주세요."></textarea>
					<br>
					<div id="message">${message}</div>
					<div class="row">
						<div class="col">
							<input type="reset" class="btn btn-secondary form-control" value="예약 취소">
						</div>
						<div class="col">
							<input type="button" class="btn btn-dark form-control" value="예약 결제"
								onclick="submitForm()">
						</div>
					</div>
				</form>
			</main>
		</div>
	</div>

	<script type="text/javascript">
		// 수정 코드

		function fieldDisabledCancel() {
			$("#cl").removeAttr("disabled");
			$("#bt").removeAttr("disabled");
			$("#ca").removeAttr("disabled");
		}

		function submitForm() {
			const quickResv = document.querySelector("#quickResv");

			// disabled 속성을 풀어주는 함수 호출
			fieldDisabledCancel();

			if (areValidated()) {
				quickResv.action = "resvList";
				quickResv.method = "POST";
				quickResv.submit();
			} else {
				const text = "모든 빈 칸을 채워주세요.";
				setMessage(text);
			}

		}
	</script>
	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>