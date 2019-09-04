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
    
    
   <section id="zlzl" class="skill-area" style="min-height:100px;">
        <div class="container">
            <div class="row">
               <div class="col-lg-12">
                    <div class="skill">
                        <h2>찜질방의 모든 정보</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    

<!-- <div id="slider-wrap"> -->
<!--     <ul id="slider"> -->
<%--     	<c:forEach var="vo" items="${event}"> --%>
<!--         <li> -->
<!--             <div> -->
<!--                 <h3>이벤트!!</h3> -->
<!--                 <span></span> -->
<!--             </div> -->
<%--             <c:if test="${!empty vo.banner_no}"> --%>
<%-- 				<img alt="" src="/file/imageView?no=${vo.banner_no}"/> --%>
<%-- 			</c:if> --%>
<!--         </li> -->
<%--         </c:forEach> --%>
<!--     </ul> -->

<!--     <div class="slider-btns" id="next"><span>▶</span></div> -->
<!--     <div class="slider-btns" id="previous"><span>◀</span></div> -->

<!--     <div id="slider-pagination-wrap"> -->
<!--         <ul> -->
<!--         </ul> -->
<!--     </div> -->
<!-- </div> -->
    
    
<div class="container">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
    
      <img src="/corlate/images/portfolio/go1.jpg" alt="Los Angeles">
    </div>

    <div class="item">
      <img src="/corlate/images/portfolio/go2.jpg" alt="Chicago">
    </div>

    <div class="item">
      <img src="/corlate/images/portfolio/go3.jpg" alt="New York">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>    
    
    
    
    <section id="services" class="service-item">
        <div class="container">
            <div class="row">
				<div class="col-sm-12 col-mx-12">
                    <div class="media services-wrap fadeInDown">
                        <div class="media-body">
                            <h3 class="media-heading"><a href="/zlzlza" class="moreList">더보기</a></h3>
                        	<p><span>현재위치</span> <span class="addr"></span></p>
                        	<div class="compList portfolio-items isotope">
                        	
                        	</div>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-6 col-md-6">
                    <div class="media services-wrap fadeInDown">
                        <div class="media-body">
                            <h3 class="media-heading">공지사항</h3>
                            <c:forEach items="${notice}" var="vo">
	                           <p><a href="/notice/detail?board_no=${vo.board_no}">${vo.title}  ${vo.regist_date}</a></p>                            
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-6">
                    <div class="media services-wrap fadeInDown">
                        <div class="media-body">
                            <h3 class="media-heading">커뮤니티</h3>
                           <c:forEach items="${board}" var="vo">
	                            <p><a href="/board/detail?board_no=${vo.board_no}">${vo.title}  ${vo.regist_date}</a></p>                            
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    
    		
					<div class="container">
                        <div class="row">
			                <div class="col-sm-12 col-md-12">
			                    <div class="media services-wrap fadeInDown">
			                        <div class="media-body">
			                            <h3 class="media-heading">이벤트</h3>
			                            <div class="portfolio-items">
               								 <c:forEach var="vo" items="${event}">
						                    <div class="portfolio-item apps col-xs-12 col-sm-4 col-md-3 single-work">
						                        <div class="recent-work-wrap">
						                        	<c:choose>
							                        	<c:when test="${!empty vo.banner_no}">
							                           		<img alt="" src="/file/imageView?no=${vo.banner_no}"/>
							                        	</c:when>
						                        		<c:otherwise>
						                        			<img alt="" src="/images/no-img.png"/>
						                        		</c:otherwise>
						                        	</c:choose>
						                        </div>
						                        <p class="text-center"><a href="/event/detail?board_no=${vo.board_no}">${vo.title}</a></p>
						                        <p class="text-center">${vo.e_start_date}~${vo.e_end_date}</p>
						                    </div>
						                    </c:forEach>
					                    </div>
			                        </div>
			                    </div>
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
                        <li><a href="/main/l">개인정보처리방침</a></li>
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
<!--     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee7b83eaa9f9eaf16b648aaa7ed34861&libraries=services"></script> -->
    <script>
    var geocoder, depth1 = '', depth2 = '';
    $(function(){
    	// 주소-좌표 변환 객체를 생성합니다
//		geocoder = new daum.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
//     	geocoder.addressSearch('서울 용산구', function(result, status) {
// 	        // 정상적으로 검색이 완료됐으면 
// 	         if (status === kakao.maps.services.Status.OK) {
	
// 	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
// 	            searchAddrFromCoords(coords.getLng(), coords.getLat());
// 	        } 
//     	});    
   	 	if (navigator.geolocation) {
            //위치 정보를 얻기
            navigator.geolocation.getCurrentPosition(function(pos) {
            	lat = pos.coords.latitude;
            	lng = pos.coords.longitude;
             	//searchAddrFromCoords(lng, lat);	// 현재 지도 중심좌표로 주소를 검색
            });
        } else {
        	$(".addr").text("알수 없음");
        	getList(depth1, depth2);
        }
   		getList(depth1, depth2);
   	 	
    });
	function getList(depth1, depth2){
		$(".moreList").on('click', function(e){
   	 		e.preventDefault();
   	 		location.href = $(this).attr('href') + "?sido=" + depth1 + "&gugun=" + depth2;  
   	 	});
		$.post('/zlzlza', {'sido' : depth1, 'gugun' : depth2}, function(data, status){
			if(data.list){
				$.each(data.list, function(idx, vo){
					var div = $("<div class='portfolio-item apps col-xs-12 col-sm-4 col-md-3 single-work isotope-item'>");
					if(vo.bannerNo){
						var imgBox = $('<div class="recent-work-wrap">');
						var img = $('<a href="/zlzlza/detail?companyNo=' + vo.companyNo + '"><img src="/file/imageView?no=' + vo.bannerNo + '">');					
						div.append(imgBox.append(img))
					}
					$("<p>").text(vo.companyName).appendTo(div);
					$("<p>").text(vo.openTime + '~' + vo.closeTime).appendTo(div);
					$('.compList').append(div);
				});
			}
		});
	}
    function searchAddrFromCoords(lng, lat, callback) {
    	// 좌표로 행정동 주소 정보를 요청합니다
//         geocoder.coord2RegionCode(lng, lat, function(data, status){
// 			if (status === kakao.maps.services.Status.OK) {
// 				for(var i = 0; i < data.length; i++) {
//        	            // 행정동의 region_type 값은 'H' 이므로
//        	            if (data[i].region_type === 'H') {
//        	            	var result = data[i];
//        	            	depth1 = result.region_1depth_name;
//            				depth2 = result.region_2depth_name;
//        	                break;
//        	            }
//        	        }
// 				$(".addr").text(depth1 + ' ' + depth2);
// 				getList(depth1, depth2);
// 			}
//         }); 
    	geocoder.coord2Address(lng, lat, function(data, status){
    		 if (status === kakao.maps.services.Status.OK) {
    			var depth1, depth2;
    			var result = data[0];
    			if(result.road_address){
    				 var road = result.road_address;
    				 depth1 = road.region_1depth_name;
    				 depth2 = road.region_2depth_name;
    			}else{
    				 var addr = result.address;
    				 depth1 = addr.region_1depth_name;
    				 depth2 = addr.region_2depth_name;
    			}
    			$(".addr").text(depth1 + ' ' + depth2);
    			getList(depth1, depth2);
    		 }//
    	});// 좌표로 법정동 상세 주소 정보를 요청합니다
    }//
    
    ///////////
    //slide-wrap
var slideWrapper = document.getElementById('slider-wrap');
//current slideIndexition
var slideIndex = 0;
//items
var slides = document.querySelectorAll('#slider-wrap ul li');
//number of slides
var totalSlides = slides.length;
//get the slide width
var sliderWidth = slideWrapper.clientWidth;
//set width of items
slides.forEach(function (element) {
    element.style.width = sliderWidth + 'px';
})
//set width to be 'x' times the number of slides
var slider = document.querySelector('#slider-wrap ul#slider');
slider.style.width = sliderWidth * totalSlides + 'px';

// next, prev
var nextBtn = document.getElementById('next');
var prevBtn = document.getElementById('previous');
nextBtn.addEventListener('click', function () {
    plusSlides(1);
});
prevBtn.addEventListener('click', function () {
    plusSlides(-1);
});

// hover
slideWrapper.addEventListener('mouseover', function () {
    this.classList.add('active');
    clearInterval(autoSlider);
});
slideWrapper.addEventListener('mouseleave', function () {
    this.classList.remove('active');
    autoSlider = setInterval(function () {
        plusSlides(1);
    }, 3000);
});


function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlides(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    slideIndex = n;
    if (slideIndex == -1) {
        slideIndex = totalSlides - 1;
    } else if (slideIndex === totalSlides) {
        slideIndex = 0;
    }

    slider.style.left = -(sliderWidth * slideIndex) + 'px';
    pagination();
}

//pagination
slides.forEach(function () {
    var li = document.createElement('li');
    document.querySelector('#slider-pagination-wrap ul').appendChild(li);
})

function pagination() {
    var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
    dots.forEach(function (element) {
        element.classList.remove('active');
    });
    dots[slideIndex].classList.add('active');
}

pagination();
var autoSlider = setInterval(function () {
    plusSlides(1);
}, 3000);
</script>


</body>

</html>
