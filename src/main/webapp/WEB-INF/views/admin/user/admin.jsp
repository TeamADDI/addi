<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "spring" uri = "http://www.springframework.org/tags" %>
    <%
    HttpSession ses = request.getSession(false);
    if(ses != null && ses.getAttribute("u_id") != null){
    	String u_id = (String) ses.getAttribute("u_id");
    	if(u_id.equals("admin")){
    	response.sendRedirect(request.getContextPath() + "main");
    	System.out.println("admin 계정이 들어왔습니다 admin 메인 페이지로 보냅니다(admin.jsp)");
    		
    	}else{
    		System.out.println("관리자가 아닙니다. 돌아가세요");
    		response.sendRedirect(request.getContextPath() + "/index.jsp");
    	}
    }else{
    	System.out.println("세션 값이 없이 admin 로그인 페이지에 도착 한 상태입니다.");
    }
    %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page = "../../../template/aHeadLogin.jsp" />
</head>

<body style = "padding:0;">

<div class = "wrapbox">
<p class = "admin">관리자</p>
<div class = "wraplogin">
<main
      class="form-signin bg-body-tertiary formpad">
		
		
      <form method="POST" action="./login">
         <label for="u_id" class="sr-only">아이디</label> 
         <input type="text"
            id="u_id" name = "u_id" class="form-control" placeholder="아이디를 입력해주세요" required
            autofocus /> 
            <label for="u_pw" class="sr-only">비밀번호</label> <input
            type="password" id="u_pw" name = "u_pw" class="form-control"
            placeholder="비밀번호를 입력해주세요" required />
         <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      </form>
   </main>
</div>
</div>
<jsp:include page = "../../../template/footer.jsp" />
</body>
</html>