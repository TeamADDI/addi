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
<div>
<h2>예약 등록</h2>
* 로그인 시에만 예약이 가능합니다.
<form id="resvForm" action="resvList" method="POST">
	<fieldset>
		<legend>예약 정보</legend>
		
		예약 항목(중복 가능)<br>
		<label for="CL">진료</label>
		<input type="checkbox" id="CL" name=categories value="CL" >
		<label for="BT">미용</label>
		<input type="checkbox" id="BT" name="categories" value="BT" >
		<label for="CA">돌봄</label>
		<input type="checkbox" id="CA" name="categories" value="CA" ><br>
		
		<label for="rDate" >날짜</label>
		<input type="text" id="rDate" name="rDate" ><br>
		
		<label for="rTime">시간</label>
		<select id="rTime" name="rTime">
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
		<input type="text" id="rName" name="rName" value="${formData.rName}" maxlength="15" ><br>
		
		<label for="rTel">보호자 연락처</label>
		<input type="text" id="rTel" name="rTel" value="${formData.rTel}" 
			maxlength="11" placeholder="숫자만 입력해주세요." ><br>
	</fieldset>
	
	<fieldset>
		<legend>파트너 정보</legend>
		
		<label for="rPetName">파트너 이름</label>
		<input type="text" id="rPetName" name="rPetName" value="${formData.rPetName}" maxlength="15" ><br>
		
		<label for="rPetAge">파트너 나이</label>
		<input type="number" id="rPetAge" name="rPetAge" value="${formData.rPetAge}" min="0" ><br>
		
		파트너 성별
		<label for="rPetGenderM">
			<input type="radio" id="rPetGenderM" name="rPetGender" value="M" checked >남
		</label>
		<label for="rPetGenderF">
			<input type="radio" id="rPetGenderF" name="rPetGender" value="F" >여
		</label><br>
		
		<label for="rPetType">파트너 타입</label>
		<input type="text" id="rPetType" name="rPetType" value="${formData.rPetType}" 
			maxlength="20" placeholder="ex) 개, 고양이" ><br>
		
		파트너 크기
		<label for="rPetSizeS">
			<input type="radio" id="rPetSizeS" name="rPetSize" value="S" checked >소형
		</label>
		<label for="rPetSizeM">
			<input type="radio" id="rPetSizeM" name="rPetSize" value="M" >중형
		</label>
		<label for="rPetSizeL">
			<input type="radio" id="rPetSizeL" name="rPetSize" value="L" >대형
		</label><br>
	</fieldset>
	
	<label for="rDetail">상세 설명</label><br>
	<textarea id="rDetail" name="rDetail" cols="50" rows="10" 
		placeholder="200자 이내로 작성해주세요." >${formData.rDetail}</textarea><br>

	<div id="message">${message}</div>
	<input type="reset" value="취소" >
	<input type="button" value="예약" onclick="submitForm()" >
</form>
</div>
<script type="text/javascript">
	setFormDatas();
	
	function setFormDatas() {
		if ("${formData}") {
			setCategories();
			setDate();
			setTime();
			setGender();
			setSize();
		}
	}
	
	function setCategories() {
		const categories = document.getElementsByName("categories");
		const itemName = "${resv.tempItemName}";
		const allCategories = ["CL", "BT", "CA"];
		
		allCategories.forEach((category, i) => {
			categories[i].checked = itemName.includes(category);
		});
	}
	
	function setDate() {
		const date = document.querySelector("#rDate");
		date.value = "${formData.rDate}";
	}
	
	function setTime() {
		const time = document.querySelector("#rTime option[value='${formData.rTime}']");
		time.selected = true;
	}
	
	function setGender() {
		const genders = document.getElementsByName("rPetGender");
		genders.forEach(gender => {
			gender.checked = gender.value === "${formData.rPetGender}";
		});
	}
	
	function setSize() {
		const sizes = document.getElementsByName("rPetSize");
		sizes.forEach(size => {
			size.checked = size.value === "${formData.rPetSize}";
		});
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
	
	function setMessage(text) {
		const msg = document.querySelector("#message");
		msg.textContent = text;
	}
	
	function areValidated() {
		const categories = document.querySelectorAll("input[type='checkbox'][name='categories']:checked");
		const rPetGender = document.querySelectorAll("input[type='radio'][name='rPetGender']:checked");
		const rPetSize = document.querySelectorAll("input[type='radio'][name='rPetSize']:checked");
		const fields = ["#rDate", "#rTime", "#rName", "#rTel", "#rPetName", "#rPetAge", "#rPetType"];

		if (!categories.length || !rPetGender.length || !rPetSize.length) {
		    return false;
		}
		
		for (const field of fields) {
		    if (!document.querySelector(field).value) {
		        return false;
		    }
		}
		
		return true;
	}
	
	function submitForm() {
		const resvForm = document.querySelector("#resvForm");
		
		if (areValidated()) {
			resvForm.action = "resvList";
			resvForm.method = "POST";
			resvForm.submit();
		} else {
			const text = "모든 빈 칸을 채워주세요.";
			setMessage(text);
		}
	}
</script>
</body>
</html>