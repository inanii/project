<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
			uri="http://java.sun.com/jsp/jstl/core" %>
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
    	$(function(){
    		$("#companyInfo").click(function() {
				location.href="/mng/company/detail?companyNo=${param.company_no}";
			});
    	
			$("#companyPromotion").click(function() {
				location.href="/mng/company/promotion?companyNo=${param.company_no}";
			});
			
			$("#companyReview").click(function() {
				location.href="/mng/company/review?company_no=${param.company_no}";
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
    			<h2>사업장 정보</h2>
    			<br>
    			<h1>리뷰 관리</h1>
    		</div>
    		<div class="row">
   				<div class="form-group col-md-2 col-md-offset-3" >
   					<button type="button" class="form-control btn-primary" id="companyInfo">사업장 정보</button>
   				</div>
   				<div class="form-group col-md-2">
   					<button type="button" class="form-control btn-primary" id="companyPromotion">프로모션</button>
   				</div>
   				<div class="form-group col-md-2">
   					<button type="button" class="form-control btn-primary" id="companyReview">리뷰</button>
   				</div>
   			</div>
   			<br><br>
   			
	    	<c:forEach items="${reviewList}" var="vo" varStatus="status">
		    	<div class="row">
		    		<div class="form-group col-md-6 col-md-offset-3" style="border-bottom: 1px solid lightgray">
			    			<c:if test="${vo.score!=null}">
			    				<c:choose>
				    				<c:when test="${vo.score==1}">
				    					<img src="/corlate/images/portfolio/sadimo.png">
				    					<h1>${vo.contents}</h1>
		    							<h3>${vo.member_id}</h3>
				    					<p>★</p>
				    				</c:when>
				    				<c:when test="${vo.score==2}">
				    					<img src="/corlate/images/portfolio/sadimo.png">
				    					<h1>${vo.contents}</h1>
		    							<h3>${vo.member_id}</h3>
				    					<p>★★</p>
				    				</c:when>
				    				<c:when test="${vo.score==3}">
				    					<img src="/corlate/images/portfolio/smileimo.png">
				    					<h1>${vo.contents}</h1>
		    							<h3>${vo.member_id}</h3>
				    					<p>★★★</p>
				    				</c:when>
				    				<c:when test="${vo.score==4}">
				    					<img src="/corlate/images/portfolio/smileimo.png">
				    					<h1>${vo.contents}</h1>
		    							<h3>${vo.member_id}</h3>
				    					<p>★★★★</p>
				    				</c:when>
				    				<c:when test="${vo.score==5}">
				    					<img src="/corlate/images/portfolio/smileimo.png">
				    					<h1>${vo.contents}</h1>
		    							<h3>${vo.member_id}</h3>
				    					<p>★★★★★</p>
				    				</c:when>
				    				<c:otherwise>
				    				</c:otherwise>
			    				</c:choose>
			    			</c:if>
		    			<p style="text-align: right;">${vo.regist_date}</p>
		    		</div>
		    	</div>
	    	</c:forEach>
   		</div>
			
   			<div class="themeum-pagination">
				<ul class="page-numbers">
				<c:if test="${page.prevState}">
					<li><a class="prev page-numbers" href="/mng/company/qnalist?memberNo=${param.memberNo}&currentPage=${page.currentPage - 1}"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a></li>
				</c:if>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" step="1" var="i">
					<c:choose>
						<c:when test="${page.currentPage eq i}">
							<li><span aria-current="page" class="page-numbers current">${i}</span></li>
						</c:when>
						<c:otherwise>
							<li><a class="page-numbers" href="/mng/company/qnalist?memberNo=${param.memberNo}&currentPage=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page.nextState}">
					<li><a class="next page-numbers" href="/mng/company/qnalist?memberNo=${param.memberNo}&currentPage=${page.currentPage + 1}"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></li>
				</c:if>
				</ul>
			</div>
			
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
