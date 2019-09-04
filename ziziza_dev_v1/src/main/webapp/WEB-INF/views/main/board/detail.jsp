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
<!--/head-->
<!-- <script src="../resources/jquery/jquery-3.4.1.js"></script> -->
<script type="text/javascript">
$(document).ready(function() {
	$("#btn_delete").click(function() {
		var goYN = confirm("글을 삭제 하시겠습니까?"); 
		if(goYN == false){
			return;
		}
		$.post(
				"/board/delete"	
				,{
					board_no:$("#hidNO").val()
				}
				,function(data, status){
					if(status == "success"){
						if(data > 0){
							alert("게시글을 삭제 했습니다");
							location.href="/board/list";
						}  else if(data == -1){
							alert("로그인 후 이용이 가능합니다.");
						}  else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}
				}
			);
	});//cilck
	$("#btn_update").click(function() {
	 location.href="/board/modify?board_no=${detailVO.board_no}"
	});
	$("#btn_list").click(function() {
		location.href="/board/list"
	});
	$("#reply_btn").click(function(e) {
		e.preventDefault();
		if($("#reply").val() == ''){
			alert("댓글을 입력해주세요.");
			return;
		}
		
		$.post(
				"/board/repinsert"
				,{
					board_no:$("#hidNO").val()
				   ,contents:$("#reply").val()
				}
				,function(data,status){
					if(status == "success"){
						if(data == 0){
							alert("잠시 후, 다시 시도해 주세요.");
						} else if(data == -1){
							alert("로그인 해 주세요.");
						} else {
							$("#reply").val("");
							$.each(data,function(index,vo){
								var tr = $("<tr>")
								tr.append("<td>${loginUser.userName}</td>");
								tr.append("<td>"+vo.contents+"</td>");
								tr.append("<td>"+vo.regist_date+"</td>");
								var td = $("<td>").append($('<button type="button" class="btn btn-outline-success btn_repdelete">').text("댓글삭제").data("no", vo.comment_no).on('click', function(e) {
									e.preventDefault();
									var btn = $(this);
									var no = btn.data('no');
									deleteReply(btn, no);
								}));
								tr.append(td);
								$("#replyTable tbody").append(tr);
							});
						}
					}
			},"json");
	});
	$(".btn_repdelete").on('click', function(e) {
		e.preventDefault();
		var btn = $(this);
		var no = btn.data('no');
		deleteReply(btn, no);
	});
});//ready
function deleteReply(btn, no){
	$.post(
			"/board/repdelete"	
			,{
				comment_no:no
			}
			,function(data, status){
				if(status == "success"){
					if(data > 0){
						alert("댓글 삭제 했습니다");
						btn.parents("tr").remove();
					}  else if(data == -1){
						alert("로그인 후 이용이 가능합니다.");
					}  else {
						alert("잠시 후 다시 시도해 주세요.");
					}
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
                    	<li><a href="/zlzlza">찾기</a></li>
                        <li><a href="/notice/list">공지사항</a></li>
                        <li><a href="/event/list">이벤트</a></li>
                        <li class="active"><a href="/board/list">커뮤니티</a></li>
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
   <h2>커뮤니티</h2>
   </div>
<div class="container" style="min-height:800px;">
	<div class="row">
		<div class="col-sm-6 col-md-offset-3">
						<table class="table ">
							<colgroup>
								<col width="20%" />
								<col width="80%" />
							</colgroup>
							<tbody>	
					<tr>
						<th>번호</th>
						<td>${detailVO.board_no}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><c:out value="${detailVO.title}" escapeXml="true"/></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${detailVO.member_name}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
<%-- 							<textarea rows="10" cols="65" readonly="readonly" style="resize:none; white-space:pre;">${detailVO.contents}</textarea> --%>
							<div style="min-height:200px; white-space:pre-wrap;">${detailVO.contents}</div>
						</td>
<%-- 						<td><c:out value="${detailVO.contents}" escapeXml="true"/></td>		 --%>

					</tr>
							</tbody>
						</table>
						<input type="hidden" id="hidNO" value="${detailVO.board_no}" />
						<input type="hidden" id="hidMbrNo" value="${detailVO.member_name}" />
		</div>
	</div>
	<div class="col-sm-2 col-md-offset-5">
	</div>
	<div class="col-sm-6 col-md-offset-3" style="border-bottom: 1px solid lightgray">
	</div>
	<br><br>
	<div class="col-sm-1 col-md-offset-3" >
	<c:if test="${loginUser.userNo == detailVO.member_no}">
	<button type="button" id="btn_update" class="btn btn-outline-success">수정</button>
	</c:if>
	</div>
	<div class="col-sm-2 col-md-offset-1">
	<c:if test="${loginUser.userNo == detailVO.member_no}">
	<button type="button" id="btn_delete" class="btn btn-outline-success">삭제</button>
	</c:if>
	</div>
	<div class="col-sm-2 col-md-offset-1">
	<button type="button" id="btn_list" class="btn btn-outline-success">목록</button>
	</div>
	<br><br>
	<br><br>
	<c:if test="${not empty loginUser}">
	<div class="col-sm-4 col-md-offset-3">
	<input type="text" id="reply" class="form-control" required="required" placeholder="댓글을 입력해주세요.">
	</div>
	<div class="col-sm-4 col-md-offset-1">
	<button type="button" id="reply_btn" class="btn btn-outline-success">등록</button>
	</div>
	</c:if>
	<c:if test="${empty loginUser}">
	<div class="col-sm-4 col-md-offset-3">
		<p>댓글작성은 로그인 필요합니다.</p>
	</div>
	</c:if>	
	<br><br>
	<br><br>
	<div class="row">
		<div class="col-sm-6 col-md-offset-3">
			<table id="replyTable" class="table ">
			<thead>
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${reply_list}" var="vo" varStatus="status">
				<tr>
					<td>${vo.member_name}</td>
					<td><c:out value="${vo.contents}" escapeXml="true"/></td>
					<td>${vo.regist_date}</td>
					<td>
					<c:if test="${loginUser.userNo == vo.member_no}">
					<button type="button" class="btn btn-outline-success btn_repdelete" data-no="${vo.comment_no}">댓글삭제</button>
					</c:if>
					</td>
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</div>
		<input type="hidden" id="rehidNO" value="${detailVO.member_no}" />
		<input type="hidden" id="rehidTit" value="${detailVO.contents}" />
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
