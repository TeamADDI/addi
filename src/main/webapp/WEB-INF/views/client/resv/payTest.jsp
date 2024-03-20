<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>페이 테스트</h2>
데이터가 잘 나옵니까?<br>
항목: ${resv.itemName}<br>
건수: ${quantity}<br>
가격: ${totalAmount}<br>
사용자 정보: <br>
${resvDetail.rName}<br>
${resvDetail.rPetName}<br>
${resvDetail.rTime}<br>
${resvDetail.rDate}<br>
${resvDetail.rPetType}<br>
</body>
</html>