<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/admin/aSession.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<style>
td.right {
	text-align: right;
}

.pagination-container {
	margin-top: 20px; /* 리스트 아래 여백 */
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
</style>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
</head>
<body>
	<%@ include file="/WEB-INF/template/admin/nav.jsp"%>
	<div class="content container-md">
		<p class="title">상품 관리</p>
		<form>
			<input type="text" placeholder="검색" name="keyword" value="${keyword}" />
			<input type="submit" value="검색" />
		</form>
		<div style="float: right; margin-bottom : 10px;">
			<a href="/admin/item/create" class="btn btn-dark" role="button">등록</a>
		</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>카테고리</th>
					<th>상품코드</th>
					<th>가격</th>
					<th>재고</th>
					<th>수정일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${data}">
					<tr>
						<td class="right">${row.item_num}</td>
						<td><a href="/admin/item/detail/${row.item_num }">${row.item_name}</a></td>
						<td class="right">${row.i_category}</td>
						<td class="right">${row.item_code}</td>
						<td class="right"><fmt:formatNumber type="number"
								maxFractionDigits="3" value="${row.i_price}" /></td>
						<td class="right"><fmt:formatNumber type="number"
								value="${row.i_stock }" /></td>
						<td><fmt:formatDate value="${row.i_updatedate}"
								pattern="yyyy.MM.dd" /></td>
						<td><a href="/admin/item/update/${row.item_num}"
							class="btn btn-secondary">수정</a></td>
						<td>
							<form class="deleteCheck" method="POST"
								action="/admin/item/delete">
								<input type="hidden" name="itemNum" value="${row.item_num}" />
								<input type="submit" value="삭제" class="btn btn-secondary" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagination-container">
			<div class="pagination">
				<c:forEach var="pageNumber" begin="1" end="${totalPages}">
					<c:url value="/admin/item/list" var="pageUrl">
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
	</div>
	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
	<script>
		var deleteForms = document.getElementsByClassName("deleteCheck");

		Array.from(deleteForms).forEach(function(form) {
			form.addEventListener("submit", function(event) {
				var confirmation = confirm("정말로 삭제하시겠습니까?");
				if (!confirmation) {
					event.preventDefault(); // 폼 제출을 취소합니다.
				}
			});
		});
	</script>

</body>
</html>