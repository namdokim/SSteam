<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<%	
	String LType = request.getParameter("LType");
	if (LType == null) {  LType = "TT"; }
%>

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
	<form action="foodMainWrite.do" method="post" style="text-align: center;" enctype="multipart/form-data" onsubmit="return validateForm()" >
		<table>
			<tr>
				<th>가게 이름</th>
				<td><input type="text" id="food_name" name="food_name" ></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="food_address" name="food_address" ></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="food_phone" name="food_phone" ></td>
			</tr>
			<tr>
				<th>대표음식종류</th>
				<td><input type="text" id="food_food_kind" name="food_food_kind" ></td>
			</tr>
			<tr>
				<th>음식 평균 가격대</th>
				<td><input type="text" id="food_avg_price" name="food_avg_price" ></td>
			</tr>
			<!-- <tr>
				<th>주차장 여부</th>
				<td>
					<select id="food_parking" name="food_parking">
						<option value="true">있음</option>
						<option value="false">없음</option>
					</select>
				</td>
			</tr> -->
			<tr>
				<th>게시글 업데이트 날짜</th>
				<td><input type="date" id="food_write_date" name="food_write_date" ></td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td><input type="text" id="food_working_hours" name="food_working_hours" ></td>
			</tr>
			<tr>
				<th>휴일</th>
				<td><input type="text" id="food_holiday" name="food_holiday"></td>
			</tr>
			<tr>
				<th>웹사이트</th>
				<td><input type="text" id="food_website" name="food_website"></td>
			</tr>
			<tr>
				<th>맛집 설명 </th>
				<td><input type="text" id="food_content" name="food_content"></td>
			</tr>
			<tr>
				<th>맛집 지역</th>
				<td>
					<select id="LType" name="LType">
						<option value="TT" <%= LType.equals("TT") ? "checked" : "" %> >전체 </option>
						<option value="GG" <%= LType.equals("GG") ? "checked" : "" %> >경기 </option>
						<option value="GW" <%= LType.equals("GW") ? "checked" : "" %> >강원 </option>
						<option value="CB" <%= LType.equals("CB") ? "checked" : "" %> >충북 </option>
						<option value="CN" <%= LType.equals("CN") ? "checked" : "" %> >충남 </option>
						<option value="GB" <%= LType.equals("GB") ? "checked" : "" %> >경북 </option>
						<option value="GN" <%= LType.equals("GN") ? "checked" : "" %> >경남 </option>
						<option value="JB" <%= LType.equals("JB") ? "checked" : "" %> >전북 </option>
						<option value="JN" <%= LType.equals("JN") ? "checked" : "" %> >전남 </option>
						<option value="JJ" <%= LType.equals("JJ") ? "checked" : "" %> >제주 </option>
					</select>
				</td>
			</tr>
			<!-- <tr>
				<th>지역 및 위치</th>
				<td>
					<input type="text" id="food_map" name="food_map" required>
					<button type="button" onclick="showMap()">위치 찾기</button>
				</td>
			</tr> -->
		</table>
		
		<!-- <div id="map"></div>
		<br> -->
		
		<!--첨부파일 -->
			<!-- <input type="file" name="uploadFile"> -->
			<input type="file" name="multiFile" multiple>
			<div id="preview"></div>
			<br>
		<button>등록</button>
	</form>

<!-- 카카오 맵 API 스크립트 -->
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=471bd87d2c2bfa282198a74a11556a57"></script>
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
	</script> -->
	
	<!-- 유효성 검사확인  -->
	<script>
    function validateForm() {
        var foodName = document.getElementById("food_name").value;
        var foodAddress = document.getElementById("food_address").value;
        var foodPhone = document.getElementById("food_phone").value;
        var foodKind = document.getElementById("food_food_kind").value;
        var foodPrice = document.getElementById("food_avg_price").value;
        var foodWorking = document.getElementById("food_working_hours").value;
        var foodHoliday = document.getElementById("food_holiday").value;
        var foodWebsite = document.getElementById("food_website").value;
        var foodContent = document.getElementById("food_content").value;

        // 모든 필수 입력란이 작성되지 않았을 경우 경고 메시지를 보여주고 false를 반환하여 폼 제출을 막습니다.
        if (foodName === "" ) {
            alert("가게이름을 작성해주세요 .");
            return false;
        }
        if (foodAddress === "" ) {
            alert("주소를 작성해주세요 .");
            return false;
        }
        if (foodPhone === "" ) {
            alert("전화번호를 작성해주세요 .");
            return false;
        }
        if (foodKind === "" ) {
            alert("대표음식종류를 작성해주세요 .");
            return false;
        }
        if (foodPrice === "" ) {
            alert("음식평균가격대를 작성해주세요 .");
            return false;
        }
        if (foodWorking === "" ) {
            alert("영업시간을 작성해주세요 .");
            return false;
        }
        if (foodHoliday === "" ) {
            alert("휴일을 작성해주세요 .");
            return false;
        }
        if (foodWebsite === "" ) {
            alert("웹사이트를 작성해주세요 .");
            return false;
        }
        if (foodContent === "" ) {
            alert("맛집설명을 작성해주세요 .");
            return false;
        }

        // 모든 필수 입력란이 작성된 경우 true를 반환하여 폼 제출을 허용합니다.
        return true;
    }
    
    // ============================================================ 미리보기 
    $(document).ready(function (e){
        $("input[type='file']").change(function(e){

          //div 내용 비워주기
          $('#preview').empty();

          var files = e.target.files;
          var arr =Array.prototype.slice.call(files);
          
          //업로드 가능 파일인지 체크
          for(var i=0;i<files.length;i++){
            if(!checkExtension(files[i].name,files[i].size)){
              return false;
            }
          }
          
          preview(arr);
          
          
        });//file change
        
        function checkExtension(fileName,fileSize){

          var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
          var maxSize = 20971520;  //20MB
          
          if(fileSize >= maxSize){
            alert('파일 사이즈 초과');
            $("input[type='file']").val("");  //파일 초기화
            return false;
          }
          
          if(regex.test(fileName)){
            alert('업로드 불가능한 파일이 있습니다.');
            $("input[type='file']").val("");  //파일 초기화
            return false;
          }
          return true;
        }
// 수정 (이미지파일 하나만 뜨게)        
        function preview(arr) {
            arr.forEach(function (f) {
              // 파일명이 길면 파일명...으로 처리
              var fileName = f.name;
              if (fileName.length > 10) {
                fileName = fileName.substring(0, 7) + "...";
              }

              // 이미지 파일인 경우에만 미리보기를 생성
              if (f.type.match('image.*')) {
                var reader = new FileReader();
                reader.onload = function (e) {
                  var str = '<div style="display: inline-flex; padding: 10px;"><li>';
                  str += '<span>' + fileName + '</span><br>';
                  str += '<img src="' + e.target.result + '" title="' + f.name + '" width=100 height=100 />';
                  str += '</li></div>';
                  $(str).appendTo('#preview');
                };
                reader.readAsDataURL(f);
              }
            });
          }
	</script>
</body>
</html>
<%@ include file="../include/footer.jsp" %> 