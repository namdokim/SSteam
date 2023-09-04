<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/datepicker.css">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap">
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=471bd87d2c2bfa282198a74a11556a57&libraries=services"></script>
<script>
	$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});

	$(function () {
	  $('.datepicker').datepicker();
	});
window.onload = function(){
	//신고할 때 review_report_reason 세팅
	const reasons = document.getElementsByClassName("review_report_reason");
	Array.from(reasons).forEach(function(reason, index) {
		reason.onclick = function() {
			for(var i=0; i<reasons.length; i++){
				reasons[i].style.backgroundColor="transparent";
			}
			if(document.getElementById("review_report_reason").value == reason.innerText){
				reason.style.backgroundColor="transparent";
				document.getElementById("review_report_reason").value = "";
			}else{
				reason.style.backgroundColor="#e1edfe";
				document.getElementById("review_report_reason").value = reason.innerText;
			}
		};
	});
	// 신고 완료 ajax
	document.getElementById("review_report_insert").onclick = function(){
		const review_idx = document.getElementById("review_report_review_idx").value;
		document.getElementById("review_report_contents").value = decodeHTMLEntities(document.getElementById("review_report_contents").value);
		const review_report_contents = document.getElementById("review_report_contents").value;
		const review_report_reason = document.getElementById("review_report_reason").value;

		if(review_idx == "" || review_report_contents == "" || review_report_reason == ""){
			alert("신고 이유와 신고 내용을 작성 확인해주세요.");
			return;
		}
		if(!confirm("신고하시겠습니까?")){
			return;
		}
		$.ajax({
			url:'insert_review_report.do',
			method:'post',
			data:{
				review_idx:review_idx,
				review_report_contents:review_report_contents,
				review_report_reason:review_report_reason
			},
			success:function(){
				document.getElementById("reportModal").style.display = "none";
				document.getElementsByClassName("modal-backdrop")[0].style.display = "none";
			},
			error:function(){
				alert("신고를 처리하는데 오류가 발생했습니다. 고객센터에 문의바랍니다.");
			}
		});
	};
	
	
	const services_ = document.getElementsByName("services");
	const facilities_ = document.getElementsByName("facilities");
	const cleans_ = document.getElementsByName("cleans");
	const prices_ = document.getElementsByName("prices");
	
	services_.forEach(function(services, index) {
		services.onclick = function() {
			for(let i=0; i < services_.length; i++){
				services_[i].style.color = "#eaeaea";
			}
			for (let j = index; j >= 0; j--) {
				services_[j].style.color = "#f7d15e";
			}
			document.getElementById("review_service").value = index+1;
		};
	});

	facilities_.forEach(function(facilities, index) {
		facilities.onclick = function() {
			for(let i=0; i < facilities_.length; i++){
				facilities_[i].style.color = "#eaeaea";
			}
			for (let j = index; j >= 0; j--) {
				facilities_[j].style.color = "#f7d15e";
			}
			document.getElementById("review_facility").value = index+1;
		};
	});
	
	cleans_.forEach(function(cleans, index) {
		cleans.onclick = function() {
			for(let i=0; i < cleans_.length; i++){
				cleans_[i].style.color = "#eaeaea";
			}
			for (let j = index; j >= 0; j--) {
				cleans_[j].style.color = "#f7d15e";
			}
			document.getElementById("review_clean").value = index+1;
		};
	});
	
	prices_.forEach(function(prices, index) {
		prices.onclick = function() {
			for(let i=0; i < prices_.length; i++){
				prices_[i].style.color = "#eaeaea";
			}
			for (let j = index; j >= 0; j--) {
				prices_[j].style.color = "#f7d15e";
			}
			document.getElementById("review_price").value = index+1;
		};
	});
	
	
	var clean_avg_width = parseInt(${reviewVO.clean_avg});
	var facility_avg_width = parseInt(${reviewVO.facility_avg});
	var price_avg_width = parseInt(${reviewVO.price_avg});
	var service_avg_width = parseInt(${reviewVO.service_avg});
	
	
	document.getElementById("clean_avg_width").style.width = clean_avg_width*20+"px";
	document.getElementById("facility_avg_width").style.width = facility_avg_width*20+"px";
	document.getElementById("price_avg_width").style.width = price_avg_width*20+"px";
	document.getElementById("service_avg_width").style.width = service_avg_width*20+"px";

	document.getElementById("clean_avg_width_").style.width = clean_avg_width*60+"px";
	document.getElementById("facility_avg_width_").style.width = facility_avg_width*60+"px";
	document.getElementById("price_avg_width_").style.width = price_avg_width*60+"px";
	document.getElementById("service_avg_width_").style.width = service_avg_width*60+"px";
	
	var price_ = document.getElementsByName("price");
	for (var i = 0; i < price_.length; i++) {
		var price = document.getElementsByName("price")[i];
		document.getElementsByName("price")[i].innerText = parseInt(price.innerText)+"원";
	}
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${rentalhomeVO.address}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
//        지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    }
	});  
	
	
	if( ${like_dupl > 0} ){
		document.getElementById("love_full").style.display="block";
		document.getElementById("love_empty").style.display="none";
	}

	// 객실 이미지 모달
	const modal_room = document.getElementById("gallery-modal-room");
	const closeButton_room = document.getElementById("close-button-room");
	
	closeButton_room.addEventListener("click", () => {
		modal_room.style.display = "none";
		document.body.style.overflow = "auto";
	});
	window.addEventListener("click", (event) => {
	  if(event.target == modal_room) {
	    modal_room.style.display = "none";
	    document.body.style.overflow = "auto";
	  }
	});
};
function select_img(index){
	const room_idx = document.getElementsByName("ajax_room_idx")[index];
	
	document.getElementById("gallery-modal-room").style.display = "block";
	document.body.style.overflow = "hidden";
	
	$.ajax({
		url:"rentalhome_room_attach_ByIdx.do",
		type:"get",
		data:{
			  room_idx:room_idx.value
		},
		success:function(list){
			var html = "";
			for (var i = 0; i < list.length; i++) {
				var room = list[i];
				console.log(${room.physical_name});
				html = html + '<img src="<%=request.getContextPath()%>/resources/upload/'+room.physical_name+'" style="margin:2px 2px;width:377px; height:250px; border-radius:5px; display:inline-block;">';
			}
			document.getElementById("insert_img").innerHTML = html;
		},
		error:function(xhr, status, error){
			console.log("ERROR: ", error);
		}
	});
}

function insert_like(){

	const rentalhome_idx = ${rentalhomeVO.rentalhome_idx};
	const insert_ = document.getElementById("love_empty");			// <img> 
	const delete_ = document.getElementById("love_full");			// <img> 
	const like_count = document.getElementById("like_count"); 		// <span>
	
	$.ajax({
		url: 'insert_like.do', 						// 요청을 보낼 서버의 URL 주소
		method: 'post', 							// HTTP 요청 방식 (GET, POST 등)
		data: { 									// 요청에 포함될 데이터 (옵션)
			rentalhome_idx: rentalhome_idx
		},											
		success: function(data) {
			if(data > 0){
				insert_.style.display="none";
				delete_.style.display="block";
				like_count.innerHTML = data;
			}else if(data < 0 ){
				if(confirm("로그인 페이지로 이동하시겠습니까?")){
					location.href = "<%=request.getContextPath()%>/User/joinCheck.do";
				}
			}
			
		},
		error: function(xhr, status, error) {
			console.log('Error:', error);
		}
	});
}
function delete_like(){
	const rentalhome_idx = ${rentalhomeVO.rentalhome_idx};
	const delete_ = document.getElementById("love_full");		// <img> 
	const insert_ = document.getElementById("love_empty");		// <img> 
	const like_count = document.getElementById("like_count"); 	// <span>
	
	$.ajax({
		url: 'delete_like.do', 						// 요청을 보낼 서버의 URL 주소
		method: 'post', 							// HTTP 요청 방식 (GET, POST 등)
		data: { 									// 요청에 포함될 데이터 (옵션)
			rentalhome_idx: rentalhome_idx
		},											
		success: function(data) {
			if(data > 0){
				delete_.style.display="none";
				insert_.style.display="block";
				like_count.innerHTML = data;
			}else if(data < 0 ){
				confirm("로그인 페이지로 이동하시겠습니까?");
				location.href = "<%=request.getContextPath()%>/User/joinCheck.do";
			}
		},
		error: function(xhr, status, error) {
			console.log('Error:', error);
		}
	});
}
function search_view(){
	const location_ = document.getElementById("location").value;
	const start_date = document.getElementById("start_date").value;
	const end_date = document.getElementById("end_date").value;
	const person = document.getElementById("person").value;
	
	if(!compareDates(start_date, end_date)){
		alert("날짜를 확인해주세요.");
		return;
	}
	
	location.href = "rentalhomeView.do?rentalhome_idx="+${rentalhomeVO.rentalhome_idx}+"&location="+location_+"&start_date="+start_date+"&end_date="+end_date+"&person="+person;
	
}
function compareDates(startDate, endDate) {
	const startDateObj = new Date(startDate);
	const endDateObj = new Date(endDate);
	const currentDate = new Date();
	
	if (startDateObj >= endDateObj || startDateObj <= currentDate) {
		return false;
	} else {
		return true;
	} 
}
function need_search(){
	
	alert("날짜, 인원수와 함께 검색해주세요");
}
function set_review_report_modal(review_idx){
	
	document.getElementById("review_report_reason").value = "";
	document.getElementById("review_report_review_idx").value = review_idx;
	document.getElementById("review_report_contents").value = "";
	
	const reasons = document.getElementsByClassName("review_report_reason");
	for(var i=0; i<reasons.length; i++){
		reasons[i].style.backgroundColor="transparent";
	}
}
function review_modify(room_name, contents, service, facility, clean, price, review_idx){
	const services_ = document.getElementsByName("services");
	const facilities_ = document.getElementsByName("facilities");
	const cleans_ = document.getElementsByName("cleans");
	const prices_ = document.getElementsByName("prices");
	
	services_.forEach(function(services, index) {
		for (let i = service-1; i >= 0; i--) {
			services_[i].style.color = "#f7d15e";
		}
	});
	facilities_.forEach(function(facilities, index) {
		for (let i = facility-1; i >= 0; i--) {
			facilities_[i].style.color = "#f7d15e";
		}
	});
	
	cleans_.forEach(function(cleans, index) {
		for (let i = clean-1; i >= 0; i--) {
			cleans_[i].style.color = "#f7d15e";
		}
	});
	
	prices_.forEach(function(prices, index) {
		for (let i = price-1; i >= 0; i--) {
			prices_[i].style.color = "#f7d15e";
		}
	});
	
	console.log(room_name+" / "+contents+" / "+service+" / "+facility+" / "+clean+" / "+price);
	document.getElementById("review_modify_modal_room").innerText = room_name;
	document.getElementById("review_modify_modal_contents").value = contents;
	
	document.getElementById("review_service").value=service;
	document.getElementById("review_facility").value=facility;
	document.getElementById("review_clean").value=clean;
	document.getElementById("review_price").value=price;
	document.getElementById("review_idx").value=review_idx;
	
}
function validation(){
	document.getElementById("review_modify_modal_contents").value = decodeHTMLEntities(document.getElementById("review_modify_modal_contents").value);
	const review_modify_modal_contents = document.getElementById("review_modify_modal_contents").value;
	if(review_modify_modal_contents == ""){
		alert("내용을 입력해주세요.");
		return false;
	}
	if(document.getElementById("review_service").value == 0){
		alert("평점을 입력해주세요.");
		return false;
	}
	if(document.getElementById("review_facility").value == 0){
		alert("평점을 입력해주세요.");
		return false;
	}
	if(document.getElementById("review_clean").value == 0){
		alert("평점을 입력해주세요.");
		return false;
	}
	if(document.getElementById("review_price").value == 0){
		alert("평점을 입력해주세요.");
		return false;
	}
	if(!confirm("리뷰를 작성하시겠습니까?")){
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
<style type="text/css">
	a {
		text-decoration:none;
		color:black;
	}
	a:hover {
		color:black;
	}
	.like {
		background-size: contain;
		background-repeat: no-repeat;
		background-position: center;
	}
	.user {
		width: 50px;
		height: 50px;
		background-image: url(../img/love_full.png);
		background-size: contain;
		background-repeat: no-repeat;
		background-position: center;
	}
	.hotel {
		background-image: url(../img/hotel.jpg);
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	.view{
		border-radius:10px;
		background-color:white;
/* 		box-shadow:1px 1px 1px 1px #ddd; */
	}
	.search{
		border:none;
		color:#444444;
	}
	.search:hover{
		border-bottom:2px solid #0863ec;
		border-radius:0px;
	}
	/* 갤러리 모달 스타일 */
	.gallery-modal {
	  display: none;
	  position: fixed;
	  z-index: 1000;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-color: rgba(0, 0, 0, 0.8);
	  overflow: auto;
	  vertical-align:middle;
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
	.modal-center{
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
	}
    .review-num input[type="radio"] {
       display: none;
    }
 
    .review-num input[type="radio"] + span {
        display: inline-block;
        padding:5px 15px;
        border: 0px;
        border-radius: 5px;
        background-color: #eff0f5;
        text-align: center;
        cursor: pointer;
        font-size:10pt;
    }
 
    .review-num input[type="radio"]:checked + span {
        background-color: #0863ec;
        color: #ffffff;
    }
	.siren{
		fill:#f94633;
		cursor:pointer;
	}
	.siren:hover{
		fill:#d4402f;
	}
	.review_report_button{
		color:#444444;
		display:inline-block;
		border-radius:5px;
		width:150px;
		padding:10px 0px;
		margin:0px 10px;
		border:1px solid lightgray;
		font-weight:bold;
	}
	.review_report_button:hover{
		border:1px solid #6ba8fe;
	}
	.review_btn:hover{
		background-color:#0a57cb;
	}
	.review_btn{
		text-align:center;
		border:0px;
		color:white;
		padding:8px 30px;
		border-radius:5px;
		background-color:#2078fc;
	}
</style>
<div style="width:1920px; text-align:center; background-color:#f7fafc; padding-bottom:50px; font-family: 'TheJamsil5Bold';">
	<div class="modal fade" id="rentalhome_attach" tabindex="-1" aria-labelledby="rentalhome_attachLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="rentalhome_attachLabel">숙소 이미지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div style="margin:24px; text-align:left;">
						<c:forEach items="${attach}" var="attach">
							<img src="<%=request.getContextPath()%>/resources/upload/${attach.physical_name}" style="margin:2px 0px;width:350px; height:230px; border-radius:5px; display:inline-block;">
						</c:forEach>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="gallery-modal" id="gallery-modal-room"  style="padding:50px;">
		<div class="close-button" id="close-button-room" style="display:inline-block;">&times;</div>
		<div class="view" id="modal-room" style="width:1224px; padding:20px; display:inline-block;">
			<div style="text-align:left; margin:20px;">
				<span style="font-weight:bold; font-size:15pt;">숙소 제공 객실 이미지</span>
			</div>
			<div style="margin:20px; width:1144px; height:1px; background-color:lightgray;"></div>
			<div id="insert_img" style="margin:20px; text-align:left;"></div>
		</div>
	</div>
	<div style="position:sticky; width:100%; top:0px; background-color:#0863ec; z-index:100; border-radius:0px 0px 20px 20px; margin:0 auto; padding:10px;  line-height:50px;">
		<div style="background-color:white;border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
			<span style="color:#282828; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">여행지</span><br>
			<input type="text" value="${searchVO.location}" id="location" class="search" readonly style="font-weight:bold; font-size:11pt;width:230px;position:absolute; top:23px; left:10px; height:25px; outline:none;">
		</div>
		<div class="mx-1" style="background-color:white; border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
				<div class="row justify-content-center">
					<div class="col-md-5">
						<span style="color:#282828; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">체크인</span><br>
						<input readonly type="text" value="${searchVO.start_date}" id="start_date"  class="search form-control datepicker" style="padding:0px; box-shadow:0 0 0 0; font-weight:bold; font-size:11pt;width:100px;position:absolute; top:23px; left:10px; height:25px; z-index:120; outline:none;">
				</div>
				<div class="col-md-5">
						<span style="color:#282828; font-size:9pt; line-height:normal; position:absolute; top:5px; left:140px;">체크아웃</span><br>
						<input readonly type="text" value="${searchVO.end_date}" id="end_date" class="search form-control datepicker" style="padding:0px; box-shadow:0 0 0 0; font-weight:bold;font-size:11pt; width:100px;position:absolute; top:23px; left:140px; height:25px; z-index:120; outline:none;">
					</div>
				</div>
		</div>
		<div style="background-color:white;border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
			<span style="color:#282828; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">인원 수</span><br>
			<select id="person" class="search" style="font-weight:bold; font-size:11pt;width:230px;position:absolute; top:23px; left:10px; height:25px; outline:none; ">
				<option selected ></option>
				<option value="1" <c:if test="${searchVO.person eq '1'}">selected</c:if>>1</option>
				<option value="2" <c:if test="${searchVO.person eq '2'}">selected</c:if>>2</option>
				<option value="3" <c:if test="${searchVO.person eq '3'}">selected</c:if>>3</option>
				<option value="4" <c:if test="${searchVO.person eq '4'}">selected</c:if>>4</option>
				<option value="5" <c:if test="${searchVO.person eq '5'}">selected</c:if>>5</option>
				<option value="6" <c:if test="${searchVO.person eq '6'}">selected</c:if>>6</option>
				<option value="7" <c:if test="${searchVO.person eq '7'}">selected</c:if>>7</option>
				<option value="8" <c:if test="${searchVO.person eq '8'}">selected</c:if>>8</option>
				<option value="9" <c:if test="${searchVO.person eq '9'}">selected</c:if>>9</option>
				<option value="10" <c:if test="${searchVO.person eq '10'}">selected</c:if>>10</option>
			</select>
		</div>
		<div onclick="search_view()" style="background-color:#0863ec; width:80px; height:50px; display:inline-block; border-radius:5px; text-align:center; cursor:pointer;" >
			<span style="font-weight:bold;color:white; font-size:15pt;">검색</span><br>
		</div>
	</div>
	<div class="card" style="width:1224px; text-align:left;margin:30px auto; padding:10px; position:relative; display:block;">
		<div style="width:1000px; margin:0 auto; padding:10px; display:inline-block;"> 
		<div style="width:900px;">
			<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-buildings-fill" viewBox="0 0 16 16">
			<path d="M15 .5a.5.5 0 0 0-.724-.447l-8 4A.5.5 0 0 0 6 4.5v3.14L.342 9.526A.5.5 0 0 0 0 10v5.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V14h1v1.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5V.5ZM2 11h1v1H2v-1Zm2 0h1v1H4v-1Zm-1 2v1H2v-1h1Zm1 0h1v1H4v-1Zm9-10v1h-1V3h1ZM8 5h1v1H8V5Zm1 2v1H8V7h1ZM8 9h1v1H8V9Zm2 0h1v1h-1V9Zm-1 2v1H8v-1h1Zm1 0h1v1h-1v-1Zm3-2v1h-1V9h1Zm-1 2h1v1h-1v-1Zm-2-4h1v1h-1V7Zm3 0v1h-1V7h1Zm-2-2v1h-1V5h1Zm1 0h1v1h-1V5Z"/></svg> 
			<span style="font-size:20pt; font-weight:bold;">${rentalhomeVO.name}</span><br>
		</div>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
			<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/></svg>
			<span style="color:#545454;">${rentalhomeVO.address}</span><br>
			<div style="width:700px; margin:5px 0px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; word-break:break-all">
				<span style="font-size:10pt; color:#545454;">${rentalhomeVO.info}</span><br>
			</div>
		</div>
										
		<span id="love_full" onclick="delete_like()" src="../img/love_full.png" class="like" style="color:#fe7c4d; display:none; width:50px; height:50px; position:absolute; top:30px; right:210px;">
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
				<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
			</svg>
		</span>
		<span id="love_empty" onclick="insert_like()" src="../img/love_empty.png" class="like" style="color:silver; width:50px; height:50px; position:absolute; top:30px; right:210px;">
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
			<path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
			</svg>
		</span>
		<div style="width:100px; text-align:center; position:absolute; top:70px; right:185px;">
			<span id="like_count" style="font-size:25pt; color:#374766; font-weight:bold; ">${like_count}</span>
		</div>
		<a href="#room" style="color:white;"><span  class="btn btn-primary btn-sm mr-2" style="text-align:center; width:160px; height:80px; padding:20px 20px; position:absolute; top:30px; left:1040px; font-size:20pt; border-radius:10px;">객실선택</span></a>
		<div style="width:100%; border-radius:5px; display:inline-block; margin-left:10px;">
			<c:forEach items="${attach}" var="attach" begin="0" end="5" varStatus="status">
				<c:choose>
					<c:when test="${status.last}">
						<div data-bs-toggle="modal" data-bs-target="#rentalhome_attach" style="cursor:pointer; display:inline-block; position:relative;">
							<img src="<%=request.getContextPath()%>/resources/upload/${attach.physical_name}" style="filter: brightness(30%); opacity:0.7;width:385px; height:250px; border-radius:5px; margin:4px 2px; display:inline-block; position:relative;">
							<span style="color:white; font-weight:bold; position:absolute; top:120px; right:105px; font-size:15pt;">숙소 이미지 더보기</span>
						</div>
					</c:when>
					<c:otherwise>
						<img src="<%=request.getContextPath()%>/resources/upload/${attach.physical_name}" style="width:385px; height:250px; border-radius:5px; margin:4px 2px; display:inline-block;">
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div style="vertical-align:top; display:inline-block;border:1px solid #ddd; border-radius:5px;text-align:left; width:300px; height:210px; margin:10px 0px 10px 10px; padding:10px 0px;" >
			<div style="width:100px; height:30px; margin:5px 0px 10px 20px;"><span style="font-weight:bold;color:#282828;">리뷰 점수</span></div>
			<div style="text-align:center;">
				<div style="text-align:left;width:120px; height:50px;display:inline-block; margin:5px; position:relative;"><span style="font-weight:bold;">청결</span>&nbsp;&nbsp;${reviewVO.clean_avg}<br>
					<div id="clean_avg_width" style="border-radius:10px; background-color:#1c77f6; margin:5px 0px; padding:1px; height:10px; position:absolute; top:25px; left:0px; z-index:5;"></div>
					<div style="border-radius:10px; background-color:#d1d1d1; margin:5px 0px; padding:1px; height:10px; width:100px; position:absolute; top:25px; left:0px;"></div>
				</div>
				<div style="text-align:left; width:120px; height:50px;display:inline-block; margin:5px; position:relative;"><span style="font-weight:bold;">가격</span>&nbsp;&nbsp;${reviewVO.price_avg}<br>
					<div id="price_avg_width"style="border-radius:10px; background-color:#1c77f6; margin:5px 0px; padding:1px; height:10px; position:absolute; top:25px; left:0px; z-index:5;"></div>
					<div style="border-radius:10px; background-color:#d1d1d1; margin:5px 0px; padding:1px; height:10px; width:100px; position:absolute; top:25px; left:0px;"></div>
				</div>
				<div style="text-align:left; width:120px; height:50px;display:inline-block; margin:5px; position:relative;"><span style="font-weight:bold;">서비스</span>&nbsp;&nbsp;${reviewVO.service_avg}<br>
					<div id="service_avg_width" style="border-radius:10px; background-color:#1c77f6; margin:5px 0px; padding:1px; height:10px; position:absolute; top:25px; left:0px; z-index:5;"></div>
					<div style="border-radius:10px; background-color:#d1d1d1; margin:5px 0px; padding:1px; height:10px; width:100px; position:absolute; top:25px; left:0px;"></div>
				</div>
				<div style="text-align:left; width:120px; height:50px; display:inline-block; margin:5px; position:relative;"><span style="font-weight:bold;">시설</span>&nbsp;&nbsp;${reviewVO.facility_avg}<br>
					<div id="facility_avg_width" style="border-radius:10px; background-color:#1c77f6; margin:5px 0px; padding:1px; height:10px; position:absolute; top:25px; left:0px; z-index:5;"></div>
					<div style="border-radius:10px; background-color:#d1d1d1; margin:5px 0px; padding:1px; height:10px; width:100px; position:absolute; top:25px; left:0px;"></div>
				</div>
			</div>
		</div>
		<div style="vertical-align:top; display:inline-block; border:1px solid #ddd; border-radius:5px; text-align:left;width:360px; height:210px;padding:10px 20px; margin:10px 0px 10px 10px;" >
			<div style="width:100px; height:30px; margin:5px 0px;"><span style="font-weight:bold;color:#282828;">호텔 시설</span></div>
				<c:if test="${rentalhomeVO.inPool_yn == 'Y' || rentalhomeVO.outPool_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/pool.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">수영장</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.parking_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/parking.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">주차장</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.pickup_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/pickup.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">픽업</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.wifi_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/wifi.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.beach_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/beach.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">인근해변</span>
					</div>	
				</c:if>
				<c:if test="${rentalhomeVO.bbq_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/bbq.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">바베큐</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.breakfast_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/breakfast.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">조식</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.animal_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/dog.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">반려동물</span>
					</div>
				</c:if>
			</div>
		<div id="map" style="vertical-align:top;display:inline-block; text-align:center;border:1px solid #ddd; border-radius:5px; width:490px; height:210px; margin:10px 0px 10px 10px;" >
		</div>
	</div>
	<div class="card" style="display:block; width:1224px; margin:20px auto; position:sticky; top:71px;z-index:100;text-align:center; padding:0px 20px; border-bottom:1px solid #d5d9e0;">
		<div style="width:30%; height:100%; display:inline-block; padding:10px 0px; font-weight:bold;"><a href="#room">객실</a></div>
		<div style="width:30%; height:100%; display:inline-block; padding:10px 0px; font-weight:bold;"><a href="#review">리뷰</a></div>
		<div style="width:30%; height:100%; display:inline-block; padding:10px 0px; font-weight:bold;"><a href="#rentalhome_rule">숙소 규정</a></div>
	</div>
	<div class="card" id="room" style="display:block; width:1224px; text-align:left; margin:10px auto;">
		<div>
			<div style="display:inline-block;padding:20px;">
				<span style="font-weight:bold; font-size:15pt;">객실 정보</span>
			</div>
			<c:if test="${not empty login.uNo and login.uNo == rentalhomeVO.uNo }">
				<div style="display:inline-block; width:1040px; text-align:right;">
					<button onclick="location.href='rentalhomeWrite_room.do?rentalhome_idx=${rentalhomeVO.rentalhome_idx}'"style="background-color:transparent; border:0px; width:150px; height:30px; display:inline-block; font-weight:bold;">객실 등록하기</button>
				</div>
			</c:if>
		</div>
		<div style="height:1px; background-color:lightgray;"></div>
		<c:forEach items="${list}" var="list" varStatus="status">
			<div style="width:100%; height:200px; margin:20px 10px;  text-align:center; position:relative; ">
				<c:choose>
					<c:when test="${not empty list.physical_name}">
						<div onclick="select_img(${status.index})" style="display:inline-block; position:absolute; top:0px; left:20px;">
						<input type="hidden" name="ajax_room_idx" value="${list.room_idx}">
							<img src="<%=request.getContextPath()%>/resources/upload/${list.physical_name}" style="cursor:pointer;border-radius:5px; width:240px; height:200px; display:inline-block;">
						</div>
					</c:when>
					<c:otherwise>
						<div class="hotel" style="border-radius:20px; width:240px; height:200px; display:inline-block; position:absolute; top:0px; left:20px;"></div>
					</c:otherwise>
				</c:choose>
				<div style="text-align:left; width:750px; height:150px; margin:20px; padding:10px; display:inline-block; position:absolute; top:0px; left:250px;">
					<div style="margin-bottom:10px;">
						<span style="font-weight:bold; font-size:15pt;">${list.name }</span><br>
					</div>
					<div style="display:inline-block; width:180px; height:30px;">
						<img src="../img/user.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">성인${list.min_person}명 - 성인${list.max_person}명</span>
					</div>
					<c:if test="${list.bed_info != ''}">
						<div style="display:inline-block; width:150px; height:30px;">
							<img src="../img/bed.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">${list.bed_info}</span>
						</div>
					</c:if>
					<c:if test="${list.smoking eq 'N'}">
						<div style="display:inline-block; width:120px; height:30px;">
							<img src="../img/dont-smoke.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">금연객실</span>
						</div>
					</c:if>
					<c:if test="${list.wifi eq 'Y'}">
						<div style="display:inline-block; width:100px; height:30px;">
							<img src="../img/wifi.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
						</div>
					</c:if>
					<br>
					<div style="width:100%; text-align:right; margin:20px 0px 10px 0px;">
						<%Calendar cal = Calendar.getInstance();
						int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

						if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY) {%>
						<c:if test="${list.discount_type eq 'fix'}">
							<span style="background-color:#fe8d48; color:white; font-weight:bold; border-radius:20px 10px 0px 15px; padding:7px 10px;">${list.discount_reason} ${list.discount_money}원 할인</span><br>
								<div style="margin:10px 0px;">
								<span style="font-size:20pt; color:#666666; text-decoration:line-through;">${list.weekend_price}원</span>
								<span name="price" style="font-size:25pt; font-weight:bold; ">${list.weekend_discount_price}</span>
							</div>
						</c:if>
						<c:if test="${list.discount_type eq 'rate'}">
							<span style="background-color:#fe8d48; color:white; font-weight:bold; border-radius:20px 10px 0px 15px; padding:7px 10px;">${list.discount_reason} ${list.discount_money}% 할인</span><br>
							<div style="margin:10px 0px;">
								<span style="font-size:20pt; color:#666666; text-decoration:line-through;">${list.weekend_price}원</span>
								<span name="price" style="font-size:25pt; font-weight:bold; ">${list.weekend_discount_price}</span>
							</div>
						</c:if>
						<c:if test="${list.discount_type eq 'default'}">
							<div style="margin:10px 0px;">
							<br>
							<span name="price" style="font-size:25pt; font-weight:bold; ">${list.weekend_discount_price}</span>
							</div>
						</c:if>
						<%} else {%>
						<c:if test="${list.discount_type eq 'fix' }">
							<span style="background-color:#fe8d48; color:white; font-weight:bold; border-radius:20px 10px 0px 15px; padding:7px 10px;">${list.discount_reason} ${list.discount_money}원 할인</span><br>
								<div style="margin:10px 0px;">
								<span style="font-size:20pt; color:#666666; text-decoration:line-through;">${list.weekday_price}원</span>
								<span name="price" style="font-size:25pt; font-weight:bold; ">${list.weekday_discount_price}</span>
							</div>
						</c:if>
						<c:if test="${list.discount_type eq 'rate' }">
							<span style="background-color:#fe8d48; color:white; font-weight:bold; border-radius:20px 10px 0px 15px; padding:7px 10px;">${list.discount_reason} ${list.discount_money}% 할인</span><br>
							<div style="margin:10px 0px;">
								<span style="font-size:20pt; color:#666666; text-decoration:line-through;">${list.weekday_price}원</span>
								<span name="price" style="font-size:25pt; font-weight:bold; ">${list.weekday_discount_price}</span>
							</div>
						</c:if>
						<c:if test="${list.discount_type eq 'default' }">
							<div style="margin:10px 0px;">
							<br>
							<span name="price" style="font-size:25pt; font-weight:bold; ">${list.weekday_discount_price}</span>
							</div>
						</c:if>
						<%}%>
					</div>
				</div>
				<c:choose>
					<c:when test="${not empty login and not empty searchVO.end_date and not empty searchVO.start_date}">
						<span class="review_btn" onclick="location.href='rentalhomeReserve.do?room_idx=${list.room_idx}&name=${rentalhomeVO.name }&start_date=${searchVO.start_date}&end_date=${searchVO.end_date}'"style="cursor:pointer; width:160px; height:80px; padding:20px 20px; position:absolute; top:120px; left:1030px; border-radius:10px; font-size:20pt;">예약</span>				
					</c:when>
					<c:otherwise>
						<span class="review_btn" onclick="need_search()" style="cursor:pointer; width:160px; height:80px; padding:20px 20px; position:absolute; top:120px; left:1030px; border-radius:10px; font-size:20pt;">검색</span>				
					</c:otherwise>
				</c:choose>
				<c:if test="${not empty login.uNo and login.uNo == rentalhomeVO.uNo }">
					<button class="review_btn" onclick="location.href='rentalhomeModify_room.do?room_idx=${list.room_idx}&rentalhome_idx=${list.rentalhome_idx }'" style="position:absolute; top:0px; right:35px; font-size:12pt; margin:0px 10px;">객실 정보 수정</button>
					<form action="rentalhomeDelete_room.do" method="post">
						<input type="hidden" name="room_idx" value="${list.room_idx}">
						<input type="hidden" name="rentalhome_idx" value="${list.rentalhome_idx}">
						<button class="review_btn" style="text-align:center; position:absolute; top:0px; right:220px; font-size:12pt;">객실 삭제</button>
					</form>
				</c:if>
			</div>
			<div style="height:1px; background-color:lightgray;"></div>
		</c:forEach>
	</div>
	<div class="card" style="display:block; width:1224px; height:520px; text-align:left; padding:10px; margin:10px auto;">
		<div style="padding:10px 0px; margin-bottom:20px;">
			<span style="font-weight:bold; font-size:15pt; padding:10px;">주변숙소</span>&nbsp;<span style="color:gray;">1박 기준 객실 최저가</span>
		</div>
		<div style="text-align:center;"> 
		<%
			for(int i=0; i <4; i++)
			{
		%>
			<div style="display:inline-block; background-color:#fbfcfd;">
				<div class="hotel" style="box-shadow: 2px 0px 1px 0px #d5d9e0; width:270px; height:200px; border-radius:10px 10px 0px 0px; margin:0px 10px;"></div>
				<div style="box-shadow: 1px 1px 1px 1px #d5d9e0; width:270px; height:200px; border-radius:0px 0px 10px 10px; margin:0px 10px; padding:10px;">
					<div style="width:100%; height:150px; text-align:left;">
						<span style="font-weight:bold;">페어필드 바이 메리어트 서울</span><br>
						<span style="font-size:10pt;">대한민국 서울특별시 영등포구 경인로 870</span><br>
						<span style="font-size:10pt;">페어필드 바이 메리어트 서울 (Fairfield by Marriott Seoul)의 숙소 정보
						</span><br>
					</div>
					<div style="text-align:right;">
						<span style="font-size:10pt; color:#666666; text-decoration:line-through;">21,000원</span>
						<span style="font-size:12pt; font-weight:bold; ">15,000원</span>
					</div>
				</div>
			</div>
		<%
			}
		%>
		</div>
	</div>
	<div class="card" id="review" style="display:block; width:1224px; text-align:left; padding:20px; margin:10px auto;">
		<span style="font-weight:bold; font-size:15pt;">리뷰</span>
		<c:if test="${not empty reviewVO.count}">
			<span style="font-size:11pt;">(${reviewVO.count})</span>
		</c:if>
		<br>
		<div style="text-align:center; display:inline-block; width:300px; margin-right:100px;">
			<c:choose>
				<c:when test="${not empty reviewVO.all_avg}">
					<span style="border-radius:20px; font-size:30pt; font-weight:bold; padding:20px;">${reviewVO.all_avg}/5</span>
				</c:when>
				<c:otherwise>
					<span style="border-radius:20px; font-size:30pt; font-weight:bold; padding:20px;">0/5</span>
				</c:otherwise>
			</c:choose>
		</div>
		<div style="display:inline-block; width:760px;">
			<div style="width:325px; height:50px; margin:0px 20px; display:inline-block; position:relative;">
				<span style="font-weight:bold;">청결</span>&nbsp;&nbsp;${reviewVO.clean_avg}<br>
				<div style="border-radius:10px; background-color:#d1d1d1; margin:10px 0px; height:10px; width:300px; position:absolute; top:24px; left:0px;"></div>
				<div id="clean_avg_width_" style="border-radius:10px; background-color:#1c77f6; margin:10px 0px; height:10px; position:absolute; top:24px; left:0px; z-index:10;"></div>
			</div>
			<div style="width:325px; height:50px; margin:0px 20px; display:inline-block; position:relative;">
				<span style="font-weight:bold;">가격</span>&nbsp;&nbsp;${reviewVO.price_avg}<br>
				<div style="border-radius:10px; background-color:#d1d1d1; margin:10px 0px; height:10px; width:300px; position:absolute; top:24px; left:0px;"></div>
				<div id="price_avg_width_" style="border-radius:10px; background-color:#1c77f6; margin:10px 0px; height:10px; position:absolute; top:24px; left:0px; z-index:10;"></div>
			</div>
			<div style="width:325px; height:50px; margin:0px 20px; display:inline-block; position:relative;">
			<span style="font-weight:bold;">서비스</span>&nbsp;&nbsp;${reviewVO.service_avg}<br>
				<div style="border-radius:10px; background-color:#d1d1d1; margin:10px 0px; height:10px; width:300px; position:absolute; top:24px; left:0px;"></div>
				<div id="service_avg_width_" style="border-radius:10px; background-color:#1c77f6; margin:10px 0px; height:10px; position:absolute; top:24px; left:0px; z-index:10;"></div>
			</div>
			<div style="width:325px; height:50px; margin:0px 20px; display:inline-block; position:relative;">
			<span style="font-weight:bold;">시설</span>&nbsp;&nbsp;${reviewVO.facility_avg}<br>
				<div style="border-radius:10px; background-color:#d1d1d1; margin:10px 0px; height:10px; width:300px; position:absolute; top:24px; left:0px;"></div>
				<div id="facility_avg_width_" style="border-radius:10px; background-color:#1c77f6; margin:10px 0px; height:10px; position:absolute; top:24px; left:0px; z-index:10;"></div>
			</div>
		</div>
		<c:choose>
			<c:when test="${not empty reviewVO.count}">
				<c:forEach items="${reviewVO_list}" var="review">
					<div name="review_div" style="border:1px solid #efefef; border-radius:10px; width:1150px; height:200px; margin:20px 15px; padding:20px; position:relative;">
						<div class="user" style="position:absolute;"></div>
						<div style="position:absolute; width:200px; top:20px; left:80px; font-size:15pt; font-weight:bold;">${review.uNick}</div>
						<div style="position:absolute; width:200px; top:50px; left:80px; color:#777777;">${review.wdate}</div>
						<div style="position:absolute; width:300px; bottom:10px; color:#444444; font-weight:bold;">
							${rentalhomeVO.name}<br>
							<span name="review_room" style="color:#444444;">${review.room_name}</span><br>
							<span style="color:#777777;">투숙일: ${review.stay_date}</span>
						</div>
						<div style="position:absolute; width:100px; top:30px; left:200px; background-color:#f0f5fe; border-radius:5px; text-align:center; ">
							<span style="font-size:18pt; font-weight:bold; padding:10px; border-radius:10px; color:#0156df;">${review.one_avg }/5</span>
						</div>
						<div name="review_contents" style="position:absolute; width:600px; top:30px; left:350px;">
							${review.contents}
						</div>
						<c:if test="${not empty login}">
							<button onclick="set_review_report_modal(${review.review_idx})" type="button" data-bs-toggle="modal" data-bs-target="#reportModal" style="position:absolute; top:20px; right:40px; text-align:center;  border:0px; background-color:transparent; ">
								<svg class="siren" height="40" width="40" version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 255.5 255.5" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 255.5 255.5">
									<g><path d="m200.583,222.5h-6.333v-99.66c0-36.362-29.145-65.34-65.507-65.34h-0.32c-36.362,0-66.173,28.978-66.173,65.34v99.66h-6.667c-5.522,0-10.333,3.977-10.333,9.5v13c0,5.523 4.811,10.5 10.333,10.5h145c5.523,0 9.667-4.977 9.667-10.5v-13c0-5.523-4.145-9.5-9.667-9.5zm-72.16-141h-0.173v16h0.173c-14.248,0-25.84,12-25.84,26h-16c0-23 18.769-42 41.84-42z"/>
									<path d="m128.25,33c4.418,0 8-3.582 8-8v-17c0-4.418-3.582-8-8-8s-8,3.582-8,8v17c0,4.418 3.582,8 8,8z"/>
									<path d="m93.935,42.519c1.563,1.562 3.609,2.343 5.657,2.343 2.048,0 4.095-0.781 5.657-2.343 3.124-3.125 3.124-8.189 0-11.315l-12.02-12.021c-3.125-3.123-8.189-3.123-11.314,0-3.124,3.125-3.124,8.19 0,11.315l12.02,12.021z"/>
									<path d="m157.575,44.861c2.048,0 4.096-0.781 5.657-2.344l12.02-12.022c3.124-3.124 3.124-8.189-0.001-11.313-3.125-3.125-8.191-3.124-11.314,0.001l-12.02,12.021c-3.124,3.124-3.124,8.189 0.001,11.314 1.563,1.563 3.609,2.343 5.657,2.343z"/></g>
								</svg><br>
								<span style="color:#3a3a3a; font-weight:bold; font-size:11pt;" >
									신고
								</span>
							</button>
						</c:if>
						<c:if test="${not empty login and review.uNo eq login.uNo }">
							<form action="rentalhome_review_delete.do" method="post">
								<input type="hidden" name="review_idx" value="${review.review_idx }">
								<input type="hidden" name="rentalhome_idx" value="${rentalhomeVO.rentalhome_idx}">
								<button class="review_btn" style="position:absolute; bottom:10px; right:20px; ">
									삭제
								</button>
							</form>
							<button class="review_btn" onclick="review_modify('${review.room_name}','${review.contents}', ${review.service}, ${review.facility}, ${review.clean}, ${review.price},${review.review_idx })" type="button" data-bs-toggle="modal" data-bs-target="#reviewModal" style="position:absolute; bottom:55px; right:20px;">
								수정
							</button>
						</c:if>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div style="text-align:center; margin:30px 15px; padding:20px;">
					<span style="font-size:20pt; font-weight:bold; color:#444444;">현재 숙소에 작성된 리뷰가 없습니다.</span><br>
					<span style="color:#a0a0a0;">리뷰는 마이페이지의 결제 내역에서 작성하실 수 있습니다.</span>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
<!-- 리뷰 신고 모달  -->
	<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModal" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content" style="text-align:left;">
				<input type="hidden" id="review_report_review_idx" name="review_report_review_idx">
				<input type="hidden" id="review_report_reason" name="review_report_reason">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel"><span style="font-weight:bold;">리뷰 신고</span></h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<span style="font-weight:bold;">신고 이유</span>
					<div style="text-align:center; margin:20px;">
						<div class="review_report_button review_report_reason">부적절한 컨텐츠</div>
						<div class="review_report_button review_report_reason">성인 컨텐츠</div>
						<div class="review_report_button review_report_reason">욕설 및 비방</div>
						<div class="review_report_button review_report_reason">기타</div>
					</div>
					<span style="font-weight:bold;">신고 내용</span>
					<div style="text-align:center; margin:20px;">
						<textarea class="form-control" id="review_report_contents" style="width:90%; height:200px; resize:none; display:inline-block; "></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					<button id="review_report_insert" type="button" class="btn btn-primary">신고 완료</button>
				</div>
			</div>
		</div>
	</div>
<!-- 리뷰 수정 모달  -->
	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModal" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<form action="update_review.do" method="post" onsubmit="return validation()">
					<input type="hidden" name="rentalhome_idx" value="${rentalhomeVO.rentalhome_idx }">
					<input type="hidden" id="review_idx" name="review_idx">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel"><span style="font-weight:bold;">${rentalhomeVO.name}</span></h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div style="text-align:left;" class="modal-body">
						<span id="review_modify_modal_room"></span><br><br>
						<textarea id="review_modify_modal_contents" name="contents" class="form-control" rows="5" style="resize:none;" placeholder="리뷰 내용을 수정해주세요."></textarea><br>
						<div style="margin:10px; color:#eaeaea; display:inline-block;">
							<span style="font-weight:bold; color:black;">서비스</span><br>
							<input type="hidden" id="review_service" name="service" value="0">
							<span name="services" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="services" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="services" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="services" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="services" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
						</div>
						<div style="margin:10px; color:#eaeaea; display:inline-block;">
							<span style="font-weight:bold; color:black;">시설</span><br>
							<input type="hidden" id="review_facility" name="facility" value="0">
							<span name="facilities" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="facilities" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="facilities" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="facilities" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="facilities" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
						</div>
						<div style="margin:10px; color:#eaeaea; display:inline-block;">
							<span style="font-weight:bold; color:black;">청결</span><br>
							<input type="hidden" id="review_clean" name="clean" value="0">
							<span name="cleans" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="cleans" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="cleans" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="cleans" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="cleans" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
						</div>
						<div style="margin:10px; color:#eaeaea; display:inline-block;">
							<span style="font-weight:bold; color:black;">가격</span><br>
							<input type="hidden" id="review_price" name="price" value="0">
							<span name="prices" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="prices" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="prices" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="prices" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="prices" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
	 									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">리뷰 수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="card" id="rentalhome_rule" style="display:block; width:1224px; text-align:left; padding:20px; margin:10px auto;">
		<span style="font-weight:bold; font-size:15pt;">숙소 규정</span><br>
		<div style="padding:0px 30px;">
			<div style="display:inline-block; width:300px; margin-top:40px;">
				<span style="font-weight:bold;">체크인 & 체크아웃</span>
			</div>
			<div style="display:inline-block; width:200px;">
				체크인 가능시간
			</div>
			<div style="display:inline-block; width:200px;">
				<span style="font-weight:bold;">${rentalhomeVO.checkIn}</span>
			</div>
			<div style="display:inline-block; width:200px;">
				체크아웃 가능시간
			</div>
			<div style="display:inline-block; width:200px;">
				<span style="font-weight:bold;">${rentalhomeVO.checkOut}</span>
			</div>
			<div style="display:inline-block; width:300px;margin-top:30px;">
			<span style="font-weight:bold;">체크인 방법</span>
			</div>
			<div style="display:inline-block; width:800px;">
				${rentalhomeVO.checkIn_info}
			</div>
			<div style="display:inline-block; width:300px; margin-top:30px; margin-bottom:20px">
			<span style="font-weight:bold;">조식</span>
			</div>
			<div style="display:inline-block; width:200px;">
				요금
			</div>
			<div style="display:inline-block; width:500px;">
				<span style="font-weight:bold;">${rentalhomeVO.breakfast_price}원/1인당</span>
			</div>
			<div style="display:inline-block; width:300px;">
			</div>
			<div style="display:inline-block; width:200px;">
				영업시간
			</div>
			<div style="display:inline-block; width:600px;">
				<span style="font-weight:bold;">${rentalhomeVO.breakfast_open}~${rentalhomeVO.breakfast_close} [${rentalhomeVO.breakfast_day}]</span>
			</div>
			<div style="display:inline-block; width:300px; margin-top:40px;">
				<span style="font-weight:bold;">시설</span>
			</div>
			<div style="display:inline-block; width:800px;">
				<c:if test="${rentalhomeVO.inPool_yn == 'Y' || rentalhomeVO.outPool_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/pool.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">수영장</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.parking_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/parking.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">주차장</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.pickup_yn  =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/pickup.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">픽업</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.wifi_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/wifi.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.beach_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/beach.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">인근해변</span>
					</div>	
				</c:if>
				<c:if test="${rentalhomeVO.bbq_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/bbq.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">바베큐</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.breakfast_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/breakfast.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">조식</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.animal_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/dog.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">반려동물</span>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<div style="width:1224px; display:inline-block; text-align:right; margin:20px 0px;">
		<c:if test="${not empty login.uNo and login.uNo == rentalhomeVO.uNo }">
			<form action="rentalhomeDelete.do" method="post" style="display:inline-block;">
				<input type="hidden" name="rentalhome_idx" value="${rentalhomeVO.rentalhome_idx}">
				<button class="btn btn-primary btn-sm mr-2" style="padding:15px; border-radius:10px; font-size:11pt;">숙소 삭제</button>
			</form>
			<span onclick="location.href='rentalhomeModify.do?rentalhome_idx=${rentalhomeVO.rentalhome_idx}'" class="btn btn-primary btn-sm mr-2" style="padding:15px; border-radius:10px; font-size:11pt; cursor:pointer;">숙소 정보 변경</span>
		</c:if>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>