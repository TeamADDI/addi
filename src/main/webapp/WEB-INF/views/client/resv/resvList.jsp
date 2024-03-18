<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 리스트</title>
</head>
<body>
<jsp:include page="../../common/index/indexHeader.jsp" />
<div>
<h2>예약 리스트</h2>
<form action="payTest" method="POST">
<table border="1" cellpadding="0" cellspacing="0" width="1000">
	<tr>
		<th>번호</th>
		<th>항목</th>
		<th>상태</th>
		<th>날짜</th>
		<th>시간</th>
		<th>보호자 이름</th>
		<th>보호자 연락처</th>
		<th>파트너 이름</th>
		<th>금액</th>
		<th>예약 변경</th>
	</tr>
	<c:forEach var="resvDetail" items="${resvList}">
		<tr>
			<td>${resvDetail.rCode}</td>
			<td>${resvDetail.krCategory}</td>
			<td>${resvDetail.rStatus}</td>
			<td>${resvDetail.rDate}</td>
			<td>${resvDetail.rTime}</td>
			<td>${resvDetail.rName}</td>
			<td>${resvDetail.rTel}</td>
			<td>${resvDetail.rPetName}</td>
			<td class="price">${resvDetail.rPrice}</td>
			<td>
				<input type="button" value="수정">
				<input type="button" value="취소">
			</td>
		</tr>
	</c:forEach>
</table>

<div>
	<span>${resvList.size()}</span>건
	<span> / </span>
	<span>${totalAmount}</span>원
	<input type="hidden" name="itemName" value="${itemName}">
	<input type="hidden" name="rCode" value="${resvList[0].rCode}">
</div>
<input type="submit" value="결제">
</form>
</div>
<jsp:include page="../../common/index/indexFooter.jsp" />
</body>
</html>