<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
         <a class="navbar-brand" href="/main">아띠 <i class='fas fa-paw' style='font-size:35px;color:orange'></i></a>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarCollapse" aria-controls="navbarCollapse"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
               <li class="nav-item"><a class="nav-link" href="/memberList">회원</a></li>
               <li class="nav-item active"><a class="nav-link" href="#">예약</a>
               </li>
               <li class="nav-item"><a class="nav-link" href="#">결제</a></li>
               <li class="nav-item"><a class="nav-link" href="/admin/item/list">상품</a></li>

               <li class="nav-item"><a class="nav-link" href="#">장바구니</a></li>
               <%-- 세션에 u_id가 있는 경우 --%>
                    <% if (session.getAttribute("u_id") != null) { %>
                        <%-- 세션에 admin이 담겨있는 경우 --%>
                        <% if ("admin".equals(session.getAttribute("u_id"))) { %>
                            <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                             <li class="nav-item"><a class="nav-link" href="/aindex">클라이언트</a></li>
                        <% } else { %>
                             <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                             <li class="nav-item"><a class="nav-link" href="/mypage">내정보</a></li>
                        <% } %>
                    <%-- 세션에 u_id가 없는 경우 --%>
                    <% } else { %>
                        <li class="nav-item"><a class="nav-link" href="/clogin">로그인</a></li>
                         <li class="nav-item"><a class="nav-link" href="/cjoin">회원가입</a></li>
                    <% } %>
            </ul>
         </div>
      </nav>
   </header>