function changeTimeFormat() {
	const times = document.querySelectorAll(".formattedTime");
	
	times.forEach(time => {
		const eachTime = time.textContent;
		const hh = eachTime.slice(0, 2);
		const mm = eachTime.slice(2);
		
		time.textContent = hh + ":" + mm;
	});
}

function changeTelFormat() {
	const tels = document.querySelectorAll(".formattedTel");
	
	tels.forEach(tel => {
		const eachTel = tel.textContent;
		const first = eachTel.slice(0, 3);
		const middle = eachTel.slice(3, 7);
		const last = eachTel.slice(7);
		
		tel.textContent = first + "-" + middle + "-" + last;
	});
}

function setAllFormat() {
	changeTimeFormat();
	changeTelFormat();
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

function setMessage(text) {
	const msg = document.querySelector("#message");
	msg.textContent = text;
}

/*
</head> 위에
<script type="text/javascript" src='<c:url value="/resources/js/format.js"/>'></script>
추가하고
</body> 위에
<script>
    setAllFormat();
    changeTimeFormat();
    changeTelFormat();
</script>
원하는 함수 사용
해당 태그에
class="formattedTime"
class="formattedTel"
추가 (편집됨) 
*/