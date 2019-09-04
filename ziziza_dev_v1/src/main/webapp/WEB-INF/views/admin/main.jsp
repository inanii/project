<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ include file="include/common.jsp" %><%--
--%><c:set var="menu" value="00" scope="request"/><%--
--%><!DOCTYPE html>
<html>
<head>
<c:import url="include/head.jsp"/>
<c:import url="include/app.jsp"/>
</head>
<body>
	<div id="wrap" class="hideNav">
		<c:import url="include/header.jsp"/>
		<c:import url="include/navigation.jsp"/>
		<!-- Content -->
		<div id="container">
			<div class="contentWrap">
				<div class="contents">
				</div><!-- /.contents -->
			</div><!-- /.contentWrap -->
		</div><!-- /#container -->
		<c:import url="include/footer.jsp"/>
	</div><!-- /#wrap -->
	<c:import url="include/modal.jsp"/>
</body>
</html>