<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
--%><!-- HEADER -->
	<header id="header">
		<div class="header">
			<div class="topBox">
				<h1 class="logo">관리자 페이지</h1>
				<button type="button" class="navToggle btn"><span class="hide">메뉴</span><i class="icofont"></i></button>
				<a href='<c:url value="/admin/logout"/>' class="btn logout waring"><i class="icofont-logout"></i>로그아웃</a>
			</div>
		</div><!-- /.header -->
	</header><!-- /#header -->