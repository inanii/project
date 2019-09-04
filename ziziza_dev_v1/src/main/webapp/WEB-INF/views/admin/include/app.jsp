<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
--%><link rel="stylesheet" href='<c:url value="/css/reset.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/admin/main.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/admin/responsive.css"/>'>
<link rel="stylesheet" href='<c:url value="/jquery/perfect-scrollbar/css/perfect.scrollbar.css"/>'>
<link rel="stylesheet" href='<c:url value="/jquery/jquery-modal/css/jquery.modal.css"/>'>
<link rel="stylesheet" href='<c:url value="/jquery/slick/css/slick.css"/>'>
<link rel="stylesheet" href='<c:url value="/jquery/slick/css/slick-theme.css"/>'>
<script src='<c:url value="/jquery/jquery-3.4.1.min.js"/>'></script>
<script src='<c:url value="/jquery/jquery-form/jquery.form.js"/>'></script>
<script src='<c:url value="/jquery/jquery-validation/jquery.validate.js"/>'></script>
<script src='<c:url value="/jquery/jquery-validation/additional-methods.js"/>'></script>
<script src='<c:url value="/jquery/perfect-scrollbar/perfect.scrollbar.js"/>'></script>
<script src='<c:url value="/jquery/jquery-modal/jquery.modal.js"/>'></script>
<script src='<c:url value="/jquery/jquery-loading/loadingoverlay.js"/>'></script>
<script src='<c:url value="/jquery/slick/slick.js"/>'></script>
<script src='<c:url value="/jquery/admin/common.js"/>'></script>
<script>
/** 	Ajax 공통 	**/
var options = {	
	type	:	'POST',       		// 'get' or 'post', override for form's 'method' attribute 
	dataType	:	'json', 		// 'xml', 'script', or 'json' (expected server response type) 
//	url	:	url,         		// override for form's 'action' attribute 
//	success	:	function(data, statusText, xhr, $form){},	// post-submit callback 
//	target:        '#output1',  // target element(s) to be updated with server response 
//	clearForm	:	true,        // clear all form fields after successful submit 
//	resetForm	:	true,        // reset the form after successful submit 
//	beforeSubmit:  showRequest, // pre-submit callback
	error	:	function(xhr, status, error){$.LoadingOverlay('hide');commonAlert('처리 오류 잠시후 다시 시도해 주세요.');}				// post-submit callback error
//	$.ajax options can be used here too, for example: 
//	timeout:   3000 
};
var vOptions = {	
		type	:	'POST',
		dataType	:	'json',
		error	:	function(xhr, status, error){$.LoadingOverlay('hide');commonAlert('처리 오류 잠시후 다시 시도해 주세요.');}
}
var tbody, temp, board, form, url, vForm, duple = false;
$(function(){
	board	= 	$('input[name="board"]').val();
	
	/**		메뉴 공통	**/
	$('.navToggle').on('click', function(e){		//메뉴 숨김 버튼 클릭
		e.preventDefault();
		$('#wrap').toggleClass('hideNav');
	});
	
	$('span.items').on('click', function(e){		//메뉴 클릭
		e.preventDefault();
		var items = $(this);
		var li = items.parent();
		if(li.hasClass('open')){
			li.removeClass('open');		
		}else{
			$('.menu > li.open').removeClass('open');
			li.addClass('open');			
		}
		
	});
	
	/**		스크롤		**/
	if(board != 'login'){		//로그인 페이지 제외
		const psNav = new PerfectScrollbar('#navWrap', {
			wheelSpeed: 2,
			wheelPropagation: true
		});
		
		const psCon = new PerfectScrollbar('#container', {
			wheelSpeed: 2,
			wheelPropagation: true
		});
		
		psNav.update();
		psCon.update();
		
		$(window).resize(throttle(100, function(e) {
			psNav.update();
			psCon.update();
	   }));
	}//if end
	
	/**  	Modal	  **/
	$('.modal').on('modal:open', function(event, modal) {
		$(modal.$elm).attr("tabindex", -1).focus();
	});
	$('.modal .close').on('click', function(){
		$.modal.close();
		return false;
	});	

	/**		목록페이지		**/
	if(board == 'list'){
		form  	=	$('.search');
		var listOpt = options;
		listOpt.success = function(data, statusText, xhr, $form){
			putList(data.list);			//목록 출력
			pageSetting(data.page);		//페이징
		};
		tbody 	=	$('.lTbl tbody');
		temp	=	$('.lTbl tbody').children().clone();
		tbody.empty();
		
		form.ajaxSubmit(listOpt);
		
		$('.search button[type="submit"]').on('click', function(e){		//검색 버튼
			e.preventDefault();
			form.ajaxSubmit(listOpt);
		});
	}//if end
	
	/**		입력 폼		**/
	if(board == 'regist' || board == 'modify'){
		vForm	=	$('<form>');
		form 	= 	$(".form");
		form.attr('autocomplete','off');
		$('<input type="hidden" name="no">').appendTo(vForm);
		$('<input type="hidden" name="menuNo">').appendTo(vForm);
		$('<input type="hidden" name="menuType">').appendTo(vForm);
		$('<input type="hidden" name="fileType">').appendTo(vForm);
		$('<input type="hidden" name="inputId">').appendTo(vForm);
		url = form.attr("action");
		commonValidator(form, rules, messages);		//validate
		if(board == 'modify')	getInfo();		//상세 페이지
		
		$('.fOpt .dBtn').on('click', function(e){	//삭제 버튼
			e.preventDefault();
			commonConfirm('삭제하시겠습니까?', deleteInfo);
		});
		
		$('.fOpt .pBtn').on('click', function(e){	//임시비밀번호 버튼
			e.preventDefault();
			commonConfirm('임시비밀번호를 발송하시겠습니까?', updateTempPw);
		});
		
		$('.files #attachments').on('change', function(e){		//첨부파일 추가
			e.preventDefault();
			var file = $(this);
			if(fileCheck(file, 'doc')){
				var upFile = file.clone().attr('name', 'attachments');
				file.val('');
				if(board == 'regist'){
					var ul = file.next();
					var li = $('<li>');
					upFile.appendTo(li);
					li.append('<i class="icofont-file-alt icofont-2x">');
					var p = $('<p>').appendTo(li);
					$('<span>').text(upFile[0].files[0].name).appendTo(p);
					$('<span>').text('').appendTo(p);
					var btn = $('<button type="button" class="btn sm danger"><i class="icofont-bin">').on('click', function(e){
						$(this).parent().remove();
					}).appendTo(li);
					li.prependTo(ul);		
				}//if end
				if(board == 'modify')	uploadFile(upFile);
			}//
		});
		
		$('#banner').on('change', function(e) {		//이미지 변경
			e.preventDefault();
			var file = $(this);
			if(fileCheck(file, 'image')){
				if(board == 'regist') readURL(this);
				if(board == 'modify') {
					var upFile = file.clone().attr('name', 'banner');
					file.val('');
					uploadFile(upFile);
				}//if end
			}//if end
		});
		
		/**		이미지 슬라이더	**/
		if($('.slider').length > 0){
			$('.slider').slick({
				  slidesToShow: 1,
				  slidesToScroll: 1,
				  arrows: false,
				  fade: true,
				  asNavFor: '.sliderNav'
			});
			$('.sliderNav').slick({
				  slidesToShow: 3,
				  slidesToScroll: 1,
				  asNavFor: '.slider',
				  dots: true,
				  infinite: false,
				  centerMode: false,
				  focusOnSelect: true
			});
		}//if end
		
		$(".rlBtn").on('click', function(e){	//댓글 열기
			e.preventDefault();
			getReply();
		});
		
		$('input[type="tel"]').on('keyup', function(e){	//전화번호 자동 하이픈
			e.preventDefault();
			var tel = $(this);
			var hypen = autoHypenPhone(tel.val());
			tel.val(hypen)
	    });
		
		$('.duple').on('click', function(e){
			e.preventDefault();
			duple = false;		//중복체크
			var input = $('#memberId');
			var id = input.val();
			if(id != '' && !input.hasClass('error')) duplicateId(id);
			else commonAlert('아이디를 확인해 주세요.');
		});
	}//if end
	
});

function duplicateId(id){
	vForm.find('input[name="inputId"]').val(id);
	vOptions.url  = '<c:url value="/admin/member/checkId"/>';
	vOptions.success = function(data, statusText, xhr){
		if(data > 0){
			commonAlert('중복 아이디가 존재합니다.');
		}else{
			commonAlert('사용 가능한 아이디입니다.');
			duple = true;
		}
	};
	vForm.ajaxSubmit(vOptions);
}//

/**		저장 Ajax		**/
function saveInfo(){
	options.url		= 	url;
	options.success = function(data, statusText, xhr, $form){
		if(data > 0){
			if(board == 'regist'){
				returnUrl = url.replace('regist', 'modify') + "?no=" + data;
				commonAlert('등록이 완료되었습니다.', returnUrl);					
			}
			if(board == 'modify') commonAlert('수정이 완료되었습니다.');
		}else{
			commonAlert('처리 오류 잠시후 다시 시도해 주세요.');
		}//if end
	};
	form.ajaxSubmit(options);
}//saveInfo()

/**		상세 ajax		**/
function getInfo(){
	vForm.find('input[name="no"]').val(form.data('no'));
	vOptions.url  = url.replace('modify', 'detail');
	vOptions.success = function(data, statusText, xhr){
		if(data.vo){
			putInfo(data.vo, data.charge, data.plants);
			vForm.find('input[name="menuNo"]').val(data.vo.boardNo);
			vForm.find('input[name="menuType"]').val(data.vo.boardCode);
			if(data.files){
				$.each(data.files, function(idx, file){
					appendAttach(file);
				});
			}//
			$('.reply .cnt').text(data.commentCnt);
		}else	
			commonAlert('정보가 존재하지 않습니다.', 'list');
	};
	vForm.ajaxSubmit(vOptions);
}//getInfo()

/**		삭제 ajax			**/
function deleteInfo(deleteUrl){
	vForm.find('input[name="no"]').val(form.data('no'));
	vOptions.url  = url.replace('modify', 'delete');
	vOptions.success = function(data, statusText, xhr){
		if(data > 0)	
			commonAlert('삭제가 완료되었습니다.', 'list');
		else 
			commonAlert('처리 오류 잠시후 다시 시도해 주세요.');
	};
	vForm.ajaxSubmit(vOptions);
}//deleteInfo()

/**		임시비밀번호 ajax			**/
function updateTempPw(){
	vForm.find('input[name="no"]').val(form.data('no'));
	vOptions.url  = '<c:url value="/tempPw"/>';
	vOptions.success = function(data, statusText, xhr){
		if(data.message) commonAlert(data.message);
	};
	vForm.ajaxSubmit(vOptions);
}//deleteInfo()

/*********************	댓글	*************************/
/**		 댓글 목록 ajax		**/
function getReply(){
	vForm.find('input[name="no"]').val(form.data('no'));
	vOptions.url  = '<c:url value="/admin/comment/list"/>';
	vOptions.success = function(data, statusText, xhr){
		$('.reply .cnt').text(data.total);
		putReply(data.list);
	};
	vForm.ajaxSubmit(vOptions);
}//

/**		 댓글 출력		**/
function putReply(list){
	var ul = $('.replyList').empty();
	if(list){
		$.each(list, function(idx, vo){
			var li = $('<li>');
			var p = $('<p>').appendTo(li);
			$('<span class="writer">').text(vo.memberName).appendTo(p);
			$('<span class="date">').text(vo.registDate).appendTo(p);
			$('<p>').text(vo.contents).appendTo(li);
			var btn = $('<button type="button" class="btn sm danger"><i class="icofont-bin">').on('click', function(e){
				e.preventDefault();
				commonConfirm('댓글을 삭제하시겠습니까?', function(){
					deleteReply(vo.commentNo, btn);
				});
			}).appendTo(li);
			li.appendTo(ul);
		});
	}else{
		$('<li class="empty">').text('등록된 데이터가 없습니다.').appendTo(ul);
	}//if end
}//

/**		댓글 삭제 ajax	**/
function deleteReply(no, elem){
	vForm.find('input[name="no"]').val(no);
	vOptions.url  = '<c:url value="/admin/comment/delete"/>';
	vOptions.success = function(data, statusText, xhr){
		if(data > 0)	{
			commonAlert("삭제가 완료되었습니다.");
			elem.parent().remove();
		}else 
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
	};
	vForm.ajaxSubmit(vOptions);
}//deleteFile()

/*********************	파일	************************/
/** 	첨부 파일	출력 **/
function appendAttach(file){
	var no = file.fileNo;
	var fileType = file.fileType;
	var btn = $('<button type="button" class="btn sm danger"><i class="icofont-bin">').on('click', function(e){
		e.preventDefault();
		commonConfirm('파일을 삭제하시겠습니까?', function(){
			deleteFile(no, btn, fileType);
		});
	});
	if(fileType == 'ATTACHMENT'){
		var ul = $('.fileList');
		var li = $('<li>');
		li.append('<i class="icofont-file-alt icofont-2x">');
		var p = $('<p>').appendTo(li);
		$('<span>').text(file.originName).appendTo(p);
		$('<span>').text('').appendTo(p);
		$('<a class="btn sm data">').attr('href', '/file/download?no=' + no).append('<i class="icofont-download">').appendTo(li);
		btn.appendTo(li);
		li.appendTo(ul);
	}//if end
	if(fileType == 'ATTACHMENTS'){
		var ul = $('.fileList');
		var li = $('<li>');
		li.append('<i class="icofont-file-alt icofont-2x">');
		var p = $('<p>').appendTo(li);
		$('<span>').text(file.originName).appendTo(p);
		$('<span>').text('').appendTo(p);
		$('<a class="btn sm data">').attr('href', '/file/download?no=' + no).append('<i class="icofont-download">').appendTo(li);
		btn.appendTo(li);
		li.appendTo(ul);
	}//if end
	if(fileType == 'BANNER') {
		$('.files #banner').hide();
		var preview = $(".bPreview").empty();
		var img = $('<img title="배너 이미지">').attr('src', '/file/imageView?no=' + file.fileNo);
		img.appendTo(preview);
		btn.appendTo(preview);
	}//if end
	if(fileType == 'SLIDE'){
		var p = $('<p>');
		var img = $('<img title="배너 이미지">').attr('src', '/file/imageView?no=' + file.fileNo).appendTo(p);
		$('.slider').slick('slickAdd',$('<div>').append(p));
		$('.sliderNav').slick('slickAdd',$('<div>').append(p.clone()));
	}//if end
}//appendAttach()

/**		파일 업로드 ajax	**/
function uploadFile(file){
	vForm.append(file);
	var type = file.attr('name');
	vForm.find('input[name="fileType"]').val(type);
	file.attr('name', 'file');
	vOptions.url  = '<c:url value="/file/upload"/>';
	vOptions.success = function(data, statusText, xhr){
		if(data)	{
			commonAlert("업로드 완료되었습니다.");
			appendAttach(data);
			file.remove();
		}else 
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
	};
	vForm.ajaxSubmit(vOptions);
}//

/**		파일 삭제 ajax	**/
function deleteFile(no, elem, fileType){
	vForm.find('input[name="no"]').val(no);
	vOptions.url  = '<c:url value="/file/delete"/>';
	vOptions.success = function(data, statusText, xhr){
		if(data > 0)	{
			commonAlert("삭제가 완료되었습니다.");
			
			if(fileType == 'BANNER'){
				$(".bPreview").empty();
				$('.files #banner').val('').show();
			}else{
				elem.parent().remove();
			}//if end
		}else 
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
	};
	vForm.ajaxSubmit(vOptions);
}//deleteFile()

/**		이미지 바로 출력		**/
function readURL(input) {
	if (input.files && input.files[0]) {
    	var reader = new FileReader();
    	reader.onload = function(e) {
	    	var preview = $('.bPreview').empty();
	    	var img = $('<img title="배너 이미지">').attr('src', e.target.result);
	    	img.appendTo(preview);
    	}
    	reader.readAsDataURL(input.files[0]);
    }//if end
}//readURL()
</script>