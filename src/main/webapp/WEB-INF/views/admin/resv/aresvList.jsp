<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/admin/aSession.jsp"%>
<!DOCTYPE html>

<html>
<head>
<style>
.footer {
	background-color: #343a40;
	color: white;
	text-align: center;
	padding: .7rem 0 1rem;
	width: 100%;
}

.content a {
	color: black;
	padding: 8px 16px;
	text-decoration: none;
}

.content a.active {
	background-color: #4CAF50;
	color: white;
}

.content a:hover:not(.active) {
	background-color: #ddd;
}
</style>
<script>
   
</script>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
<script type="text/javascript"
	src='<c:url value="/resources/js/format.js"/>'></script>
</head>
<body>
	<%@ include file="/WEB-INF/template/admin/nav.jsp"%>

	<div class="content container-md">
		<p>${resvDetail}</p>
		<p class="title">예약 관리</p>

		<table class="table table-hover table-responsive-md">
			<thead>
				<tr>
					<th colspan="7">보호자</th>
					<th colspan="4">파트너</th>
					<th></th>
				</tr>
				<tr>
					<th>예약번호</th>
					<th>항목</th>
					<th>날짜</th>
					<th>시간</th>
					<th>이름</th>
					<th>연락처</th>
					<th>아이디</th>
					<th>이름</th>
					<th>내용</th>
					<th>취소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="resvDetail" items="${aresvList}">
					<tr>
						<td>${resvDetail.rNo}</td>
						<!-- 수정 코드 -->
						<td class="category">${resvDetail.pCategory}</td>
						<td>${resvDetail.rDate}</td>
						<td class="formattedTime">${resvDetail.rTime}</td>
						<td>${resvDetail.rName}</td>
						<td class="formattedTel">${resvDetail.rTel}</td>
						<td>${resvDetail.uId}</td>
						<td>${resvDetail.rPetName}</td>
						<td>${resvDetail.rDetail}</td>

						<td><c:choose>
								<%-- 수정 코드 --%>
								<c:when test="${resvDetail.rStatus == '결제완료'}">
									<%-- 결제가 성공한 경우 확정으로 버튼 변경 --%>
									<input type="button" value="확정" class="btn btn-dark" />
								</c:when>
								<c:otherwise>
									<%-- 결제가 안된 경우 버튼 표시 --%>
									<form class="aResvListDelete" action="/aResvDelete"
										method="POST">
										<input type="hidden" name="rNo" value="${resvDetail.rNo}" />
										<input type="submit" value="취소" class="btn btn-secondary" />
									</form>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div>
			<input type="hidden" name="itemName" value="${itemName}"> <input
				type="hidden" name="rCode" value="${aresvList[0].rCode}">
		</div>

		<div class="content">
			<c:forEach var="pageNumber" begin="1" end="${totalPages}">
				<c:url value="/aresvList" var="pageUrl">
					<c:param name="page" value="${pageNumber}" />
				</c:url>
				<c:choose>
					<c:when test="${pageNumber eq currentPage}">
						<a href="${pageUrl}" class="active">${pageNumber}</a>
					</c:when>
					<c:otherwise>
						<a href="${pageUrl}">${pageNumber}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>

	<script>
	 // 추가 코드
    setAllFormat();
    setCategory();
    
    function setCategory() {
       const categories = document.querySelectorAll(".category");
       
       categories.forEach(category => {
          if (category.textContent === "CL") {
             category.textContent = "진료";
          } else if (category.textContent === "BT") {
             category.textContent = "미용";
          } else if (category.textContent === "CA") {
             category.textContent = "돌봄";
          }
       });
    }
    
    const deleteForms = document.getElementsByClassName("aResvListDelete");

    Array.from(deleteForms).forEach(function(form) {
       form.addEventListener("submit", function(event) {
          const confirmation = confirm("정말로 취소하시겠습니까?");
          if (!confirmation) {
             event.preventDefault(); // 폼 제출을 취소합니다.
          }
       });
    });
   </script>

	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>