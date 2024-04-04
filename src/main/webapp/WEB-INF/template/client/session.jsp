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
	System.out.println("계속 진행하셔도 됩니다 세션 아이디는 : " + u_id);
} else {
%>
<script>
	var proceed = confirm("로그인이 필요합니다. 로그인하시겠습니까?");
	if (proceed) {
		// 확인 누를 시
		window.location.href = "/clogin";
	} else {
		// 사용자가 취소를 누르면 다른 작업 수행 가능
		window.location.href = "/"; // 메인 페이지의 경로로 변경
	}
</script>
<%
}
%>