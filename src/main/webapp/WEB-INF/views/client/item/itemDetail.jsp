<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
	href='<c:url value="/resources/css/admin/common.css"/>' />
<style>
.card-img-top {
	margin: 20px auto;
	max-width: 50%;
	height: auto;
}

.card {
	margin: 40px auto;
	width: 80%;
	font-size: 20px;
}

.info {
	margin: 20px auto;
}

textarea {
	font-size: 20px;
	line-height: 1.8;
	width: 100%;
	height: 400px;
	border: none;
	padding: 10px;
	background: transparent;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/template/client/nav.jsp"%>
	<div class="content container-md">
		<p class="title">상품 상세</p>
		<div class="card">
			<img class="card-img-top"
				src='<c:url value="/resources/upload/${itemDetail.i_img}"/>'
				alt="${itemDetail.item_name}">
			<div class="card-body">
				<h4 class="card-title">${ itemDetail.item_name }</h4><br>
				<p class="card-text">카테고리 : ${ itemDetail.i_category }</p>

				<!-- 버튼을 눌렀을때 로그인 한상태인지 확인을하는 로직이 필요함.
					로그인이 되었을 경우, 장바구니 등록되었습니다 출력
					로그인이 안되어있을 경우, 로그인이 필요합니다 하면서 로그인으로 이동을 하는게 좋겠죠 -->
				<main class="form-signin text-center">
					<form method="POST" action="/cartInsert">
						<div class="row">
							<div class="col">
								<label>가격 : <fmt:formatNumber type="number"
										value="${itemDetail.i_price * (1 - itemDetail.i_sale) }" />원
								</label>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col">
								<label>수량 : <input type="number" name="c_quantity"
									id="i_quantity_input" value="1" min="1" max="99"></label>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col">
								<input type="hidden" name="c_category"
									value="${itemDetail.i_category}" /> <input type="hidden"
									name="item_num" value="${itemDetail.item_num }" /> <input
									type="hidden" name="c_name" value="${itemDetail.item_name}" />
								<input type="hidden" name="c_price"
									value="${itemDetail.i_price }" /> <input type="submit"
									value="장바구니" class="btn btn-dark form-control" />
							</div>
							<div class="col">
								<a href="/client/item/list"
									class="btn btn-secondary form-control">쇼핑 더하기</a>
							</div>
						</div>
					</form>
				</main>
			</div>
			<div class="card-footer">
				<br>
				<h4 class="card-title">상세정보</h4>
				<br>
				<textarea disabled>${ itemDetail.i_detail }</textarea>
				<br><br>
			</div>
		</div>
		<!-- <p>재고 : <fmt:formatNumber type="number" value="${itemDetail.i_stock}"/></p> -->
	</div>

	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>