<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.ibatis.io.Resources"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>사용자 상세 정보</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="/">아띠</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">
							<span class="feather" data-feather="users"></span> 회원관리 <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <span
							class="feather" data-feather="shopping-cart"></span> 상품목록
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <span
							class="feather" data-feather="credit-card"></span> 결제내역
					</a></li>
				</ul>
				<form class="form-inline mt-2 mt-md-0">


               <%-- 세션에 u_id가 있는 경우 --%>
                    <% if (session.getAttribute("u_id") != null) { %>
                        <%-- 세션에 admin이 담겨있는 경우 --%>
                        <% if ("admin".equals(session.getAttribute("u_id"))) { %>
                            <a class="nav-link" href="logout">로그아웃</a>
                            <a class="nav-link" href="aindex">클라이언트</a>
                        <% } else { %>
                            <a class="nav-link" href="logout">로그아웃</a>
                            <a class="nav-link" href="mypage">내정보</a>
                        <% } %>
                    <%-- 세션에 u_id가 없는 경우 --%>
                    <% } else { %>
                        <a class="nav-link" href="clogin">로그인</a>
                        <a class="nav-link" href="cjoin">회원가입</a>
                    <% } %>


            </form>
			</div>
		</nav>
	</header>