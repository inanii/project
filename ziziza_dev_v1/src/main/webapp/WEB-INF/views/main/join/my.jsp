<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home | Corlate</title>

    <!-- core CSS -->
    <link href="/corlate/css/bootstrap.min.css" rel="stylesheet">
    <link href="/corlate/css/font-awesome.min.css" rel="stylesheet">
    <link href="/corlate/css/animate.min.css" rel="stylesheet">
    <link href="/corlate/css/prettyPhoto.css" rel="stylesheet">
    <link href="/corlate/css/owl.carousel.min.css" rel="stylesheet">
    <link href="/corlate/css/icomoon.css" rel="stylesheet">
    <link href="/corlate/css/main.css" rel="stylesheet">
    <link href="/corlate/css/responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="/corlate/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/corlate/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/corlate/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/corlate/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/corlate/images/ico/apple-touch-icon-57-precomposed.png">
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
                    <ul class="nav navbar-nav" style="font-size:14px;">
                    	<li><a href="/zlzlza">찾기</a></li>
                        <li><a href="/notice/list">공지사항</a></li>
                        <li><a href="/event/list">이벤트</a></li>
                        <li><a href="/board/list">커뮤니티</a></li>
                        <c:if test="${loginUser == null}">
                        <li><a href="/joinform"> 회원가입 </a></li>
                        <li><a href="/login">로그인</a></li>
                        </c:if>
                        <c:if test="${loginUser != null}">
                        <li class="active"><a href="/mypage">마이페이지</a></li>
                        <li><a href="/main/logout">로그아웃</a></li>
                        </c:if>
                        <li><a href="/mng/login">사장님페이지</a></li>
                    </ul>
                   </div>
                </div>
            </div><!--/.container-->
        </div><!--/nav-->
    </header><!--/header-->

    
    <div class="page-title" style="background-image: url(/corlate/images/t2.jpg)">
        <h1>마이페이지</h1>
    </div>

    <section id="about-us">
        <div class="container">
            <div class="row">
	                <div class="col-md-5">
	                    <div class="w3-content w3-container w3-margin-top">
							<div class="w3-container w3-card-4">
								<div class="w3-center w3-large w3-margin-top">
									<h3>My Page</h3>
								</div>
								<div>
								<form action="/updateInfo">
									<p>
										<label>NAME</label> 
										<input class="w3-input" type="text" id="memberName" name="memberName" readonly value="${detailVO.memberName}"> 
									</p>
									<p>
										<label>EMAIL</label> 
										<input class="w3-input" type="text" id="email" name="email" readonly value="${detailVO.email}"> 
									</p>
									<p>
										<label>PHONE</label> 
										<input class="w3-input" type="text" id="phone" name="phone" readonly value="${detailVO.phone}">
									</p>
									
									<p class="w3-center">
										<input type="button" id="modify_btn" name="modify_btn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" value="수정하기">
									</p>
								</form>
							</div>
						</div>
					</div>
                </div>
                <div class="col-md-7">
                    <div class="w3-content w3-container w3-margin-top">
						<div class="w3-container w3-card-4">
							<div class="w3-center w3-large w3-margin-top">
								<h3>비밀번호 수정</h3>
							</div>
							<div>
								<form  action="/updatePw">
								 <div class="form-group">
									<p>
										<label>현재비밀번호</label> 
										<input class="w3-input" type="password" id="old_password" name="old_password" placeholder="현재비밀번호"> 
									</p>
									<p>
										<label>새 비밀번호</label> 
										<input class="w3-input" type="password" id="password" name="password" placeholder="새 비밀번호"> 
									</p>
									<p>
										<label>새 비밀번호 확인</label>
										<input class="w3-input" type="password" id="password_check" name="password_check" placeholder="새 비밀번호 확인">
									</p>
									<p class="w3-center">
										<input type="button" id="modifyPw_btn" name="modifyPw_btn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" value="수정하기">
									</p>
								</form>
							</div>
						</div>
                </div>
            </div>
        </div>
    </section>


    <section id="middle" class="skill-area" style="background-image: url(${pageContext.request.contextPath}/resources/corlate/images/siloam.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 fadeInDown">
                    <div class="skill">
                        <h2>나의 방문기록</h2>
                    </div>
                </div>
                <!--/.col-sm-6-->

                <div class="col-sm-6">
                    <div class="progress-wrap">
                        <h3>용산 드래곤 힐 스파</h3>
                        <div class="progress">
                            <div class="progress-bar  color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                <span class="bar-width">6번</span>
                            </div>

                        </div>
                    </div>

                    <div class="progress-wrap">
                        <h3>거북이목욕탕</h3>
                        <div class="progress">
                            <div class="progress-bar color2" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                <span class="bar-width">7번</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="progress-wrap">
                        <h3>불가마사우나</h3>
                        <div class="progress">
                            <div class="progress-bar color3" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                <span class="bar-width">8번</span>
                            </div>
                        </div>
                    </div>

                    <div class="progress-wrap">
                        <h3>실로암사우나</h3>
                        <div class="progress">
                            <div class="progress-bar color4" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                <span class="bar-width">9번</span>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    <!--/#middle-->
    
    <section id="team-area">
        <div class="container">
            <div class="center fadeInDown">
                <h2>내가 찜한 곳</h2>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6 single-team">
                    <div class="inner">
                        <div class="team-img">
                            <img src="/corlate/images/dragon.jpg" alt="">
                        </div>
                        <div class="team-content">
                            <h4>드래곤 힐 스파</h4>
                            <div class="team-social">
                                <a class="fa fa-facebook" href="#"></a>
                                <a class="fa fa-twitter" href="#"></a>
                                <a class="fa fa-linkedin" href="#"></a>
                                <a class="fa fa-pinterest" href="#"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 single-team">
                    <div class="inner">
                        <div class="team-img">
                            <img src="/corlate/images/siloam.jpg" alt="">
                        </div>
                        <div class="team-content">
                            <h4>실로암</h4>
                            <div class="team-social">
                                <a class="fa fa-facebook" href="#"></a>
                                <a class="fa fa-twitter" href="#"></a>
                                <a class="fa fa-linkedin" href="#"></a>
                                <a class="fa fa-pinterest" href="#"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 single-team">
                    <div class="inner">
                        <div class="team-img">
                            <img src="/corlate/images/tean.jpg" alt="">
                        </div>
                        <div class="team-content">
                            <h4>태안 불가마</h4>
                            <div class="team-social">
                                <a class="fa fa-facebook" href="#"></a>
                                <a class="fa fa-twitter" href="#"></a>
                                <a class="fa fa-linkedin" href="#"></a>
                                <a class="fa fa-pinterest" href="#"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 single-team">
                    <div class="inner">
                        <div class="team-img">
                            <img src="/corlate/images/t2.jpg" alt="">
                        </div>
                        <div class="team-content">
                            <h4>덕양 불가마</h4>
                            <div class="team-social">
                                <a class="fa fa-facebook" href="#"></a>
                                <a class="fa fa-twitter" href="#"></a>
                                <a class="fa fa-linkedin" href="#"></a>
                                <a class="fa fa-pinterest" href="#"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 single-team">
                    <div class="inner">
                        <div class="team-img">
                            <img src="/corlate/images/t3.jpg" alt="">
                        </div>
                        <div class="team-content">
                            <h4>참숯 불가마</h4>
                            <div class="team-social">
                                <a class="fa fa-facebook" href="#"></a>
                                <a class="fa fa-twitter" href="#"></a>
                                <a class="fa fa-linkedin" href="#"></a>
                                <a class="fa fa-pinterest" href="#"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 single-team">
                    <div class="inner">
                        <div class="team-img">
                            <img src="/corlate/images/t4.jpg" alt="">
                        </div>
                        <div class="team-content">
                            <h4>황토 불가마</h4>
                            <div class="team-social">
                                <a class="fa fa-facebook" href="#"></a>
                                <a class="fa fa-twitter" href="#"></a>
                                <a class="fa fa-linkedin" href="#"></a>
                                <a class="fa fa-pinterest" href="#"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--/#bottom-->

    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-xs-12">
                    &copy; 2019-7-04설립 사업명:지지자 컴퍼니 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates"></a>
                </div>
                <div class="col-sm-6 col-xs-12">
                    <ul class="pull-right">
                        <li><a href="#">문의사항</a></li>
                        <li><a href="#">고객센터 02-xxx-xxxx</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">회사소개</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->


    <script src="/corlate/js/jquery.js"></script>
    <script src="/corlate/js/bootstrap.min.js"></script>
    <script src="/corlate/js/jquery.prettyPhoto.js"></script>
    <script src="/corlate/js/owl.carousel.min.js"></script>
    <script src="/corlate/js/jquery.isotope.min.js"></script>
    <script src="/corlate/js/main.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
		$("#modify_btn").click(function() {
			if($.trim($("#memberName").val())==""){
				alert("이름을 확인하세요");
				$("#memberName").focus();
				return;
			}
			if($.trim($("#email").val())==""){
				alert("이메일을 확인하세요");
				$("#email").focus();
				return;
			}
			if($.trim($("#phone").val())==""){
				alert("전화번호를 확인하세요");
				$("#phone").focus();
				return;
			}
			$.get(
					"/updateInfo"
					,{
						memberName: $("#memberName").val()
						,phone:$("#phone").val()
						,email:$("#email").val()
					}
					,function(data,status){
						if(status=="success"){
							if(data==-1){
								alert("시스템관리자에게 문의 바랍니다");
							}else if(data>0){
								alert("수정되었습니다");
								location.href="/mypage";
							}else {
								alert("잠시 후 다시 시도해주세요");
							}
						}else {
							alert("시스템 관리자에게 문의해주세요");
						}
					}
				)
		});
		
		$("#modifyPw_btn").click(function() {
			if($.trim($("#old_password").val())==''){
    			alert("비밀번호는 필수 입력사항입니다");
    			$("#password").focus();
    			return;
    		}
			if($.trim($("#password").val())==''){
    			alert("비밀번호는 필수 입력사항입니다");
    			$("#password").focus();
    			return;
    		}
			if($.trim($("#password").val()) != $.trim($("#password_check").val())){
    			alert("비밀번호가 일치하지 않습니다.");
    			$("#password").focus();
    			return;
    		}
			$.post(
					"/updatePw"
					,{
						old_password: $("#old_password").val()
						,password:$("#password").val()
					}
					,function(data,status){
						if(data.result){
							alert(data.message);
							location.href="/mypage";
						}else {
							alert(data.message);
						}
					}
				)
		});
	});
    </script>
</body>

</html>

