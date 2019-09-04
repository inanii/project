<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ include file="../include/common.jsp" %><%--
--%><c:set var="menu" value="2" scope="request"/><%--
--%><c:set var="subMenu" value="1" scope="request"/><%--
--%><!DOCTYPE html>
<html>
<head>
<c:import url="../include/head.jsp"/>
<c:import url="../include/app.jsp"/>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src='<c:url value="/jquery/address.js"/>'></script>
<script>
var rules = {
	zoneCode: {
		required: true
	},
	detailAddress:{
		required: true
	},
	companyTel:{
		required: true,
    	regx: /(^02.{0}|^0[3-9]{1}[0-9]{1}|^01(?:0|1|[6-9]))-(?:\d{3}|\d{4})-\d{4}$/
	},
	openTime:{
		required: true,
		time:true
	},
	closeTime:{
		required: true,
		time:true
	},
	contents: {
        required: true,
        maxbytelength: 1000
    }
};
var messages = {
	zoneCode: {
		required: "우편번호를 입력하세요."
	},
	detailAddress:{
		required: "상세 주소를 입력해주세요."
	},
    companyTel: {
        required: "전화번호를 입력하세요.",
        regx: "올바른 번호 형식으로 입력하세요."
    },
    openTime:{
		required: "영업시작시간을 입력하세요.",
		time:	"올바른 시간 형식으로 입력하세요."
	},
	closeTime:{
		required: "영업마감시간을 입력하세요.",
		time:	"올바른 시간 형식으로 입력하세요."
	},
	contents: {
		 required : "내용을 입력하세요.",
		 maxbytelength: "{0}Byte 이하로 입력하세요."
    }
};

function putInfo(vo, charge, plants){
	$("#state option[value='" + vo.state + "']").attr("selected", true);
	$("#companyKind option[value='" + vo.companyKind + "']").attr("selected", true);
	$("#companyName").val(vo.companyName);
	$("#zoneCode").val(vo.zoneCode);
	$("#address").val(vo.address);
	$("#detailAddress").val(vo.detailAddress);
	$("#companyTel").val(vo.companyTel);
	$("#openTime").val(vo.openTime);
	$("#closeTime").val(vo.closeTime);
	$("#contents").val(vo.contents);
	//요금
	var cList = $(".chargeList").empty();
	$.each(charge, function(idx, cl){
		var li = $("<li>");
		$('<span>').text(cl.timeKind).appendTo(li);
		$('<span>').text(cl.subject).appendTo(li);
		$('<span>').text(cl.price).appendTo(li);
		li.appendTo(cList);
	});
	//편의시설
	var pList = $(".plantList").empty();
	$.each(plants, function(idx, pl){
		var li = $("<li>").text(pl.plantName);
		li.appendTo(pList);
	});
}//appendInfo()

$(function(){

});
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
				<div class="title"><h3>사업장 수정</h3></div>
				<div class="content">
					<form action='<c:url value="/admin/company/modify"/>' name="form" class="form" data-no='<c:out value="${param.no}"/>' method="post" enctype="multipart/form-data">
						<fieldset class="box">
							<legend class="hide">사업장 정보 입력 폼</legend>
							<input type="hidden" name="board" value="modify"/>
							<input type="hidden" name="companyNo" value='<c:out value="${param.no}"/>'/>
							<div>
								<label for="state">상태</label><%--
							--%><select name="state" id="state">
									<option value="Y">게시중</option>
									<option value="N">숨김</option>
								</select>
							</div>
							<div>
								<label for="companyKind">구분</label><%--
							--%><select name="companyKind" id="companyKind">
									<option value="찜질방">찜질방</option>
								</select>
							</div>
							<div>
								<label for="companyName">상호명</label><input type="text" name="companyName" id="companyName" readonly/>
								<span class="message"></span>
							</div>
							<div class="addressBox">
								<label for="zipCode">우편번호</label><%--
							--%><input type="text" name="zoneCode" id="zoneCode" class="zoneCode" readonly/>
								<button type="button" class="openAddr btn md data">우편번호 검색</button>
								<span class="message"></span>
							</div>
							<div class="addressBox">
								<label for="address">주소</label><%--
							--%><input type="text" name="address" id="address" class="address" readonly/>
								<input type="text" name="detailAddress" id="detailAddress" class="detailAddress" maxlength="100"/>
								<span class="message"></span>
							</div>
							<div>
								<label for="companyTel">전화번호</label><input type="tel" name="companyTel" id="companyTel" maxlength="13"/>
								<span class="message"></span>
							</div>
							<div>
								<label for="openTime">오픈시간</label><input type="time" name="openTime" id="openTime"/>
								<span class="message"></span>
							</div>
							<div>
								<label for="closeTime">마감시간</label><input type="time" name="closeTime" id="closeTime"/>
								<span class="message"></span>
							</div>
							<div>
								<label for="contents">소개글</label><textarea id="contents" name="contents" rows="8"></textarea>
								<span class="message"></span>
								<span class="byte"></span>
							</div>
						</fieldset>
						<fieldset class="native">
							<div>
								<span>요금</span>
								<ul class="chargeList"></ul>
							</div>
							<div>
								<span>편의시설</span>
								<ul class="plantList"></ul>
							</div>
						</fieldset>
						<fieldset class="files">
							<div class="sliderBox">
								<label for="banner">이미지</label>
							    <div id="slider" class="slider"></div>
							    <div id="sliderNav" class="sliderNav"></div>
							</div>
						</fieldset>
						<fieldset class="fOpt">
							<a href='<c:url value="/admin/company/delete"/>' class="dBtn btn danger fl">삭제</a>
							<a href='<c:url value="/admin/company/list"/>' class="lBtn btn link">목록</a><!-- 
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