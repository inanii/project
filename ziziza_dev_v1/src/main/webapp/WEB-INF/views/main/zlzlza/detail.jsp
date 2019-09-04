<%@ page language="java"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

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
$(document).ready(function() {
	$("#reply_btn").click(function() {
		if(!($("#score").val()>=1 && $("#score").val()<=5)){
	         alert("1~5의 숫자를 입력해주세요.");
	         return;
	      }
		$.post(
				"/zlzlza/repInsert"
				,{
					company_no : $("input[name='company_no']").val(),
					contents:$("#reply").val(),
					score:$("#score").val()			
				}
				,function(data,status){
					if(status == "success"){
						if(data == 0){
							alert("잠시 후, 다시 시도해 주세요.");
						} else if(data == -1){
							alert("로그인 해 주세요.");
						} else {
							$("#reply").val("");
							location.reload();
							$.each(data,function(index,vo){
								var tr = $("<tr>");
								$("<td>").text(vo.member_name).appendTo(tr);
								$("<td>").text(vo.score).appendTo(tr);
								$("<td>").text(vo.contents).appendTo(tr);
								$("<td>").text(vo.regist_date).appendTo(tr);
								var td = $("<td>");
								$('<button type="button" id="btn_repdelete" class="btn btn-outline-success" data-no="' + vo.review_no + '">').text("삭제").on('click', function(e){
									e.preventDefault();
									repdelete($(this));
								}).appendTo(td);
								td.appendTo(tr);
								$("#replyTable tbody").append(tr);
							});
						}
					}
			},"json");
	});
	$(":button[id='btn_repdelete']").click(function() {
		repdelete($(this));
	});
});
function repdelete(btn, no){
	var goYN = confirm("삭제 하시겠습니까?");
	if(goYN == false){
		return;
	}
	var no = btn.data("no");
	$.post(
			"/company/redelete"
			,{
				'review_no':no
			}
			,function(data, status){
				if(data > 0){
					alert("댓글 삭제 했습니다");
					btn.parents("tr").remove();
					location.reload();
				} else {
					alert("잠시 후 다시 시도해 주세요.");
				}	
			}
	);
}
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
                    	<li class="active"><a href="/zlzlza">찾기</a></li>
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
                
            </div>
            <!--/.container-->
        </div>
        <!--/.top-bar-->

    </header>
    
   <div class="container" style="min-height:200px;">
    	<div class="row">
<%--     	<img src="/file/imageView?no=${detailVO.fileNo}"/> --%>
    	<div class="col-md-10 col-md-offset-1 text-center">
					<c:forEach items="${files}" var="file">
						<c:if test="${file.fileType eq 'SLIDE'}">
								<img src="/file/imageView?no=${file.fileNo}"/>
	                    </c:if>
					</c:forEach>
                </div>
    	</div>
    </div>


	<div class="container">
	 <div class="row">
	  <div class="col-sm-12 col-sm-offset-1" style="padding-left:2%; min-height:200px;">
	  	<h1>${detailVO.companyName}</h1>
	  	<c:forEach items="${proList}" var="pro">
	  	<h4>프로모션 : ${pro.eventContent}</h4>
		</c:forEach>
		<h4>주소 : ${detailVO.address} ${detailVO.detailAddress}</h4>
	  </div>		
	 </div>	
	</div>
	
	<div class="container">
	 <div class="row">
	 		<c:forEach items="${chargeList}" var="charge">
		 	<div class="col-sm-12 col-sm-offset-1" >
	 			<div>${charge.timeKind } ${charge.subject } ${charge.price }</div>
		 	</div>
		 	</c:forEach>
	 </div>
	 </div>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="col-md-10 col-md-offset-1 text-center">
                    <div class="single-pricing featured">
                    	<p>${detailVO.contents}</p>
                    	영업시간: ${detailVO.openTime}~${detailVO.closeTime}
                    </div>
                </div>
			</div>
						<div class="col-sm-6 col-sm-offset-1">
							<h5>전화번호 : ${detailVO.companyTel}</h5>
						</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="f3xljso">
			<div class="fla3bp24">
				<div class="col-sm-12 col-sm-offset-1" style="padding-left:2%">
					<h2>편의시설 및 서비스</h2>
				</div>
			<div class="f4nsdxu swiper col-sm-1 col-md-offset-1 text-center">
			 <div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
			 	<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
			 		<div class="swiper-slide facility-icon swiper-slide-active">
			 		<c:forEach items="${plantList}" var="plant">
			 			<div>${plant.plantName }</div>
			 		</c:forEach>
			 		</div>
			 	</div>
			 </div>
			</div>
		</div>
	</div>
			</div> 
		</div>
		<br><br>
		
	<input type="hidden" name="company_no" value="${detailVO.companyNo}" />
	<div class="col-sm-1 col-md-offset-3">
	<input type="text" id="score" class="form-control" required="required" placeholder="점수(1~5)">
	</div>
	<div class="col-sm-4">
	<input type="text" id="reply" class="form-control" required="required" placeholder="댓글을 입력해주세요.">
	</div>
	<button type="button" id="reply_btn" class="btn btn-outline-success">등록</button>
	
	<div class="col-sm-6 col-md-offset-3">
<!-- 	<table id="replyTable" class="table "> -->
<!-- 			<thead> -->
<!-- 								<tr> -->
<!-- 									<th>작성자</th> -->
<!-- 									<th>평점</th> -->
<!-- 									<th>내용</th> -->
<!-- 									<th>등록일</th> -->
<!-- 								</tr> -->
<!-- 			</thead> -->
<!-- 							<tbody> -->
<%-- 			<c:forEach items="${replyList}" var="vo" varStatus="status"> --%>
<!-- 				<tr> -->
<%-- 					<td>${vo.member_name}</td> --%>
<%-- 					<td>${vo.score}</td> --%>
<%-- 					<td>${vo.contents}</td> --%>
<%-- 					<td>${vo.regist_date}</td> --%>
<!-- 					<td> -->
<%-- 						<c:if test="${not empty loginUser and loginUser.userNo eq vo.member_no}"> --%>
<%-- 							<button type="button" id="btn_repdelete" class="btn btn-outline-success" data-no="${vo.review_no}">삭제</button> --%>
<%-- 						</c:if> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 	</table>	 -->
	
	<br><br>
	<ul>
	<c:forEach items="${replyList}" var="vo" varStatus="status">
		<div class="row" style="border-bottom: 1px solid lightgray">
		<c:if test="${vo.score!= null }">
			<c:choose>
				<c:when test="${vo.score==1}">
					<img src="/corlate/images/portfolio/sadimo.png">
					<h3>${vo.member_name}</h3>
   					<p>★</p>
   				</c:when>
   				<c:when test="${vo.score==2}">
   					<img src="/corlate/images/portfolio/sadimo.png">
   					<h3>${vo.member_name}</h3>
   					<p>★★</p>
   				</c:when>
   				<c:when test="${vo.score==3}">
   					<img src="/corlate/images/portfolio/ho2.png">
   					<h3>${vo.member_name}</h3>
   					<p>★★★</p>
   				</c:when>
   				<c:when test="${vo.score==4}">
   					<img src="/corlate/images/portfolio/smileimo.png">
   					<h3>${vo.member_name}</h3>
   					<p>★★★★</p>
   				</c:when>
   				<c:when test="${vo.score==5}">
   					<img src="/corlate/images/portfolio/smileimo.png">
   					<h3>${vo.member_name}</h3>
   					<p>★★★★★</p>
   				</c:when>
   				<c:otherwise>
			    </c:otherwise>
			</c:choose>
		</c:if>
		<h3>${vo.contents}</h3>
		<h3>${vo.regist_date}</h3>
		<div class="col-sm-3 col-md-offset-10">
		<c:if test="${not empty loginUser and loginUser.userNo eq vo.member_no}">
		<button type="button" id="btn_repdelete" class="btn btn-outline-success" data-no="${vo.review_no}">삭제</button>
		</c:if>
		</div>
		</div>	
	</c:forEach>
	</ul>
	
	</div>
	
	
    
    <footer id="footer" class="midnight-blue" style="clear: both;">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-xs-12">
                    &copy; 2019-7-04설립 	사업명:지지자 컴퍼니 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates"></a>
                </div>
                <div class="col-sm-6 col-xs-12">
                    <ul class="pull-right">
                        <li><a href="#">문의사항</a></li>
                        <li><a href="#">고객센터 02-xxx-xxxx</a></li>
                        <li><a href="/main/l">개인정보처리방침</a></li>
                        <li><a href="#">회사소개</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    
</body>

</html>
