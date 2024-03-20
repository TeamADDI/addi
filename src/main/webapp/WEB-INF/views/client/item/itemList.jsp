<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gallery</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    .gallery-item {
        margin-bottom: 20px;
    }
    .gallery-item img {
        max-width: 100%;
        height: auto;
    }
</style>
</head>
<body>

<div class="container">
    <div class="row">
        <c:forEach var="row" items="${itemList}">
            <div class="col-md-4 gallery-item">
                <a href="/client/item/detail/num/${row.item_num}">
	        	<img src="../../resources/upload/${row.i_img}" alt="${row.item_name}">
	            <h3>${row.item_name}</h3>
	            <p>
	            ${row.i_sale}% 원가:${row.i_price}원 판매가격: ${row.i_price * (1 - row.i_sale)}원
	            </p>
	            <p>${row.i_regdate }</p>
        	</a> 
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
