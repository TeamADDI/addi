<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!doctype html>
<html lang="en">
<head>
	<jsp:include page="../../../template/head.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("#btnUpdate").click(function(event) {
            var confirmed = confirm("수정을 완료하시겠습니까?");
           	if (!confirmed) {
           		event.preventDefault(); //취소
           	}
        });
        $("#btnDelete").click(function(event) {
            var confirmed = confirm("정말로 회원을 삭제하시겠습니까?");
            if (confirmed) {
                $("#memberUpdate").attr("action", "/memberDelete.do");
            } else {
                event.preventDefault(); // 삭제 취소
            }
        });
    });
</script>
</head>
<body>
	<jsp:include page="../../../template/aNav.jsp" />
	<main role="main" class="container mt-4">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title">사용자 상세 정보</h2>
			</div>
			<div class="card-body">
				<form id="memberUpdate" method="post" action="/memberUpdate.do">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th scope="row" style="width: 150px;">아이디</th>
								<td><input type="text" name="u_id"
									value="${detail.u_id}" readonly="readonly"></td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td><input type="text" name="u_name"
									value="${detail.u_name}"></td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td><input type="email" name="u_email"
									value="${detail.u_email}"></td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td><input type="text" name="u_tel"
								 	value="${detail.u_tel}"></td>
							</tr>
							<tr>
								<th scope="row">생년월일</th>
								<td><input type="date" name="u_birth"
									value="${detail.u_birth}"></td>
							</tr>
							<tr>
								<th scope="row">나이</th>
								<td><input type="number" name="u_age"
									value="${detail.u_age}"></td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td><select name="u_gender">
										<option value="m"
											${detail.u_gender == 'm' ? 'selected' : ''}>m</option>
										<option value="w"
											${detail.u_gender == 'w' ? 'selected' : ''}>w</option>
								</select></td>
							</tr>
							<tr>
								<th scope="row">우편번호</th>
								<td><input type="text" name="u_post"
									value="${detail.u_post}"></td>
							</tr>
							<tr>
								<th scope="row">상세주소</th>
								<td><input type="text" name="u_addr"
									value="${detail.u_addr}"></td>
							</tr>
							<tr>
								<th scope="row">가입일자</th>
								<td><input type="text" name="u_regdate"
									value="${detail.u_regdate}" readonly="readonly"></td>
							</tr>
						</tbody>
					</table>
					<div class="text-center">
						<a href="/memberList" class="btn btn-primary mr-2">목록</a> 
						<button type="submit" id="btnUpdate" class="btn btn-primary mr-2">수정</button>
                        <button type="submit" id="btnDelete" class="btn btn-primary mr-2">회원삭제</button> 
					</div>
				</form>
			</div>
		</div>
	</main>
</body>
</html>