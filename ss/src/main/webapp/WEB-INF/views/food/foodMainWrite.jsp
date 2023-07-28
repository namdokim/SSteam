<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<!-- CSS ================================================================= -->
	<meta charset="UTF-8">
	<title>식당 등록 페이지</title>
	<style>
		table {
		border-collapse: collapse;
		width: fit-content;
		margin: 20px auto;
		}
		
		th {
		border: 1px solid black;
		padding: 8px;
		text-align: center;
		background-color: orange;
		}
		
		td {
		border: 1px solid black;
		padding: 8px;
		text-align: left;
		}
		
		#map {
		width: 100%;
		height: 400px;
		display: none;
		margin: 20px auto;
		}
	</style>
</head>

<body>
<!-- 테이블(DB name) ================================================================= -->
<h1 style="text-align: center; font-size: 2em;">식당 등록</h1>
	<form action="foodWrite.do" method="post" style="text-align: center;">
		<table>
			<tr>
				<th>가게 이름</th>
					<td><input type="text" id="food_title" name="food_title" required></td>
			</tr>
			<tr>
			<th>평점</th>
				<td><input type="number" id="food_grade" name="food_grade" min="0" max="5" step="0.1" required></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="food_adress" name="food_adress" required></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="food_call" name="food_call" required></td>
			</tr>
			<tr>
				<th>대표음식종류</th>
				<td><input type="text" id="food_foodkind" name="food_foodkind" required></td>
			</tr>
			<tr>
				<th>음식 평균 가격대</th>
				<td><input type="text" id="food_money" name="food_money" required></td>
			</tr>
			<tr>
				<th>주차장 여부</th>
				<td>
					<select id="food_car" name="food_car">
						<option value="true">있음</option>
						<option value="false">없음</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>게시글 업데이트 날짜</th>
				<td><input type="date" id="food_write_date" name="food_write_date" required></td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td><input type="text" id="food_working" name="food_working" required></td>
			</tr>
			<tr>
				<th>휴일</th>
				<td><input type="text" id="food_rest" name="food_rest" required></td>
			</tr>
			<tr>
				<th>웹사이트</th>
				<td><input type="text" id="food_website" name="food_website"></td>
			</tr>
			<tr>
				<th>지역 및 위치</th>
				<td>
					<input type="text" id="food_map" name="food_map" required>
					<button type="button" onclick="showMap()">위치 찾기</button>
				</td>
			</tr>
		</table>
		
		<div id="map"></div>
		<br>
		<button>등록</button>
	</form>

<!-- 카카오 맵 API 스크립트 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=471bd87d2c2bfa282198a74a11556a57"></script>
	<script>
		// 지도 API를 사용하여 지도 보여주기
		function showMap() {
		var inputLocation = document.getElementById('location').value;
		var mapDiv = document.getElementById('map');
		mapDiv.style.display = 'block';
		
		var geocoder = new kakao.maps.services.Geocoder();
		
		geocoder.addressSearch(inputLocation, function (result, status) {
		if (status === kakao.maps.services.Status.OK) {
		var mapOptions = {
		center: new kakao.maps.LatLng(result[0].y, result[0].x),
		level: 3
		};
		var map = new kakao.maps.Map(mapDiv, mapOptions);
		var marker = new kakao.maps.Marker({
		position: new kakao.maps.LatLng(result[0].y, result[0].x)
		});
		marker.setMap(map);
		} else {
		alert('지도를 표시할 수 없습니다.');
		}
		});
		}
	</script>
</body>
</html>
<%@ include file="../include/footer.jsp" %>
