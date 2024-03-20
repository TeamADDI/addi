<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
 <head>
  <title>상품 상세</title><style>
  	 img { width : 200px; height : 200px;}
  </style>
 </head>
 <body>
 <jsp:include page="../../common/aTemplates/iHeader.jsp"></jsp:include>
 <div>
 
  <h1>상품 상세</h1>
  <p> 이미지 이름 : ${ data.i_img } </p>
  <p>상품명 : ${ data.item_name } </p>
  <p>상품코드 : ${ data.item_code} </p>
  <p>카테고리 : ${ data.i_category }</p>
  <p>상세정보 : ${ data.i_detail }</p>
  <p>가격 : <fmt:formatNumber type="number" value="${data.i_price}" /></p>
  <p>재고 : <fmt:formatNumber type="number" value="${data.i_stock}"/></p>
  <p>할인율 : <fmt:formatNumber type="percent" value="${data.i_sale}" /> </p>
  <p>삭제여부 : ${ data.i_delete } </p>
  <p>입력일 : <fmt:formatDate value="${data.i_regdate}" pattern="yyyy.MM.dd HH:mm" /></p>
  <p>수정일 : <fmt:formatDate value="${data.i_updatedate}" pattern="yyyy.MM.dd HH:mm" /></p>


  <a href="/admin/item/update?itemNum=${itemNum}">수정</a>
  
  <form id="deleteCheck" method="POST" action="/admin/item/delete">
   <input type="hidden" name="itemNum" value="${itemNum}" />
   <input type="submit" value="삭제" />
  </form>
  
  <a href="/admin/item/list">목록으로</a>
  </div>
  <jsp:include page="../../../template/footer.jsp"></jsp:include>
  <script>
	  document.getElementById("deleteCheck").addEventListener("submit", function(event) {
	      var confirmation = confirm("정말로 삭제하시겠습니까?");
	      if (!confirmation) {
	          event.preventDefault(); // 폼 제출을 취소합니다.
	      }
	  });
  </script>
  
 </body>
</html>
