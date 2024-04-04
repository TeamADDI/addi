<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
<style>
.gallery-item {
	margin: 10px auto 30px auto;
	text-align: center;
}

.gallery-item img {
	max-width: 80%;
	height: auto;
}

.pagination-container {
	margin: 20px 0px; /* 리스트 아래 여백 */
	width: 100%; /* 부모 요소의 너비를 100%로 설정 */
	display: flex;
	justify-content: center; /* 가운데 정렬 */
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	display: inline-block; /* 인라인 블록 요소로 변경 */
	padding: 8px 16px;
	text-decoration: none;
	margin: 0 5px; /* 각 링크 사이의 간격 설정 */
}

.pagination .active {
	background-color: #4CAF50;
	color: white;
}

img {
	margin: 20px 0;
}

.iname {
	font-size: 1.2 rem;
	font-weight: bold;
}
</style>

<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/common.css" />
</head>
<body>
	<%@ include file="/WEB-INF/template/client/nav.jsp"%>
	<div class="content container-md">
		<p class="title">상품</p>

		<div class="row no-gutters">
			<c:forEach var="row" items="${items}">
				<div class="col-md-4 gallery-item">
					<!-- 수정 -->
					<a href="/client/item/detail/num/${row.item_num}"> <img
						src='<c:url value="/resources/upload/${row.i_img}"/>'
						alt="${row.item_name}" class="img-thumbnail">
						<p class="iname">${row.item_name}</p>
						<p>
							가격 :
							<fmt:formatNumber type="number"
								value="${row.i_price * (1 - row.i_sale) }" />
							원
						</p>
					</a>
				</div>
			</c:forEach>

		</div>
	</div>

	<div class="pagination-container">
		<div class="pagination">
			<c:forEach var="pageNumber" begin="1" end="${totalPages}">
				<c:url value="/client/item/list" var="pageUrl">
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
