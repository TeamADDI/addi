<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
HttpSession ses = request.getSession(false);

if (ses != null && ses.getAttribute("u_id") != null) {
	String u_id = (String) ses.getAttribute("u_id");
	if (u_id.equals("admin")) {
		System.out.println("계속 진행하셔도 됩니다 세션 아이디는 : " + u_id);

	} else {
		System.out.println("관리자가 아닙니다. 돌아가세요");
		response.sendRedirect(request.getContextPath() + "/");
	}
} else{
	System.out.println("관리자가 아닙니다. 돌아가세요 제에발");
	response.sendRedirect(request.getContextPath() + "/");
}
%>

