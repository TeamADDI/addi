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
<!doctype html>
<html lang="en">
<head></head>
<body>

<jsp:include page = "../../common/aTemplates/adminHeader.jsp" />
<jsp:include page = "../../common/aTemplates/adminLogin.jsp" />
<jsp:include page = "../../common/aTemplates/adminFooter.jsp" />
</body>
</html>