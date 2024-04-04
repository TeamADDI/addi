<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/admin/aSession.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>결제 리스트</title>
<style>
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
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
</head>
<body>
	<%@ include file="/WEB-INF/template/admin/nav.jsp"%>
	<div class="content container-md">
		<p class="title">결제 관리</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>결제 번호</th>
					<th>회원 ID</th>
					<th>상품명</th>
					<th>수량</th>
					<th>금액</th>
					<th>결제방법</th>
					<th>결제일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="payment" items="${completedPayments}">
					<tr>
						<td>${payment.p_number}</td>
						<td>${payment.partner_user_id}</td>
						<td>${payment.item_name}</td>
						<td>${payment.quantity}</td>
						<!-- 수정 코드 -->
						<td><fmt:formatNumber type="number"
								value="${payment.total_amount}" /></td>
						<td>${payment.payment_method_type}</td>
						<td>${payment.approved_at}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 페이징 -->
		<div class="content">
			<c:forEach var="pageNumber" begin="1" end="${totalPages}">
				<c:url value="/payList" var="pageUrl">
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

	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>