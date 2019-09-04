<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ include file="../include/common.jsp" %><%--
--%><c:set var="menu" value="2" scope="request"/><%--
--%><c:set var="subMenu" value="1" scope="request"/><%--
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
			var link = $('<a href="<c:url value='/admin/company/modify'/>?no=' + vo.companyNo + '">').text(vo.companyName);
			tr.find("td").eq(0).text($("#state option[value='" + vo.state + "']").text())
						.next().text(vo.companyKind)
						.next().append(link)
						.next().text(vo.address)
						.next().text(vo.companyTel)
						.next().text(vo.registDate)							
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
				<div class="title"><h3>사업장 목록</h3></div>
				<div class="content">
					<form action='<c:url value="/admin/company/list"/>' name="search" class="search" method="post">
						<fieldset class="box">
							<legend class="hide">목록 검색</legend>
							<input type="hidden" name="board" value="list"/>
							<input type="hidden" name="currentPage" value="1"/>
							<p>
								<select name="state" id="state">
									<option value="A">상태</option>
									<option value="Y">게시중</option>
									<option value="N">숨김</option>
								</select><%--
							--%><select name="companyKind">
									<option value="A">구분</option>
									<option value="">찜질방</option>
								</select>
							</p>
							<p>
								<select name="searchType" >
									<option value="NONE">검색조건</option>
									<option value="NAME">상호명</option>
									<option value="ADDR">소재지</option>
								</select><%--
						 	--%><input type="text" name="searchTxt" class="txtBox"/><%--
							--%><button type="submit" class="btn md data">검색</button>							
						</p>
						</fieldset>
					</form>
					<div class="lTbl">
						<table>
							<caption class="hide">사업장 목록</caption>
							<thead>
								<tr>
									<th scope="col">상태</th>
									<th scope="col">구분</th>
									<th scope="col">상호명</th>
									<th scope="col">소재지</th>
									<th scope="col">연락처</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td class="title"></td>
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