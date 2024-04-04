<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/template/admin/aSession.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>

.pagination {
   display: inline-block;
}

.pagination a {
   color: black;
   display: inline-block; /* 인라인 블록 요소로 변경 */
   padding: 8px 16px;
   text-decoration: none;
   margin: 0 5px; /* 각 링크 사이의 간격 설정 */
}

.pagination .active {
   background-color: #4CAF50;
   color: white;
}
</style>

<link rel="stylesheet"
   href='<c:url value="/resources/css/admin/common.css"/>' />
</head>
<body>
   <%@ include file="/WEB-INF/template/admin/nav.jsp"%>

   <div class="content container-md">
      <h1 class="title">장바구니</h1>
      <div>
         <form method="post" action="./update">
            <table class="table table-hover">
               <thead >
                  <tr>
                     <th scope="col">아이디</th>
                     <th scope="col">상품명</th>
                     <th scope="col">카테고리</th>
                     <th scope="col">수량</th>
                     <th scope="col">금액</th>
                     <th scope="col">수정</th>
                     <th scope="col">취소</th>
                  </tr>
               </thead>
               <tbody>
                  <!-- 장바구니에 담긴 각 상품을 반복하여 표시 -->
                  <c:forEach var="c" items="${aCartList}">
                     <tr>
                        <td>${c.u_id}</td>
                        <td>${c.c_name}</td>
                        <td>${c.c_category}</td>
                        <td>
                           <form method="post" action="${path}/update">
                              <input type="hidden" name="c_no" value="${c.c_no}"> <input
                                 type="hidden" name="action" value="update"> <input
                                 type="number" name="c_quantity" value="${c.c_quantity}"
                                 min="1" max="99" class="form-control">
                        </td>
                        <td class="right"><fmt:formatNumber type="number"
                              maxFractionDigits="3" value="${c.c_price * c.c_quantity}" /></td>
                        <td>
                           <button type="submit" class="updateBtn btn btn-secondary" data-c_no="${c.c_no}">수정</button>
                           </form>
                        </td>
                        <td>
                           <form method="post" action="${path}/delete">
                              <input type="hidden" name="c_no" value="${c.c_no}"> <input
                                 type="hidden" name="action" value="delete">
                              <button type="submit" class="deleteBtn btn btn-dark" data-c_no="${c.c_no}">취소</button>
                           </form>
                        </td>
                     </tr>
                     
                  </c:forEach>
               </tbody>
            </table>
         </form>
      </div><br><br>

      <div class="pagination-container">
         <div class="pagination">
            <c:forEach var="pageNumber" begin="1" end="${totalPages}">
               <c:url value="/aCartList" var="pageUrl">
                  <c:param name="page" value="${pageNumber}" />
               </c:url>
               <c:choose>
                  <c:when test="${pageNumber eq currentPage}">
                     <a href="${pageUrl}" class="active">${pageNumber}</a>
                  </c:when>
                  <c:otherwise>
                     <a href="${pageUrl}">${pageNumber}</a>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
         </div>
      </div>
   </div>

   <script>
      $.noConflict();
      jQuery(document).ready(
            function($) {
               var path = "${path}";

               // 수정 버튼 클릭 시
               $(".updateBtn").on(
                     "click",
                     function(event) {
                        event.preventDefault(); // 기본 이벤트 동작 방지
                        var c_no = $(this).data("c_no"); // 수정할 상품의 이름 가져오기
                        var quantity = $(this).closest("tr").find(
                              "input[name='c_quantity']").val(); // 변경된 수량 가져오기
                        var confirmed = confirm("상품 수량을 변경 하시겠습니까?");
                        if (confirmed) {
                           $.ajax({
                              type : "POST",
                              url : path + "/update", // 수정 요청을 보낼 URL
                              data : {
                                 c_no : c_no,
                                 c_quantity : quantity
                              }, // 수정할 상품의 이름과 변경된 수량을 서버에 전송
                              success : function(response) {
                                 location.reload(); // 페이지 새로고침
                              },
                              error : function(xhr, status, error) {
                                 console.error("AJAX 요청 실패:",
                                       status, error);
                              }
                           });
                        }
                     });

               // 삭제 버튼 클릭 시
               $(".deleteBtn").on(
                     "click",
                     function(event) {
                        event.preventDefault(); // 기본 이벤트 동작 방지
                        var c_no = $(this).data("c_no"); // 삭제할 상품의 이름 가져오기
                        var confirmed = confirm("취소 하시겠습니까?");
                        if (confirmed) {
                           $.ajax({
                              type : "POST",
                              url : path + "/delete", // 삭제 요청을 보낼 URL
                              data : {
                                 c_no : c_no
                              }, // 삭제할 상품의 번호를 서버에 전송
                              success : function(response) {
                                 // 성공적으로 처리되었을 때 수행할 동작
                                 // 예: 페이지 새로고침 또는 변경된 내용 업데이트
                                 location.reload(); // 페이지 새로고침
                              },
                              error : function(xhr, status, error) {
                                 console.error("AJAX 요청 실패:",
                                       status, error);
                              }
                           });
                        }
                     });
            });
   </script>

   <%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>