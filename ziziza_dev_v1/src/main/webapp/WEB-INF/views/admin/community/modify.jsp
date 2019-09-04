<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ include file="../include/common.jsp" %><%--
--%><c:set var="menu" value="3" scope="request"/><%--
--%><c:set var="subMenu" value="3" scope="request"/><%--
--%><!DOCTYPE html>
<html>
<head>
<c:import url="../include/head.jsp"/>
<c:import url="../include/app.jsp"/>
<script>
var rules = {
	title: {
        required: true,
        maxbytelength: 120
    },
    contents: {
        required: true,
        maxbytelength: 1000
    }
};
var messages = {
	title: {
         required : "제목을 입력하세요.",
         maxbytelength: "{0}Byte 이하로 입력하세요."
	},
	contents: {
		 required : "내용을 입력하세요.",
		 maxbytelength: "{0}Byte 이하로 입력하세요."
    }
};
function putInfo(vo){
	$("#state option[value='" + vo.state + "']").attr("selected", true);
	$("#modifyName").val(vo.modifyName);
	$("#modifyNo").val(vo.modifyNo);
	$("#memberName").val(vo.memberName);
	$("#memberNo").val(vo.memberNo);
	$("#title").val((vo.title).DecodeXMLEscapeChars());
	$("#contents").val((vo.contents).DecodeXMLEscapeChars());
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
				<div class="title"><h3>커뮤니티 수정</h3></div>
				<div class="content">
					<form action='<c:url value="/admin/board/community/modify"/>' name="form" class="form" data-no='<c:out value="${param.no}"/>' method="post" enctype="multipart/form-data">
						<fieldset class="box">
							<legend class="hide">커뮤니티 수정 입력 폼</legend>
							<input type="hidden" name="board" value="modify"/>
							<input type="hidden" name="boardNo" value='<c:out value="${param.no}"/>'/>
							<div>
								<label for="state">상태</label><%--
							--%><select name="state" id="state">
									<option value="Y">게시중</option>
									<option value="N">숨김</option>
								</select>
							</div>
							<div>
								<label for="modifyName">수정자</label><input type="text" name="modifyName" id="modifyName" maxlength="16" disabled/>
								<input type="hidden" name="modifyNo" value='<c:out value="${loginUser.userNo}"/>'/>
							</div>
							<div>
								<label for="memberName">작성자</label><input type="text" name="memberName" id="memberName" maxlength="16" disabled/>
								<input type="hidden" id="memberNo" name="memberNo"/>
							</div>
							<div>
								<label for="title">제목</label><input type="text" id="title" name="title" maxlength="120"/>
								<span class="message"></span>
								<span class="byte"></span>
							</div>
							<div>
								<label for="contents">내용</label><textarea id="contents" name="contents" rows="8"></textarea>
								<span class="message"></span>
								<span class="byte"></span>
							</div>
						</fieldset>
						<fieldset class="fOpt">
							<a href='<c:url value="/admin/board/community/delete"/>' class="dBtn btn danger fl">삭제</a>
							<a href='<c:url value="/admin/board/community/list"/>' class="lBtn btn link">목록</a><!-- 
						 --><button type="submit" class="rBtn btn">저장</button>
						</fieldset>
					</form>
					<c:import url="../comment/list.jsp"/>
				</div>
			</div><!-- /.contents -->
		</div><!-- /.contentWrap -->
	</div><!-- /#container -->
	<c:import url="../include/footer.jsp"/>
</div><!-- /#wrap -->
<c:import url="../include/modal.jsp"/>
</body>
</html>