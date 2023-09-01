<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%-- <%	
	String LType = request.getParameter("LType");
	if (LType == null) {  LType = "TT"; }
%> --%>

<!-- 첨부파일 수정 -->
<script>
window.onload = function(){
	limitTextarea(document.getElementById("food_content"),200);
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
		.form-signin { max-width: 600px; padding: 15px; }
		.form-signin .form-floating:focus-within { z-index: 2; }
		.form-signin input { margin-bottom: 1px; }
		
	</style>
</head>

<!-- <body> -->
<!-- 테이블(DB name) ================================================================= -->
<!-- 모달  -->
<div class="modal fade" id="exampleModalCenteredScrollable" tabindex="-1" aria-labelledby="exampleModalCenteredScrollableLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenteredScrollableLabel">맛집 제공 이미지</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<!-- 모달 내용을 이곳에 추가 -->
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
	
<div class="text-center pt-5" style="height:150%; background-color: #FFFCF5;">
	<div class="form-signin card shadow-sm w-100 m-auto">
		<form action="foodMainModify.do" method="post" style="text-align: center;" enctype="multipart/form-data" onsubmit="return validateForm()" >
			<input type="hidden" name="fNo" value="${vo.fNo}">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/food/foodMain.do" title="Arcalive">
			<svg class="ms-1 mb-4" style="color:#FFA500" xmlns="http://www.w3.org/2000/svg" width="72" height="60" fill="currentColor" class="bi bi-cup-hot" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M.5 6a.5.5 0 0 0-.488.608l1.652 7.434A2.5 2.5 0 0 0 4.104 16h5.792a2.5 2.5 0 0 0 2.44-1.958l.131-.59a3 3 0 0 0 1.3-5.854l.221-.99A.5.5 0 0 0 13.5 6H.5ZM13 12.5a2.01 2.01 0 0 1-.316-.025l.867-3.898A2.001 2.001 0 0 1 13 12.5ZM2.64 13.825 1.123 7h11.754l-1.517 6.825A1.5 1.5 0 0 1 9.896 15H4.104a1.5 1.5 0 0 1-1.464-1.175Z"/>
			  <path d="m4.4.8-.003.004-.014.019a4.167 4.167 0 0 0-.204.31 2.327 2.327 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.31 3.31 0 0 1-.202.388 5.444 5.444 0 0 1-.253.382l-.018.025-.005.008-.002.002A.5.5 0 0 1 3.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 3.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 3 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 4.4.8Zm3 0-.003.004-.014.019a4.167 4.167 0 0 0-.204.31 2.327 2.327 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.31 3.31 0 0 1-.202.388 5.444 5.444 0 0 1-.253.382l-.018.025-.005.008-.002.002A.5.5 0 0 1 6.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 6.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 6 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 7.4.8Zm3 0-.003.004-.014.019a4.077 4.077 0 0 0-.204.31 2.337 2.337 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.198 3.198 0 0 1-.202.388 5.385 5.385 0 0 1-.252.382l-.019.025-.005.008-.002.002A.5.5 0 0 1 9.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 9.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 9 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 10.4.8Z"/>
			</svg>
			</a>
			<h1 class="h3 mb-3 fw-normal" style="color:#FFA500">식당 등록</h1>
	
			<div class="form-floating">
				<input type="text" class="form-control" id="food_name" placeholder="가게 이름" name="food_name" value="${vo.food_name}">
				<label for="floatingInput" class="text-muted">가게 이름</label>
			</div>
			
			<div class="form-floating">
				<input type="text" class="form-control" id="food_address" placeholder="주소" name="food_address" value="${vo.food_address}" readonly>
				<label for="floatingPassword" class="text-muted">주소</label>
				<span class="text-muted btn btn-outline-warning py-1 my-1" id="search_address" style="cursor:pointer;">주소 찾기</span>
			</div>
	
			<div class="form-floating">
				<input type="text" class="form-control" id="food_phone" placeholder="전화번호" name="food_phone" value="${vo.food_phone}">
				<label for="floatingInput" class="text-muted">전화번호</label>
			</div>
			
			<div class="form-floating">
				<input type="text" class="form-control" id="food_food_kind" placeholder="대표음식종류" name="food_food_kind" value="${vo.food_food_kind}">
				<label for="floatingInput" class="text-muted">대표음식종류</label>
			</div>
			
			<div class="form-floating">
				<input type="text" class="form-control" id="food_avg_price" placeholder="음식 평균 가격대" name="food_avg_price" value="${vo.food_avg_price}">
				<label for="floatingInput" class="text-muted">음식 평균 가격대</label>
			</div>
			
			<div class="form-floating">
				<input type="text" class="form-control" id="food_working_hours" placeholder="영업시간" name="food_working_hours" value="${vo.food_working_hours}">
				<label for="floatingInput" class="text-muted">영업시간</label>
			</div>
			
			<div class="form-floating">
				<input type="text" class="form-control" id="food_holiday" placeholder="휴일" name="food_holiday" value="${vo.food_holiday}">
				<label for="floatingInput" class="text-muted">휴일</label>
			</div>
			
			<div class="form-floating">
				<input type="text" class="form-control" id="food_website" placeholder="웹사이트" name="food_website" value="${vo.food_website}">
				<label for="floatingInput" class="text-muted">웹사이트</label>
			</div>
			
			<div class="form-floating">
				<textarea class="form-control" id="food_content" placeholder="맛집 설명" name="food_content" oninput="limitTextarea(this, 200)" style="resize:none; height:200px;">${vo.food_content}</textarea>
				<div class="text-muted" style="text-align:right;"><span id="charCount">200</span> 자 남음</div>
				<label for="floatingInput" class="text-muted">맛집 설명</label>
				<script>
					function limitTextarea(element, limit) {
					    const text = element.value;
					    if (text.length > limit) {
					        element.value = text.substring(0, limit);
					    }
					    const charCount = limit - text.length;
					    document.getElementById('charCount').textContent = charCount;
					}
				</script>
			</div>
			<label for="floatingInput" class="text-muted">맛집 지역</label>
			<div class="form-floating">
				<select class="form-select mb-2" id="LType" name="LType">
					<option value="TT" <c:if test="${vo.LType == 'TT'}">selected</c:if>>지역을 선택해주세요. </option>
						<option value="GG" <c:if test="${vo.LType == 'GG'}">selected</c:if>>서울 / 경기 </option>
						<option value="GW" <c:if test="${vo.LType == 'GW'}">selected</c:if>>강원 </option>
						<option value="CB" <c:if test="${vo.LType == 'CB'}">selected</c:if>>충북 </option>
						<option value="CN" <c:if test="${vo.LType == 'CN'}">selected</c:if>>충남 </option>
						<option value="GB" <c:if test="${vo.LType == 'GB'}">selected</c:if>>경북 </option>
						<option value="GN" <c:if test="${vo.LType == 'GN'}">selected</c:if>>경남 </option>
						<option value="JB" <c:if test="${vo.LType == 'JB'}">selected</c:if>>전북 </option>
						<option value="JN" <c:if test="${vo.LType == 'JN'}">selected</c:if>>전남 </option>
						<option value="JJ" <c:if test="${vo.LType == 'JJ'}">selected</c:if>>제주 </option>
				</select>
			</div>
			
			
			<div class="card my-4">
				<h1 class="h5 mb-3 fw-normal text-muted">맛집 등록 이미지 관리</h1>
				<div class="form-floating">
					<button type="button" class="btn btn-lg btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModalCenteredScrollable" style="color:white">
					등록된 이미지 보기
					</button>
				</div>	
				
				<label class="btn mt-2 mx-2" style="background-color:#FFA500; color:white">
					추가 이미지 선택			
				<input type="file" name="multiFile" multiple style="display: none;">
				</label>
				<div id="preview"></div>
				<br>
			</div>
			<button class="w-100 btn btn-lg " style="background-color:#FFA500; color:white">
				수정 등록
			</button>
			
		</form>
	</div>
</div>

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