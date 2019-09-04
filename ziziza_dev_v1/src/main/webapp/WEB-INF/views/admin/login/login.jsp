<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ include file="../include/common.jsp" %><%--
--%><!DOCTYPE html>
<html>
<head>
<c:import url="../include/head.jsp"/>
<c:import url="../include/app.jsp"/>
<script>
/**
 * 	관리자 페이지 로그인 JS
 */
var form;
$(function(){
	form = $(".signIn");
	form.validate({
        debug: false,   //debug가 true인 경우 validation 후 submit을 수행하지 않음
        focusCleanup: true, //true이면 잘못된 필드에 포커스가 가면 에러를 지움
        rules: rules,
        messages: messages,
        errorPlacement: function (error, element) {
        	element.parent().find('.message').addClass('error').text(error.text());
        },
        success: function(error, element) {
        	$(element).parent().find('.message').removeClass('error').text('');
        },
        submitHandler: function(){
			options.success = function(data, statusText, xhr, $form){
				if(data.result){
					commonAlert("로그인 성공", data.returnURL);
				}else{
					commonAlert(data.message);
				}//
			};
			form.ajaxSubmit(options);
        }
    });
});
var rules = {
	userId: {
        required: true,
        regx: /^[a-z]{1}[a-z0-9]{4,18}$/
    },
    userPw: {
        required: true,
        regx: /^(?=.*[a-zA-Z])(?=.*[!@#$_])(?=.*[0-9]).{6,16}/
    }
};
var messages = {
	userId: {
		required : "아이디를 입력하세요.",
        regx: "첫문자 영문소문자 + 영문/숫자 5~18자입니다."
	},
	userPw: {
		required : "비밀번호를 입력하세요.",
        regx: "영문+숫자+특수문자(!,@,#,$,_) 포함 6~20자입니다."
    }
};
</script>
</head>
<body>
<div id="wrap" class="hideNav">
	<!-- HEADER -->
	<header id="header">
		<div class="header">
			<div class="topBox">
				<h1 class="logo">관리자 페이지</h1>
			</div>
		</div><!-- /.header -->
	</header><!-- /#header -->
	<!-- Content -->
	<div id="container">
		<div class="contentWrap">
			<div class="contents">
				<input type="hidden" name="board" value="login"/>
				<div class="signBox">
					<div class="signHeader">
						<h1><span class="hide">로그인</span><i class="icofont-lock icofont-5x"></i></h1>
					</div>
					<c:choose>
					<c:when test="${empty loginUser || loginUser.roleName ne 'ADMIN'}">
					<form action='<c:url value="/admin/login"/>' name="signIn" class="signIn" method="post">
						<fieldset class="box">
							<legend class="hide">로그인 폼</legend>
							<input type="hidden" name="board" value="login"/>
							<p>
								<label for="userId"><span class="hide">아이디</span><i class="icofont-user-alt-7 icofont-2x"></i></label>
								<input type="text" name="userId" id="userId" placeholder="ID"/>
								<span class="message"></span>
							</p>
							<p>
								<label for="userPw"><span class="hide">비밀번호</span><i class="icofont-key icofont-2x"></i></label>
								<input type="password" name="userPw" id="userPw" placeholder="PASSWORD"/>
								<span class="message"></span>
							</p>
						</fieldset>
						<fieldset class="fOpt">
							<button type="submit" class="rBtn btn">로그인<i class="icofont-login"></i></button>
						</fieldset>
					</form>
					</c:when>
					<c:otherwise>
					<div class="login">
						<p class="message"><%--
						--%><span><c:out value="${loginUser.userName}"/></span>님 로그인 되었습니다.<%--
					--%></p>
						<p>
							<a href='<c:url value="/admin/main"/>' class="btn mBtn link" title="관리자 메인페이지 이동">메인페이지<i class="icofont-arrow-right"></i></a><%--
						--%><a href='<c:url value="/admin/logout"/>' class="btn logout waring"><i class="icofont-logout"></i>로그아웃</a>
						</p>
					</div>
				</div>
				</c:otherwise>
				</c:choose>
			</div><!-- /.contents -->
		</div><!-- /.contentWrap -->
	</div><!-- /#container -->
	<c:import url="../include/footer.jsp"/>
</div><!-- /#wrap -->
<c:import url="../include/modal.jsp"/>
</body>
</html>