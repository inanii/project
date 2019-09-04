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
	   $(function() {
		   $(":button[id='qnaDelete']").click(function() {
				var btn = $(this);
				$.get(
						"/mng/company/qnaDelete"
						,{
							qnaNo:btn.val()
						}
						,function(data, status){
							if(status == "success"){
								if(data > 0){
									alert("삭제 했습니다.");
									location.reload();
								} else {
									alert("잠시 후 다시 시도해 주세요.");
								}	
							}
						}
					);
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
    			<h1>1:1 문의</h1>
    		</div>
	       	<div class="row">
      			<div class= "form-group col-md-10 col-md-offset-1">
                	<table class="table table-bordered">
	                    <thead class="table-head">
	                       <tr>
	                          <th class="text-center">제목</th>
	                          <th class="text-center">내용</th>
	                          <th class="text-center">등록일</th>
	                          <th class="text-center">답변</th>
	                          <th class="text-center">삭제</th>
	                       </tr>
	                    </thead>
	                    <colgroup>
		   					<col width="20%">
		   					<col width="50%">
		   					<col width="15%">
		   					<col width="10%">
		   					<col width="5%">
						</colgroup>
	                    <c:forEach items="${qnaList}" var="vo" varStatus="status">
	                     	<tbody>   
									<tr>
										<td>${vo.qstTitle}</td>
										<td style="white-space:pre;">${vo.qstContents}</td>
										<td class="text-center">${vo.registDate}</td>
										<c:choose>
										<c:when test="${vo.answer != null}">
											<td align="center" valign="top">
												<button class="btn margin-center" style="background-color: lightgreen;" data-toggle="modal" data-target="#myModal">확인</button>
												<!-- The Modal -->
												<div class="modal" id="myModal">
												  <div class="modal-dialog">
												    <div class="modal-content">
												
												      <!-- Modal Header -->
												      <div class="modal-header">
												        <h3 class="modal-title text-center">-관리자 답변입니다-</h3>
												        <button type="button" class="close" data-dismiss="modal">&times;</button>
												      </div>
												
												      <!-- Modal body -->
												      <div class="modal-body">
												      	<h2>${vo.answer}</h2>
												      </div>
												      
												      <!-- Modal footer -->
												      <div class="modal-footer">
												        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
												      </div>
												
												    </div>
												  </div>
												</div>
											</td>
										</c:when>
										<c:otherwise>
											<td align="center" valign="top">
												답변대기
											</td>
										</c:otherwise>
										</c:choose>
										<td align="center">
											<button class="btn margin-center" id="qnaDelete" value="${vo.qnaNo}">삭제</button>
										</td>
									</tr>
	                     	</tbody>
						</c:forEach>
                  	</table>
	   			</div>
			</div>
			 	
			</div>
		  	<div class="row">
		  		<div class= "form-group col-md-2 col-md-offset-7">
					<a href='<c:url value="/mng/company/qnaregist?memberNo=${param.memberNo}"/>'><button type="button" class="btn btn-info" style="float:right">문의하기</button></a>
    			</div>
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
