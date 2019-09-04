<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<script src="../resources/jquery/jquery-3.4.1.min.js"></script>
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
</head>
<!--/head-->

<body>
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
                        <li class="active"><a href="/joinform"> 회원가입 </a></li>
                        <li><a href="/login">로그인</a></li>
                        </c:if>
                        <c:if test="${loginUser != null}">
                        <li><a href="/mypage">마이페이지</a></li>
                        <li><a href="/main/logout">로그아웃</a></li>
                        </c:if>
                        <li><a href="/mng/login">사장님페이지</a></li>
                    </ul>
                  </div>
                </div>
            </div><!--/.container-->
        </div><!--/nav-->
    </header><!--/header-->

    <section id="contact-page">
       <div class="container">
          <div class="large-title text-center">
             <h1>회원가입</h1>
          </div>
                 <div class="form-row">
                <div class="form-group col-md-5">
                    <label for="memberId">아이디</label>
                    <input type="text" class="form-control" id="memberId" name=memberId placeholder="아이디를 입력하세요.">
                </div>
                <div class="form-group col-md-1">
                   <label for="zi_id_check">중복검사</label>
                    <input type="button" class="form-control btn-success" id="idchk" name="idchk" value="확인">
                </div>
                <div class="form-group col-md-6">
                     <label for="memberName">이름</label>
                     <input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름을 입력하세요.">
                </div>
              </div>
              <div class="form-group">
                <div class="form-group col-md-6">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                </div>
                <div class="form-group col-md-6">
                     <label for="password_check">비밀번호 확인</label>
                     <input type="password" class="form-control" id="password_check" name="password_check" placeholder="비밀번호 확인">
                </div>
              </div>
              <div class="form-group">
                <div class="form-group col-md-6">
                    <label for="phone">휴대전화</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="휴대전화 번호를 입력하세요.">
                </div>
                <div class="form-group col-md-6">
                     <label for="email">이메일 주소</label>
                     <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.">
                </div>
              </div>
              <div class="form-group">
                 <div class="form-group col-md-12">
                    <p>
                    <a class="btn btn-success" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                      이용 약관
                    </a>
                  </p>
                  <div class="collapse" id="collapseExample">
                    <div class="card card-body">
                		<p>이 약관은 (전자상거래 사업자)가 운영하는 사이버 몰(이하 '몰' 이라 한다)에서 제공하는 인터넷 관련 서비스(이항 '서비스'라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리/의무 및 책임사항을 규정함을 목적으로 합니다.</p>
                		<p>PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.</p> 
                    </div>
                  </div>
                  <div class="form-check">
                        <input type="checkbox" id="gridCheck" name="gridCheck" value="0">
                        <label class="form-check-label">
                          약관동의
                       </label>
                   </div>
                 </div>
              </div>
              <div class="form-group">
                   <div class="form-group col-md-6">
                       <input type="button" class="form-control btn-info" id="join_btn" name="join_btn" value="회원가입">
                   </div>
              <div class="form-group col-md-6">
                   <input type="button" class="form-control btn-warning" value="취소">
              </div>
              </div>
        </div><!-- container -->
    </section><!--/#contact-page-->


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

    <script src="${pageContext.request.contextPath}/resources/corlate/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/corlate/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/corlate/js/jquery.prettyPhoto.js"></script>
    <script src="${pageContext.request.contextPath}/resources/corlate/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/corlate/js/jquery.isotope.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/corlate/js/main.js"></script>
    <script type="text/javascript">
    var chkid='';
    var chkidyn=0;
    $(document).ready(function() {
		$("#idchk").click(function() {
			if($.trim($("#memberId").val())==''){
				alert("아이디는 필수 입력사항입니다");
				$("#memberId").focus();
				return;
			}
			$.post("./joinidchk",
			{memberId:$("#memberId").val()},
			function(data,status) {
				if(data==0){
					alert("사용가능한 아이디입니다");
					chkid=$("#memberId").val();
					chkidyn=1;
				}else{
					alert("이미 사용중인 아이디입니다");
				}
			}
			)
		});
	});
    $(document).ready(function() {
		$(":checkbox").click(function() {
			if($(this).val()==0){
				$(this).val(1);
			}else if($(this).val()==1){
				$(this).val(0);
			}
		});
	});
    $(document).ready(function() {
    	$("#join_btn").click(function() {
    		if($("#gridCheck").val()==0){
    			alert("서비스 이용약관 동의후 가입바랍니다");
    			$("#gridCheck").focus();
    			return;
    		}
    		if($.trim($("#memberId").val())==''){
    			alert("아이디는 필수 입력사항입니다");
    			$("#memberId").focus();
    			return;
    		}
    		if($.trim($("#password").val())==''){
    			alert("비밀번호는 필수 입력사항입니다");
    			$("#password").focus();
    			return;
    		}
    		if($.trim($("#phone").val())==''){
    			alert("전화번호는 필수 입력사항입니다");
    			$("#phone").focus();
    			return;
    		}
    		if($.trim($("#email").val())==''){
    			alert("이메일은 필수 입력사항입니다");
    			$("#email").focus();
    			return;
    		}
    		if($("#email").val().indexOf('@') == '-1'
				|| $("#email").val().lastIndexOf('.') == '-1'){
				alert("eMail 형식이 잘못되었습니다.");
				$("#email").focus();
				return;
			}
    		
			$.post(
				"./joinins"
				,{
					memberId:$("#memberId").val()
					,memberName:$("#memberName").val()
					,password:$("#password").val()
					,phone:$("#phone").val()
					,email:$("#email").val()
				}
				,function(data,status){
					if(status=="success"){
						if(data==-1){
							alert("시스템관리자에게 문의 바랍니다");
						}else if(data>0){
							alert("회원가입되셨습니다");
							location.href="/login";
						}else {
							alert("잠시 후 다시 시도해주세요");
						}
					}else {
						alert("시스템 관리자에게 문의해주세요");
					}
				}
			)
		});
		
	});
    
    </script>
</body>

</html>