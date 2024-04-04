<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/client/session.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
<style>
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
					<li class="nav-item"><a class="nav-link tabtitle"
						href="/myResvList">예약정보</a></li>
					<li class="nav-item"><a class="nav-link active tabtitle"
						href="/cartList">장바구니</a></li>
				</ul>
			</div>
		</div>

		<div class="tab-content">
			<div class="tab-pane fade show active" id="cartList">
				<div class="container">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">상품명</th>
								<th scope="col">카테고리</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
								<th scope="col">수정</th>
								<th scope="col">취소</th>
							</tr>
						</thead>
						<tbody>
							<!-- 장바구니에 담긴 각 상품을 반복하여 표시 -->
							<c:forEach var="c" items="${cartList}">
								<form class="frmSubmit" action="/cartList/edit" method="post">
									<tr>
										<td>${c.c_name}</td>
										<td>${c.c_category}</td>
										<td><input type="number" name="c_quantity"
											value="${c.c_quantity}" min="1" max="99" class="form-control"></td>
										<td class="right"><fmt:formatNumber type="number"
												maxFractionDigits="3" value="${c.c_price * c.c_quantity}" />
										</td>
										<td><input type="hidden" value="${c.c_name}"
											name="c_name" /> <input type="submit" value="수정"
											class="updateBtn btn btn-secondary" /></td>
										<td><input type="button" value="취소"
											class="deleteBtn btn btn-dark"
											onclick="return submit2(this.form);" /></td>
									</tr>
								</form>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<c:if test="${not empty isEmptyMessage}">
					<p>${isEmptyMessage}</p>
				</c:if>
				<c:if test="${empty isEmptyMessage}" />
				<!-- 쇼핑더하기 버튼 -->
				<div class="row">
					<div class="col">
						<a href="/" class="btn btn-secondary form-control">메인으로 가기</a>
					</div>
					<div class="col">
						<a href="client/item/list" class=" form-control btn btn-dark">쇼핑
							더하기</a>
					</div>
					<br><br>
				</div>
				<div class="pagination-container">
					<div class="pagination">
						<c:forEach var="pageNumber" begin="1" end="${totalPages}">
							<c:url value="/cartList" var="pageUrl">
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
		</div>
	</div><br>

	<script type="text/javascript">
		jQuery(function($) {
			$(".updateBtn").click(function(event) {
				var confirmed = confirm("수정을 완료하시겠습니까?");
				if (!confirmed) {
					event.preventDefault(); //취소
				} else {
					alert("수정되었습니다.")
				}
			});

			$(".deleteBtn").click(function(event) {
				var confirmed = confirm("이 상품을 삭제하시겠습니까?");
				if (!confirmed) {
					event.preventDefault(); //취소
				} else {
					alert("취소되었습니다.")
				}
			});

		});
		function submit2(frm) {
			frm.action = '/cartList/delete';
			frm.submit();
			return true;
		}
	</script>

	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>


