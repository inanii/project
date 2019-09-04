<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
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
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">당신의 아이디는</h4>
      </div>
      <div class="modal-body">
        <span id="aaa"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
	</div>
 	</div>
	</div>
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">당신의 아이디는</h4>
      </div>
      <div class="modal-body">
        <span id="bbb"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
	</div>
 	</div>
	</div>
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
             <h1>아이디 비밀번호 찾기</h1>
          </div>
                 <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="zi_id">휴대전화번호</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="휴대전화번호를 입력하세요.">
                </div>
                <div class="form-group col-md-6">
                     <label for="zi_nm">아이디</label>
                     <input type="text" class="form-control" id="memberId" name="memberId" placeholder="아이디를 입력하세요.">
                </div>
              </div>
              <div class="form-group">
                <div class="form-group col-md-6">
                    <label for="zi_password">이메일</label>
                    <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요">
                </div>
                <div class="form-group col-md-6">
                      <label for="zi_password">이메일</label>
                    <input type="text" class="form-control" id="email2" name="email" placeholder="이메일을 입력하세요">
                </div>
              </div>
              <div class="form-group">
                   <div class="form-group col-md-6">
                       <input type="button" class="form-control btn-info" id="find_id_btn" name="find_id_btn" value="아이디찾기">
                   </div>
              <div class="form-group col-md-6">
                   <input type="button" class="form-control btn-warning" id="find_pass_btn" name="find_pass_btn" value="비밀번호찾기">
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
    $(document).ready(function() {
		$("#find_id_btn").click(function() {
			if($.trim($("#phone").val())==''){
				alert("휴대전화번호를 입력해주세요");
				$("#phone").focus();
				return;
			}
    		if($.trim($("#email").val())==''){
    			alert("이메일을 입력해주세요");
    			$("#email").focus();
    			return;
    		}
			$.post(
				"/findidproc"
				,{
					phone:$("#phone").val()
					,email:$("#email").val()
				}
				,function(data,status){
					if(status=="success"){
						if(data==""){
							alert("휴대전화번호, 이메일을 확인해주세요");
						}else {
							$("#aaa").text(data);
							$("#myModal").modal();
						}
					}else {
						alert("시스템 관리자에게 문의해주세요");
					}
				}//function
			);//post
    		
		});
	});
    $(document).ready(function() {
		$("#find_pass_btn").click(function() {
			if($.trim($("#memberId").val())==''){
				alert("아이디를 입력해주세요");
				$("#memberId").focus();
				return;
			}
    		if($.trim($("#email2").val())==''){
    			alert("이메일을 입력해주세요");
    			$("#phone2").focus();
    			return;
    		}
			$.post(
				"/findpassproc"
				,{
					memberId:$("#memberId").val()
					,email:$("#email2").val()
				}
				,function(data,status){
					if(status=="success"){
						if(data.result){
							alert(data.message);
						}else {
							alert(data.message);
						}
					}else {
						alert("시스템 관리자에게 문의해주세요");
					}
				}//function
			);//post
    		
		});
	});
    </script>
</body>

</html>