<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <main role="main" class="col-md-12 main-text"
      style="position: relative; top: 30px;">
      <div class="container mt-4">
         <h2>사용자 상세 정보</h2>
         <table class="table">
            <tbody>
               <tr>
                  <th scope="row">아이디</th>
                  <td>${detail.u_id}</td>
               </tr>
               <tr>
                  <th scope="row">이름</th>
                  <td>${detail.u_name}</td>
               </tr>
               <tr>
                  <th scope="row">이메일</th>
                  <td>${detail.u_email}</td>
               </tr>
               <tr>
                  <th scope="row">전화번호</th>
                  <td>${detail.u_tel}</td>
               </tr>
               <tr>
                  <th scope="row">생년월일</th>
                  <td>${detail.formattedUBirth}</td>
               </tr>
               <tr>
                  <th scope="row">나이</th>
                  <td>${detail.u_age}</td>
               </tr>
               <tr>
                  <th scope="row">성별</th>
                  <td>${detail.u_gender}</td>
               </tr>
               <tr>
                  <th scope="row">주소</th>
                  <td>${detail.u_addr}</td>
               </tr>
               <tr>
                  <th scope="row">가입일자</th>
                  <td>${detail.formattedURegdate}</td>
               </tr>
            </tbody>
         </table>
         <div style="margin-left: 1px;">
            <a href="/main" class="btn btn-primary">목록</a>
         </div>
      </div>
   </main>
</body>
</html>