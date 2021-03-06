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
                        <li class="active"><a href="/notice/list">공지사항</a></li>
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
                
            </div>
            <!--/.container-->
        </div>
        <!--/.top-bar-->

    </header>
    
    
   <div class="container" style="min-height:100px;">
   <h2>공지사항</h2>
   </div>
   <div class="container">
   	<div class="row">
   	<div class="col-sm-4">
   	</div>
   	<div  class="col-sm-8">
   		<form action="/notice/list" class="navbar-form navbar-right searchForm">
   			<input type="hidden" name="currentPage" value="${page.currentPage}">
                 <div class="form-group ">
                 	<div class="col-sm-4">
                 	<select name="searchType">
			   			<option>전체</option>
			   			<option value="TITLE" <c:if test="${search.searchType eq 'TITLE'}">selected</c:if>>제목</option>
						<option value="CNT" <c:if test="${search.searchType eq 'CNT'}">selected</c:if>>내용</option>
			   		</select>
			   		</div>
			   		<div class="col-sm-5">
                     <input type="text" name="searchTxt" class="form-control"  placeholder="Search" value="${search.searchTxt}">
                     </div>
                     <div class="col-sm-3">
                     <button type="submit" class="btn btn-default">검색</button>
                     </div>
                 </div>
   		</form>
   	</div>
   	</div>
   </div>
<div class="container" style="min-height:580px;">
	<div class="row">
		<div class="col-xs-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>	
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>
								<a href="/notice/detail?board_no=${vo.board_no}">
									<c:out value="${vo.title}"  escapeXml="true"/> 
								</a>
							</td>
							<td>${vo.member_name}</td>
							<td>${vo.regist_date}</td>
							<td>${vo.hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="themeum-pagination">
		<ul class="page-numbers">
		<c:if test="${page.prevState}">
			<li><a class="prev page-numbers" href="/notice/list" data-page="${page.currentPage - 1}"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a></li>
		</c:if>
		<c:forEach begin="${page.startPage}" end="${page.endPage}" step="1" var="i">
			<c:choose>
				<c:when test="${page.currentPage eq i}">
					<li><span aria-current="page" class="page-numbers current" data-page="${i}">${i}</span></li>
				</c:when>
				<c:otherwise>
					<li><a class="page-numbers" href="/notice/list" data-page="${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.nextState}">
			<li><a class="next page-numbers" href="/notice/list" data-page="${page.currentPage + 1}"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></li>
		</c:if>
		</ul>
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
    <script src="../resources/corlate/js/jquery.js"></script>
    <script src="../resources/corlate/js/bootstrap.min.js"></script>
    <script src="../resources/corlate/js/jquery.prettyPhoto.js"></script>
    <script src="../resources/corlate/js/owl.carousel.min.js"></script>
    <script src="../resources/corlate/js/jquery.isotope.min.js"></script>
    <script src="../resources/corlate/js/main.js"></script>
    <script>
    	$(function(){
    		$("a.page-numbers").on("click", function(e){
    			e.preventDefault();
    			$('input[name="currentPage"]').val($(this).data('page'));
    			$('.searchForm').submit();
    		});
    	});
    </script>
</body>
</html>