<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/admin/aSession.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
      <p class="title">상품 수정</p>

      <div class="wraplogin2">
         <form method="POST" enctype="multipart/form-data">
            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">코드</label>
               </div>
               <div class="col-8">
                  <input type="text" name="item_code" class="form-control"
                     value="${data.item_code}" />
               </div>
            </div>
            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">카테고리</label>
               </div>
               <div class="col-8">
                  <input type="text" name="i_category" class="form-control"
                     value="${data.i_category}" />
               </div>
            </div>
            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">품명</label>
               </div>
               <div class="col-8">
                  <input type="text" name="item_name" class="form-control"
                     value="${data.item_name}" />
               </div>
            </div>
            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">파일</label>
               </div>
               <div class="col-8">
                  <input type="file" accept="image/*" class="form-control"
                     name="i_img" value="${data.i_img }" />
               </div>
            </div>

            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">재고</label>
               </div>
               <div class="col-8">
                  <input type="text" name="i_stock" class="form-control"
                     value="${data.i_stock}" />
               </div>
            </div>
            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">가격</label>
               </div>
               <div class="col-8">
                  <input type="text" name="i_price" class="form-control"
                     value="${data.i_price}" />
               </div>
            </div>

            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">상세정보</label>
               </div>
               <div class="col-8">
                  <textarea cols="30" rows="10" name="i_detail" class="form-control">${data.i_detail}</textarea>
               </div>
            </div><br>
            <p>
            
            <div class="row">
               <div class="col">
                  <input type="submit" value="수정" class="btn btn-dark form-control">
               </div>
               <div class="col">
                  <a href="/admin/item/list" class="btn btn-secondary form-control" role="button">목록</a>
               </div>
               <br>
            </div>
         </form>
      
      </div>
   </div>
   <%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>

