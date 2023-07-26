<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<!-- main page -->
	
	<!-- 전광판 -->
	<div style="margin-left: 5%; margin-right: 5%;">
		<input type="text" style="width: 100% " value="전광판">
	</div>
	<!-- 이미지 슬라이드 -->
	<div style="margin-left: 5%; margin-right: 5%;">
		<img alt="이미지 구현" src="./img/main2.jpg" style="width: 100%">
		<!-- <textarea rows="40" style="width:100%; height: 20%">이미지 구현 </textarea> -->
	</div>
	<!-- 지도앱  margin-left: 5%; margin-right: 5%; -->
	<div style="float: left; width: 40%; margin-left: 5%; margin-right: 5%;">
		<img alt="지도 구현" src="./img/map.jpg">
		<!-- <textarea rows="20" style="width:100%; margin-left: 5%;">MAP 구현 </textarea> -->
	</div>
	<!-- 베스트글 보여주기  -->
	<div style="float: left; width: 40%; margin-left: 5%; margin-right: 5%; ">
		<table border="1" style=" width: 90%; height: 100%;  margin-right: 5%; ">
			<tr>
				<td>1
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>2
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>3
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>4
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>1
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>2
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>3
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>4
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
		</table>
	</div>
	<div>
	</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<!-- 채팅 테스트 개발 중 (혁수) -->
<a href = "<%=request.getContextPath() %>/Community/ChattingTest.do"> 채팅 테스트 </a>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>