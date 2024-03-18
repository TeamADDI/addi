<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resForm</title>
<style>
	div { margin: 0 auto; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
</head>
<body>
<jsp:include page="../../common/index/indexHeader.jsp" />
<div>
<h2>예약 등록</h2>
* 로그인 시에만 예약이 가능합니다.
<form id="resvForm" action="resvList" method="POST">
	<fieldset>
		<legend>예약 정보</legend>
		
		예약 항목(중복 가능)<br>
		<label for="cl">진료</label>
		<input type="checkbox" id="cl" name=categories value="CL" >
		<label for="bt">미용</label>
		<input type="checkbox" id="bt" name="categories" value="BT" >
		<label for="ca">돌봄</label>
		<input type="checkbox" id="ca" name="categories" value="CA" ><br>
		
		<label for="rDate" >날짜</label>
		<input type="text" id="rDate" name="rDate" required >
		<!-- <input type="date" id="rDate" name="rDate" min="2024-03-11" max="2024-04-10" required ><br> -->
		
		<label for="rTime">시간</label>
		<select id="rTime" name="rTime" required>
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
		
		<label for="rName">보호자 이름</label>
		<input type="text" id="rName" name="rName" maxlength="15" required ><br>
		
		<label for="rTel">보호자 연락처</label>
		<input type="text" id="rTel" name="rTel" maxlength="11" placeholder="숫자만 입력해주세요." required ><br>
	</fieldset>
	
	<fieldset>
		<legend>파트너 정보</legend>
		
		<label for="rPetName">파트너 이름</label>
		<input type="text" id="rPetName" name="rPetName" maxlength="15" required ><br>
		
		<label for="rPetAge">파트너 나이</label>
		<input type="number" id="rPetAge" name="rPetAge" min="0" required ><br>
		
		파트너 성별
		<label for="rPetGenderM"><input type="radio" id="rPetGenderM" name="rPetGender" value="M" checked required >남</label>
		<label for="rPetGenderF"><input type="radio" id="rPetGenderF" name="rPetGender" value="F" >여</label><br>
		
		<label for="rPetType">파트너 타입</label>
		<input type="text" id="rPetType" name="rPetType" maxlength="20" placeholder="ex) 개, 고양이" required ><br>
		
		파트너 크기
		<label for="rPetSizeS"><input type="radio" id="rPetSizeS" name="rPetSize" value="S" checked required >소형</label>
		<label for="rPetSizeM"><input type="radio" id="rPetSizeM" name="rPetSize" value="M" >중형</label>
		<label for="rPetSizeL"><input type="radio" id="rPetSizeL" name="rPetSize" value="L" >대형</label><br>
	</fieldset>
	
	<label for="rDetail">상세 설명</label><br>
	<textarea id="rDetail" name="rDetail" cols="50" rows="10" placeholder="200자 이내로 작성해주세요." ></textarea><br>


	<div id="message"></div>
	<input type="reset" value="취소" >
	<input type="button" value="예약" onclick="submitForm()" >
</form>
</div>
<jsp:include page="../../common/index/indexFooter.jsp" />
<script>
	function submitForm() {
		const checkboxes = document.querySelectorAll("input[type='checkbox']:checked");
		const msg = document.querySelector("#message");
		const resvForm = document.querySelector("#resvForm");

		msg.textContent = checkboxes.length ? "" : "하나 이상의 옵션을 선택해주세요.";
		
		resvForm.action = "resvList";
		resvForm.method = "POST";
		resvForm.submit();
	}
	
	const days = ["2024-3-18","2024-3-25","2024-3-27"];

	function getMinDate() {
		const today = new Date();
		const year = today.getFullYear();
		const month = today.getMonth() + 1;
		const date = today.getDate();
		
		return year + "-" + month + "-" + date;
	}
	
	function getMaxDate() {
		const range = 30;
		
		const today = new Date();
		const date = today.getDate();
		const max = new Date(today.setDate(date + range));
		
		const maxYear = max.getFullYear();
		const maxMonth = max.getMonth() + 1;
		const maxDate = max.getDate();

		return maxYear + "-" + maxMonth + "-" + maxDate;
	}

	$("#rDate").datepicker({
		dateFormat: "yy-mm-dd",
	    yearSuffix: "년",
	    defaultDate: null,
	    changeMonth: true,
	    selectOtherMonths: true,
	    showOtherMonths: true,
	    showMonthAfterYear: true,
	    monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	    dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
	    minDate: getMinDate(),
	    maxDate: getMaxDate(),
	    beforeShowDay: disabledDays,
	}).datepicker;
	
	function disabledDays(date) {
	   	const m = date.getMonth();
	    const d = date.getDate();
	    const y = date.getFullYear();
	    for (i = 0; i < days.length; i++) {
	        if($.inArray(y + "-" +(m+1) + "-" + d,days) != -1) {
	            return [false];
	        }
	    }
	    
	    const noWeekend = jQuery.datepicker.noWeekends(date);
	    
	    return noWeekend[0] ? [true] : noWeekend;
	}
</script>
</body>
</html>