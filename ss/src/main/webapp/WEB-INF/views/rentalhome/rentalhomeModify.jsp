<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
	document.getElementById("search_address").addEventListener("click", function(){
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				document.getElementById("address").value = data.address; // 주소 넣기
			}
		}).open();
	});
	
	// 주어진 문자열에서 요일 배열 만들기
	const day = '${rentalhomeVO.breakfast_day}'.split(",");
	// 각 체크박스의 요일 값과 배열에 포함된 요일 비교하여 checked 속성 부여
	const breakfast_day = document.getElementsByName("breakfast_day");
	for(var i=0; i <breakfast_day.length; i++){
		for(var j=0; j<day.length; j++){
			if(day[j] == breakfast_day[i].value){
				breakfast_day[i].checked = true;
			} 
		}
	}
}
function thumbnail(index){
	var attach_idx = document.getElementsByName("attach_idx")[index].value;
	var rentalhome_idx = document.getElementsByName("rentalhome_idx")[index].value;
	$.ajax({
		url:"rentalhomeThumbnail.do",
		type:"post",
		data:{
			attach_idx:attach_idx,
			rentalhome_idx:rentalhome_idx
		},
		success:function(){
			alert("썸네일을 등록하셨습니다.");
		},
		error:function(error){
			console.log('ERROR: ', error);
		}
	});
}	

function attach_delete(index){
	var attach_idx = document.getElementsByName("attach_idx")[index];
	var attach_img = document.getElementsByName("attach_img")[index];
	$.ajax({
		url:"rentalhomeDelete_attach.do",
		type:"post",
		data:{
			attach_idx:attach_idx.value
		},
		success:function(){
			alert("등록된 이미지를 삭제하셨습니다.");
			attach_img.style.display = "none";
		},
		error:function(error){
			console.log('ERROR: ', error);
		}
	});
}	

function validation(){
	document.getElementById("name").value = decodeHTMLEntities(document.getElementById("name").value);
	var name = document.getElementById("name").value;

	document.getElementById("info").value = decodeHTMLEntities(document.getElementById("info").value);
	var info = document.getElementById("info").value;

	var type = document.getElementById("type").value;

	var checkIn = document.getElementById("checkIn").value;
	var checkOut = document.getElementById("checkOut").value;

	document.getElementById("checkIn_info").value = decodeHTMLEntities(document.getElementById("checkIn_info").value);
	var checkIn_info = document.getElementById("checkIn_info").value;

	var breakfast_price = document.getElementById("breakfast_price").value;
	
	var breakfast_open = document.getElementById("breakfast_open").value;
	var breakfast_close = document.getElementById("breakfast_close").value;
	
	// 유효성 검사
	const pattern_time = /^(0?[1-9]|1\d|2[0-3]):[0-5]\d$/;
	const pattern_num = /^[1-9][0-9]*$/;
	
	// 숙소 종류 선택
	if(type == ''){
		alert("숙소 종류를 선택해주세요.");
		return false;
	}

	// 체크인 체크아웃
	if(!(pattern_time.test(checkIn) && pattern_time.test(checkOut))){
		alert("체크인&체크아웃 시간을 확인해주세요.");
		return false;
	}
	// 조식 요금
	if(breakfast_price != null || breakfast_price != ""){
		if(!pattern_num.test(breakfast_price)){
			alert("조식 요금을 확인해 주세요");
			return false;
		}
		// 조식 시간
		if(!pattern_time.test(breakfast_open) && !pattern_time.test(breakfast_close)){
			alert("조식 시간을 확인해주세요.");
			return false;
		}
		if(parseInt(breakfast_open.replace(':','')) >= parseInt(breakfast_close.replace(':',''))){
			alert("조식의 오픈 시간이 마감 시간보다 크거나 같을 수 없습니다.");
			return false;
		}
	}
	
	if(!confirm("숙소를 수정하시겠습니까?")){
		return false;
	}
	
	return true;
	
}
function decodeHTMLEntities (str) {
	if(str !== undefined && str !== null && str !== '') {
		str = String(str);

		str = str.replace(/<script[^>]*>([\S\s]*?)<\/script>/gmi, '');
		str = str.replace(/<\/?\w(?:[^"'>]|"[^"]*"|'[^']*')*>/gmi, '');
		var element = document.createElement('div');
		element.innerHTML = str;
		str = element.textContent;
		element.textContent = '';
	}

	return str;
}
</script>
<!-- CSS ================================================================= -->
<style>
.form-signin .scrollable-x {
  overflow-x: auto;
  white-space: nowrap;
}

.form-signin {
  max-width: 700px;
  padding: 15px;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input {
  margin-bottom: 1px;


}
.masthead:before {
    content: "";
    position: absolute;
    background-color: #1c375e;
    height: 100%;
    width: 100%;
    top: 0;
    left: 0;
    opacity: 0.5;
}		
.masthead {
    position: relative;
    background: url(../img/homeback.jpg) no-repeat center center;
    background-size: cover;
    height:400px
}	
</style>

<div class="masthead text-center pt-5" style="height:200%; font-family: 'TheJamsil5Bold';">
	<div class="form-signin card shadow-sm w-100 m-auto" >
		<!-- Modal -->
		<div class="modal fade" id="rentalhome_attach" tabindex="-1" aria-labelledby="rentalhome_attachLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="rentalhome_attachLabel">숙소에 등록된 이미지</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div style="margin:24px; text-align:left;">
							<c:forEach items="${attach}" var="attach"  varStatus="status">
								<div name="attach_img" style="display:inline-block; margin:20px 0px;">
									<img src="<%=request.getContextPath()%>/resources/upload/${attach.physical_name}" style="width:350px; height:230px; border-radius:5px; display:inline-block;"><br>
									<input type="hidden" name="attach_idx" value="${attach.attach_idx}">
									<input type="hidden" name="rentalhome_idx" value="${attach.rentalhome_idx}">
									<button onclick="thumbnail(${status.index})" style="border:0px; background-color:transparent; border-radius:5px; padding:10px; height:50px; line-height:25px;font-weight:bold;">썸네일 등록</button>
									<button onclick="attach_delete(${status.index})" style="border:0px; background-color:transparent; border-radius:5px; padding:10px; height:50px; line-height:25px;font-weight:bold;">등록 이미지 삭제</button>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<form action="rentalhomeModify.do" method="post" style="text-align: center;" enctype="multipart/form-data" onsubmit="return validation()">
			<input type="hidden" name="rentalhome_idx" value="${rentalhomeVO.rentalhome_idx}">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do" title="Arcalive">
			<svg xmlns="http://www.w3.org/2000/svg" style="color:#0863ec" width="72" height="60" fill="currentColor" class="bi bi-house-add" viewBox="0 0 16 16">
			  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h4a.5.5 0 1 0 0-1h-4a.5.5 0 0 1-.5-.5V7.207l5-5 6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
			  <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 1 0 1 0v-1h1a.5.5 0 1 0 0-1h-1v-1a.5.5 0 0 0-.5-.5Z"/>
			</svg>
			</a>
			<h1 class="h3 mb-3 fw-normal" style="color:#0863ec">숙소 수정하기기</h1>
	
			<div class="form-floating">
				<input type="text" class="form-control" placeholder="숙박 시설 이름" id="name" name="name" value="${rentalhomeVO.name}">
				<label for="floatingInput" class="text-muted">숙박 시설 이름</label>
			</div>
			<div class="d-flex">
			<span class=" btn btn-outline-primary py-1 my-1 float-left w-25" id="search_address" style="cursor:pointer;">주소 찾기</span>
			</div>
			<div class="form-floating ">
				<input type="text" class="form-control" id="address" readonly placeholder="주소" name="address" value="${rentalhomeVO.address}">
				<label for="floatingPassword" class="text-muted">주소</label>
			</div>
	
			<div class="form-floating mb-3">
				<textarea class="form-control" placeholder="숙소 소개글" id="info" name="info"  style="height: 200px; resize: none">${rentalhomeVO.info}</textarea>
  				<label for="floatingTextarea2" class="text-muted">숙소 소개글</label>
			</div>
			
			
			
			<div class="mb-2">
				<select name="type" id="type" class="form-select" aria-label="Default select example">
					<option selected value="">숙소 종류</option>
					<option value="motel" <c:if test="${rentalhomeVO.type == 'motel'}">selected</c:if> >모텔</option>
					<option value="hotel" <c:if test="${rentalhomeVO.type == 'hotel'}">selected</c:if> >호텔</option>
					<option value="resort" <c:if test="${rentalhomeVO.type == 'resort'}">selected</c:if>>리조트</option>
					<option value="pension" <c:if test="${rentalhomeVO.type == 'pension'}">selected</c:if>>펜션</option>
					<option value="guesthouse" <c:if test="${rentalhomeVO.type == 'guesthouse'}">selected</c:if>>게스트 하우스</option>
					<option value="camping" <c:if test="${rentalhomeVO.type == 'camping'}">selected</c:if>>캠핑  & 글램핑</option>
				</select>
			</div>
			<div class="card mb-2">
				<span class="text-muted ">호텔내 시설체크</span>
				<div class="py-md-1 ms-4" style="text-align: left;">
					<input type="checkbox" <c:if test="${rentalhomeVO.inPool_yn == 'Y'}">checked</c:if> class="btn-check" name="inPool_yn" value="Y" id="btn-check-outlined1" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined1">내부 수영장</label>
					<input type="checkbox" <c:if test="${rentalhomeVO.outPool_yn == 'Y'}">checked</c:if> class="btn-check" name="outPool_yn" value="Y" id="btn-check-outlined2" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined2">야외 수영장</label>
					<input type="checkbox" <c:if test="${rentalhomeVO.parking_yn == 'Y'}">checked</c:if> class="btn-check" name="parking_yn" value="Y" id="btn-check-outlined3" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined3">주차장</label>
					<input type="checkbox" <c:if test="${rentalhomeVO.pickup_yn == 'Y'}">checked</c:if> class="btn-check" name="pickup_yn" value="Y" id="btn-check-outlined4" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined4">픽업</label>
					<input type="checkbox" <c:if test="${rentalhomeVO.wifi_yn == 'Y'}">checked</c:if> class="btn-check" name="wifi_yn" value="Y" id="btn-check-outlined5" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined5">와이파이</label>
					<input type="checkbox" <c:if test="${rentalhomeVO.beach_yn == 'Y'}">checked</c:if> class="btn-check" name="beach_yn" value="Y" id="btn-check-outlined6" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined6">인근해변</label>
					<input type="checkbox" <c:if test="${rentalhomeVO.bbq_yn == 'Y'}">checked</c:if> class="btn-check" name="bbq_yn" value="Y" id="btn-check-outlined7" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined7">바베큐</label>
					<input type="checkbox" <c:if test="${rentalhomeVO.breakfast_yn == 'Y'}">checked</c:if> class="btn-check" name="breakfast_yn" value="Y" id="btn-check-outlined8" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined8">조식</label>
					<input type="checkbox" <c:if test="${rentalhomeVO.animal_yn == 'Y'}">checked</c:if> class="btn-check" name="animal_yn" value="Y" id="btn-check-outlined9" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined9">반려동물</label>
				</div>
			</div>
			
			<div class="d-flex mt-3">
				<h5 class="text-left ms-2" >체크인</h5>
			</div>
			<div class="card px-3 py-3">
				<div class="row align-items-center">
					<div class="form-floating col">	
						<input type="text" class="form-control ps-3" value="${rentalhomeVO.checkIn}" placeholder="체크 인 시간" id="checkIn" name="checkIn">
						<label for="floatingInput" class="text-muted ms-3">체크 인 시간</label>
					</div>
						
						-
					
					<div class="form-floating col">	
						<input type="text" class="form-control ps-3" value="${rentalhomeVO.checkOut}" placeholder="체크 아웃 시간" id="checkOut" name="checkOut">
						<label for="floatingInput2" class="text-muted ms-3">체크 아웃 시간</label>
					</div>
				</div>
				
				<div class="form-floating my-2">
					<input type="text" value="${rentalhomeVO.checkIn_info}" class="form-control" id="checkIn_info" name="checkIn_info" placeholder="체크인 방법">
					<label for="floatingInput" class="text-muted">체크인 방법</label>
				</div>
			</div>
			<div class="d-flex mt-3">
				<h5 class="text-left ms-2" >조식</h5>
			</div>
			<div class="card px-3 py-3">
				<div class="form-floating mx-1 my-1">
					<input type="text" value="${rentalhomeVO.breakfast_price}" class="form-control" placeholder="요금 / 1인" id="breakfast_price" name="breakfast_price">
					<label for="floatingInput" class="text-muted">요금 / 1인</label>
				</div>
				
				<div class="d-flex">
					<span class="text-left ms-2 mt-2">영업시간</span>
				</div>
				<div class="d-flex">
					<div class="form-floating col mx-1 my-1">
						<input type="text" value="${rentalhomeVO.breakfast_open}" class="form-control ps-3" id="breakfast_open" placeholder="open" name="breakfast_open">
						<label for="breakfast_open" class="text-muted ms-1">open</label>
					</div>
					<div class="form-floating col mx-1 my-1">
						<input type="text" value="${rentalhomeVO.breakfast_close}" class="form-control ps-3" id="breakfast_close" placeholder="close" name="breakfast_close">
						<label for="breakfast_close" class="text-muted ms-1">close</label>
					</div>
				</div>	
				<div class="d-flex">
					<span class="text-left ms-2 mt-2">영업일</span>
				</div>
				<div class="card mb-2 mx-1">
				<div class="d-flex my-3 justify-content-center">
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="월요일">
						<label class="form-check-label" for="flexCheckDefault">
							월요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="화요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							 화요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="수요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							수요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="목요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							목요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="금요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							금요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="토요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							토요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="일요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							일요일
						</label>
					</div>
				</div>
			</div>
			</div>
		
			<div class="d-flex ms-2 align-items-center">
				<span class="h5 my-3 me-3 fw-normal">파일 업로드</span>
				<button type="button" class="btn btn-primary w-20 h-50 my-3" data-bs-toggle="modal" data-bs-target="#rentalhome_attach">
					등록된 이미지 보기
				</button>
			</div>	
		
			<div class="card">
				<div class="d-flex">
					<label class="btn btn-primary float-left ms-2 my-2" >
					이미지 선택			
					<input type="file" name="multiFile" multiple style="display: none;">
					</label>
				</div>	
				<div class="ms-4" id="preview" style="overflow-y: auto; max-height: 230px; text-align: left;"></div>
			</div>	
			<br>
			<button class="w-100 btn btn-lg btn-primary" >
				수정
			</button>
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp" %> 