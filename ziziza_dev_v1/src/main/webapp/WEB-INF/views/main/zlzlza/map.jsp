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
                    <a class="navbar-brand" href="/main">ziziza</a>
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
   		<p><span>검색 범위</span> <span class="addr"></span></p>
		<div  class="col-sm-9">
			<div id="map" style="width:500px;height:400px;"></div>
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee7b83eaa9f9eaf16b648aaa7ed34861&libraries=services"></script>
    <script>
    var map, geocoder, lat, lng,depth1 = '', depth2 = '';
    var markers = [], infowindows = [];
    $(function(){
    	// 주소-좌표 변환 객체를 생성합니다
		geocoder = new daum.maps.services.Geocoder();
    	
   	 	if (navigator.geolocation) {
            //위치 정보를 얻기
            navigator.geolocation.getCurrentPosition(function(pos) {
            	lat = pos.coords.latitude;
            	lng = pos.coords.longitude;
             //	initMap(lng, lat);
            });
        } else {
        	$(".addr").text("알수 없음");
        	getList(depth1, depth2);
        }
   	
    });
    function initMap(lng, lat){
    	var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(lat, lng),
			level: 5,
			maxLevel:5
		};
    	map = new kakao.maps.Map(container, options);
    	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	   	kakao.maps.event.addListener(map, 'idle', function() {
	   		var coords = map.getCenter();
	   		searchAddrFromCoords(coords.getLng(), coords.getLat());
	   	});
    	searchAddrFromCoords(lng, lat);	// 현재 지도 중심좌표로 주소를 검색
    }
	function getList(depth1, depth2){
		$.post('/zlzlza', {'sido' : depth1, 'gugun' : depth2}, function(data, status){
			if(data.list){
				$.each(data.list, function(idx, vo){
					drawMarker(vo);
				});
			}
		});
	}
	function drawMarker(vo){
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(vo.address, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		    	 // 마커 위에 표시할 인포윈도우를 생성한다
				var infowindow = new kakao.maps.InfoWindow({
				    content : '<div class="infoBox"><p>' + vo.companyName + '</p><p>' + vo.openTime + '~' + vo.closeTime + '</p></div>' // 인포윈도우에 표시할 내용
				});

				// 인포윈도우를 지도에 표시한다
				infowindow.open(map, marker);
				infowindows.push(infowindow);
				markers.push(marker);
		    } 
		});    
	}
	
	function delMarkers() {	//마커 초기화
	    for (var i = 0; i < markers.length; i++) {
	        infowindows[i].close();
	        markers[i].setMap(null);
	    }            
	}//
	
    function searchAddrFromCoords(lng, lat, callback) {
    	geocoder.coord2Address(lng, lat, function(data, status){
    		 if (status === kakao.maps.services.Status.OK) {
    			var result = data[0];
    			var search = false;
    			if(result.road_address){
    				var road = result.road_address;
    				if(road.region_1depth_name != depth1) search = true;
    				if(road.region_1depth_name == depth1 && road.region_2depth_name != depth2) search = true;
    				depth1 = road.region_1depth_name;
    				depth2 = road.region_2depth_name;
    			}else{
    				var addr = result.address;
    				if(addr.region_1depth_name != depth1) search = true;
    				if(addr.region_1depth_name == depth1 && addr.region_2depth_name != depth2) search = true;
    				depth1 = addr.region_1depth_name;
    				depth2 = addr.region_2depth_name;
    			}//
    			if(search){
	    			delMarkers();
	    			$(".addr").text(depth1 + ' ' + depth2);
	    			getList(depth1, depth2);
    			}//
    		 }//
    	});// 좌표로 법정동 상세 주소 정보를 요청합니다
    }//
    </script>
</body>
</html>