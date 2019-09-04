<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>찜질방의 모든 정보 지지자</title>

    <!-- core CSS -->
    <link href="${pageContext.request.contextPath}/resources/corlate/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/corlate/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/corlate/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/corlate/css/prettyPhoto.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/corlate/css/owl.carousel.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/corlate/css/icomoon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/corlate/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/corlate/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/corlate/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/resources/corlate/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/resources/corlate/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/resources/corlate/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/corlate/images/ico/apple-touch-icon-57-precomposed.png">
    <script type="text/javascript">
    $(document).ready(function() {
		$("#login_btn").click(function() {
			if($.trim($("#userId").val())==""){
				alert("아이디를 확인하세요");
				$("#memberId").focus();
				return;
			}
			if($.trim($("#userPw").val())==""){
				alert("아이디를 확인하세요");
				$("#userPw").focus();
				return;
			}
			$.post(
					"/main/login"
					,{
						userId:$("#userId").val()
						,userPw:$("#userPw").val()
					}
					,function(data,status){
						if(status=="success"){
							if(data.result){
								alert("로그인 되었습니다.");
								location.href= data.returnURL;
							} else {
								alert(data.message);
							}
						}else{
							alert("관리자에게 문의해주세요");
						}
					}
				);
		});//click
		
		$(".findId").click(function() {
			location.href="/findid"
		});
		$(".joinform").click(function() {
			location.href="/joinform"
		});
	});//ready
    </script>
</head>
<!--/head-->

<body class="homepage">

    <header id="header">
           <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/main"><img src="/corlate/images/ziziza.png" alt="logo"></a>
                	</div>
                </div>

                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
						<li><a href="/zlzlza">찾기</a></li>
                        <li><a href="/notice/list">공지사항</a></li>
                        <li><a href="/event/list">이벤트</a></li>
                        <li><a href="/board/list">커뮤니티</a></li>
                        <c:if test="${loginUser == null}">
                        <li><a href="/joinform"> 회원가입 </a></li>
                        <li class="active"><a href="/login">로그인</a></li>
                        </c:if>
                        <c:if test="${loginUser != null}">
                        <li><a href="/mypage">마이페이지</a></li>
                        <li><a href="/main/logout">로그아웃</a></li>
                        </c:if>
                        <li><a href="/mng/login">사장님페이지</a></li>
                    </ul>
                </div>
            </div>
            </div>
            <!--/.container-->
        </div>
        <!--/nav-->

    </header>
    <!--/header-->
    
    
    
    <section id="contact-page">
       <div class="container text-center" >
            <div class="large-title text-center">
                <h1>로그인</h1>
            </div>
         </div>
         <div class="container">
            <div class="row text-center">
             <div class="form-group col-md-4" style="width: 30%; float:none; margin:0 auto">
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
             <div class="form-group col-md-4" style="width: 30%; float:none; margin:0 auto">
                <button type="submit" name="login_btn" id="login_btn" class="form-control btn-info">Login</button>
             </div>
          </div>
          <div class="row">
             <div class="form-group col-md-4 offset-md-6" style="width: 30%; float:none; margin:0 auto; text-aling:center">
                <button type="submit" class="form-control btn-danger findId">아이디/비밀번호 찾기</button>
             </div>
          </div>
          <div class="row">
             <div class="form-group col-md-4 offset-md-6" style="width: 30%; float:none; margin:0 auto">
                <button type="submit" name="login-submit" class="form-control btn-success joinform">회원가입</button>
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
    
    <script src="${pageContext.request.contextPath}/resources/corlate/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/corlate/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/corlate/js/jquery.prettyPhoto.js"></script>
    <script src="${pageContext.request.contextPath}/resources/corlate/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/corlate/js/jquery.isotope.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/corlate/js/main.js"></script>
</body>

</html>