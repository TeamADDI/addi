<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/template/admin/aSession.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>

<link rel="stylesheet"
   href='<c:url value="/resources/css/admin/common.css"/>' />
<script type="text/javascript">
   $(function() {
      $("#btnUpdate").click(function(event) {
         var confirmed = confirm("수정을 완료하시겠습니까?");
         if (!confirmed) {
            event.preventDefault(); //취소
         } else {
            alert("수정이 완료되었습니다.");
         }
      });

      $("#btnDelete").click(function(event) {
         var confirmed = confirm("정말로 회원을 삭제하시겠습니까?");
         if (confirmed) {
            $("#memberUpdate").attr("action", "/memberDelete");
            alert("회원이 삭제되었습니다.");
         } else {
            event.preventDefault(); // 삭제 취소
         }
      });
   });
</script>

</head>
<body>
   <%@ include file="/WEB-INF/template/admin/nav.jsp"%>
   <div class="content container-md">
      <main role="main" class="container mt-4">
            <h2 class="title">사용자 상세 정보</h2>
            <div class="card-body">
               <form id="memberUpdate" method="post" action="/memberUpdate">
                  <table class="table table-bordered">
                     <tbody>
                        <tr>
                           <th scope="row" style="width: 150px;">아이디</th>
                           <td><input type="text" class="form-control" name="u_id"
                              value="${detail.u_id}" readonly="readonly"></td>
                        </tr>
                        <tr>
                           <th scope="row">이름</th>
                           <td><input type="text" class="form-control" name="u_name"
                              value="${detail.u_name}" readonly></td>
                        </tr>
                        <tr>
                           <th scope="row">이메일</th>
                           <td><input type="email" class="form-control"
                              name="u_email" value="${detail.u_email}"></td>
                        </tr>
                        <tr>
                           <th scope="row">전화번호</th>
                           <td><input type="text" class="form-control" name="u_tel"
                              value="${detail.u_tel}"></td>
                        </tr>
                        <tr>

                           <th scope="row">생년월일</th>
                           <td><input type="text" class="form-control" name="u_birth"
                              value="<fmt:formatDate value='${detail.u_birth}' pattern='yyyy-MM-dd' />"
                              readonly="readonly"></td>
                        </tr>
                        <tr>
                           <th scope="row">나이</th>
                           <td><input type="number" class="form-control" name="u_age"
                              value="${detail.u_age}"></td>
                        </tr>
                        <tr>
                           <th scope="row">우편번호</th>
                           <td><input type="text" class="form-control" name="u_post"
                              value="${detail.u_post}"></td>
                        </tr>
                        <tr>
                           <th scope="row">상세주소</th>
                           <td><input type="text" class="form-control" name="u_addr"
                              value="${detail.u_addr}"></td>
                        </tr>
                        <tr>
                           <th scope="row">가입일자</th>
                           <td><input type="text" class="form-control"
                              name="u_regdate"
                              value="<fmt:formatDate value='${detail.u_regdate}' pattern='yyyy-MM-dd' />"
                              readonly="readonly"></td>
                        </tr>
                     </tbody>
                  </table>
                  <div class="row">
                     <div class="col">
                        <a href="/admin/members" class="btn btn-secondary form-control">목록</a>
                     </div>
                     <div class="col">
                        <button type="submit" id="btnUpdate"
                           class="btn btn-dark form-control">수정</button>
                     </div>
                  </div>
               </form>
            </div>
         <br> <br>
      </main>
   </div>
   <%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>