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
      <p class="title">상품 등록</p>

      <div class="wraplogin2">
         <form method="POST" enctype="multipart/form-data">



            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">코드</label>
               </div>
               <div class="col-8">
                  <input type="text" name="item_code" class="form-control" />
               </div>
            </div>

            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">카테고리</label>
               </div>
               <div class="col-8">
                  <input type="text" name="i_category" class="form-control" />
               </div>
            </div>

            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">상품명</label>
               </div>
               <div class="col-8">
                  <input type="text" name="item_name" class="form-control" />
               </div>
            </div>

            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">사진</label>
               </div>
               <div class="col-8">
                  <input type="file" name="i_img" class="form-control" />
               </div>
            </div>


            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">재고</label>
               </div>
               <div class="col-8">
                  <input type="text" name="i_stock" class="form-control" />
               </div>
            </div>


            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">가격</label>
               </div>
               <div class="col-8">
                  <input type="text" name="i_price" class="form-control" />
               </div>
            </div>


            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">할인율</label>
               </div>
               <div class="col-8">
                  <input type="text" name="i_sale" class="form-control" />
               </div>
            </div>

            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">과세</label>
               </div>
               <div class="col-8">
                  <input type="text" name="i_tax_free" class="form-control" />
               </div>
            </div>

            <div class="row">
               <div class="col-4">
                  <label class="form-control border-0">상세정보</label>
               </div>
               <div class="col-8">
                  <textarea cols="20" rows="5" name="i_detail" class="form-control"></textarea>
               </div>
            </div><br><br>

            <div class="row">
               <div class="col">
                  <input type="submit" value="등록" class="form-control btn btn-dark" />
               </div>
               <div class="col">
                  <input type="reset" value="리셋"
                     class=" form-control btn btn-secondary" />
               </div>
            </div>
            <br>
         </form>


         <form action="/admin/item/list">
            <div class="row">
               <div class="col">
                  <input type="submit" value="취소" class="form-control btn btn-secondary" />
               </div>
            </div>
         </form>
      </div>
   </div>
   <%@ include file="/WEB-INF/template/common/footer.jsp"%>
</body>
</html>
