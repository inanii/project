<%@ page language="java"
	contentType="text/html; charset=UTF-8"
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
    <title>Home ziziza</title>

    <!-- core CSS -->
    <link href="../resources/corlate/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/corlate/css/font-awesome.min.css" rel="stylesheet">
    <link href="../resources/corlate/css/animate.min.css" rel="stylesheet">
    <link href="../resources/corlate/css/prettyPhoto.css" rel="stylesheet">
    <link href="../resources/corlate/css/owl.carousel.min.css" rel="stylesheet">
    <link href="../resources/corlate/css/icomoon.css" rel="stylesheet">
    <link href="../resources/corlate/css/main.css" rel="stylesheet">
    <link href="../resources/corlate/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="../resources/corlate/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../resources/corlate/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../resources/corlate/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../resources/corlate/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../resources/corlate/images/ico/apple-touch-icon-57-precomposed.png">
    
    <script src="../resources/corlate/js/jquery.js"></script>
    <script src="../resources/corlate/js/bootstrap.min.js"></script>
    <script src="../resources/corlate/js/jquery.prettyPhoto.js"></script>
    <script src="../resources/corlate/js/owl.carousel.min.js"></script>
    <script src="../resources/corlate/js/jquery.isotope.min.js"></script>
    <script src="../resources/corlate/js/main.js"></script>
</head>

<script type="text/javascript">
$(function() {
	$("#btn_list").click(function() {
		location.href="/event/list"
	});
});
</script>

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
                        <li class="active"><a href="/event/list">이벤트</a></li>
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
            </div>
            <!--/.container-->
        </div>
        <!--/.top-bar-->
    </header>
<div class="container" style="min-height:100px;">
   <h2>이벤트</h2>
</div>
<div class="container" style="min-height:635px;">
	<div class="row contact-wrap"> 
                <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php">
                    <div class="col-sm-6 col-md-offset-3">
                        <div class="kk">
<!--                         	<label>제목</label> -->
<%--                             <input type="text" name="name" class="form-control" required="required" disabled="disabled" value="${detailVO.title}"> --%>
                            <div style="min-height:100px;"><h1>${detailVO.title}</h1></div>
						</div>
                        <div class="recent-work-wrap" style="min-height:500px;">
							<img alt="" src="/file/imageView?no=${detailVO.banner_no}"/>
                        </div>
                        <div class="kk">
<!--                             <label>내용</label> -->
<%--                             <textarea  required="required" class="form-control" disabled="disabled" rows="8">${detailVO.contents}</textarea> --%>
							<div style="min-height:200px; white-space: pre-wrap;"><p>${detailVO.contents}</p></div>
                    	</div>

                        <div class="form-group">
                            <label>첨부파일 : </label>
                            <c:forEach items="${fileList}" var="vo">
                          		 <c:if test="${vo.fileType eq 'ATTACHMENTS'}">
                           		<p><a href="/file/download?no=${vo.fileNo}">${vo.originName}</a></p>
                           		</c:if>
                            </c:forEach>
                        </div>
                    </div>
                </form>
	<div class="col-sm-4 col-md-offset-8">
	<button type="button" id="btn_list" class="btn btn-outline-success">목록</button>
	<br><br>
	<br><br>
	<br><br>
	</div>
	</div>
</div>
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
</body>
</html>