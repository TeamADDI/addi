<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>상품 상세</title>
<style>
.product-info {
	display: flex;
	align-items: center;
}

.product-info p {
	margin-left: 10px;
}

img {
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
	<h1>상품 상세</h1>
	<div class="product-info">
		<img class="img"
			src="../../../../resources/upload/${itemDetail.i_img}"
			alt="${itemDetail.item_name}">
		<div>
			<p>상품명 : ${ itemDetail.item_name }</p>
			<p>카테고리 : ${ itemDetail.i_category }</p>
			<p>
				할인율 :
				<fmt:formatNumber type="percent" value="${itemDetail.i_sale}" />
				원가 :
				<fmt:formatNumber type="number" value="${itemDetail.i_price}" />
				원 가격 :
				<fmt:formatNumber type="number"
					value="${itemDetail.i_price * (1 - itemDetail.i_sale) }" />
				원
			</p>
			수량 : <input type="number" name="quantity" value="1" min="1" max="99">
			<form method="post" action="../cartList">
				<input type="submit" value="Cart" />
			</form> 
			<form method="post" action="">
				<input type="submit" value="Pay" />
			</form>  
		</div>
	</div>
	<p>상세정보 : ${ itemDetail.i_detail }</p>

	<a href="/client/item/list">목록으로</a>

</body>
</html>
