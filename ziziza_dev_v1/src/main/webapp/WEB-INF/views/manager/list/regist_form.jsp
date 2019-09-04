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
		var idx = 0, pidx= 0;
    	$(function() {
			$(".registBtn").click(function(e) {
				e.preventDefault();
				if($.trim($("#companyName").val()) == ""){
					alert("상호명을 입력하세요.");
					return;
				}
				if($.trim($("#companyTel").val()) == ""){
					alert("전화번호를 확인하세요.");
					return;
				}
				if($.trim($("#openTime").val()) == ""){
					alert("오픈 시간을 확인하세요.");
					return;
				}
				if($.trim($("#closeTime").val()) == ""){
					alert("마감 시간을 확인하세요.");
					return;
				}
				if($.trim($("#address").val()) == ""){
					alert("소재지를 확인하세요.");
					return;
				}
				if($.trim($("#contents").val()) == ""){
					alert("사업장 소개를 확인하세요.");
					return;
				}
				var formData = new FormData($(".form")[0]);

				$.ajax({
		            type: "POST",
		            enctype: 'multipart/form-data',
		            url: "/mng/company/insert",
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
			});//registBtn
			
			$(".listBtn").click(function() {
				location.href="/mng/company/list?mngNo=${loginUser.mngNo}";
			});//listBtn
			
			$(".pAdd").on('click', function(e){
				e.preventDefault();
				var orign = $(".plant");
				if(orign.find('.plantName').val() == ""){
					alert("입력을 확인하세요.");
					return;
				}
				var plant = orign.clone().removeClass('plant');
				$(".plant input").val('');
				plant.children('.plantName').attr('name', 'plantList[' + pidx + '].plantName');
				$('<button type="button" class="form-control btn-success">').text('삭제').on("click", function(e){
					e.preventDefault();
					$(this).parent().remove();
				}).appendTo(plant);
				plant.appendTo(".plantList");
				pidx++;
			});
			
			$(".cAdd").on('click', function(e){
				e.preventDefault();
				var orign = $(".charge");
				if(orign.find('.subject').val() == ""){
					alert("대상을 확인하세요.");
					return;
				}
				if(orign.find('.price').val() == ""){
					alert("요금을 확인하세요.");
					return;
				}
				if(orign.find('.orderSeq').val() == ""){
					alert("순서를 확인하세요.");
					return;
				}
				var selectTime = $(".charge .timeKind").val();
				var charge = orign.clone().removeClass('charge');
				$(".charge input").val('');
				$(".charge select").val('주간');
				charge.children('.timeKind').attr('name', 'chargeList[' + idx + '].timeKind').val(selectTime);
				charge.children('.subject').attr('name', 'chargeList[' + idx + '].subject');
				charge.children('.price').attr('name', 'chargeList[' + idx + '].price');
				charge.children('.orderSeq').attr('name', 'chargeList[' + idx + '].orderSeq');
				$('<button type="button" class="form-control btn-success">').text('삭제').on("click", function(e){
					e.preventDefault();
					$(this).parent().remove();
				}).appendTo(charge);
				charge.appendTo(".chargeList");
				idx++;
			});

		});
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
    			<h1>사업장 등록</h1>
    		</div>
    		<form class="form" method="post" enctype="multipart/form-data">
    			<input type="hidden" name="mngNo" value="${loginUser.mngNo }"/>
	       	 	<div class="row">
		    		<div class="form-group col-md-4 col-md-offset-2">
		     			<label for="companyName">상호명</label>
 		     			<input type="text" id="companyName" class="form-control" name="companyName" placeholder="상호명 입력">
		    		</div>
		    		<div class="form-group col-md-2">
		    			<label for="companyKind">종류</label>
 		     			<select id="companyKind" name="companyKind" class="form-control">
 		     				<option value="찜질방" <c:if test="${fn:contains(vo.companyKind, '찜질방')}">selected</c:if>>찜질방</option>
 		     				<option value="사우나" <c:if test="${fn:contains(vo.companyKind, '사우나')}">selected</c:if>>사우나</option>
 		     				<option value="목욕탕" <c:if test="${fn:contains(vo.companyKind, '목욕탕')}">selected</c:if>>목욕탕</option>
 		     			</select>
		    		</div>
		    		<div class="form-group col-md-2" >
		     		 	<label for="companyTel">전화번호</label>
 		      			<input type="tel" id="companyTel" class="form-control" name="companyTel" placeholder="전화번호 입력">
		    		</div>
		  		</div>
		  		<div class="row">
		    		<div class="form-group col-md-4 col-md-offset-2">
		    			<label for="openTime">open시간</label>
		     			<input type="text" id="openTime" class="form-control" name="openTime" placeholder="ex)00:00">
		    		</div>
		    		<div class="form-group col-md-4">
			     	 	<label for="closeTime">close시간</label>
			      		<input type="text" id="closeTime" class="form-control" name="closeTime"  placeholder="ex)24:00">
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
		    	&nbsp;
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
						<input type="text" name="zoneCode" id="zoneCode" class="form-control zoneCode" readonly/>
						<button type="button" class="openAddr form-control btn-success">우편번호 검색</button>
					</div>
				</div>
		  		<div class="row addressBox">
		    		<div class="form-group col-md-8 col-md-offset-2">
		    			<label for="address">주소</label>
		    			<input type="text" id="address" class="form-control address" name="address" readonly/>
		    			<input type="text" name="detailAddress" id="detailAddress" class="form-control detailAddress" maxlength="100"/>
		    		</div>	
		    	</div>
		    	<div class="row">
		    		<div class="form-group col-md-8 col-md-offset-2">
		     			<label for="contents">소개</label>
		     			<textarea id="contents" required="required" class="form-control" name="contents" rows="3"></textarea>
		    		</div>
		    	</div>
		    	<div class="row">	
		    		<div class="form-group col-md-8 col-md-offset-2">
		     			<label for="plantName">편의시설</label>
		    		</div>
		    	</div>
		    	<div class="row plantList">
		    		&nbsp;
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
			    		<label for="imgChumbu">메인 이미지</label>
						<input type="file" id="imgChumbu" name="banner"/>
					</div>
				</div>
		    	<div class="row">
		    		<div class="form-group col-md-2 col-md-offset-2">
			    		<label for="imgChumbu">이미지 리스트</label>
						<input type="file" id="imgChumbu" name="slide"/>
						<input type="file" id="imgChumbu2" name="slide"/>
						<input type="file" id="imgChumbu2" name="slide"/>
					</div>
				</div>
		  		<div class="row">	
		  			<div class="form-group col-md-1 col-md-offset-8">
		     			<button type="button" class="form-control btn-warning listBtn" id="inputPassword4">취소</button>
		  			</div>
		  			<div class="form-group col-md-1">
		     			<button type="submit" class="form-control btn-info registBtn">확인</button>
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
