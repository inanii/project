<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
--%><!-- Nav -->
	<div id="navWrap">
		<div class="navigation">
			<ul class="menu">
				<li class='<c:if test="${menu eq 1}">open</c:if>'>
					<span class="items"><i class="icofont-group ico"></i>회원 관리<i class="icofont"></i></span>
					<ul class="subMenu">
						<li class='<c:if test="${menu eq 1 and subMenu eq 1}">active</c:if>'><a href='<c:url value="/admin/member/list"/>' class="items"><i class="icofont-rounded-right ico"></i>회원 목록</a></li>
						<li class='<c:if test="${menu eq 1 and subMenu eq 2}">active</c:if>'><a href='<c:url value="/admin/manager/list"/>' class="items"><i class="icofont-rounded-right ico"></i>사업자 목록</a></li>
					</ul>
				</li>
				<li class='<c:if test="${menu eq 2}">open</c:if>'>
					<span class="items"><i class="icofont-institution ico"></i>사업장 관리<i class="icofont"></i></span>
					<ul class="subMenu">
						<li class='<c:if test="${menu eq 2 and subMenu eq 1}">active</c:if>'><a href='<c:url value="/admin/company/list"/>' class="items"><i class="icofont-rounded-right ico"></i>사업장 목록</a></li>
					</ul>
				</li>
				<li class='<c:if test="${menu eq 3}">open</c:if>'>
					<span class="items"><i class="icofont-list ico"></i>게시판 관리<i class="icofont"></i></span>
					<ul class="subMenu">
						<li class='<c:if test="${menu eq 3 and subMenu eq 1}">active</c:if>'><a href='<c:url value="/admin/board/notice/list"/>' class="items"><i class="icofont-rounded-right ico"></i>공지사항 목록</a></li>
						<li class='<c:if test="${menu eq 3 and subMenu eq 2}">active</c:if>'><a href='<c:url value="/admin/board/event/list"/>' class="items"><i class="icofont-rounded-right ico"></i>이벤트 목록</a></li>
						<li class='<c:if test="${menu eq 3 and subMenu eq 3}">active</c:if>'><a href='<c:url value="/admin/board/community/list"/>' class="items"><i class="icofont-rounded-right ico"></i>커뮤니티 목록</a></li>
					</ul>
				</li>
				<li class='<c:if test="${menu eq 4}">open</c:if>'>
					<span class="items"><i class="icofont-speech-comments ico"></i>문의 관리<i class="icofont"></i></span>
					<ul class="subMenu">
						<li class='<c:if test="${menu eq 4 and subMenu eq 1}">active</c:if>'><a href='<c:url value="/admin/qna/list"/>' class="items"><i class="icofont-rounded-right ico"></i>문의 목록</a></li>
					</ul>
				</li>
			</ul>
		</div><!-- /.navigation -->
	</div><!-- /#navWrap -->