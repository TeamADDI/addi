<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/client/session.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
<script type="text/javascript"
	src='<c:url value="/resources/js/format.js"/>'></script>
<style>
.footer {
	position: absolute;
	bottom: 0;
	background-color: #343a40;
	color: white;
	text-align: center;
	padding: .7rem 0 1rem;
	width: 100%;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/template/client/nav.jsp"%>
	<div class="content container-md">
		<p class="title">예약 결제 내역</p>
		<form action="./kakaoPay" method="POST">
			<table class="table table-hover">
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>시간</th>
					<th>보호자 이름</th>
					<th>보호자 연락처</th>
					<th>파트너 이름</th>
					<th>금액</th>
					<th>확정</th>
				</tr>
				<c:forEach var="resvDetail" items="${resvList}">
					<tr>
						<td>${resvDetail.rCode}</td>
						<td>${resvDetail.rDate}</td>
						<td class="formattedTime">${resvDetail.rTime}</td>
						<td>${resvDetail.rName}</td>
						<td class="formattedTel">${resvDetail.rTel}</td>
						<td>${resvDetail.rPetName}</td>
						<td><fmt:formatNumber type="number"
								value="${resvDetail.rPrice}" /></td>
						<td><c:choose>
								<c:when test="${not empty hideButtons}">
									<%-- 결제가 성공한 경우 버튼 변경 --%>
									<input type="button" value="확정" class="btn btn-secondary" />
								</c:when>
								<c:otherwise>
									<%-- 결제가 안된 경우 버튼 숨김 --%>
									<%-- 아무 내용도 출력하지 않음 --%>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</table>

			<div style="text-align: right">
				<br> <span>${resvList.size()}</span>건 <span> / </span> <span><fmt:formatNumber
						type="number" value="${totalAmount}" /></span>원 <input type="hidden"
					name="itemName" value="${resv.itemName}"> <input
					type="hidden" name="totalAmount" value="${totalAmount}"> <input
					type="hidden" name="quantity" value="${resvList.size()}">
				<!-- 추가 코드 -->
				<input type="hidden" name="code" value="${code}">
			</div>
			<br>


			<c:choose>
				<c:when test="${not empty hideButtons}">
					<%-- 결제가 성공한 경우 버튼 숨김 --%>
					<%-- 아무 내용도 출력하지 않음 --%>

					<p style="text-align: center">결제가 완료되었습니다.</p>
					<br>
					<div class="row">
						<div class="col">
							<input type="button" class="form-control btn btn-secondary"
								value="메인으로" onclick="location.href='/'">
						</div>
						<div class="col">
							<input type="button" class="form-control btn btn-dark"
								value="쇼핑더하기" onclick="location.href='/client/item/list'">
						</div>
					</div>
					<br>
				</c:when>
				<c:otherwise>

					<p style="text-align: center">신청하신 사항은 결제 완료시에 예약 확정됩니다.</p>
					<br>
					<div class="row">
						<div class="col">
							<input type="button" class="form-control btn btn-secondary"
								value="메인으로" onclick="location.href='/'">
						</div>
						<div class="col">
							<input type="submit" class="btn btn-dark form-control" value="결제">
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
				</c:otherwise>
			</c:choose>
		</form>
	</div>
	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
	<script>
		// 추가 코드
		setAllFormat();

		// 결제 성공 시 버튼을 숨기기
		function hideButtons() {
			var buttons = document.querySelectorAll('input[type="button"]');
			buttons.forEach(function(button) {
				button.style.display = 'none';
			});
		}
	</script>
</body>
</html>