<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- 첨부파일 수정 -->
<script>
window.onload = function(){
	const openButton = document.getElementById("open-gallery-button");
	const modal = document.getElementById("gallery-modal");
	const closeButton = document.getElementById("close-button");

	openButton.addEventListener("click", () => {
	  modal.style.display = "block";
	  document.body.style.overflow = "hidden";
	});

	closeButton.addEventListener("click", () => {
	  modal.style.display = "none";
	  document.body.style.overflow = "auto";
	});

	window.addEventListener("click", (event) => {
	  if (event.target === modal) {
	    modal.style.display = "none";
	    document.body.style.overflow = "auto";
	  }
	});
}
</script>

<!-- CSS ================================================================= -->
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
		
		
		/* 갤러리 모달 스타일 */
		.view{
		border-radius:10px;
		background-color:white;
		box-shadow:1px 1px 1px 1px #ddd;
		}
	
		.gallery-modal {
		  display: none;
		  position: fixed;
		  z-index: 1000;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  background-color: rgba(0, 0, 0, 0.5);
		  overflow: auto;
		}
		
		.gallery-content {
		  display: flex;
		  flex-wrap: wrap;
		  justify-content: center;
		  padding: 20px;
		}
		
		.gallery-content img {
		  max-width: 100%;
		  height: auto;
		  margin:2px 0px;
		}
		.close-button {
		  color: white;
		  font-size: 30px;
		  position: absolute;
		  top: 10px;
		  right: 20px;
		  cursor: pointer;
		}	
	</style>
</head>

<!-- <body> -->
<!-- 테이블(DB name) ================================================================= -->
<!-- 모달  -->
	<div class="gallery-modal" id="gallery-modal">
	    <div class="gallery-content">
	    	<div class="close-button" id="close-button" style="display:inline-block;">&times;</div>
		    <div class="view" style="width:1224px; padding:20px;">
			    <div style="text-align:left; margin:20px;">
				    <span style="font-weight:bold; font-size:15pt;">맛집 제공 이미지</span>
			    </div>
			    
			    
			    <div style="margin:20px; width:1144px; height:1px; background-color:lightgray;"></div>
			    <div style="margin:20px; text-align:left;">
			    
				    <c:forEach items="${attach}" var="attach">
					    <div style="display:inline-block; margin:20px 0px;">
					   		<img src="<%=request.getContextPath()%>/resources/upload/${attach.food_attach_physical_name}" style="width:370px; height:250px; border-radius:5px; display:inline-block;"><br>
						    
						    <form action="foodThumbnail.do" method="post" style="display:inline-block;">
						    	<input type="hidden" name="food_attach_number" value="${attach.food_attach_number}">
						    	<input type="hidden" name="fNo" value="${attach.fNo}">
						   		<button style="border:0px; background-color:transparent; border-radius:5px; padding:10px; height:50px; line-height:25px;font-weight:bold;">썸네일 등록</button>
						    </form>
						    
						    <form action="foodDelete_attach.do" method="post" style="display:inline-block;">
						    	<input type="hidden" name="food_attach_number" value="${attach.food_attach_number}">
						    	<input type="hidden" name="fNo" value="${attach.fNo}">
						   		<button style="border:0px; background-color:transparent; border-radius:5px; padding:10px; height:50px; line-height:25px;font-weight:bold;">등록 이미지 삭제</button>
						    </form>
						    
					    </div>
				    </c:forEach>
			    </div>
		    </div>
	    </div>
	</div>
	
<h1 style="text-align: center; font-size: 2em;">식당 등록</h1>
	<form action="foodMainModify.do" method="post" style="text-align: center;" enctype="multipart/form-data" onsubmit="return validateForm()" >
	<input type="hidden" name="fNo" value="${vo.fNo}">
		<table>
			<tr>
				<th>가게 이름</th>
				<td><input type="text" id="food_name" name="food_name" value="${vo.food_name}" ></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="food_address" name="food_address" value="${vo.food_address}" ></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="food_phone" name="food_phone" value="${vo.food_phone}"></td>
			</tr>
			<tr>
				<th>대표음식종류</th>
				<td><input type="text" id="food_food_kind" name="food_food_kind" value="${vo.food_food_kind}"></td>
			</tr>
			<tr>
				<th>음식 평균 가격대</th>
				<td><input type="text" id="food_avg_price" name="food_avg_price" value="${vo.food_avg_price}" ></td>
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
				<td><input type="date" id="food_write_date" name="food_write_date" value="${vo.food_write_date}"  ></td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td><input type="text" id="food_working_hours" name="food_working_hours" value="${vo.food_working_hours}" ></td>
			</tr>
			<tr>
				<th>휴일</th>
				<td><input type="text" id="food_holiday" name="food_holiday" value="${vo.food_holiday}"></td>
			</tr>
			<tr>
				<th>웹사이트</th>
				<td><input type="text" id="food_website" name="food_website" value="${vo.food_website}"></td>
			</tr>
			<tr>
				<th>맛집 설명 </th>
				<td><input type="text" id="food_content" name="food_content" value="${vo.food_content}"></td>
			</tr>
			<tr>
				<th>맛집 지역</th>
				<td>
					<select id="LType" name="LType" >
						<option value="TT" <c:if test="${vo.LType == 'TT'}">selected</c:if>>전체 </option>
						<option value="GG" <c:if test="${vo.LType == 'GG'}">selected</c:if>>경기 </option>
						<option value="GW" <c:if test="${vo.LType == 'GW'}">selected</c:if>>강원 </option>
						<option value="CB" <c:if test="${vo.LType == 'CB'}">selected</c:if>>충북 </option>
						<option value="CN" <c:if test="${vo.LType == 'CN'}">selected</c:if>>충남 </option>
						<option value="GB" <c:if test="${vo.LType == 'GB'}">selected</c:if>>경북 </option>
						<option value="GN" <c:if test="${vo.LType == 'GN'}">selected</c:if>>경남 </option>
						<option value="JB" <c:if test="${vo.LType == 'JB'}">selected</c:if>>전북 </option>
						<option value="JN" <c:if test="${vo.LType == 'JN'}">selected</c:if>>전남 </option>
						<option value="JJ" <c:if test="${vo.LType == 'JJ'}">selected</c:if>>제주 </option>
					</select>
				</td>
			</tr>
			<tr>
				<th>맛집 등록 이미지 관리</td>
				<td id="open-gallery-button" style="cursor:pointer;">등록된 이미지 보기</td>
			</tr>
			
			<tr>
				<th>맛집 이미지 추가 업로드</th>
				<td>
					<input type="file" name="multiFile" multiple>
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
			
			
			<div style="display:inline-block; width:800px;">
				<div id="preview" style="width:800px;"></div>
			</div>
			<br>
		<button>수정 등록 </button>
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
        var Ltype = document.getElementById("Ltype").value;

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
        if (Ltype === "" ) {
            alert("지역을 선택해주세요 .");
            return false;
        }

        // 모든 필수 입력란이 작성된 경우 true를 반환하여 폼 제출을 허용합니다.
        return true;
    }
	</script>
<%@ include file="../include/footer.jsp" %>  