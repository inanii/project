<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ include file="../include/common.jsp" %><%--
--%><c:set var="menu" value="1" scope="request"/><%--
--%><c:set var="subMenu" value="2" scope="request"/><%--
--%><!DOCTYPE html>
<html>
<head>
<c:import url="../include/head.jsp"/>
<c:import url="../include/app.jsp"/>
<script>
//리스트 출력
function putList(list){
	tbody.empty();
	if(list.length > 0){
		$.each(list, function(index, vo){
			var tr = temp.clone();
			var link = $('<a href="<c:url value='/admin/manager/modify'/>?no=' + vo.mngNo + '">').text(vo.mngName);
			tr.find("td").eq(0).text($("#state option[value='" + vo.state + "']").text())
						.next().append(link)
						.next().text(vo.bizNo)
						.next().text(vo.repTel)
			if(vo.state == 'Y')	tr.find("td").eq(4).text(vo.applyName).next().text(vo.applyDate);
			tbody.append(tr);
		});
	}else{
		$("<td colspan='6'>").text("등록된 데이터가 없습니다.").appendTo(tbody);
	}//if end
}//putList()
</script>
</head>
<body>
<div id="wrap" class="hideNav">
	<c:import url="../include/header.jsp"/>
	<c:import url="../include/navigation.jsp"/>
	<!-- Content -->
	<div id="container">
		<div class="contentWrap">
			<div class="contents">
				<div class="title"><h3>사업자 목록</h3></div>
				<div class="content">
					<form action='<c:url value="/admin/manager/list"/>' name="search" class="search" method="post">
						<fieldset class="box">
							<legend class="hide">목록 검색</legend>
							<input type="hidden" name="board" value="list"/>
							<input type="hidden" name="currentPage" value="1"/>
							<p>
								<select name="state" id="state"> 
									<option value="A">상태</option>
									<option value="Y">승인</option>
									<option value="N">대기</option>
								</select>
							</p>
							<p>
								<select name="searchType" >
									<option value="NONE">검색조건</option>
									<option value="NAME">대표자</option>
									<option value="REGNUM">사업자번호</option>
								</select><%--
						 	--%><input type="text" name="searchTxt" class="txtBox"/><%--
							--%><button type="submit" class="btn md data">검색</button>
							</p>
						</fieldset>
					</form>
					<div class="lTbl">
						<table>
							<caption class="hide">이벤트 목록</caption>
							<thead>
								<tr>
									<th scope="col">상태</th>
									<th scope="col">대표자</th>
									<th scope="col">사업자 등록번호</th>
									<th scope="col">대표 연락처</th>
									<th scope="col">담당자</th>								
									<th scope="col">승인일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td class="title"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="lOpt">
						<c:import url="../include/pagination.jsp"/>
					</div>
				</div>
			</div><!-- /.contents -->
		</div><!-- /.contentWrap -->
	</div><!-- /#container -->
	<c:import url="../include/footer.jsp"/>
</div><!-- /#wrap -->
<c:import url="../include/modal.jsp"/>
</body>
</html>