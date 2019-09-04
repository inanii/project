<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ include file="../include/common.jsp" %><%--
--%><c:set var="menu" value="4" scope="request"/><%--
--%><c:set var="subMenu" value="1" scope="request"/><%--
--%><!DOCTYPE html>
<html>
<head>
<c:import url="../include/head.jsp"/>
<c:import url="../include/app.jsp"/>
<script>
var rules = {
	answer: {
        required: true,
        maxbytelength: 1000
    }
};
var messages = {
	answer: {
		 required : "내용을 입력하세요.",
		 maxbytelength: "{0}Byte 이하로 입력하세요."
    }
};

function putInfo(vo){
	$("#state option[value='" + vo.state + "']").attr("selected", true);
	$("#roleName option[value='" + vo.roleName + "']").attr("selected", true);
	$("#memberName").val(vo.memberName);
	$("#qstTitle").val(vo.qstTitle);
	$("#qstContents").val(vo.qstContents);
	$("#alramEmail").val(vo.alramEmail);
	if(vo.state == 'Y'){
		$("#answerName").val(vo.answerName);
		$("#answer").val(vo.answer);
		$("#answerDate").text(vo.answerDate);
	}//
}//appendInfo()
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
				<div class="title"><h3>문의 수정</h3></div>
				<div class="content">
					<form action='<c:url value="/admin/qna/modify"/>' name="form" class="form" data-no='<c:out value="${param.no}"/>' method="post" enctype="multipart/form-data">
						<fieldset class="box">
							<legend class="hide">답변 입력 폼</legend>
							<input type="hidden" name="board" value="modify"/>
							<input type="hidden" name="qnaNo" value='<c:out value="${param.no}"/>'/>
							<div class="block">
								<label for="state">상태</label><%--
							--%><select name="state" id="state">
									<option value="Y">답변</option>
									<option value="N">미답변</option>
								</select>
							</div>
							<div class="block">
								<label for="roleName">구분</label><%--
							--%><select name="roleName" id="roleName" disabled>
									<option value="USER">일반</option>
									<option value="MANAGER">사업자</option>
								</select>
							</div>
							<div class="fc">
								<label for="memberName">문의자</label><input type="text" name="memberName" id="memberName" maxlength="16" disabled/>
								<input type="hidden" id="alramEmail" name="alramEmail" value=''/>
							</div>
							<div>
								<label for="qstTitle">제목</label><input type="text" id="qstTitle" name="qstTitle" readonly/>
							</div>
							<div>
								<label for="qstContents">문의 내용</label><textarea id="qstContents" name="qstContents" rows="8"  readonly></textarea>
							</div>
							<div>
								<label for="answerName">답변자</label><input type="text" name="answerName" id="answerName" value='<c:out value="${loginUser.userName}"/>' disabled/>
								<input type="hidden" name="answerNo" value='<c:out value="${loginUser.userNo}"/>'/>
								<span class="message" id="answerDate"></span>
							</div>
							<div>
								<label for="answer">답변</label><textarea id="answer" name="answer" rows="8"></textarea>
								<span class="message"></span>
								<span class="byte"></span>
							</div>
						</fieldset>
						<fieldset class="fOpt">
							<a href='<c:url value="/admin/qna/delete"/>' class="dBtn btn danger fl">삭제</a>
							<a href='<c:url value="/admin/qna/list"/>' class="lBtn btn link">목록</a><!-- 
						 --><button type="submit" class="rBtn btn">저장</button>
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