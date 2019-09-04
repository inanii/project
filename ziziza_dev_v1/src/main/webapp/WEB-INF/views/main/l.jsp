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
    <script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
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
    






<!DOCTYPE html>



<head>
    <title>개인정보처리방침</title>
    <meta content='//t1.kakaocdn.net/kakaocorp/corp_thumbnail/Kakao.png' property='og:image'>
    <link rel="shortcut icon" href="//www.kakao.com/resources/favicon.ico" type="image/x-icon" />
    <script type="text/javascript" src="//www.kakao.com/resources/service/_js/jquery-1.11.3.min.js"></script>
    

    
        
            <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
            <meta name="format-detection" content="telephone=no">
            
                
                
                    <link rel="stylesheet" type="text/css" href="//www.kakao.com/resources/policymo/css/h.css?t_=20171219"/>
                    <link rel="stylesheet" type="text/css" href="//www.kakao.com/resources/policymo/css/font.css?t_=20171219"/>
                
            
            <!--[if lte IE 8]>
            <script src="//m1.daumcdn.net/svc/original/U03/cssjs/sizzle/sizzle-1.10.7.min.js"></script>
            <script src="//m1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>
            <![endif]-->
            <script src="//m1.daumcdn.net/svc/original/U03/cssjs/coco/coco-1.0.25.merged.js"></script>

            <script type="text/javascript">
                $(window).scroll(function() {
                    $(".tit_kakaocorp").addClass("tit_fixed");
                    var scroll = $(window).scrollTop();
                    if (scroll <= 48) {
                        $(".tit_kakaocorp").removeClass("tit_fixed");
                    };
                });
            </script>
        
        
    


    <!-- PC와 동일한 CSS 사용하는 모바일 화면 -->
</head>
<body>
<script>
    $(function(){
        $(document).on("click", "a.btnDownloadPromise", function () {
            $("#frmFileDownload").children("input[name='fileUrl']").val($(this).prop('href'));
            $("#frmFileDownload").submit();
            return false; //this is critical to stop the click event which will trigger a normal file download
        });
    });
</script>
<form id="frmFileDownload" method="POST" action="/download/url">
    <input type="hidden" name="fileUrl" value="">
</form>
    
    
        
            
                <div id="kakaoWrap">
                    <main id="kakaoContent" class="cont_policy">
                        <article id="mArticle">
                            


<hr class="hide">
<script>
    //body 메뉴 선택 펼치기/접기
    function selectBoxClick(e) {
        var $opt_comm = $('.opt_comm');
        if(e){
            $opt_comm = $(e).parent();
        }
        if ( $opt_comm.hasClass( 'opt_open' ) ) {
            //접기
            $opt_comm.removeClass( 'opt_open' );
            $('.ico_corp').text('펼치기');
        } else {
            //펼치기
            $opt_comm.addClass( 'opt_open' );
            $('.ico_corp').text('접기');
        }
        $('.inner_opt li').click(function(){
            if ( $opt_comm.hasClass( 'opt_open' ) ) {
                $opt_comm.removeClass( 'opt_open' );
            }
        });

    }

    // head 메뉴 선택 펼치기/접기
    function headMenuSelect() {
        var $opt_head = $('.opt_head');
        var $span = $('.opt_head > a > span');
        if($opt_head.hasClass('opt_open')){
            $opt_head.removeClass('opt_open');
            $span.text('관련메뉴 펼치기 버튼');
        } else {
            $opt_head.addClass('opt_open');
            $span.text('관련메뉴 접기 버튼');
        }

        //inner_opt
    }
    $( document ).ready( function() {
      //입력 URL 별로  ON Class 변경

        var urlPath = document.location.pathname.split("?");
        if(urlPath != "/") {

            //  2depth이하 메뉴시 접속시  GNB 메뉴 1depth 메뉴로 노출
            urlPath = urlPath.toString();
            if (urlPath.indexOf("/policy/terms/policy/terms?type=s") != -1) {
                urlPath =  "//www.kakao.com/policy/terms?type=t";
            }else if (urlPath.indexOf("/policy/location") != -1) {
                urlPath =  "//www.kakao.com/policy/location";
            }else if (urlPath.indexOf("/policy/privacyPolicy") != -1) {
                urlPath =  "//www.kakao.com/policy/privacy";
            }else if (urlPath.indexOf("/policy/notice") != -1) {
                urlPath =  "//www.kakao.com/notices";
            }

            //list_opt 하위 li class 초기화
            $('.list_opt').children('li').removeClass('on');

            //입력받은 UrlPath와 동일한 li의 value 값에 class를 on 시킴
            $('li[value="'+urlPath+'"]').addClass("on");
        }

    });

</script>
<script type="text/javascript">
    /*    $(window).scroll(function() {
        $(".head_kakaocorp").addClass("head_fixed");
        var scroll = $(window).scrollTop();
        if (scroll <= 48) {
            $(".head_kakaocorp").removeClass("head_fixed");
        };

        //셀렉트 박스
        if (scroll > 120) {
            $(".head_kakaocorp").css('margin-top','-51px');
            $(".opt_comm").addClass('opt_fixed');
        } else {
            $(".head_kakaocorp").css('margin-top','0px');
            $(".opt_comm").removeClass('opt_fixed');
        }

    });*/

</script>




                            



<div class="opt_comm "><!-- 활성화시 opt_open 클래스 추가해주세요~ -->

    
        <a href="#none" class="ico_comm link_selected" id="kakaoPrivacy">
            <span class="screen_out">개인정보처리방침 바로가기 메뉴</span><span aria-hidden="true">지지자 개인정보처리방침</span><span class="ico_corp ico_arrow">펼치기</span><!-- 활성화시 펼치기 -> 접기 텍스트 변경 필요 --><!-- 2019-03-25 수정 -->
        </a>
        <div class="wrap_opt"><!-- 2018-05-03 감싸는 div태그 추가 -->
            <div class="box_opt">
                <div class="inner_opt">
                    <ul class="list_opt">

                        
                            <li class="on"><a href="//www.kakao.com/ko/privacy?type=p&etc=simple" class="link_option">지지자 개인정보처리방침</a></li><!-- 해당메뉴 선택시 on 클래스 추가해주세요 --><!-- 2019-03-25 수정 -->
                            <li><a href="//www.kakao.com/ko/privacy?type=sp&etc=simple" class="link_option">지지자 서비스 개인정보처리방침</a></li>
                        
                        
                    </ul>
                </div>
                <!-- <span class="scroll_bar" style="display:block">                <span class="bg_bar" style="top:0;height:37px"></span>          </span> 2019-03-25 삭제 -->
            </div>
        </div>
    
    
</div>




    <ul class="list_tab" role="tablist">
        <li><a href="#tab1" class="link_tab" role="tab" aria-selected="true">1. 개인정보 처리방침</a><!-- 활성화시 aria-selected 값 "true" 넣어주세요 --></li>
        <li><a href="#tab2" class="link_tab" role="tab" aria-selected="false">2. 개인정보 수집</a></li>
        <li><a href="#tab3" class="link_tab" role="tab" aria-selected="false">3. 개인정보 이용</a></li>
        <li><a href="#tab4" class="link_tab" role="tab" aria-selected="false">4. 개인정보 제공</a></li>
        <li><a href="#tab5" class="link_tab" role="tab" aria-selected="false">5. 개인정보 파기</a></li>
        <li><a href="#tab6" class="link_tab" role="tab" aria-selected="false">6. 기타사항</a></li>
    </ul>

<div class="wrap_policy wrap_policy2">
    <div id="tab1" class="area_cont">
        <h4 class="tit_corp">1. 개인정보 처리방침이란?</h4>
        <p class="desc_g">
            주식회사 지지자(이하"회사")는 이용자의 ‘동의를 기반으로 개인정보를 수집·이용 및 제공’하고 있으며, ‘이용자의 권리 (개인정보 자기결정권)를 적극적으로 보장’합니다.<br/><br/>회사는 정보통신서비스제공자가 준수하여야 하는 대한민국의 관계 법령 및 개인정보보호 규정, 가이드라인을 준수하고 있습니다.<br/><br/>“개인정보처리방침”이란 이용자의 소중한 개인정보를 보호함으로써 이용자가 안심하고 서비스를 이용할 수 있도록 회사가 준수해야 할 지침을 의미합니다.<br/><br/>본 개인정보처리방침은 회사가 제공하는 지지자계정 기반의 서비스(이하 ‘서비스'라 함)에 적용됩니다.
        </p>
    </div>
    <div id="tab2" class="area_cont">
        <h4 class="tit_corp">2. 개인정보 수집</h4>
        <strong class="tit_rules">서비스 제공을 위한 필요 최소한의 개인정보를 수집하고 있습니다.</strong>
        <p class="desc_g">회원 가입 시 또는 서비스 이용 과정에서 홈페이지 또는 개별 어플리케이션이나 프로그램 등을 통해 아래와 같은 서비스 제공을 위해 필요한 최소한의 개인정보를 수집하고 있습니다.</p>
        <strong class="tit_group">[지지자계정]</strong>
        <em class="emph_group">필수</em>
        <p class="desc_group">이메일, 비밀번호, 이름(닉네임), 프로필사진, 친구목록, 카카오톡 전화번호(카카오톡 이용자의 경우에 한함), 연락처, 서비스 이용내역, 서비스 내 구매 및 결제 내역</p>
        <em class="emph_group">선택</em>
        <p class="desc_group">생년월일, 성별, 배송지정보(수령인명, 배송지 주소, 전화번호)</p>
        <strong class="tit_group">[본인인증 시]</strong>
        <p class="desc_group">이름, 성별, 생년월일, 휴대폰번호, 통신사업자, 내/외국인 여부, 암호화된 이용자 확인값(CI), 중복가입확인정보(DI)</p>
        <strong class="tit_group">[유료서비스 이용 시]</strong>
        <p class="desc_group">
            신용카드 결제 시: 카드번호(일부), 카드사명 등<br>
            휴대전화번호 결제 시: 휴대전화번호, 결제승인번호 등<br>
            계좌이체 시: 예금주명, 계좌번호, 계좌은행 등<br/>
            상품권 이용 시: 상품권 번호, 해당 사이트 아이디
        </p>
        <strong class="tit_group">[환불처리 시]</strong>
        <p class="desc_group">계좌은행, 계좌번호, 예금주명</p>
        <strong class="tit_group">[현금영수증 발행 시]</strong>
        <p class="desc_group">휴대폰번호, 현금영수증 카드번호</p>
        <p class="desc_g">일부 서비스에서는 특화된 여러 기능들을 제공하기 위해 ‘카카오계정’에서 공통으로 수집하는 정보 이외에 이용자에게 동의를 받고<br>추가적인 개인정보를 수집할 수 있습니다.</p>
        <ul class="list_2depth list_2depth_type3">
            <li><em class="emph_g">필수정보란?</em>
                <br/>: 해당 서비스의 본질적 기능을 수행하기 위한 정보</li>
            <li><em class="emph_g">선택정보란?</em>
                <br/>: 보다 특화된 서비스를 제공하기 위해 추가 수집하는 정보 (선택 정보를 입력하지 않은 경우에도 서비스 이용 제한은 없습니다.)</li>
        </ul>



        
            <a href="//www.kakao.com/policy/privacyPolicy/collectSeparately?type=kakao&lang=ko" class="btn_info" >서비스에서 별도로 수집하는 개인정보 항목 자세히 보기<span class="ico_corp ico_arr"></span></a>
            <a href="//www.kakao.com/policy/privacyPolicy/policyPrivacyCenter?lang=ko" class="btn_info" >고객상담을 위해 추가 수집하는 개인정보 항목 자세히 보기<span class="ico_corp ico_arr"></span></a>
        
        


        <strong class="tit_rules">개인정보를 수집하는 방법은 다음과 같습니다.</strong>
        <p class="desc_g">개인정보를 수집하는 경우에는 반드시 사전에 이용자에게 해당 사실을 알리고 동의를 구하고 있으며, 아래와 같은 방법을 통해 개인정보를 수집합니다.</p>
        <ul class="list_2depth list_2depth_type3">
            <li>회원가입 및 서비스 이용 과정에서 이용자가 개인정보 수집에 대해 동의를 하고 직접 정보를 입력하는 경우</li>
            <li>제휴 서비스 또는 단체 등으로부터 개인정보를 제공받은 경우</li>
            <li>고객센터를 통한 상담 과정에서 웹페이지, 메일, 팩스, 전화 등</li>
            <li>온·오프라인에서 진행되는 이벤트/행사 등 참여</li>
        </ul>
        <strong class="tit_rules">서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.</strong>
        <p class="desc_g">PC웹, 모바일 웹/앱 이용 과정에서 단말기정보(OS, 화면사이즈, 디바이스 아이디, 폰기종, 단말기 모델명), IP주소, 쿠키, 방문일시, 부정이용기록, 서비스 이용 기록 등의 정보가 자동으로 생성되어 수집될 수 있습니다.</p>
        <strong class="tit_rules">서비스 간 제휴, 연계 등으로 제3자로부터 개인정보를 제공받고 있습니다.</strong>

        
            <a href="http://www.kakao.com/policy/privacyPolicy/providedInfo?lang=ko" class="btn_info" >제공받는 개인정보 항목 자세히 보기<span class="ico_corp ico_arr"></span></a>
        
        

    </div>
    <div id="tab3" class="area_cont">
        <h4 class="tit_corp">3. 개인정보 이용</h4>
        <strong class="tit_rules">
            회원관리, 서비스 제공·개선, 신규 서비스 개발 등을 위해 이용합니다. </br>
            회원 가입 시 또는 서비스 이용 과정에서 홈페이지 또는 개별 어플리케이션이나 프로그램 등을 통해 아래와 같이 서비스 제공을 위해 필요한 최소한의 개인정보를 수집하고 있습니다.
        </strong>
        <ul class="list_2depth list_2depth_type3">
            <li>회원 식별/가입의사 확인, 본인/연령 확인, 부정이용 방지</li>
            <li>만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 법정 대리인 권리행사 시 본인 확인</li>
            <li>이용자간 메시지 전송, 친구등록 및 친구추천 기능의 제공</li>
            <li>친구에게 활동내역을 알리거나 이용자 검색, 등록 등의 기능 제공</li>
            <li>신규 서비스 개발, 다양한 서비스 제공, 문의사항 또는 불만처리, 공지사항 전달</li>
            <li>유료서비스 이용 시 컨텐츠 등의 전송이나 배송·요금 정산</li>
            <li>서비스의 원활한 운영에 지장을 주는 행위(계정 도용 및 부정 이용 행위 등 포함)에 대한 방지 및 제재</li>
            <li>인구통계학적 특성과 이용자의 관심, 기호, 성향의 추정을 통한 맞춤형 컨텐츠 추천 및 <em class="emph_g">마케팅에 활용</em></li>
            <li>음성명령 인식 및 개인화 서비스 제공</li>
            <li>서비스 이용 기록, 접속 빈도 및 서비스 이용에 대한 통계, 프라이버시 보호 측면의 서비스 환경 구축, 서비스 개선에 활용</li>
        </ul>
    </div>
    <div id="tab4" class="area_cont">
        <h4 class="tit_corp">4. 개인정보 제공</h4>
        <strong class="tit_rules">카카오는 이용자의 별도 동의가 있는 경우나 법령에 규정된 경우를 제외하고는 이용자의 개인정보를 제3자에게 제공하지 않습니다.</strong>
        <strong class="tit_rules">제3자 서비스와의 연결을 위해 아래와 같이 개인정보를 제공하고 있습니다.</strong>
        <p class="desc_g">카카오는 이용자의 사전 동의 없이 개인정보를 제3자에게 제공하지 않습니다. 다만, 이용자가 외부 제휴사 등의 서비스를 이용하기 위하여 필요한 범위 내에서 이용자의 동의를 얻은 후에 개인정보를 제3자에게 제공하고 있습니다.</p>


        
            <a href="//www.kakao.com/policy/privacyPolicy/informationThirdParty?lang=ko" class="btn_info">개인정보 제3자 제공 현황 자세히 보기<span class="ico_corp ico_arr"></span></a>
        
        




        <strong class="tit_rules">서비스 제공을 위해 아래와 같은 업무를 위탁하고 있습니다.</strong>
        <p class="desc_g">서비스 제공에 있어 필요한 업무 중 일부를 외부 업체로 하여금 수행하도록 개인정보를 위탁하고 있습니다. 그리고 위탁 받은 업체가 관계 법령을 준수하도록 관리·감독하고 있습니다.</p>


        
            <a href="//www.kakao.com/policy/privacyPolicy/policyPrivacyBusiness?lang=ko" class="btn_info">개인정보 위탁업체 자세히 보기<span class="ico_corp ico_arr"></span></a>
        
        

        <p class="desc_g">개인정보 처리위탁 중 국외에서 처리하는 위탁업무는 아래와 같습니다.</p>


        
            <a href="//www.kakao.com/policy/privacyPolicy/privacyBusinessTransfer?lang=ko" class="btn_info">개인정보 국외이전 위탁업체 자세히 보기<span class="ico_corp ico_arr"></span></a>
        
        



    </div>
    <div id="tab5" class="area_cont">
        <h4 class="tit_corp">5. 개인정보 파기</h4>
        <strong class="tit_rules">개인정보는 수집 및 이용목적이 달성되면 지체없이 파기하며, 절차 및 방법은 아래와 같습니다.</strong>
        <p class="desc_g">
            전자적 파일 형태인 경우 복구 및 재생되지 않도록 안전하게 삭제하고, 그 밖에 기록물, 인쇄물, 서면 등의 경우 분쇄하거나 소각하여 파기합니다.<br><br>
            다만, 내부 방침에 따라 일정 기간 보관 후 파기하는 정보는 아래와 같습니다.
        </p>
        <ul class="list_article article_type2">
            <li>아래 정보는 탈퇴일부터 최대 1년간 보관 후 파기합니다.
                <ul class="list_2depth">
                    <li>안내메일 발송 및 CS문의 대응을 위해 카카오계정과 탈퇴안내 이메일 주소를 암호화하여 보관</li>
                    <li>서비스 부정이용 기록</li>
                </ul>
            </li>
            <li>아래 정보는 프로젝트 모금함 최종 종료일부터 3년 경과 후 파기합니다.(단, 미선정의 경우, 미선일로부터 90일 경과 후 파기)
                <ul class="list_2depth">
                    <li>카카오같이가치 &gt; 지원대상 선정 시 수집한 증빙서류</li>
                </ul>
            </li>
            <li>아래 정보는 멜론 서비스 내부 방침에 따라 회원정보 변경에 따른 민원 대응 후 5년 경과 후 파기합니다.
                <ul class="list_2depth">
                    <li>보유기간 : 회원정보 변경 후 5년간</li>
                    <li>보유정보 : 회원정보 변경 발생 이력</li>
                </ul>
            </li>
        </ul>
        <p class="desc_g">
            또한, 카카오는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관 또는 삭제하고 있으며, 분리 보관된 개인정보는 4년간 보관 후 지체없이 파기합니다. <br><br>이 외에 법령에 따라 일정기간 보관해야 하는 개인정보 및 해당 법령은 아래 표와 같습니다.
        </p>
        
            <a href="//www.kakao.com/location_term_purpose?lang=ko" class="btn_info" >관계법령에 따른 개인정보 보관 자세히 보기<span class="ico_corp ico_arr"></span></a>
        
        
    </div>
    <div id="tab6" class="area_cont">
        <h4 class="tit_corp">6. 기타</h4>
        <strong class="tit_rules">카카오는 여러분의 권리를 보호합니다.</strong>
        <p class="desc_g">
            이용자(만 14세 미만인 경우 법정 대리인)는 언제든지 자신의 개인정보를 조회하거나 수정할 수 있으며, 수집・이용에 대한 동의 철회 또는 가입 해지를 요청할 수 있습니다.<br/>
            <br><br>보다 구체적으로는 서비스 내 설정을 통한 회원정보 수정 기능이나 회원탈퇴 기능을 이용할 수 있고, 고객센터를 통해 서면, 전화 또는 이메일로 요청하시면 지체 없이 조치하겠습니다.<br/><br>
            개인정보의 오류에 대한 정정을 요청하신 경우 정정을 완료하기 전까지 해당 개인정보를 이용 또는 제공하지 않습니다.<br><br>
            또한, '온라인 맞춤형 광고 개인정보보호 가이드 라인'에 따른 이용자 권리보호를 위한 페이지도 제공하고 있습니다.
        </p>


        
        <a href="http://info.ad.daum.net/optout.do" class="btn_info" >맞춤형 광고소개 및 거부방법 자세히 보기
            
            



                <span class="ico_corp ico_arr"></span></a>


            <strong class="tit_rules">웹기반 서비스의 제공을 위하여 쿠키를 이용하는 경우가 있습니다.</strong>
            <p class="desc_g">쿠키는 보다 빠르고 편리한 웹사이트 사용을 지원하고 맞춤형 서비스를 제공하기 위해 사용됩니다.</p>
            <strong class="tit_group">쿠키란?</strong>
            <p class="desc_group">웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에 보내는 아주 작은 텍스트 파일로서 이용자 컴퓨터에 저장됩니다.</p>
            <strong class="tit_group">사용목적</strong>
            <p class="desc_group">개인화되고 맞춤화된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 쿠키를 사용합니다. 이용자가 웹사이트에 방문할 경우 웹 사이트 서버는 이용자의 디바이스에 저장되어 있는 쿠키의 내용을 읽어 이용자의 환경설정을 유지하고 맞춤화된 서비스를 제공하게 됩니다. 쿠키는 이용자가 웹 사이트를 방문할 때, 웹 사이트 사용을 설정한대로 접속하고 편리하게 사용할 수 있도록 돕습니다. 또한, 이용자의 웹사이트 방문 기록, 이용 형태를 통해서 최적화된 광고 등 맞춤형 정보를 제공하기 위해 활용됩니다.</p>
            <strong class="tit_group">쿠키 수집 거부</strong>
            <p class="desc_group">쿠키에는 이름, 전화번호 등 개인을 식별하는 정보를 저장하지 않으며, 이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 이용자는 웹 브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 쿠키 설치를 거부할 경우 웹 사용이 불편해지며, 로그인이 필요한 일부 서비스 이용에 어려움이 있을 수 있습니다.</p>
            <strong class="tit_group">설정 방법의 예</strong>
            <ul class="list_2depth_type1">
                <li><em class="emph_g">1) Internet Explorer의 경우</em>
                    <p class="desc_group">웹 브라우저 상단의 도구 메뉴 &gt; 인터넷 옵션 &gt; 개인정보 &gt; 설정</p>
                </li>
                <li><em class="emph_g">2) Chrome의 경우</em>
                    <p class="desc_group">웹 브라우저 우측의 설정 메뉴 &gt; 화면 하단의 고급 설정 표시 &gt; 개인정보의 콘텐츠 설정 버튼 &gt; 쿠키</p>
                </li>
            </ul>
            <!-- 2018-07-06 추가 시작 -->
            <strong class="tit_rules">카카오는 유럽연합 일반 개인정보보호법(General Data Protection Regulation) 및 각 회원국의 법률을 준수합니다.</strong>
            <p class="desc_g">
                유럽연합 내 이용자를 대상으로 서비스를 제공하는 경우, 아래 내용이 적용될 수 있습니다.
            </p>
            <strong class="tit_terms">[개인정보 처리의 목적 및 처리근거]</strong>
            <p class="desc_group">
                카카오는 수집한 개인정보를 "3. 개인정보의 이용"에 기재된 목적으로만 이용하며, 사전에 이용자에게 해당 사실을 알리고 동의를 구하고 있습니다. <br>
                그리고 GDPR 등 적용되는 법률에 따라, 카카오는 아래 하나에 해당하는 경우에 이용자의 개인정보를 처리할 수 있습니다.
            </p>
            <ul class="list_2depth list_2depth_type3">
                <li>정보주체의 동의</li>
                <li>정보주체와의 계약의 체결 및 이행을 위한 경우</li>
                <li>법적 의무사항 준수를 위한 경우</li>
                <li>정보주체의 중대한 이익을 위해 처리가 필요한 경우</li>
                <li>회사의 적법한 이익 추구를 위한 경우(정보주체의 이익과 권리 또는 자유가 그 이익보다 중요한 경우는 제외)</li>
            </ul>
            <strong class="tit_terms">[유럽연합 내 이용자의 권리 보장]</strong>
            <p class="desc_group">
                카카오는 &#34;여러분의 권리를 보호합니다&#34;에서 알린 바와 같이, 이용자의 개인정보를 소중하게 보호합니다. GDPR 등 적용되는 법률에 따라, 이용자는 자신의 개인정보를 다른 관리자에게 이전해 달라고 요청할 수 있고, 자신의 정보 처리 거부를 요청 할 수 있습니다. 그리고 이용자는 개인정보보호 권한 당국에 불만을 제기할 권리가 있습니다.<br><br>
                또한, 카카오는 이벤트 및 광고 등 마케팅을 제공하기 위해 개인정보를 활용할 수 있으며, 사전에 이용자의 동의를 구하고 있습니다. 이용자는 원하지 않은 경우 언제든지 동의를 철회할 수 있습니다.<br><br>
                위와 관련한 요청사항은 고객센터를 통해 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.<br><br>
                개인정보의 오류에 대한 정정을 요청하신 경우 정정을 완료하기 전까지 해당 개인정보를 이용 또는 제공하지 않습니다.
            </p>
            <!-- 2018-07-06 추가 끝 -->
            <strong class="tit_group">개인정보보호와 관련해서 궁금하신 사항은?</strong>
            <p class="desc_g">서비스를 이용하면서 발생하는 모든 개인정보보호 관련 문의, 불만, 조언이나 기타 사항은 개인정보 보호책임자 및 담당부서로 연락해 주시기 바랍니다. 카카오는 여러분의 목소리에 귀 기울이고 신속하고 충분한 답변을 드릴 수 있도록 최선을 다하겠습니다.</p>
            <strong class="tit_terms">개인정보보호 책임자(CPO, DPO) 및 담당부서</strong>
            <ul class="list_2depth list_2depth_type2">
                <li>책임자: 강성</li>
                <li>담당부서: 개인정보보호파트</li>
                <li>문의 :<br>카카오 고객센터 : 1577-3357<br>멜론 고객센터 : 1566-7727</li>
            </ul>
            <p class="desc_g">또한 개인정보가 침해되어 이에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하셔서 도움을 받으실 수 있습니다.</p>
            <div class="terms_list">
                <div class="bundle_terms">
                    <strong class="tit_terms">개인정보침해 신고센터</strong>
                    <ul class="list_2depth list_2depth_type3">
                        <li>(국번없이)118</li>
                        <li>
                            
                                <a href="//privacy.kisa.or.kr" class="link_item" >https://privacy.kisa.or.kr</a>
                            
                            
                        </li>
                    </ul>
                </div>
                <div class="bundle_terms">
                    <strong class="tit_terms">대검찰청 사이버수사과</strong>
                    <ul class="list_2depth list_2depth_type3">
                        <li>(국번없이)1301</li>
                        <li>
                            
                                <a href="mailto:cid@spo.go.kr" class="link_item">cid@spo.go.kr</a>
                            
                            
                        </li>
                    </ul>
                </div>
                <div class="bundle_terms">
                    <strong class="tit_terms">경찰청 사이버안전국</strong>
                    <ul class="list_2depth list_2depth_type3">
                        <li>(국번없이)182</li>
                        <li>
                            
                                <a href="//cyberbureau.police.go.kr" class="link_item" >https://cyberbureau.police.go.kr</a>
                            
                            
                        </li>
                    </ul>
                </div>
            </div>
            <strong class="tit_terms">개인정보처리방침이 변경되는 경우</strong>
            <p class="desc_g">
                법률이나 서비스의 변경사항을 반영하기 위한 목적 등으로 개인정보처리방침을 수정할 수 있습니다. 개인정보처리방침이 변경되는 경우 카카오는 변경 사항을 게시하며, 변경된 개인정보처리방침은 게시한 날로부터 7일 후부터 효력이 발생합니다.  <br>다만, 수집하는 개인정보의 항목, 이용목적의 변경 등과 같이 이용자 권리의 중대한 변경이 발생할 때에는 최소 30일 전에 미리 알려드리겠습니다.
            </p>
            <ul class="list_2depth list_2depth_type3">
                <li>공고일자: 2019년 07월 02일</li>
                <li>시행일자: 2019년 07월 09일</li>
            </ul>
            <a href="//www.kakao.com/policy/privacy/kakaoPrivacyPolicy/history/20190611;jsessionid=00C63E9044AFD943DED0D4A03A447914?lang=ko"  class="btn_info">변경 전 개인정보 처리방침 보기<span class="ico_corp ico_arr"></span></a>
            <p class="desc_g">카카오는 이용자 여러분의 정보를 소중히 생각하며, 이용자가 더욱 안심하고 서비스를 이용할 수 있도록 최선의 노력을 다할것을 약속드립니다.</p>
            
    </div>
</div>
<script type="text/javascript">
    $("#kakaoPrivacy").click(function(){

        if($(this).parent().hasClass('opt_open')){
            $(this).parent().removeClass('opt_open');
        }
        else{
            $(this).parent().addClass('opt_open');
        }
    });
</script>

                        </article>
                    </main>
                </div>
            
            
        
        
    
</body>
</html>

<script>
    // PC, Mobile 공통 스크립트
    $( document ).ready( function() {

        // 검색박스 이벤트
        if (document.getElementById('search_word') != null) {
            if (document.getElementById('search_word').value.length > 0) {
                document.getElementsByClassName('sch_comm')[0].classList.add('sch_on');
            } else {
                document.getElementsByClassName('sch_comm')[0].classList.remove('sch_on');
            }

            document.getElementById('search_word').addEventListener('focus', function (event) {
                document.getElementsByClassName('sch_comm')[0].classList.add('sch_on');
            });

            document.getElementById('search_word').addEventListener('blur', function (event) {
                if (document.getElementById('search_word').value.length <= 0) {
                    document.getElementsByClassName('sch_comm')[0].classList.remove('sch_on');
                }
            });
        }
    });

</script>
    
    
    
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
