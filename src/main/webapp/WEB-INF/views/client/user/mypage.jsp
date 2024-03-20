<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    $("#updateBtn").click(function(event) {
        var confirmed = confirm("수정을 완료하시겠습니까?");
       	if (!confirmed) {
       		event.preventDefault(); //취소
       	}
    });
});

$(function() {
    $("#deleteBtn").click(function(event) {
        var confirmed = confirm("탈퇴하시겠습니까?");
       	if (!confirmed) {
       		event.preventDefault(); //취소
       	}
    });
});

function getPost(mode)
{
    var theForm = document.frmSubmit;
      if(mode == "update")
    {
        theForm.method = "post";
        theForm.action = "/update.action";
    }
    else if(mode == "delete")
       {
          theForm.method = "post";
          theForm.action = "/delete.action"
    }
    theForm.submit();
}




</script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="mypage.action">내 정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#asd">장바구니 내역</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="qwe">
						<div class="container mt-5">
							<h4 class="mb-3">내정보</h4>
							<form id="frmSubmit" name="frmSubmit" method="post">
								<div class="mb-3">
									<label for="id">아이디</label> <input type="text" id="u_id"
										name="u_id" class="form-control" placeholder=""
										value="${n.u_id}" required>
								</div>

								<div class="mb-3">
									<label for="name">이름</label> <input type="text"
										class="form-control" id="u_name" name="u_name" placeholder=""
										value="${n.u_name}" required>
								</div>

								<div class="mb-3">
									<label for="tel">전화번호</label>
									<div class="input-group">
										<input type="text" class="form-control" id="u_tel"
											name="u_tel" placeholder="" value="${n.u_tel}" required>
									</div>
								</div>

								<div class="mb-3">
									<label for="email">이메일</label> <input type="email"
										class="form-control" id="u_email" name="u_email"
										placeholder="" value="${n.u_email}">
								</div>

								<div class="mb-3">
									<label for="age">나이</label> <input type="text"
										class="form-control" id="u_age" name="u_age" placeholder=""
										value="${n.u_age}" required>
								</div>

								<div class="mb-3">
									<label for="addr">주소</label> <input type="text"
										class="form-control" id="u_addr" name="u_addr" placeholder=""
										value="${n.u_addr}">
								</div>

								<button type="button" id="updateBtn" name="updateBtn" value="Submit01" onClick="getPost('update')">수정하기</button>
								<button type="button" id="deleteBtn" name="deleteBtn" value="Submit01" onClick="getPost('delete')">탈퇴하기</button>
							</form>
								
							

						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="asd">
					<p>장바구니내역</p>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	<jsp:include page="../../common/cTemplates/mypageHeader.jsp"></jsp:include>
	<jsp:include page="../../common/cTemplates/cFooter.jsp"></jsp:include>
</body>
</html>