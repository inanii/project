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
			$(".loginBtn").click(function() {
				if($.trim($("#userId").val()) == ""){
					alert("아이디를 확인하세요.");
					$("#userId").focus();
					return;
				}
				if($.trim($("#userPw").val()) == ""){
					alert("비밀번호를 확인하세요.");
					$("#userPw").focus();
					return;
				}
				$.post(
						"/mng/login"
						,{
							userId:$("#userId").val()
							,userPw:$("#userPw").val()
						}
						,function(data,status){
							if(data.result){
								alert("로그인 되었습니다.");
								location.href= data.returnURL;
							} else {
								alert(data.message);
							}
						}
				);//post
			});//loginBtn
			
			$(".findIdBtn").click(function() {
				location.href="/mng/company/findidform";
			});//findIdBtn
			
			$(".findPwdBtn").click(function() {
				location.href="/mng/company/findpwdform";
			});
			
			$(".joinBtn").click(function() {
				location.href="/mng/company/join";
			});
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
	   	<div class="container">
	   		<div class="large-title text-center align-center">
	   			 <a href="/mng/main"><img src="/corlate/images/portfolio/logosmall.png" alt="logosmall"></a>
	   		</div>
	   		
	   		<div class="row text-center">
	    		<div class="form-group col-md-4 col-md-offset-4">
	     			<label for="userId">아이디</label>
	     			<br>
	     			<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
	     			<br>
	     			<label for="userPw">비밀번호</label>
	     			<br>
	     			<input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호">
	    		</div>
		    </div>
		    <br><br>
	    	<div class="row">
	    		<div class="form-group col-md-4 col-md-offset-4">
	    			<button type="submit" name="loginBtn" class="form-control btn-info loginBtn">Login</button>
	    		</div>
	    	</div>
	    	<div class="row">
	    		<div class="form-group col-md-2 col-md-offset-4">
	    			<button type="submit" name="findIdBtn" class="form-control btn-danger findIdBtn">아이디 찾기</button>
	    		</div>
	    		<div class="form-group col-md-2">
	    			<button type="submit" name="findPwdBtn" class="form-control btn-danger findPwdBtn">비밀번호 찾기</button>
	    		</div>
	    	</div>
	    	<div class="row">
	    		<div class="form-group col-md-4 col-md-offset-4">
	    			<button type="submit" name="joinBtn" class="form-control btn-success joinBtn">회원가입</button>
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
