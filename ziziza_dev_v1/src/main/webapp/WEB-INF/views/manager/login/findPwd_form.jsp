<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	$(function() {
			$("#phoneNumberBtn").click(function() {
				$.post(
						"/mng/company/findpwdphone"
						,{
							memberName:$("#memberName").val()
							,memberId:$("#memberId").val()
							,phone:$("#phone").val()
						}
						,function(data,status){
							if(status == "success"){
								if(data == ""){
									alert("입력하신 회원 정보가 없습니다.");
								} else {
									$("#memberName").val("");
									$("#memberId").val("");
									$("#phone").val("");
									$("#email").val("");
									alert("회원님의 비밀번호는\n"+data+"\n입니다.");
								}
							} else {
								alert("시스템 관리자에게 문의 바랍니다.");
							}
						}
				);//post
			});//phoneNumberBtn
			$("#emailBtn").click(function() {
				$.post(
						"/mng/company/findpwdemail"
						,{
							memberName:$("#memberName").val()
							,memberId:$("#memberId").val()
							,email:$("#email").val()
						}
						,function(data,status){
							if(status == "success"){
								if(data == ""){
									alert("입력하신 회원 정보가 없습니다.");
								} else {
									$("#memberName").val("");
									$("#memberId").val("");
									$("#phone").val("");
									$("#email").val("");
									alert("회원님의 비밀번호는\n"+data+"\n입니다.");
								}
							} else {
								alert("시스템 관리자에게 문의 바랍니다.");
							}
						}
				);//post
			});//emailBtn
			
			$("#mainBtn").click(function() {
				location.href="/mng/main";
			});//mainBtn
			
			$("#loginBtn").click(function() {
				location.href="/mng/login";
			});//loginBtn
		});
    </script>
</head>
<!--/head-->

<body class="homepage">

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
                        		<li><a href="/mng/logout">로그아웃</a></li>
                        	</c:when>
                        	<c:otherwise>
                       			<li><a href="/mng/company/join">회원가입</a></li>
		                        <li><a href="/mng/login">로그인</a></li>
                        	</c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
            <!--/.container-->
        </nav>
        <!--/nav-->

    </header>
    <!--/header-->
    
    
    
    <section id="contact-page">
    	<div class="container text-center" >
	   		<div class="large-title text-center">
	   			 <h1>비밀번호 찾기</h1>	   			 
	   		</div>
	   	</div>
	   	<div class="container">
	   		<div class="row">
	    		<div class="form-group col-md-2 col-md-offset-4">
	     			<label for="memberName">이름</label>
	     			<input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름 입력">
	    		</div>
	    		<div class="form-group col-md-2">
	     			<label for="memberId">아이디</label>
	     			<input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디 입력">
	    		</div>
		    </div>
		    <br><br>
		    <label for="phone" class="form-group col-md-4 col-md-offset-4">내 정보에 등록된 휴대폰으로 찾기</label>
	    	<div class="row">
	    		<div class="form-group col-md-4 col-md-offset-4">
	    			<input type="text" class="form-control" id="phone" name="phone" placeholder="번호 입력">
	    		</div>
	    		<div class="form-group col-md-1">
	     			<button id="phoneNumberBtn" class="form-control btn-info">찾기</button>
	    		</div>
	    	</div>
	    	<label for="email" class="form-group col-md-4 col-md-offset-4">내 정보에 등록된 이메일로 찾기</label>
	    	<div class="row">
	    		<div class="form-group col-md-4 col-md-offset-4">
	    			<input type="text" class="form-control" id="email" name="email" placeholder="이메일 입력">
	    		</div>
	    		<div class="form-group col-md-1">
	     			<button id="emailBtn" class="form-control btn-info">찾기</button>
	    		</div>
	    	</div>
	    	<div class="row">
	    		<div class="form-group col-md-2 col-md-offset-4">
	    			<button id="mainBtn" class="form-control btn-danger">메인화면으로 가기</button>
	    		</div>
	    		<div class="form-group col-md-2">
	    			<button id="loginBtn" class="form-control btn-success">로그인하러 가기</button>
	    		</div>
	    	</div>
	    </div>
    </section>
    
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
