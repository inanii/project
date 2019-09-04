<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ include file="../include/common.jsp" %><%--
--%><c:set var="menu" value="1" scope="request"/><%--
--%><c:set var="subMenu" value="2" scope="request"/><%--
--%><!DOCTYPE html>
<html>
<head>
<c:import url="../include/head.jsp"/>
<c:import url="../include/app.jsp"/>
<script>
var rules = {
    mngName: {
        required: true,
        regx: /^[가-힣]{2,10}$|^[a-zA-Z]{3,20}$/
    },
    bizNo: {
    	required: true,
    	bizId : true		//ex) 116-82-00276   114-86-59541
    },
    repTel: {
    	required: true,
    	regx: /(^02.{0}|^0[3-9]{1}[0-9]{1}|^01(?:0|1|[6-9]))-(?:\d{3}|\d{4})-\d{4}$/
    }
};
var messages = {
	mngName: {
		 required : "대표자를 입력하세요.",
		 regx: "한글(2~10자)/영문(3~20자) 택1 타입으로 입력하세요."
    },
    bizNo: {
    	required: "사업자번호를 입력하세요.",
    	bizId : "유효하지 않는 번호입니다."
    },
	repTel: {
        required: "대표연락처를 입력하세요.",
        regx: "올바른 번호 형식으로 입력하세요."
    }
};

function putInfo(vo){
	$("#state option[value='" + vo.state + "']").attr("selected", true);
	$("#mngName").val(vo.mngName);
	$("#bizNo").val(vo.bizNo);
	$("#repTel").val(vo.repTel);
	if(vo.state == 'Y'){
		$("#applyName").val(vo.applyName);
		$("#applyDate").text(vo.applyDate);
	}//
}//putInfo()
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
				<div class="title"><h3>사업자 수정</h3></div>
				<div class="content">
					<form action='<c:url value="/admin/manager/modify"/>' name="form" class="form" data-no='<c:out value="${param.no}"/>' method="post" enctype="multipart/form-data">
						<fieldset class="box">
							<legend class="hide">사업자 정보 입력 폼</legend>
							<input type="hidden" name="board" value="modify"/>
							<input type="hidden" name="mngNo" value='<c:out value="${param.no}"/>'/>
							<div>
								<label for="state">상태</label><%--
							--%><select name="state" id="state">
									<option value="Y">승인</option>
									<option value="N">대기</option>
								</select>
								<span class="message" id="applyDate"></span>
							</div>
							<div>
								<label for="applyName">담당자</label><input type="text" name="applyName" id="applyName" value='<c:out value="${loginUser.userName}"/>' disabled/>
								<input type="hidden" name="applyNo" value='<c:out value="${loginUser.userNo}"/>'/>
							</div>
							<div>
								<label for="mngName">대표자</label><input type="text" name="mngName" id="mngName" maxlength="16"/>
								<span class="message"></span>
							</div>
							<div>
								<label for="bizNo">사업자번호</label><input type="text" name="bizNo" id="bizNo" maxlength="12"/>
								<span class="message"></span>
							</div>
							<div>
								<label for="repTel">대표 연락처</label><input type="tel" name="repTel" id="repTel" maxlength="13"/>
								<span class="message"></span>
							</div>
						</fieldset>
						<fieldset class="files">
							<div>
								<label for="attachment">첨부파일</label>
							    <ul class="fileList"></ul>
							</div>
						</fieldset>
						<fieldset class="fOpt">
							<a href='<c:url value="/admin/manager/delete"/>' class="dBtn btn danger fl">삭제</a>
							<a href='<c:url value="/admin/manager/list"/>' class="lBtn btn link">목록</a><!-- 
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