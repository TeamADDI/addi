<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/template/admin/aSession.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/aHeader.css" />
</head>
<body>
<%@ include file="/WEB-INF/template/admin/nav.jsp"%>
	<div>
		<h2>예약 리스트</h2>
		<table border="1" cellpadding="0" cellspacing="0" width="1000">
			<tr>
				<th>번호</th>
				<th>항목</th>
				<th>예약 상태</th>
				<th>예약 날짜</th>
				<th>예약 시간</th>
				<th>보호자 이름</th>
				<th>보호자 연락처</th>
				<th>파트너 이름</th>
				<th>회원 id</th>
				<th>회원 이메일</th>
				<th>회원 주소</th>
				<th>회원 우편주소</th>
				<th>파트너 나이</th>
				<th>파트너 성별</th>
				<th>파트너 타입</th>
				<th>파트너 크기</th>
				<th>예약 신청한 날짜</th>
				<th>상세내용</th>
				<th>금액</th>
				<th>예약 변경</th>
				<th></th>
			</tr>
			<c:forEach var="resvDetail" items="${aresvList}">
				<tr>
					<td>${resvDetail.rNo}</td>
					<td>${resvDetail.pCategory}</td>
					<td>${resvDetail.rStatus}</td>
					<td>${resvDetail.rDate}</td>
					<td>${resvDetail.rTime}</td>
					<td>${resvDetail.rName}</td>
					<td>${resvDetail.rTel}</td>
					<td>${resvDetail.rPetName}</td>
					<td>${resvDetail.uId}</td>
					<td>${resvDetail.uEmail}</td>
					<td>${resvDetail.uAddr}</td>
					<td>${resvDetail.uPost}</td>
					<td>${resvDetail.rPetAge}</td>
					<td>${resvDetail.rPetGender}</td>
					<td>${resvDetail.rPetType}</td>
					<td>${resvDetail.rPetSize}</td>
					<td>${resvDetail.rRegdate}</td>
					<td>${resvDetail.rDetail}</td>
					<td class="price">${resvDetail.rPrice}</td>
					<td>
						<form method="POST">
							<input type="submit" value="수정"><input type="button"
								value="취소">
					</td>
				</tr>
				</form>
			</c:forEach>
		</table>

		<div>
			<span>총 ${aresvList.size()}</span>건<span> <input type="hidden"
				name="item_name" value="${itemName}"> <input type="hidden"
				name="rCode" value="${resvList[0].rCode}">
		</div>
	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>