/**		페이지 로딩 js		**/
//$(window).on('load', function() {	// 로딩 완료되었을때
// 	$.LoadingOverlay('hide');
//});
$(document)
//.ready(function() {		// 문서의 로딩을 시작할때
//	$.LoadingOverlay('show');
//})
.ajaxStart(function(){			// ajax 시작할때
	$.LoadingOverlay('show');
}).ajaxStop(function(){				// ajax 종료
	$.LoadingOverlay('hide');
})
//.ajaxError(function() {
//	$.LoadingOverlay('hide');
//	commonAlert('처리 오류 잠시후 다시 시도해 주세요.');
//});

/****************** 	Modal custom	********************/
/** 공통 Alert **/
function commonAlert(msg, returnUrl){
	$('.alert .message').empty().text(msg);
	$('.alert').modal({ escapeClose: false,clickClose: false, showClose : false});
	if(returnUrl){
		$('.alert .close').off('click').on('click', function(e){
			e.preventDefault();
			location.href = (returnUrl == 'list' ? $('.lBtn').attr('href') : returnUrl);
		});	
	}
}//commonAlert()

/** 공통 Confirm **/
function commonConfirm(msg, callBack){
	$('.confirm .message').empty().text(msg);
	$('.confirm').modal({ escapeClose: false,clickClose: false, showClose : false});
	$('.modal .ok').off('click').on('click', function(e){		//Modal 확인 버튼
		e.preventDefault();
		$.modal.close();
		callBack();
	});
}//commonConfirm()

/******************** 공통 Validator **************************/
function commonValidator(targetForm, rules, messages) {
	targetForm.validate({
        debug: false,   //debug가 true인 경우 validation 후 submit을 수행하지 않음
        focusCleanup: true, //true이면 잘못된 필드에 포커스가 가면 에러를 지움
        rules: rules,		//validate 	규칙
        messages: messages,	//validate 	메세지
        errorPlacement: function (error, element) {	//틀림
        	element.parent().find('.message').addClass('error').text(error.text());
        },
        success: function(error, element) {		//통과
        	$(element).parent().find('.message').removeClass('error').text('');
        },
        submitHandler: function(form){
        	//중복체크 존재 하면 확인
        	if($('.duple').length > 0)
        		if(!duple){ commonAlert('아이디 중복 확인이 필요합니다.'); return;}
        	
        	commonConfirm('저장하시겠습니까?', saveInfo);
        }
    });
}//commonValidator()

/****************		페이징		**************/
function pageSetting(page){
	$('.paging .pageNum').remove();	//초기화
	var nowPage = page.currentPage;
	var prev = $('.paging > .prev');
	var next = $('.paging > .next');
	
	if(page.prevState)	prev.removeClass('disabled').data('page', nowPage - 1);	
		else	prev.addClass('disabled');
	if(page.nextState)	next.removeClass('disabled').data('page', nowPage + 1);	
		else	next.addClass("disabled");
	
	for(var i = page.startPage;i <= page.endPage;i++){
		var span = $('<span>').text(i);
		var li = $('<li class="pageNum">').data('page', i);
		li.append(span);
		if(i == nowPage) li.addClass('active');
		next.before(li);
	}//for end
	
	$('.paging li').off('click').not('.active, .disabled').on('click', function(e){
		e.preventDefault();
		$('input[name="currentPage"]').val($(this).data('page'));
		form.ajaxSubmit(options);
	});
}//pageSetting()

/***************	Util	*******************/
//주어진 시간만큼 지나야 주어진 함수를 실행 합니다.
function throttle(ms, fn) {
  var allow = true;
  function enable() { allow = true;}
  return function(e) {
      if(allow) {
          allow = false;
          setTimeout(enable, ms);
          fn.call(this, e);
      }//if end
  }
}//throttle()

/**
* 문자열의 바이트수 리턴
* @returns {Number}
*/
String.prototype.getByteLength = function() {
  var l	= 	0;
  for(var idx = 0; idx < this.length; idx++) {
      var c	=	escape(this.charAt(idx));
      if(c.length == 1) l ++;
      else if(c.indexOf('%u') != -1)	l += 2;
      else if(c.indexOf('%') != -1)	l += c.length/3;
  }//for end
  return l;
};

/*	
* 	전화번호 자동 하이픈	
* 	출처 : https://mulder21c.github.io/2014/11/03/automatically-enter-cell-phone-number-hyphen/
* */
function autoHypenPhone(str){
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	
	// 서울이라는 변수를 선언
  var seoul = 0;

  // 서울 지역번호(02)가 들어가는 경우 1을 삽입
  if(str.substring(0, 2).indexOf('02') == 0) {
      seoul = 1;
  }
  
	if( str.length < (4 - seoul)){
		return str;
	}else if(str.length < 7- seoul){
		tmp += str.substr(0, 3- seoul);
		tmp += '-';
		tmp += str.substr(3- seoul);
		return tmp;
	}else if(str.length < 11- seoul){
		tmp += str.substr(0, 3- seoul);
		tmp += '-';
		tmp += str.substr(3- seoul, 3);
		tmp += '-';
		tmp += str.substr(6- seoul);
		return tmp;
	}else{
		tmp += str.substr(0, 3- seoul);
		tmp += '-';
		tmp += str.substr(3- seoul, 4);
		tmp += '-';
		tmp += str.substr(7- seoul);
		return tmp;
	}
	return str;
}//autoHypenPhone()

String.prototype.DecodeXMLEscapeChars = function () {
	var OutPut = this;
    if ($.trim(OutPut) != "") {
        OutPut = replaceAll(OutPut, "&amp;", "&");
        OutPut = replaceAll(OutPut, "&lt;", '<');
        OutPut = replaceAll(OutPut, "&gt;", '>');
        OutPut = replaceAll(OutPut, "&quot;", '"');
        OutPut = replaceAll(OutPut, "&#39;", "'");	
        OutPut = replaceAll(OutPut, "$1\\\\$2", "\\");  //replaces odd backslash(\\) with even.
    }
    else {
        OutPut = "";
    }
    return OutPut;
};
function replaceAll(str, searchStr, replaceStr) {
	return str.split(searchStr).join(replaceStr);
}

/***	파일 체크		***/
function fileCheck(upFile, type){
    var ext = upFile.val().split('.').pop().toLowerCase();
    var size = upFile[0].files[0].size;
    var check = false;
    var message = '파일을 확인해주세요.';
    if(upFile.val() != '' && size > 0){
    	var checkType = ['doc','docx','xls','xlsx','hwp', 'txt'];
    	var maxSize = 1024 * 1024 * 10; //10MB
    	message = '문서 파일이 아닙니다.(doc, docx, xls, xlsx, hwp, txt)';
    	if(type == 'image'){
    		checkType = ['gif','png','jpg','jpeg'];
    		message = '이미지 파일이 아닙니다.(gif, png, jpg, jpeg)';
    	}//
    	if($.inArray(ext, checkType) > -1) check = true;
    	if(size > maxSize) {
    		check=false
    		message = '파일은 10MB이하만 업로드가 가능합니다.';
    	}//
    }//
    
    if(!check){
    	commonAlert(message);
		upFile.val("");
    }//
    
    return check;
}//