<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ include file="../include/common.jsp" %><%--
--%><c:set var="menu" value="1" scope="request"/><%--
--%><c:set var="subMenu" value="1" scope="request"/><%--
--%><!DOCTYPE html>
<html>
<head>
<c:import url="../include/head.jsp"/>
<c:import url="../include/app.jsp"/>
<script>
var rules = {
    memberId: {
        required: true,
        regx: /^[a-z]{1}[a-z0-9]{4,18}$/
    },
    memberName: {
        required: true,
        regx: /^[가-힣]{2,10}$|^[a-zA-Z]{3,20}$/
    },
    password: {
    	required: true,
        regx: /^(?=.*[a-zA-Z])(?=.*[!@#$_])(?=.*[0-9]).{6,16}/
    },
    phone: {
    	required: true,
    	regx: /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/
    },
    email: {
       required: true,
       email:false,
       regx: /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/
    }
};
var messages = {
	memberId: {
         required : "아이디를 입력하세요.",
         regx: "첫문자 영문소문자 + 영문/숫자 5~18자입니다."
	},
	memberName: {
		 required : "이름을 입력하세요.",
		 regx: "한글(2~10자)/영문(3~20자) 택1 타입으로 입력하세요."
    },
    password: {
        required : "비밀번호를 입력하세요.",
        regx: "영문+숫자+특수문자(!,@,#,$,_) 포함 6~20자입니다."
	},
    phone: {
        required: "핸드폰를 입력하세요.",
        regx: "올바른 번호 형식으로 입력하세요."
    },
    email: {
        required: "이메일을 입력하세요",
        regx: "올바른 이메일 형식으로 입력하세요."
    }
};
</script>
</head>
<body>
<div id="wrap" class="hideNav">
	<c:import url="../include/header.jsp"/>
	<c:import url="../include/navigation.jsp"/>
	<!-- Content -->
	<div id="container">
		<div class="contentWrap">
			<div class="contents">
				<div class="title"><h3>회원 등록</h3></div>
				<div class="content">
					<form action='<c:url value="/admin/member/regist"/>' name="form" class="form" method="post" enctype="multipart/form-data">
						<fieldset class="box">
							<legend class="hide">회원 정보 입력 폼</legend>
							<input type="hidden" name="board" value="regist"/>
							<div class="block">
								<label for="state">상태</label><%--
							--%><select name="state" id="state">
									<option value="Y">정상</option>
									<option value="S">정지</option>
									<option value="L">탈퇴</option>
								</select>
							</div>
							<div class="block">
								<label for="roleName">구분</label><%--
							--%><select name="roleName" id="roleName">
									<option value="USER">일반</option>
									<option value="MANAGER">사업자</option>
									<option value="ADMIN">관리자</option>
								</select>
							</div>
							<div class="fc">
								<label for="memberId">아이디</label><input type="text" name="memberId" id="memberId" maxlength="16"/><button type="button" class="duple btn md data">중복확인</button>
								<span class="message"></span>
							</div>
							<div>
								<label for="memberName">이름</label><input type="text" name="memberName" id="memberName" maxlength="12"/>
								<span class="message"></span>
							</div>
							<div>
								<label for="password">비밀번호</label><input type="password" name="password" id="password" maxlength="16"/>
								<span class="message"></span>
							</div>
							<div>
								<label for="phone">핸드폰</label><input type="tel" name="phone" id="phone" maxlength="13"/>
								<span class="message"></span>
							</div>
							<div>
								<label for="email">이메일</label><input type="email" name="email" id="email"  maxlength="30"/>
								<span class="message"></span>
							</div>
						</fieldset>
						<fieldset class="fOpt">
							<a href='<c:url value="/admin/member/list"/>' class="lBtn  btn link">목록</a><!-- 
						 --><button type="submit" class="rBtn btn">등록</button>
						</fieldset>
					</form>
				</div>
			</div><!-- /.contents -->
		</div><!-- /.contentWrap -->
	</div><!-- /#container -->
	<c:import url="../include/footer.jsp"/>
</div><!-- /#wrap -->
<c:import url="../include/modal.jsp"/>
</body>
</html>