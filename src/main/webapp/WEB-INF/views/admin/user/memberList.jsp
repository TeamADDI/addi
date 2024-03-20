<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">
<head>
<jsp:include page="../../../template/head.jsp"></jsp:include>>

</head>
<body>
    <main role="main" class="col-md-12 main-text"
        style="position: relative; top: 30px;">
        <div class="d-flex justify-content-between align-items-center">
            <h2 class="mb-0">회원관리목록</h2>
            <a href="/memberRegist" class="btn btn-primary">회원 등록</a>
        </div>
        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>생년월일</th>
                        <th>나이</th>
                        <th>성별</th>
                        <th>상세주소</th>
                        <th>가입일자</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${userList}" var="list">
                        <tr>
                            <td>${list.u_no}</td>
                            <td><a href="/memberDetail?u_id=${list.u_id}"> <c:out
                                        value="${list.u_id}" /></a></td>
                            <td><a href="/memberDetail?u_id=${list.u_id}"> <c:out
                                        value="${list.u_name}" /></a></td>
                            <td>${list.u_email}</td>
                            <td>${list.u_tel}</td>
                            <td>${list.u_birth}</td>
                            <td>${list.u_age}</td>
                            <td>${list.u_gender}</td>
                            <td>${list.u_addr}</td>
                            <td>${list.u_regdate}</td>
                            <td><a href="/memberDetail?u_id=${list.u_id}"
                                class="btn btn-primary btn-sm">수정</a></td>
                            <td><a href="/memberDetail?u_id=${list.u_id}"
                                class="btn btn-primary btn-sm">삭제</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>


</body>
</html>
