<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/client/session.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 리스트</title>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
<script type="text/javascript"
	src='<c:url value="/resources/js/format.js"/>'></script>
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
					<li class="nav-item"><a class="nav-link tabtitle"
						href="/mypage">내정보</a></li>
					<li class="nav-item"><a class="nav-link active tabtitle"
						href="/myResvList">예약정보</a></li>
					<li class="nav-item"><a class="nav-link tabtitle"
						href="/cartList">장바구니</a></li>
				</ul>
			</div>
		</div>

		<div class="tab-content">
			<div class="tab-pane fade show active" id="myResvList">
				<div class="container">
					<table class="table table-hover">
						<thead>
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
						</thead>
						<c:forEach var="resvDetail" items="${myResvList}">
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
										<%-- 수정된 코드 --%>
										<c:when test="${resvDetail.rStatus == '결제완료'}">
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
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col">
				<a class="btn btn-dark form-control" href="/quickResv">패키지 예약
					Quick &raquo;</a>
			</div>
			<div class="col">
				<a href="/" class="btn btn-secondary form-control">메인으로 가기</a>
			</div>
		</div>
	</div>
	<script>
		// 추가 코드
		setAllFormat();
	</script>

	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>