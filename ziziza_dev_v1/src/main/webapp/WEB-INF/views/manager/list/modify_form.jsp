<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>찜질방의 모든 정보 지지자</title>

    <!-- core CSS -->
    <link href="/corlate/css/bootstrap.min.css" rel="stylesheet">
    <link href="/corlate/css/font-awesome.min.css" rel="stylesheet">
    <link href="/corlate/css/animate.min.css" rel="stylesheet">
    <link href="/corlate/css/prettyPhoto.css" rel="stylesheet">
    <link href="/corlate/css/owl.carousel.min.css" rel="stylesheet">
    <link href="/corlate/css/icomoon.css" rel="stylesheet">
    <link href="/corlate/css/main.css" rel="stylesheet">
    <link href="/corlate/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    <script src="/corlate/js/jquery.js"></script>
    <script src="/corlate/js/bootstrap.min.js"></script>
    <script src="/corlate/js/jquery.prettyPhoto.js"></script>
    <script src="/corlate/js/owl.carousel.min.js"></script>
    <script src="/corlate/js/jquery.isotope.min.js"></script>
    <script src="/corlate/js/main.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="/jquery/address.js"></script>
    <script type="text/javascript">
    	$(function() {
			$(".modifyBtn").click(function(e) {
				e.preventDefault();
				var modify_yn = false;
				modify_yn = confirm("수정하시겠습니까?");
				if(modify_yn == false){
					return;
				}
				var formData = new FormData($(".form")[0]);
				$.ajax({
		            type: "POST",
		            enctype: 'multipart/form-data',
		            url: "/mng/company/update",
		            data: formData,
		            processData: false,
		            contentType: false,
		            success: function (data) {
						if(data > 0){
							alert("저장 되었습니다.");
							location.href="/mng/company/list?mngNo=${loginUser.mngNo}";
						} else {
							alert("잠시 후에 다시 시도해 주세요.");
						}
		            },
		            error: function (e) {
		            	alert("admin : 02-5555-7777");
		            }
		        });
			});//modifyBtn
			$(".fileDel").on('click', function(e){
				e.preventDefault();
				fileDelete($(this));
			});
			
			$('.chumbu').on('change', function(e){		//첨부파일 추가
				e.preventDefault();
				var file = $(this);
				var fileName = file[0].files[0].name;
				var fileSize = file[0].files[0].size;
				var fileType = file.attr('name');
				if(fileName != '' && fileSize > 0){		
					var formData = new FormData();
					formData.append("file", file[0].files[0]);
					formData.append("fileType", fileType);
					formData.append("menuNo", $("input[name='companyNo']").val());
					formData.append("menuType", "COMPANY");
					file.val('');
					$.ajax({
			            type: "POST",
			            dataType : 'json',
			            url: "/file/upload",
			            data: formData,
			            processData: false,
			            contentType: false,
			            success: function (data) {
							if(data){
								var list = file.next();
								var p = $("<p>");
								p.append('<img src="/file/imageView?no=' + data.fileNo + '"/>');
	     						$('<button type="button" class="form-control btn-success fileDel">').data('no', data.fileNo).text("삭제").on('click', function(e){
	     							e.preventDefault();
	     							fileDelete($(this));	     							
	     						}).appendTo(p);
	     						list.append(p);
	     						if(fileType == 'banner'){
	     							$('#mainChumbu').hide();
	     						}
							} else {
								alert("잠시 후에 다시 시도해 주세요.");
							}
			            },
			            error: function (e) {
			            	alert("admin : 02-5555-7777");
			            }
			        });
					
				}//
			});
			
			if($('.chumbuimage.banner p').length > 0){
				$('#mainChumbu').hide();
			}
			
			$(".listBtn").click(function(e) {
				e.preventDefault();
				location.href="/mng/company/list?mngNo=${loginUser.mngNo}";
			});
			
			$(".pAdd").on('click', function(e){
				e.preventDefault();
				var orign = $(".plant");
				if(orign.find('.plantName').val() == ""){
					alert("입력을 확인하세요.");
					return;
				}
				var plant = orign.clone().removeClass('plant');
				$(".plant input").val('');
				plantInsert(plant);
			});
			
			$(".cAdd").on('click', function(e){
				e.preventDefault();
				var oringCharge = $(".charge");
				if(oringCharge.find('.subject').val() == ""){
					alert("대상을 확인하세요.");
					return;
				}
				if(oringCharge.find('.price').val() == ""){
					alert("요금을 확인하세요.");
					return;
				}
				var selectTime = $(".charge .timeKind").val();
				var charge = oringCharge.clone().removeClass('charge');
				$(".charge input").val('');
				$(".charge select").val('주간');
				charge.children('.timeKind').val(selectTime);
				charge.children('.subject');
				charge.children('.price');
				charge.children('.orderSeq');
				chargeInsert(charge);
				
			});
			
			$(".cUpd").on('click', function(e){
				e.preventDefault();
				chargeUpdate($(this));
			});
			$(".cDel").on('click', function(e){
				e.preventDefault();
				chargeDelete($(this));
			});
			
			$(".pUpd").on('click', function(e){
				e.preventDefault();
				plantUpdate($(this));
			});
			$(".pDel").on('click', function(e){
				e.preventDefault();
				plantDelete($(this));
			});
		});
    	
    	function chargeInsert(charge){
    		var formData = new FormData();
    		formData.append("companyNo", $("input[name='companyNo']").val());
    		formData.append("timeKind", charge.find('.timeKind').val());
    		formData.append("subject", charge.find('.subject').val());
    		formData.append("price", charge.find('.price').val());
    		formData.append("orderSeq", charge.find('.orderSeq').val());
    		$.ajax({
	            type: "POST",
	            dataType : 'json',
	            url: "/mng/company/chargeInsert",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function (data) {
					if(data > 0){
						alert("저장 되었습니다.");
						$('<button type="button" class="form-control btn-success" data-no="' + data + '">').text('수정').on("click", function(e){
							e.preventDefault();
							chargeUpdate($(this));
						}).appendTo(charge);
						$('<button type="button" class="form-control btn-success" data-no="' + data + '">').text('삭제').on("click", function(e){
							e.preventDefault();
							chargeDelete($(this));
						}).appendTo(charge);
						charge.appendTo(".chargeList");
					} else {
						alert("잠시 후에 다시 시도해 주세요.");
					}
	            },
	            error: function (e) {
	            	alert("admin : 02-5555-7777");
	            }
	        });
    		
    	}
    	
    	function chargeUpdate(btn){
    		var div = btn.parent();
    		if(div.find('.subject').val() == ""){
				alert("대상을 확인하세요.");
				return;
			}
			if(div.find('.price').val() == ""){
				alert("요금을 확인하세요.");
				return;
			}
			if(div.find('.orderSeq').val() == ""){
				alert("순서를 확인하세요.");
				return;
			}
    		var formData = new FormData();
    		formData.append("chargeNo", btn.data('no'));
    		formData.append("timeKind", div.find('.timeKind').val());
    		formData.append("subject", div.find('.subject').val());
    		formData.append("price", div.find('.price').val());
    		formData.append("orderSeq", div.find('.orderSeq').val());
    		$.ajax({
	            type: "POST",
	            dataType : 'json',
	            url: "/mng/company/chargeUpdate",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function (data) {
					if(data > 0){
						alert("저장 되었습니다.");
					} else {
						alert("잠시 후에 다시 시도해 주세요.");
					}
	            },
	            error: function (e) {
	            	alert("admin : 02-5555-7777");
	            }
	        });
    	}
    	
		function chargeDelete(btn){
			var modify_yn = false;
			modify_yn = confirm("삭제하시겠습니까?");
			if(modify_yn == false){
				return;
			}
			var formData = new FormData();
    		formData.append("chargeNo", btn.data('no'));
    		
    		$.ajax({
	            type: "POST",
	            dataType : 'json',
	            url: "/mng/company/chargeDelete",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function (data) {
					if(data > 0){
						alert("삭제 되었습니다.");
						btn.parent().remove();
					} else {
						alert("잠시 후에 다시 시도해 주세요.");
					}
	            },
	            error: function (e) {
	            	alert("admin : 02-5555-7777");
	            }
	        });
    	}
		
		function plantInsert(plant){
    		var formData = new FormData();
    		formData.append("companyNo", $("input[name='companyNo']").val());
    		formData.append("plantName", plant.find('.plantName').val());
    		$.ajax({
	            type: "POST",
	            dataType : 'json',
	            url: "/mng/company/plantInsert",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function (data) {
					if(data > 0){
						alert("저장 되었습니다.");
						$('<button type="button" class="form-control btn-success" data-no="' + data + '">').text('수정').on("click", function(e){
							e.preventDefault();
							plantUpdate($(this));
						}).appendTo(plant);
						$('<button type="button" class="form-control btn-success" data-no="' + data + '">').text('삭제').on("click", function(e){
							e.preventDefault();
							plantDelete($(this));
						}).appendTo(plant);
						plant.appendTo(".plantList");
					} else {
						alert("잠시 후에 다시 시도해 주세요.");
					}
	            },
	            error: function (e) {
	            	alert("admin : 02-5555-7777");
	            }
	        });
    	}
		
		function plantUpdate(btn){
    		var div = btn.parent();
    		if(div.find('.plantName').val() == ""){
				alert("대상을 확인하세요.");
				return;
			}
    		var formData = new FormData();
    		formData.append("plantNo", btn.data('no'));
    		formData.append("plantName", div.find('.plantName').val());
    		$.ajax({
	            type: "POST",
	            dataType : 'json',
	            url: "/mng/company/plantUpdate",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function (data) {
					if(data > 0){
						alert("저장 되었습니다.");
					} else {
						alert("잠시 후에 다시 시도해 주세요.");
					}
	            },
	            error: function (e) {
	            	alert("admin : 02-5555-7777");
	            }
	        });
    	}
		
		function plantDelete(btn){
			var modify_yn = false;
			modify_yn = confirm("삭제하시겠습니까?");
			if(modify_yn == false){
				return;
			}
			var formData = new FormData();
    		formData.append("plantNo", btn.data('no'));
    		
    		$.ajax({
	            type: "POST",
	            dataType : 'json',
	            url: "/mng/company/plantDelete",
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function (data) {
					if(data > 0){
						alert("삭제 되었습니다.");
						btn.parent().remove();
					} else {
						alert("잠시 후에 다시 시도해 주세요.");
					}
	            },
	            error: function (e) {
	            	alert("admin : 02-5555-7777");
	            }
	        });
    	}
    </script>
</head>
<!--/head-->

<body>
    <header id="header">
        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                     <a class="navbar-brand" href="/mng/main"><img src="/corlate/images/mnglogo.png" alt="logo"></a>
                </div>
                
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                         <c:choose>
                        	<c:when test="${loginUser != null && loginUser.roleName eq 'MANAGER'}">
                        		<li><a href="/mng/company/info?memberNo=${loginUser.userNo}">내정보</a></li>
                        		<li><a href="/mng/company/list?mngNo=${loginUser.mngNo}">사업장관리</a></li>
                        		<li><a href="/mng/company/qnalist?memberNo=${loginUser.userNo}">1:1문의</a></li>
                        		<li><a href="/mng/logout">로그아웃</a></li>
                        	</c:when>
                        	<c:otherwise>
                       			<li><a href="/mng/company/join">회원가입</a></li>
		                        <li><a href="/mng/login">로그인</a></li>
                        	</c:otherwise>
                        </c:choose> 
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
    </header><!--/header-->
    
    <section id="contact-page">
    	<div class="container">
    		<div class="large-title text-center">
    			<h2>${detailVO.companyName}</h2>
    			<br>
    			<h1>수정페이지</h1>
    		</div>
    		<form class="form" method="post" enctype="multipart/form-data">
    			<input type="hidden" name="companyNo" value="${detailVO.companyNo }"/>
    			<br>
	       	 	<div class="row">
		    		<div class="form-group col-md-4 col-md-offset-2">
		     			<label for="companyName">상호명</label>
		     			<input type="text" class="form-control" id="companyName" name="companyName" value="${detailVO.companyName}">
		    		</div>
		    		<div class="form-group col-md-2">
		    			<label for=companyKind>종류</label>
 		     			<select id="companyKind" name="companyKind" class="form-control">
 		     				<option value="찜질방" <c:if test="${fn:contains(vo.companyKind, '찜질방')}">selected</c:if>>찜질방</option>
 		     				<option value="사우나" <c:if test="${fn:contains(vo.companyKind, '사우나')}">selected</c:if>>사우나</option>
 		     				<option value="목욕탕" <c:if test="${fn:contains(vo.companyKind, '목욕탕')}">selected</c:if>>목욕탕</option>
 		     			</select>
		    		</div>
		    		<div class="form-group col-md-2" >
		     		 	<label for="companyTel">전화번호</label>
 		      			<input type="tel" class="form-control" id="companyTel" name="companyTel" value="${detailVO.companyTel}">
		    		</div>	
		  		</div>
		  		<div class="row">
		    		<div class="form-group col-md-4 col-md-offset-2">
		    			<label for="openTime">open시간</label>
		     			<input type="text" class="form-control" id="openTime" name="openTime" value="${detailVO.openTime}">
		    		</div>
		    		<div class="form-group col-md-4">
			     	 	<label for="closeTime">close시간</label>
			      		<input type="text" class="form-control" id="closeTime" name="closeTime" value="${detailVO.closeTime}">
		    		</div>	
		    	</div>
		    	<div class="row">	
		    		<div class="form-group col-md-2 col-md-offset-2">
		     			<label for="timeKind">대상</label>
		    		</div>
		    		<div class="form-group col-md-2">
		     			<label for="subject">요금</label>
		    		</div>
		    		<div class="form-group col-md-3">
		     			<label for="price">순서</label>
		    		</div>
		    	</div>
		    	<div class="row chargeList form-group">
		    		<c:forEach items="${chargeList }" var="charge">
		    		<div class="form-group col-md-6 col-md-offset-2 ">
		    			<select class="timeKind form-control">
		     				<option value="주간" <c:if test="${charge.timeKind eq '주간'}">selected</c:if>>주간</option>
		     				<option value="야간" <c:if test="${charge.timeKind eq '야간'}">selected</c:if>>야간</option>
 		     			</select>
 		     			<input type="text" class="subject" class="form-control" value="${charge.subject}"/>
 		     			<input type="text" class="price" class="form-control"  value="${charge.price}"/>
 		     			<input type="text" class="orderSeq" class="form-control"  value="${charge.orderSeq}"/>
 		     			<button type="button" class="form-control btn-success cUpd" data-no="${charge.chargeNo }">수정</button>
 		     			<button type="button" class="form-control btn-success cDel" data-no="${charge.chargeNo }">삭제</button>
		 			</div>
		 			</c:forEach>
		  		</div>
		    	<div class="row">
		    		<div class="form-group col-md-6 col-md-offset-2 charge">
		     			<select class="timeKind form-control">
		     				<option value="주간">주간</option>
		     				<option value="야간">야간</option>
 		     			</select>
 		     			<input type="text" class="subject" class="form-control" placeholder="대상 입력"/>
 		     			<input type="text" class="price" class="form-control" placeholder="요금 입력"/>
 		     			<input type="text" class="orderSeq" class="form-control" placeholder="순서"/>
		    		</div>
		    		<div class="form-group col-md-1" >
 		      			<input type="button" class="form-control btn-success cAdd" value="추가"/>
		    		</div>		
		    	</div>
		    	<div class="row addressBox">
					<div class="form-group col-md-8 col-md-offset-2">
						<label for="zipCode">우편번호</label>
						<input type="text" name="zoneCode" id="zoneCode" class="form-control zoneCode" readonly value="${detailVO.zoneCode}"/>
						<button type="button" class="openAddr form-control btn-success">우편번호 검색</button>
					</div>
								
				</div>
		  		<div class="row addressBox">
		    		<div class="form-group col-md-8 col-md-offset-2">
		    			<label for="address">주소</label>
		    			<input type="text" id="address" class="form-control address" name="address" readonly value="${detailVO.address}"/>
		    			<input type="text" name="detailAddress" id="detailAddress" class="form-control detailAddress" maxlength="100" value="${detailVO.detailAddress}"/>
		    		</div>	
		    	</div>
		    	<div class="row">	
		    		<div class="form-group col-md-8 col-md-offset-2">
		     			<label for="contents">소개</label>
		     			<textarea id="contents" class="form-control" name="contents">${detailVO.contents}</textarea>
		    		</div>
		    	</div>
		    	<div class="row">	
		    		<div class="form-group col-md-8 col-md-offset-2">
		     			<label for="plantName">편의시설</label>
		    		</div>
		    	</div>
		    	<div class="row plantList">
		    		<c:forEach items="${plantList}" var="plant">
		    			<div class="form-group col-md-2 col-md-offset-2 plant">
			    			<input type="text" class="form-control plantName"  value="${plant.plantName}"/>
			    			<button type="button" class="form-control btn-success pUpd" data-no="${plant.plantNo }">수정</button>
 		     				<button type="button" class="form-control btn-success pDel" data-no="${plant.plantNo }">삭제</button>
				     	</div>
		    		</c:forEach>
		    	</div>
		    	<div class="row">
		    		<div class="form-group col-md-2 col-md-offset-2 plant">
		    			<input type="text" class="form-control plantName" />
			     	</div>
			     	<div class="form-group col-md-1">
			     		<input type="button" id="plantAdd" class="form-control btn-success pAdd" value="추가"/>
			     	</div>
		    	</div>
		    	<div class="row">
		    		<div class="form-group col-md-2 col-md-offset-2">
		     			<label>메인이미지</label>
		     			<input type="file" id="mainChumbu" class="chumbu" name="banner"/>
		     			<div class="chumbuimage banner">
		     				<c:forEach items="${files}" var="file">
		     					<c:if test="${file.fileType eq 'BANNER'}">
		     					<p><img src="/file/imageView?no=${file.fileNo}"/><button type="button" class="form-control btn-success fileDel" data-no="${file.fileNo}">삭제</button></p>
		     					</c:if>
		     				</c:forEach>
		     			</div>
		     		</div>
	     		</div>
		    	<div class="row">
		    		<div class="form-group col-md-2 col-md-offset-2">
		     			<label>이미지리스트</label>
		     			<input type="file" id="imgChumbu" class="chumbu" name="slide"/>
		     			<div class="chumbuimage">
		     				<c:forEach items="${files}" var="file">
		     					<c:if test="${file.fileType eq 'SLIDE'}">
		     					<p>
		     						<img src="/file/imageView?no=${file.fileNo}"/>
		     						<button type="button" class="form-control btn-success fileDel" data-no="${file.fileNo}">삭제</button>
		     					</p>
		     					</c:if>
		     				</c:forEach>
		     			</div>
		    		</div>
		  		</div>
		  		<div class="row">
		  			<div class="form-group col-md-1 col-md-offset-8">
		     			<button type="submit" class="form-control btn-warning listBtn" id="inputPassword4">목록</button>
		  			</div>
		  			<div class="form-group col-md-1">
		     			<button type="submit" class="form-control btn-info modifyBtn" id="inputPassword4">확인</button>
		  			</div>
		  		</div>
		  	</form>
		</div><!-- container -->
    </section><!--/#contact-page-->

    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2013 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates">ShapeBootstrap</a>. All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Faq</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->
</body>

</html>
