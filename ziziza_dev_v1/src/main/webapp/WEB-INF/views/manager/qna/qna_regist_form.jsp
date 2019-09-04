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
    <script type="text/javascript">

    $(function() {
    		
    		$(".registBtn").click(function() {
    			
				if($("#qstContents").val() == ""){
					alert("내용을 입력하세요.");
					$("#qstContents").focus();
					return;
				}
					$.post("/mng/company/qnaInsert"
						,{										
							qstTitle:$("#qstTitle").val()			//제목
							,qstContents:$("#qstContents").val()	//내용
							,alarmType:$("select[id='alarmType']").val()
							,memberNo:$("#hidNo").val()
						}//data
						,function(data,status){
							if(status == "success"){
									if(data > 0){
										alert("저장 되었습니다.");
 										location.href="/mng/company/qnalist?memberNo=${param.memberNo}";
									} else {
										alert("잠시 후에 다시 시도해 주세요.");
									}
							} else {
								alert("admin : 02-5555-7777");
							}
						}//function
					);//post
			});//registBtn
		
			$(".listBtn").click(function() {
				location.href="/mng/company/qnalist?memberNo=${param.memberNo}";
			});//listBtn
		});
    </script>
</head>
<!--/head-->

<body>
<input type="hidden" id="hidNo" value="${param.memberNo}" />
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
    			<h1>1:1 문의</h1>
    		</div>
	       	 	<div class="row">
		    		<div class="form-group col-md-4 col-md-offset-4">
		     			<label for="qstTitle">제목</label>
 		     			<input type="text" id="qstTitle" class="form-control" name="qstTitle">
		    		</div>
		  		</div>
<!-- 		  		<div class="row"> -->
<!-- 		  			<div class="form-group col-md-2 col-md-offset-4"> -->
<!-- 		  				<label for="alarmType">답변알림</label> -->
<!-- 		     				<select id="alarmType" name="alarmType" class="form-control"> -->
<!-- 		     					<option value="S">SMS</option> -->
<!-- 		     					<option value="E">EMAIL</option> -->
<!-- 		     				</select> -->
<!-- 		    		</div> -->
<!-- 		    	</div> -->
		    	<div class="row">
		    		<div class="form-group col-md-4 col-md-offset-4">
		     			<label for="qstContents">내용</label>
		     			<textarea id="qstContents" required="required" class="form-control" name="qstContents" rows="3" style="white-space:pre;"></textarea>
		    		</div>
		    	</div>
		  		<div class="row">	
		  			<div class="form-group col-md-1 col-md-offset-6">
		     			<button type="button" class="form-control btn-warning listBtn" id="inputPassword4">취소</button>
		  			</div>
		  			<div class="form-group col-md-1">
		     			<button type="submit" class="form-control btn-info registBtn">확인</button>
		  			</div>
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
