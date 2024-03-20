<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin 상품수정란</title>
</head><body>
	<jsp:include page="../../common/aTemplates/iHeader.jsp"></jsp:include>
	<h3>상품 수정</h3>
	
	<form method="POST"	enctype="multipart/form-data">
		<p> 코드 : <input type="text" name="item_code" value="${data.item_code}"/></p>
		<p> 카테고리 : <input type="text" name="i_category" value="${data.i_category}"/></p>
		<p> 품명 : <input type="text" name="item_name" value="${data.item_name}"/></p>
		<p> 파일 : <input type="file" name="i_img" value="${data.i_img }"/></p>
		<p> 상세정보 : <textarea cols="30" rows="10" name="i_detail">${data.i_detail}</textarea></p>
		<p> 재고 : <input type="text" name="i_stock" value="${data.i_stock}"/></p>
		<p> 가격 : <input type="text" name="i_price" value="${data.i_price}"/></p>
		<p> 할인율 : <input type="text" name="i_sale" value="${data.i_sale}"/></p>
		<p> 삭제여부 : <input type="text" name="i_delete" value="n"/></p>
		<p> 과세 : <input type="text" name="i_tax_free" value="${data.i_tax_free}"/></p>		
		<p>
		<input type="submit" value="수정">
		<input type="reset" value="수정취소"></p>
		
		<p><a href="/admin/item/list">목록으로</a></p>
	</form>
	
	<form method="post" action="/admin/item/delete">
		<input type="submit" value="삭제" />
	</form>	
	<jsp:include page="../../../template/footer.jsp"></jsp:include>
</body>
</html>