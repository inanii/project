<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript">
    	$(function() {
    		$("#promotionBtn").click(function() {
    			if($.trim($("#eventContent").val()) == ""){
					alert("내용을 입력해주세요.");
					return;
				}
    			$.post("/mng/company/promotionreply"
    				,{
    				eventContent:$("#eventContent").val()
    				,companyNo:$("#hidNo").val()
    			}
    				,function(data,status){
    					if(status == "success"){
							if(data == 0) {
								alert("잠시 후, 다시 시도해 주세요.")
							} else {
								$("#eventContent").val("");
								location.reload();
							}
						} else {
							alert("admin : 02-5555-7777");
						}
					}//function
				);//get
			});
    		$(":button[id='promotionDelete']").click(function() {
				var btn = $(this);
				$.get(
						"/mng/company/promotionDelete"
						,{
							cEventNo:btn.val()
						}
						,function(data, status){
							if(status == "success"){
								if(data > 0){
									alert("프로모션 삭제 했습니다.");
									location.reload();
								} else {
									alert("잠시 후 다시 시도해 주세요.");
								}	
							}
						}
					);
			});
    		
    		$("#companyInfo").click(function() {
				location.href="/mng/company/detail?companyNo=${param.companyNo}";
			});
    	
			$("#companyPromotion").click(function() {
				location.href="/mng/company/promotion?companyNo=${param.companyNo}";
			});
			
			$("#companyReview").click(function() {
				location.href="/mng/company/review?company_no=${param.companyNo}";
			});
			
		});
    </script>
</head>
<!--/head-->

<body>
<input type="hidden" id="hidNo" value="${param.companyNo}"/>
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
    			<h2>사업장 정보</h2>
    			<br>
    			<h1>프로모션</h1>
    		</div>
    		
   			<div class="row">
   				<div class="form-group col-md-2 col-md-offset-3">
   					<button type="button" class="form-control btn-primary" id="companyInfo">사업장 정보</button>
   				</div>
   				<div class="form-group col-md-2">
   					<button type="button" class="form-control btn-primary" id="companyPromotion">프로모션</button>
   				</div>
   				<div class="form-group col-md-2">
   					<button type="button" class="form-control btn-primary" id="companyReview">리뷰</button>
   				</div>
   			</div>
   			<br>
   			<label for="eventContent" class="form-group col-md-4 col-md-offset-3">프로모션 등록</label>
   			<div class="row">
   				<div class="form-group col-md-6 col-md-offset-3">
   				<input type="text" class="form-control" name="eventContent" id="eventContent"/>
   				</div>
   				<div class="form-group col-md-1">
   				<button type="submit" class="form-control btn-info" id="promotionBtn">등록</button>
   				</div>
   			</div>
   			<br><br>
   			<div class="row">
   				<div class="form-group col-md-6 col-md-offset-3">
		   			<table class="table">
		   				<thead class="table-head">
							<tr>
								<th>프로모션 목록</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
		   				<colgroup>
		   					<col width="70%">
		   					<col width="30%">
						</colgroup>
						<tbody>
							<c:forEach var="vo" items="${list}" varStatus="status">
								<tr>
									<td class="promotionIndex">
										${vo.eventContent}
									</td>
									<td>
										${vo.registDate}
									</td>
									<td>
										<button type="button" class="btn btn-danger" id="promotionDelete" value="${vo.cEventNo}">삭제</button>
									</td>
								</tr>
							</c:forEach>
		   			</table>
   				</div>
   			</div>
   		</div>
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
