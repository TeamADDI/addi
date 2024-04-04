<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/admin/aSession.jsp"%>
<html>
<head>
<style>
img {
   width: 200px;
   height: 400px;
}
.wraplogin2 {
   width: 650px;
   border: 1px solid lightgray;
   border-radius: 10px;
   padding: 40px 10px;
   margin: 30px auto;
}
</style>
<%@ include file="/WEB-INF/template/common/headMeta.jsp"%>
<link rel="stylesheet"
   href='<c:url value="/resources/css/admin/common.css"/>' />
</head>
<body>
   <%@ include file="/WEB-INF/template/admin/nav.jsp"%>
   <div class="content container-md">
      <p class="title">상품 상세</p>
      <div class="wraplogin">
         <img class="card-img-top"
            src='<c:url value="/resources/upload/${data.i_img}"/>'
            alt="${itemDetail.item_name}">
         <h4>상품명: ${ data.item_name }</h4>
         <br>
         <div>
            <p>상품코드 : ${ data.item_code}</p>
            <p>카테고리 : ${ data.i_category }</p>
            <p>
               가격 :
               <fmt:formatNumber type="number" value="${data.i_price}" />
            </p>
            <p>
               재고 :
               <fmt:formatNumber type="number" value="${data.i_stock}" />
            </p>
            <p>
               할인율 :
               <fmt:formatNumber type="percent" value="${data.i_sale}" />
            </p>
            <p>삭제여부 : ${ data.i_delete }</p>
            <p>
               입력일 :
               <fmt:formatDate value="${data.i_regdate}"
                  pattern="yyyy.MM.dd HH:mm" />
            </p>
            <p>
               수정일 :
               <fmt:formatDate value="${data.i_updatedate}"
                  pattern="yyyy.MM.dd HH:mm" />
            </p>
         </div>
         <div class="card-footer">
            <p>상세정보 : ${ data.i_detail }</p>
         </div>
         <br> <br>
         <div class="row justify-content-center"> 
            <form action="/admin/item/update/${data.item_num }" class="col-auto">
               <input type="submit" value="수정" class="btn btn-dark" />
            </form>
            <form id="deleteCheck" method="POST" action="/admin/item/delete"
               class="col-auto">
               <input type="hidden" name="itemNum" value="${itemNum}" /> <input
                  type="submit" value="삭제" class="btn btn-dark" />
            </form>
            <form action="/admin/item/list" class="col-auto">
               <input type="submit" value="목록" class="btn btn-dark" />
            </form>
         </div>
      </div>
   </div>
   <%@ include file="/WEB-INF/template/common/footer.jsp"%>
   <script>
      document.getElementById("deleteCheck").addEventListener("submit",
            function(event) {
               var confirmation = confirm("정말로 삭제하시겠습니까?");
               if (!confirmation) {
                  event.preventDefault(); // 폼 제출을 취소합니다.
               }
            });
   </script>
</body>
</html>

