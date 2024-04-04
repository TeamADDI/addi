<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/admin/aSession.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<script type="text/javascript">
	function memberDelete(userId) {
		var confirmed = confirm("정말로 회원을 삭제하시겠습니까?");
		if (confirmed) {
			document.getElementById('deleteForm').action = "/memberDelete?u_id="
					+ userId;
			document.getElementById('deleteForm').submit();
		}
	}
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "/admin/members?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/common.css" />
</head>
<style>
#content a {
	color: black;
	padding: 8px 16px;
	text-decoration: none;
}

#content a.active {
	background-color: #4CAF50;
	color: white;
}

#content a:hover:not(.active) {
	background-color: #ddd;
}
</style>
<body>
	<%@ include file="/WEB-INF/template/admin/nav.jsp"%>
	<div class="content container-md">
		<p class="title">회원 관리</p>
		<div style="float: right;">
			<a href="/memberRegistPage" class="btn btn-dark"
				style="margin-bottom: 10px;">회원 등록</a>
		</div>
		<form id="deleteForm" method="post">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>생년월일</th>
					<th>가입일자</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userList}" var="list">
					<tr>
						<td>${list.u_no}</td>
						<td><a href="/admin/detail/${list.u_id}"
							style="color: black;"><c:out value="${list.u_id}" /></a></td>
						<td><a href="/admin/detail/${list.u_id}"
							style="color: black;"><c:out value="${list.u_name}" /></a></td>
						<td>${list.u_email}</td>
						<td>${list.u_tel}</td>
						<td><fmt:formatDate value='${list.u_birth}'
								pattern='yyyy-MM-dd' /></td>
						<td><fmt:formatDate value='${list.u_regdate}'
								pattern='yyyy-MM-dd' /></td>
						<td><a href="/admin/detail/${list.u_id}"class="btn btn-addi btn btn-secondary">수정</a>
							<button type="button" class="btn btn-addi btn-secondary" onclick="memberDelete('${list.u_id}')">회원삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</form>
		<div style="display: block; text-align: center;" id = "content">
			<c:if test="${paging.nowPage != 1}">
				<a href="/admin/members?nowPage=${paging.nowPage - 1}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<a class="active">${p }</a>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<a href="/admin/members?nowPage=${p }">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.nowPage != paging.lastPage}">
				<a href="/admin/members?nowPage=${paging.nowPage + 1}">&gt;</a>
			</c:if>
		</div>
	</div>

	<%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>
