<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><style>
	td.right {text-align : right;}
	img {width : 50px; height : 50px;}
</style>
</head>
<body>
	<jsp:include page="../../common/aTemplates/iHeader.jsp"></jsp:include>
	<h1>상품 목록</h1> 
<P>
<form>  
<input type="text" placeholder="검색" name="keyword" value="${keyword}" />  
<input type="submit" value="검색" />  
</form>  
</p>	
	 
<table><thead><tr>  
<th>상품번호</th><th>이미지</th><th>상품명</th><th>카테고리</th><th>상품코드</th>
<th>가격</th><th>할인률</th><th>삭제여부</th><th>과세비용</th><th>재고</th><th>등록일</th><th>수정일</th>
<th>수정</th><th>삭제</th>
</tr>  
</thead>  
<tbody>  
<c:forEach var="row" items="${data}">  
<tr>  
<td class="right">${row.item_num}</td>  
<td>${row.i_img } </td>
<td><a href="/admin/item/update?itemNum=${row.item_num }">${row.item_name}</a></td>	<td class="right">${row.i_category}</td>
<td class="right">${row.item_code}</td>
<td class="right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.i_price}" /></td>
<td class="right"><fmt:formatNumber type="percent" value="${row.i_sale }" /></td>
<td>${row.i_delete }</td>
<td class="right"><fmt:formatNumber type="number" value="${row.i_tax_free }"/></td>
<td class="right"><fmt:formatNumber type="number"	value = "${row.i_stock }" /></td>
<td>${row.i_regdate }</td>
<td>${row.i_updatedate}</td>
<td>
	<a href="/admin/item/update?itemNum=${row.item_num}">수정</a>

</td>
<td>
	<form id="deleteCheck" method="POST" action="/admin/item/delete">
   		<input type="hidden" name="itemNum" value="${itemNum}" />
   		<input type="submit" value="삭제" />
 	</form>
</td>  
</tr>  
</c:forEach>  
</tbody>  
</table>  
<p>  
<a href="/admin/item/create">등록</a>  <a href="/admin/item/delete">삭제</a> <a href="/client/list">상품페이지</a>
</p>
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