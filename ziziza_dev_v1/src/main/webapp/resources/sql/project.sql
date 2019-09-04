-- --------------------------------------------------------
-- 호스트:                          192.168.0.182
-- 서버 버전:                        5.7.27-0ubuntu0.16.04.1 - (Ubuntu)
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- project 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `project`;

-- 테이블 project.BOARD 구조 내보내기
CREATE TABLE IF NOT EXISTS `BOARD` (
  `board_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시물고유번호',
  `board_code` varchar(15) NOT NULL COMMENT '게시판명',
  `title` varchar(120) NOT NULL COMMENT '제목',
  `contents` text NOT NULL COMMENT '내용',
  `e_start_date` date DEFAULT NULL COMMENT '이벤트시작일',
  `e_end_date` date DEFAULT NULL COMMENT '이벤트종료일',
  `regist_date` date NOT NULL COMMENT '등록일',
  `modify_date` date DEFAULT NULL COMMENT '수정일',
  `hit` int(11) DEFAULT '0' COMMENT '조회수',
  `state` char(1) NOT NULL COMMENT '''Y'', ''N''',
  `member_no` int(11) NOT NULL COMMENT '등록자',
  `modify_no` int(11) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`board_no`),
  UNIQUE KEY `board_no` (`board_no`),
  KEY `member_no` (`member_no`),
  CONSTRAINT `BOARD_ibfk_1` FOREIGN KEY (`member_no`) REFERENCES `MEMBER` (`member_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project.BOARD:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `BOARD` DISABLE KEYS */;
INSERT INTO `BOARD` (`board_no`, `board_code`, `title`, `contents`, `e_start_date`, `e_end_date`, `regist_date`, `modify_date`, `hit`, `state`, `member_no`, `modify_no`) VALUES
	(2, 'NOTICE', '사장님을 위한 사장님 전용 사이트가 오픈했습니다.', '사장님 사이트에서는 업소 등록부터 업소 정보 관리/리뷰 관리까지 \r\n업소에 대한 모든 정보를 확인할 수 있습니다.', NULL, NULL, '2019-08-14', '2019-08-14', 4, 'Y', 1, 1),
	(3, 'NOTICE', '서비스 점검 안내', '서버 안정화 작업\r\n일정 : 2019-08-15 00:00 ~ 2019-08-16 02:00', NULL, NULL, '2019-08-14', '2019-08-14', 3, 'Y', 1, 1),
	(4, 'NOTICE', '서비스 이용에 불편을 드려 죄송합니다.', '앞으로, 동일한 문제가 발생하지 않도록 시스템에 대한 보완작업을 지속적으로 진행해, 서비스 이용에 불편함을 드리지 않도록 최선을 다하겠습니다.', NULL, NULL, '2019-08-14', '2019-08-14', 2, 'Y', 1, 1),
	(5, 'NOTICE', '이용약관 및 개인정보취급방침 개정 안내', '서비스이용약관 및 개인정보취급방침이 개정될 예정입니다.\r\n\r\n서비스 이용시 참고하시기 바랍니다.\r\n\r\n \r\n- 개정 적용 일자 : 2016년 3월 1일', NULL, NULL, '2019-08-14', '2019-08-14', 7, 'Y', 1, 1),
	(6, 'COMMUNITY', '오늘의 아침은 아이스 아메리카노', '요즘 너무 졸아서 한잔 먹고 정신차리자!\r\n\r\n오후에 또 자겠지.. 그놈의 식곤증', NULL, NULL, '2019-08-14', NULL, 6, 'Y', 3, NULL),
	(7, 'EVENT', '신규 회원 경품 이벤트', '대상 : 서비스 오픈 이후 신규회원 전체\r\n\r\n기간 : 2019-08-09 ~ 2019-08-31', '2019-08-19', '2019-08-31', '2019-08-14', '2019-08-14', 4, 'Y', 1, 1),
	(8, 'COMMUNITY', '찜질방 이용법', '&quot;한번에 30분 이상 넘기지말라&quot; 찜질방 건강법! \n\n찜질방족이라는 신조어가 생길 만큼 찜질방이 하나의 건강문화 코드로 자리잡고 있다. 그러나 막연히 몸에 좋겠지 하는 생각은 있어도 효과와 적절한 이용법에 대해서는 모르는 경우가 많다. 찜질이 건강에 미치는 영향과 효과 높이는 이용법을 알아봤다. (편집자주) \n\n찜질방은 뜨거운 공기를 이용해 땀을 내는 열기욕이란 점에서 사우나, 한증막과 비슷하다. 내부온도는 찜질방 40&sim;50℃, 건식 사우나 70&sim;100℃, 한증막 70&sim;130℃로 찜질방이 가장 낮다. \n\n찜질방이 사우나, 한증막과 다른 점은 원적외선이 방출된다는 점이다. 700℃ 이상 고온으로 달궈진 찜질방의 황토, 맥반석, 온돌, 게르마늄 등에서 나온 원적외선이 피부 안쪽 4&sim;5cm까지 침투해 세포운동 및 혈액순환까지 활발하게 해준다. \n\n찜질방을 이용하고 나면 뻐근했던 몸이 개운해지는 느낌이 드는 것도 이 때문이다. 찜질방의 원적외선 요법은 사우나에서 장시간 인내하며 땀을 흘리는 것보다도 더 효율적이며 편하고 훨씬 오랫동안 온열효과를 얻을 수 있다. \n\n\n혈액순환이 좋아져 피부미용에 효과 \n\n찜질방에서 땀을 흘리면 혈액순환이 좋아져 피부가 매끄러워진다. 이는 온도가 올라가면서 모세혈관이 열리고 혈류의 흐름이 좋아지는 효과에 땀샘이 활발히 활동해 몸에 쌓여 있는 노폐물이 배출되기 때문이다. \n\n하지만 고온에서 오랜 시간 땀을 흘리면 몸의 수분이 지나치게 많이 빠져나가 오히려 피부가 갈라지고 트는 등의 역효과가 날 수 있다는 점에 주의하자. 따라서 찜질방에 들어가서 1회에 길어도 20&sim;30분을 넘기지 말고 또 적절히 수분을 공급해 주는 것이 좋다. \n\n\n근육통, 어깨결림 등 통증이 줄어든다 \n\n원적외선은 파장이 길어 열에너지가 피부조직을 뚫고 깊이 스며들어 신진대사를 활발히 하면서 뭉쳐 있던 근육이 풀어져 근육통, 어깨결림, 관절통 등 통증이 줄어드는 효과가 뛰어나다. 찜질을 하면서 가벼운 스트레칭을 해주면 더 큰 효과를 볼 수 있다. \n\n또 아픈 신체 부위를 뜨끈뜨근한 온돌에 대고 누우면 그 부위의 혈액순환이 활발해져 통증을 완화시키는 효과를 볼 수 있다. 하지만 너무 뜨거운 곳에 환부를 대고 있으면 화상을 입을 위험도 있으므로 주의해야 한다. \n\n\n적정 체온 유지시켜 냉증에 효과 \n\n신진대사가 활발해지면서 혈행의 흐름이 좋아져 모세혈관이 확장되는데 이는 찜질방의 온도가 사람의 정상 체온보다 높기 때문이다. 때문에 체온을 적정하게 유지시켜 냉증이 있는 사람도 손과 발까지 따뜻해지는 효과를 볼 수 있다. \n\n단 너무 온도가 높은 곳보다는 60℃ 정도의 낮은 곳을 골라 5분 정도 있다가 다시 밖으로 나오는 것을 2&sim;3회 반복해야 효과를 볼 수 있다. 하지만 고온에 장시간 있는 것과 준비 없이 바로 찜질방에 들어가는 것은 심장에 부담을 줄 수 있으므로 삼가야 한다. \n\n\n푹 잠들 수 있다 \n\n원적외선의 영향으로 손발이 더워져 말초신경까지 혈액순환이 활발해지기 때문에 호르몬 분비가 일정하게 이루어져 신경이 안정되면서 숙면을 취할 수 있게 되는 것으로 알려져 있다. 특히 저온의 찜질방에서 땀을 빼고 열을 식힌 후 잠자리에 들면 깊고 편안한 숙면을 취할 수 있다. \n\n\n몸 안에 쌓여 있는 노폐물이 배출된다 \n\n체내에 흡수된 원적외선은 온열작용을 일으키고 피지선이 직접 자극되어 몸 속에 고여 있는 염분과 함께 납, 카드뮴 등 중금속을 몸밖으로 밀어내주는 역할을 한다. 쌓여 있던 노폐물이 없어지면서 자연히 몸은 제 컨디션을 되찾고 심신의 피로가 회복되는 효과를 볼 수 있다. \n\n\n찜질방 건강한 이용법! &quot;1회에 20~30분 정도, 안에서는 급격한 운동 삼가야 &quot; \n\n사람마다 체질이 달라 적절한 이용시간을 단정지을 수는 없지만 지치거나 피로한 느낌이 들면 바로 나오는 게 좋다. 보통 1회에 최대 20&sim;30분 정도가 바람직하다. 찜질방을 나온 뒤에도 최소 30분에서 1시간 정도 휴식을 취해야 한다. 5분 정도 찜질방을 이용하고 10분 정도 휴게실에서 쉬는 것을 3&sim;4회 정도 반복하는 것도 괜찮은 방법. \n\n찜질방에 들어가면 자세를 바로 하고 눈을 뜬 채로 천천히 배로 숨을 쉬는 복식호흡을 하는 게 좋다. 뛰어다니거나 게임을 하는 등의 활발한 움직임은 심장 박동을 급격히 증가시킬 수 있으므로 삼가는 것이 좋다. 또 잠을 자거나 책을 읽게 되면 피로감 등 신체에서 나타나는 증상을 놓칠 수 있으므로 피해야 한다. \n\n임신중이거나 술을 마신 뒤 숙취 해소를 위해 찜질방을 찾는 행위는 절대 금물. 임산부의 경우 체온이 올라가면 태아에 큰 위험을 줄 수 있으며 심하면 유산까지 할 수 있다. \n\n술을 마실 경우 몸 안에 수분이 부족해지므로 땀을 심하게 빼는 것은 위험하다. 술 마신 뒤 최소한 2시간 이내에는 이용하지 않는 게 좋다. 평소에 심장병이나 고혈압 증상이 있다면 찜질방 이용에 주의해야 한다. \n\n찜질 효과 100% 높이는 이용법을 찾아라! \n\n수시로 물을 마신다: 찜질방에서 땀을 많이 빼려는 목적으로 물을 입에도 안 대는 경우가 종종 있다. 그러나 이는 매우 위험한 일이다. 몸의 수분이 빠져나가 탈수증상이 나타날 수 있기 때문이다. 약간이라도 목이 마르다고 느낄 때마다 물을 마시는 것이 좋다. \n\n한 번에 마시는 물의 양은 사람에 따라 다르지만 보통 200㎖짜리 컵으로 1/4에서 1/2정도면 적당하다. 만약 찜질방 이용중 어지러움을 느끼게 되면 즉시 중단해야 한다. 이는 탈수증의 초기증상일 수 있기 때문이다. 바로 충분한 수분을 공급하고 휴식을 취해주어야 한다. \n\n수분 보충은 생수가 좋다:갈증으로 인한 수분 보충은 물이 좋다. 특히 미네랄 성분이 풍부한 생수가 갈증을 해소하고 몸에서 빠져나간 무기질을 보충할 수 있다. 또 전해질 음료도 좋은데 약간의 소금성분이 들어 있어 탈수를 예방하기 때문. 대표적인 것은 이온음료를 들 수 있다. 하지만 이온음료의 경우 농도가 진하기 때문에 자주 마시면 이 역시 갈증을 초래할 수 있다는 점도 잊지 말자. \n\n찜질방 내에서 종종 몸의 부족한 수분을 보충한다고 맥주나 식혜 같은 음료를 마시는 경우가 많은데, 사실 이는 별 도움이 되지 못한다. 일시적으로 수분이 보충되는 듯하지만 알코올 성분이나 높은 당도는 분해되면서 오히려 갈증을 유발하기 때문. 또 칼로리 역시 높아 오히려 살이 찔 우려도 적지 않다. \n\n얼굴과 머리는 찬 수건으로 감싸준다: 맥반석, 옥, 황토 등의 발열물질에 너무 가까이 있거나 장시간 직접 피부를 노출시키는 것은 좋지 않다. \n\n특히 피부손상이 쉬운 얼굴과 머리카락을 찬 물수건으로 가리고 뜨거운 쪽을 등지고 앉는 게 좋다. 발열물질에서 떨어져 앉는다고 해서 찜질방의 효과가 사라지는 것이 아니므로 안전을 위해서 되도록 멀찌감치 있는 것이 좋다. \n\n한 번 이용할 때 찜질 횟수는 3회 정도:사람의 건강상태와 컨디션에 따라 차이기 있긴 하지만 찜질방에서 땀을 빼는 횟수는 1주일에 1&sim;2회, 한 번 이용할 때마다 3회가 적당하다. 너무 자주 땀을 빼면 탈수가 심해져 피부가 오히려 건조해지는 증상이 나타날 수 있기 때문이다. \n\n또한 한번 할 때마다 찜질방에 머무르는 시간은 초보자나 허약한 사람은 5분, 경험이 많더라도 30분을 넘기지 않는 것이 적당하다. 휴식은 찜질방에 있었던 시간만큼 취해주는 것이 좋다. \n\n찜질 후에는 미지근한 물로 샤워를 한다:맥반석이나 게르마늄 등의 방사물질을 쬐며 찜질을 한 뒤 최소한 2시간 후에는 샤워를 해야 한다. 이때 열에 의해 피부가 달아오른 상태이므로 미지근한 물로 샤워를 하는 게 피부손상을 최대한 줄이는 방법. \n\n또 알칼리성 비누나 때수건을 사용하지 말고 물이나 적은 양의 중성비누로 살살 마사지하듯 씻어내는 게 좋다. 또 샤워 후에는 보습제를 꼼꼼히 발라주고 얼굴에는 감자, 오이, 꿀 등 미용팩을 사용해 달아오른 피부와 넓어진 모공을 진정시켜 주도록 한다. ', NULL, NULL, '2019-08-14', NULL, 5, 'Y', 4, NULL),
	(9, 'COMMUNITY', '찜질방 효능과 주의사항', '찜질방에는 몸의 피로를 풀기 위해 땀을 빼는 사람들로 성황을 이룬다. 찜질방은 혈액순환과 신진대사 촉진, 만성피로 해소 등 각종 통증 완화와 숙면 등에 도움이 되며, 무엇보다. 원적외선이 방출되기 때문에 온열효과가 좋은 것이 특징이다. \r\n\r\n \r\n찜질할 때 제일 중요한 것은 수분 보충이라 할 수 있는데, 찜질하기 전 충분히 물을 마셔 몸속 노폐물 배설을 촉진하고 찜질 중간중간에도 물을 마시는 것이 바람직하다. \r\n \r\n그러나 간혹 찜질방 고온실에서 잠을 자는 경우 호흡곤란을 일으킬 수 있어 특히 주의해야 한다. 온도가 높을수록 산소가 줄어들기 때문에 한 곳에 30분 이상 있는 것은 피해야 하며, 잠을 잘 경우에는 고온실이 아닌 수면실이나 적정 온도의 방에서 자는 것이 좋다.\r\n \r\n만약 찜질하는 도중 숨이 차오른다면 즉시 밖으로 나와 몸 온도를 서서히 식혀주도록 하며, 혈액순환에 도움을 주기 위해선 찬물이나 얼음물보다는 되도록 따뜻한 물을 마시도록 하자.', NULL, NULL, '2019-08-14', NULL, 6, 'Y', 4, NULL),
	(10, 'EVENT', '여름 이벤트', '여름 이벤트', '2019-08-01', '2019-08-31', '2019-08-14', '2019-08-14', 7, 'Y', 1, 1),
	(11, 'EVENT', '8월 셋째주 이벤트', '20% 할인', '2019-08-19', '2019-08-23', '2019-08-14', '2019-08-14', 4, 'Y', 1, 1);
/*!40000 ALTER TABLE `BOARD` ENABLE KEYS */;

-- 테이블 project.CHARGE 구조 내보내기
CREATE TABLE IF NOT EXISTS `CHARGE` (
  `charge_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '요금 번호',
  `company_no` int(11) NOT NULL COMMENT '사업장 번호',
  `time_kind` varchar(24) NOT NULL COMMENT '주/야 구분',
  `subject` varchar(24) NOT NULL COMMENT '대상자',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '가격',
  `order_seq` int(2) NOT NULL DEFAULT '0' COMMENT '순서',
  PRIMARY KEY (`charge_no`),
  UNIQUE KEY `charge_no` (`charge_no`),
  KEY `company_no` (`company_no`),
  CONSTRAINT `CHARGE_ibfk_1` FOREIGN KEY (`company_no`) REFERENCES `COMPANY` (`company_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project.CHARGE:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `CHARGE` DISABLE KEYS */;
INSERT INTO `CHARGE` (`charge_no`, `company_no`, `time_kind`, `subject`, `price`, `order_seq`) VALUES
	(1, 1, '주간', '성인', 8000, 1),
	(2, 1, '야간', '성인', 8000, 2),
	(3, 1, '주간', '소인', 5000, 3),
	(4, 1, '야간', '소인', 5000, 4),
	(5, 2, '주간', '성인', 8000, 1),
	(6, 2, '야간', '성인', 8000, 2),
	(7, 2, '주간', '소인', 6000, 3),
	(8, 2, '야간', '소인', 6000, 4),
	(9, 3, '주간', '전체', 8000, 1),
	(10, 3, '야간', '전체', 9000, 2);
/*!40000 ALTER TABLE `CHARGE` ENABLE KEYS */;

-- 테이블 project.COMMENT 구조 내보내기
CREATE TABLE IF NOT EXISTS `COMMENT` (
  `comment_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글고유번호',
  `contents` varchar(180) NOT NULL COMMENT '내용',
  `regist_date` date NOT NULL COMMENT '등록일',
  `state` char(1) NOT NULL COMMENT '''Y'', ''N''',
  `board_no` int(11) NOT NULL COMMENT '게시물번호',
  `member_no` int(11) NOT NULL COMMENT '등록자',
  PRIMARY KEY (`comment_no`),
  UNIQUE KEY `comment_no` (`comment_no`),
  KEY `board_no` (`board_no`),
  KEY `member_no` (`member_no`),
  CONSTRAINT `COMMENT_ibfk_1` FOREIGN KEY (`board_no`) REFERENCES `BOARD` (`board_no`) ON DELETE CASCADE,
  CONSTRAINT `COMMENT_ibfk_2` FOREIGN KEY (`member_no`) REFERENCES `MEMBER` (`member_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project.COMMENT:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `COMMENT` DISABLE KEYS */;
INSERT INTO `COMMENT` (`comment_no`, `contents`, `regist_date`, `state`, `board_no`, `member_no`) VALUES
	(1, '그만 좀 자라', '2019-08-14', 'Y', 6, 3),
	(2, '잘 봤습니다.', '2019-08-14', 'Y', 9, 2),
	(3, '너무 장문입니다.', '2019-08-14', 'Y', 8, 6),
	(4, '좋은 내용 공유 감사합니다ㅎㅎ', '2019-08-14', 'Y', 9, 6);
/*!40000 ALTER TABLE `COMMENT` ENABLE KEYS */;

-- 테이블 project.COMPANY 구조 내보내기
CREATE TABLE IF NOT EXISTS `COMPANY` (
  `company_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '사업장고유번호',
  `company_kind` varchar(15) NOT NULL COMMENT '사업장구분',
  `company_name` varchar(120) NOT NULL COMMENT '사업장명',
  `zone_code` varchar(5) DEFAULT NULL COMMENT '우편번호',
  `address` varchar(120) NOT NULL COMMENT '주소',
  `detail_address` varchar(120) DEFAULT NULL COMMENT '상세주소',
  `company_tel` varchar(15) NOT NULL COMMENT '사업장연락처',
  `contents` varchar(300) DEFAULT NULL COMMENT '사업장소개글',
  `open_time` time DEFAULT NULL COMMENT '영업시작시간',
  `close_time` time DEFAULT NULL COMMENT '영업종료시간',
  `regist_date` date NOT NULL COMMENT '등록일',
  `state` char(1) NOT NULL COMMENT '허용''Y'', 거부''N''',
  `mng_no` int(11) NOT NULL COMMENT '사업자번호',
  PRIMARY KEY (`company_no`),
  UNIQUE KEY `company_no` (`company_no`),
  KEY `mng_no` (`mng_no`),
  CONSTRAINT `COMPANY_ibfk_1` FOREIGN KEY (`mng_no`) REFERENCES `MANAGER` (`mng_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project.COMPANY:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `COMPANY` DISABLE KEYS */;
INSERT INTO `COMPANY` (`company_no`, `company_kind`, `company_name`, `zone_code`, `address`, `detail_address`, `company_tel`, `contents`, `open_time`, `close_time`, `regist_date`, `state`, `mng_no`) VALUES
	(1, '찜질방', '유토피아스파', '08378', '서울 구로구 도림천로 446 (예성유토피아)', '유토피아스파', '02-839-0000', '구로디지털단지역 3번출구 바로 앞 위치', '00:00:00', '23:59:59', '2019-08-14', 'Y', 1),
	(2, '찜질방', '신풍24시 불한증막 사우나', '07403', '서울 영등포구 가마산로48길 16 (신풍프라자)', '신풍24시 불한증막 사우나', '02-832-7000', '저희 신풍24시불한증막사우나에 찾아주셔서 감사합니다', '00:00:00', '23:59:59', '2019-08-14', 'Y', 1),
	(3, '찜질방', '천지랜드대중탕', '08543', '서울 금천구 독산로 293 (독산동천지랜드불가마)', '천지랜드대중탕', '02-856-0000', '2층은 남자사우나 \r\n3층은 찜질방 및 부대시설들 \r\n4층은 여자사우나\r\n5층은 수영장', '00:00:00', '23:59:59', '2019-08-14', 'Y', 1);
/*!40000 ALTER TABLE `COMPANY` ENABLE KEYS */;

-- 테이블 project.COMPANY_EVENT 구조 내보내기
CREATE TABLE IF NOT EXISTS `COMPANY_EVENT` (
  `c_event_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '사업장이벤트고유번호',
  `company_no` int(11) NOT NULL COMMENT '사업장번호',
  `event_content` varchar(180) NOT NULL COMMENT '이벤트내용',
  `regist_date` date NOT NULL COMMENT '등록일',
  PRIMARY KEY (`c_event_no`),
  UNIQUE KEY `c_event_no` (`c_event_no`),
  KEY `company_no` (`company_no`),
  CONSTRAINT `COMPANY_EVENT_ibfk_1` FOREIGN KEY (`company_no`) REFERENCES `COMPANY` (`company_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project.COMPANY_EVENT:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `COMPANY_EVENT` DISABLE KEYS */;
INSERT INTO `COMPANY_EVENT` (`c_event_no`, `company_no`, `event_content`, `regist_date`) VALUES
	(1, 1, '20% 할인 이벤트', '2019-08-14'),
	(2, 3, '무료입장', '2019-08-14');
/*!40000 ALTER TABLE `COMPANY_EVENT` ENABLE KEYS */;

-- 테이블 project.FILES 구조 내보내기
CREATE TABLE IF NOT EXISTS `FILES` (
  `file_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '파일고유번호',
  `menu_type` varchar(10) NOT NULL COMMENT '메뉴명',
  `menu_no` int(11) NOT NULL COMMENT '메뉴게시물번호',
  `file_type` varchar(12) NOT NULL COMMENT '파일 구분 첨부/배너',
  `origin_name` varchar(120) NOT NULL COMMENT '원본파일명',
  `save_name` varchar(120) NOT NULL COMMENT '저장파일명',
  `save_path` varchar(100) NOT NULL COMMENT '저장경로',
  `thum_name` varchar(120) DEFAULT NULL COMMENT '썸네일명',
  `thum_path` varchar(100) DEFAULT NULL COMMENT '썸네일경로',
  `file_storage` varchar(10) NOT NULL COMMENT '파일용량',
  `file_content_type` varchar(30) NOT NULL COMMENT '파일타입',
  PRIMARY KEY (`file_no`),
  UNIQUE KEY `file_no` (`file_no`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project.FILES:~15 rows (대략적) 내보내기
/*!40000 ALTER TABLE `FILES` DISABLE KEYS */;
INSERT INTO `FILES` (`file_no`, `menu_type`, `menu_no`, `file_type`, `origin_name`, `save_name`, `save_path`, `thum_name`, `thum_path`, `file_storage`, `file_content_type`) VALUES
	(2, 'EVENT', 7, 'BANNER', 'santa-claus-2927962__340.png', '0c960d16209343cf906bca05ab726d0f.png', '/event/20190814', NULL, NULL, '74.3KB', 'image/png'),
	(4, 'MANAGER', 1, 'ATTACHMENT', '사업자등록증.jpg', 'f377448bb58441789749acc85af68e2e.jpg', '/MANAGER/20190814', NULL, NULL, '22.5KB', 'image/jpeg'),
	(5, 'COMPANY', 1, 'SLIDE', '2019-02-16-18-32-47.jpg', '48f03d5ae79543ae8246cbefb4349857.jpg', '/COMPANY/20190814', NULL, NULL, '77.9KB', 'image/jpeg'),
	(6, 'COMPANY', 1, 'SLIDE', '2019-02-16-18-32-36.jpg', '00d381142e15428e8e765f961a4a2305.jpg', '/COMPANY/20190814', NULL, NULL, '70.9KB', 'image/jpeg'),
	(7, 'COMPANY', 1, 'SLIDE', '2019-02-16-18-32-18.jpg', '6e162713987844e48265bd6a1dd3e6d7.jpg', '/COMPANY/20190814', NULL, NULL, '98.3KB', 'image/jpeg'),
	(8, 'COMPANY', 1, 'BANNER', '2019-02-16-18-32-47.jpg', '56e58fd3003f4ad6ad1690a69d35e116.jpg', '/COMPANY/20190814', NULL, NULL, '77.9KB', 'image/jpeg'),
	(9, 'COMPANY', 1, 'SLIDE', '2019-02-16-16-04-46.jpg', 'e4b6745ba8304c79ae2540d0ec01fa74.jpg', '/COMPANY/20190814', NULL, NULL, '77.2KB', 'image/jpeg'),
	(10, 'COMPANY', 2, 'SLIDE', 'images.jpg', 'ebaba4c7d7da4a87aba0926e6fcd0183.jpg', '/COMPANY/20190814', NULL, NULL, '9.4KB', 'image/jpeg'),
	(11, 'COMPANY', 2, 'SLIDE', '13672987065809.jpg', '79c56adf35b745749a5cdd644ca66c34.jpg', '/COMPANY/20190814', NULL, NULL, '167.2KB', 'image/jpeg'),
	(12, 'COMPANY', 2, 'BANNER', 'images.jpg', 'de02f69bdec54d8b93a0a3ad3014080c.jpg', '/COMPANY/20190814', NULL, NULL, '9.4KB', 'image/jpeg'),
	(13, 'COMPANY', 3, 'SLIDE', '다운로드.jpg', '94431ee200c94491b6f51ded202eb43c.jpg', '/COMPANY/20190814', NULL, NULL, '6KB', 'image/jpeg'),
	(14, 'COMPANY', 3, 'SLIDE', 'images.jpg', '1b511ef27c524d6994928ab476b6a274.jpg', '/COMPANY/20190814', NULL, NULL, '5.5KB', 'image/jpeg'),
	(15, 'COMPANY', 3, 'SLIDE', 'images (1).jpg', '8bb40723c19f4133aa685d803f51028a.jpg', '/COMPANY/20190814', NULL, NULL, '10.8KB', 'image/jpeg'),
	(16, 'COMPANY', 3, 'BANNER', '다운로드.jpg', 'ad2a198406234f83aac7e799c9af4b5d.jpg', '/COMPANY/20190814', NULL, NULL, '6KB', 'image/jpeg'),
	(17, 'EVENT', 10, 'BANNER', 'balloons-1761634__340.jpg', '8f04858e763a44f3bfd6f8a6df1ec0f0.jpg', '/event/20190814', NULL, NULL, '51.1KB', 'image/jpeg'),
	(18, 'EVENT', 11, 'BANNER', 'discount-1015444_960_720.jpg', '5ada05cd0367476cbce4bab94d9dcf50.jpg', '/event/20190814', NULL, NULL, '40.8KB', 'image/jpeg');
/*!40000 ALTER TABLE `FILES` ENABLE KEYS */;

-- 테이블 project.MANAGER 구조 내보내기
CREATE TABLE IF NOT EXISTS `MANAGER` (
  `mng_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '사업자고유번호',
  `mng_name` varchar(90) NOT NULL COMMENT '대표자',
  `biz_no` varchar(12) NOT NULL COMMENT '사업자번호',
  `rep_tel` varchar(15) NOT NULL COMMENT '사업자대표연락처',
  `state` char(1) NOT NULL DEFAULT 'N' COMMENT '승인여부',
  `apply_date` date DEFAULT NULL COMMENT '승인',
  `member_no` int(11) NOT NULL COMMENT '회원번호',
  `apply_no` int(11) DEFAULT NULL COMMENT '관리자번호',
  PRIMARY KEY (`mng_no`),
  UNIQUE KEY `mng_no` (`mng_no`),
  KEY `member_no` (`member_no`),
  CONSTRAINT `MANAGER_ibfk_1` FOREIGN KEY (`member_no`) REFERENCES `MEMBER` (`member_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project.MANAGER:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `MANAGER` DISABLE KEYS */;
INSERT INTO `MANAGER` (`mng_no`, `mng_name`, `biz_no`, `rep_tel`, `state`, `apply_date`, `member_no`, `apply_no`) VALUES
	(1, '사장님', '000-00-00000', '070-2222-1111', 'Y', '2019-08-14', 5, 1);
/*!40000 ALTER TABLE `MANAGER` ENABLE KEYS */;

-- 테이블 project.MEMBER 구조 내보내기
CREATE TABLE IF NOT EXISTS `MEMBER` (
  `member_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유번호',
  `member_id` varchar(18) NOT NULL COMMENT '회원아이디',
  `password` varchar(120) NOT NULL COMMENT '비밀번호',
  `member_name` varchar(60) NOT NULL COMMENT '회원이름',
  `phone` varchar(15) NOT NULL COMMENT '연락처',
  `email` varchar(30) NOT NULL COMMENT '이메일',
  `join_date` date NOT NULL COMMENT '가입일',
  `last_access_date` date DEFAULT NULL COMMENT '최근접속일',
  `leave_date` date DEFAULT NULL COMMENT '탈퇴일',
  `leave_reason` varchar(300) DEFAULT NULL COMMENT '탈퇴사유',
  `state` char(1) NOT NULL DEFAULT 'Y' COMMENT '''Y''정상, ''S''정지, ''L''탈퇴',
  `role_name` varchar(10) NOT NULL COMMENT '권한명',
  PRIMARY KEY (`member_no`),
  UNIQUE KEY `member_no` (`member_no`),
  UNIQUE KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project.MEMBER:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
INSERT INTO `MEMBER` (`member_no`, `member_id`, `password`, `member_name`, `phone`, `email`, `join_date`, `last_access_date`, `leave_date`, `leave_reason`, `state`, `role_name`) VALUES
	(1, 'admin', '$2a$10$9BpcHb4VBSbd.AGdyqPiYuSYc0dJhCnNe13Uys9Wf4nHjAjfU3F5G', '관리자', '010-0000-0000', 'admin@gmail.co.kr', '2019-08-13', '2019-08-14', NULL, NULL, 'Y', 'ADMIN'),
	(2, 'user', '$2a$10$5afq2TZXxDsGUeM9xUrYN.149ovQ3UhrEMrxhHwTCXx3MNPui/aNW', '사용자', '010-1234-6859', 'user@naver.com', '2019-08-13', '2019-08-14', NULL, NULL, 'Y', 'USER'),
	(3, '1234', '$2a$10$mNSUpujZ.KtfxHsQybrMPOtvLdcdU.QTT/rIjbIu9lYoBKlT3vyNK', '1234', '1234', '1234@1234.com', '2019-08-14', '2019-08-14', NULL, NULL, 'Y', 'USER'),
	(4, 'koitt', '$2a$10$7m891pUtIIMqcCvED4K83OzeRmP4ewgupCSJxwYGOgje8A6a763Yu', '홍길동', '010-1234-8789', 'hong@gmail.com', '2019-08-14', '2019-08-14', NULL, NULL, 'Y', 'USER'),
	(5, 'manager', '$2a$10$NtfMC6QjLvzil55EoJGVguxsGuXVxxsH5ytnQb11V3uKf.MCG1XVq', '사장님', '010-1234-8789', 'manager@gmail.com', '2019-08-14', '2019-08-14', NULL, NULL, 'Y', 'MANAGER'),
	(6, 'user1', '$2a$10$/V5Hs3feP7E6jelQd5.OU.PqtbLfKmzG9Jx1gdo/nNjEI430aZw.O', 'user1', '01011112222', '123@123.com', '2019-08-14', '2019-08-14', NULL, NULL, 'Y', 'USER'),
	(7, '4444', '$2a$10$uXDxONbPC3OJEwvkUE1Hf.rFGT8iib1nZzCPj06C82sjGIb38fUki', '이름', '555', '44@ha.com', '2019-08-14', '2019-08-14', NULL, NULL, 'Y', 'USER');
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;

-- 테이블 project.PLANTS 구조 내보내기
CREATE TABLE IF NOT EXISTS `PLANTS` (
  `plant_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '편의시설고유번호',
  `company_no` int(11) NOT NULL COMMENT '사업장번호',
  `plant_name` varchar(24) NOT NULL COMMENT '편의시설명',
  `order_seq` int(2) NOT NULL DEFAULT '0' COMMENT '순서',
  PRIMARY KEY (`plant_no`),
  UNIQUE KEY `plant_no` (`plant_no`),
  KEY `company_no` (`company_no`),
  CONSTRAINT `PLANTS_ibfk_1` FOREIGN KEY (`company_no`) REFERENCES `COMPANY` (`company_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project.PLANTS:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `PLANTS` DISABLE KEYS */;
INSERT INTO `PLANTS` (`plant_no`, `company_no`, `plant_name`, `order_seq`) VALUES
	(1, 1, '휘트니스', 0),
	(2, 1, '주차장', 0),
	(3, 1, '수면실', 0),
	(4, 2, '매점', 0),
	(5, 2, '주차장', 0),
	(6, 3, '휘트니스', 0),
	(7, 3, '주차장', 0),
	(8, 3, '수영장', 0);
/*!40000 ALTER TABLE `PLANTS` ENABLE KEYS */;

-- 테이블 project.QNA 구조 내보내기
CREATE TABLE IF NOT EXISTS `QNA` (
  `qna_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '문의고유번호',
  `qst_title` varchar(120) NOT NULL COMMENT '문의제목',
  `qst_contents` varchar(300) NOT NULL COMMENT '문의내용',
  `alram_type` char(1) NOT NULL COMMENT '알림구분 이메일''E'' 핸드폰 ''P''',
  `regist_date` date NOT NULL COMMENT '등록일',
  `state` char(1) NOT NULL COMMENT '''Y'', ''N''',
  `answer` varchar(300) DEFAULT NULL COMMENT '답변',
  `answer_date` date DEFAULT NULL COMMENT '답변일',
  `answer_no` int(11) DEFAULT NULL COMMENT '답변자',
  `member_no` int(11) NOT NULL COMMENT '등록자',
  PRIMARY KEY (`qna_no`),
  UNIQUE KEY `qna_no` (`qna_no`),
  KEY `member_no` (`member_no`),
  CONSTRAINT `QNA_ibfk_1` FOREIGN KEY (`member_no`) REFERENCES `MEMBER` (`member_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project.QNA:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `QNA` DISABLE KEYS */;
INSERT INTO `QNA` (`qna_no`, `qst_title`, `qst_contents`, `alram_type`, `regist_date`, `state`, `answer`, `answer_date`, `answer_no`, `member_no`) VALUES
	(1, '이미지가 안 보입니다.', '이미지가 안 보입니다.', '\0', '2019-08-14', 'Y', '수정했습니다.\r\n확인해 주세요.', '2019-08-14', 1, 5);
/*!40000 ALTER TABLE `QNA` ENABLE KEYS */;

-- 테이블 project.REVIEW 구조 내보내기
CREATE TABLE IF NOT EXISTS `REVIEW` (
  `review_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '리뷰고유번호',
  `contents` varchar(300) NOT NULL COMMENT '내용',
  `score` int(11) NOT NULL COMMENT '점수',
  `regist_date` date NOT NULL COMMENT '등록일',
  `company_no` int(11) NOT NULL COMMENT '사업장번호',
  `member_no` int(11) NOT NULL COMMENT '등록자',
  `state` char(1) NOT NULL COMMENT '''Y'',''N''',
  PRIMARY KEY (`review_no`),
  UNIQUE KEY `review_no` (`review_no`),
  KEY `company_no` (`company_no`),
  KEY `member_no` (`member_no`),
  CONSTRAINT `REVIEW_ibfk_1` FOREIGN KEY (`company_no`) REFERENCES `COMPANY` (`company_no`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_ibfk_2` FOREIGN KEY (`member_no`) REFERENCES `MEMBER` (`member_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 테이블 데이터 project.REVIEW:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `REVIEW` DISABLE KEYS */;
INSERT INTO `REVIEW` (`review_no`, `contents`, `score`, `regist_date`, `company_no`, `member_no`, `state`) VALUES
	(2, '별로', 2, '2019-08-14', 3, 4, 'Y'),
	(3, '그냥 그래요', 3, '2019-08-14', 3, 6, 'Y'),
	(4, '휘트니스가 있어서 좋았습니다', 4, '2019-08-14', 3, 6, 'Y'),
	(5, '시설이 너무 좋아요!!', 5, '2019-08-14', 1, 6, 'Y'),
	(6, '오늘은 너무 시끄럽네요 ㅡㅡ', 2, '2019-08-14', 1, 6, 'Y'),
	(7, 'soso', 3, '2019-08-14', 1, 6, 'Y');
/*!40000 ALTER TABLE `REVIEW` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
