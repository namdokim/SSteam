<%@page import="java.util.Calendar"%>
<%@page import="com.ss.demo.domain.PageMaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%
	PageMaker pageMaker = (PageMaker)request.getAttribute("pageMaker");
%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/datepicker.css">
<link rel="stylesheet" href="../css/font.css">
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
	let yn_ = document.getElementsByName("yn");
	yn_.forEach(function(yn, index) {
		if(yn.checked == true){
			yn_[index].value = "Y";
		}else{
			yn_[index].value = "N";
		}
		console.log(yn_[index].value);
		yn.onchange = function(){
			if(yn_[index].value == "Y"){
				yn_[index].value = "N"
			}else{
				yn_[index].value = "Y"
			}
		}
	});
	
	const empty_star_ = document.getElementsByName("empty_star");
	const fill_star_ = document.getElementsByName("fill_star");
	const dupl_count = document.getElementsByName("dupl_count");
	empty_star_.forEach(function(empty, index) {
		console.log(dupl_count[index].value);
		console.log(empty_star_.length);
		if(dupl_count[index].value == 0){
			empty_star_[index].style.display = "block";
			fill_star_[index].style.display = "none";
		}else{
			empty_star_[index].style.display = "none";
			fill_star_[index].style.display = "block";
		}
	});
	
	const inputLeft = document.getElementById("input-left");
	const inputRight = document.getElementById("input-right");

	const thumbLeft = document.querySelector(".slider > .thumb.left");
	const thumbRight = document.querySelector(".slider > .thumb.right");
	const range = document.querySelector(".slider > .range");

	const minPriceInput = document.getElementById("min_price");
	const maxPriceInput = document.getElementById("max_price");

	const setLeftValue = () => {
		const _this = inputLeft;
		const [min, max] = [parseInt(_this.min), parseInt(_this.max)];
		// 교차되지 않게, 1을 빼준 건 완전히 겹치기보다는 어느 정도 간격을 남겨두기 위해.
		_this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1);
		// input, thumb 같이 움직이도록
		const percent = ((_this.value - min) / (max - min)) * 100;
		thumbLeft.style.left = percent + "%";
		range.style.left = percent + "%";
		document.getElementById("min_price").value = inputLeft.value*10000;
	};

	const setRightValue = () => {
		const _this = inputRight;
		const [min, max] = [parseInt(_this.min), parseInt(_this.max)];
		// 교차되지 않게, 1을 더해준 건 완전히 겹치기보다는 어느 정도 간격을 남겨두기 위해.
		_this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 1);
		// input, thumb 같이 움직이도록
		const percent = ((_this.value - min) / (max - min)) * 100;
		thumbRight.style.right = 100 - percent + "%";
		range.style.right = 100 - percent + "%";
		document.getElementById("max_price").value = inputRight.value*10000;
	};

	const setLeft = () => {
		const _this = minPriceInput;
		const percent = parseInt(_this.value/10000);
		thumbLeft.style.left = percent + "%";
	 	range.style.left = percent + "%";
		inputLeft.value = percent;
	};

	const setRight = () => {
		const _this = maxPriceInput;
		const percent = parseInt(_this.value/10000);
		thumbRight.style.right = 100 - percent + "%";
		range.style.right = 100 - percent + "%";
		inputRight.value = percent;
	};

	inputLeft.addEventListener("input", setLeftValue);
	inputRight.addEventListener("input", setRightValue);

	minPriceInput.addEventListener("blur", function() {
		if ( parseInt(maxPriceInput.value) <= parseInt(this.value) ) {
			alert("최소 가격은 최대 가격보다 작아야합니다.");
			this.value = parseInt(maxPriceInput.value) - 10000;
		}
		setLeft();
	});
	maxPriceInput.addEventListener("blur", function() {
		if ( parseInt(this.value) <= parseInt(minPriceInput.value) ) {
			alert("최대 가격은 최소 가격보다 커야합니다.");
			this.value = parseInt(minPriceInput.value) + 10000;
		}
		setRight();
	});
};
	function search(){
		const location_ = document.getElementById("location").value;
		const start_date = document.getElementById("start_date").value;
		const end_date = document.getElementById("end_date").value;
		const person = document.getElementById("person").value;
		
		location.href = "rentalhomeMain.do?location="+location_+"&start_date="+start_date+"&end_date="+end_date+"&person="+person;
		
	}
	
	function insert_like(obj){
		
		const insert_ = document.getElementsByName("empty_star"); 
		const delete_ = document.getElementsByName("fill_star"); 
		const like_count = document.getElementsByName("like_count");
		const index = Array.from(insert_).indexOf(obj);
		const rentalhome_idx = document.getElementsByName("rentalhome_idx")[index].value;

		$.ajax({
			url: 'insert_like.do', 						// 요청을 보낼 서버의 URL 주소
			method: 'post', 							// HTTP 요청 방식 (GET, POST 등)
			data: { 									// 요청에 포함될 데이터 (옵션)
				rentalhome_idx: rentalhome_idx
			},											
			success: function(data) {
				console.log(data);
				if(data > 0){
					like_count[index].innerHTML = data;
					insert_[index].style.display="none";
					delete_[index].style.display="block";
				}
				
			},
			error: function(xhr, status, error) {
				console.log('Error:', error);
			}
		});
	}
	function delete_like(obj){
		
		const delete_ = document.getElementsByName("fill_star");
		const insert_ = document.getElementsByName("empty_star");
		const like_count = document.getElementsByName("like_count");
		const index = Array.from(delete_).indexOf(obj);
		const rentalhome_idx = document.getElementsByName("rentalhome_idx")[index].value;
		
		$.ajax({
			url: 'delete_like.do', 						// 요청을 보낼 서버의 URL 주소
			method: 'post', 							// HTTP 요청 방식 (GET, POST 등)
			data: { 									// 요청에 포함될 데이터 (옵션)
				rentalhome_idx: rentalhome_idx
			},											
			success: function(data) {
				like_count[index].innerHTML = data;
				delete_[index].style.display="none";
				insert_[index].style.display="block";
				
			},
			error: function(xhr, status, error) {
				console.log('Error:', error);
			}
		});
	}
	function searchMain(){
		
		let location = document.getElementById("location").value;
		let start_date = document.getElementById("start_date").value;
		let end_date = document.getElementById("end_date").value;
		let person = document.getElementById("person").value;
		let min_price = document.getElementById("min_price").value;
		let max_price = document.getElementById("max_price").value;
		let score = document.getElementById("score").value;
		let inPool_yn = document.getElementById("inPool_yn").value;
		let outPool_yn = document.getElementById("outPool_yn").value;
		let parking_yn = document.getElementById("parking_yn").value;
		let pickup_yn = document.getElementById("pickup_yn").value;
		let wifi_yn = document.getElementById("wifi_yn").value;
		let beach_yn = document.getElementById("beach_yn").value;
		let bbq_yn = document.getElementById("bbq_yn").value;
		let breakfast_yn = document.getElementById("breakfast_yn").value;
		let animal_yn = document.getElementById("animal_yn").value;
		let sort = document.getElementById("sort").value;
		
		const type_ = document.getElementsByName("type");	// radio name
		let type_value = "";
		
		type_.forEach(function(type, index) {
			if(type.checked == true){
				type_value = type.value;
			}
		});
		
		window.location.href = "rentalhomeMain.do?location="+location+"&start_date="+start_date+"&end_date="+end_date+
						"&person="+person+"&min_price="+min_price+"&max_price="+max_price+"&score="+score+"&inPool_yn="+inPool_yn+
						"&outPool_yn="+outPool_yn+"&parking_yn="+parking_yn+"&pickup_yn="+pickup_yn+"&wifi_yn="+wifi_yn+"&beach_yn="+beach_yn+
						"&bbq_yn="+bbq_yn+"&breakfast_yn="+breakfast_yn+"&animal_yn="+animal_yn+"&sort="+sort+"&type="+type_value;
	}
</script>
<style type="text/css">

	a {
		text-decoration:none;
		color:black;
	}
	.view{
		border-radius:10px;
		background-color:white;
		box-shadow:1px 1px 1px 1px #ddd;
	}
	.search{
		border:none;
		color:#444444;
	}
	.search:hover{
		border-bottom:2px solid #0863ec;
		border-radius:0px;
	}
	.hotel {
		background-image: url(../img/hotel.jpg);
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	.image {
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	.like {
		background-size: contain;
		background-repeat: no-repeat;
		background-position: center;
	}
	.datepicker{
		font-weight:bold;
	}
	
.middle {
  width: 100%;
  max-width: 500px;
}

.slider {
  position: relative;
  z-index: 1;
  height: 5px;
  margin: 0 15px;
}
.slider > .track {
  position: absolute;
  z-index: 1;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  border-radius: 5px;
  border-shadow:2px 2px 2px 2px #dddddd;
  background-color: #e2e2e2;
}
.slider > .range {
  position: absolute;
  z-index: 2;
  left: 0%;
  right: 0%;
  top: 0;
  bottom: 0;
  border-radius: 5px;
  background-color: #017fee;
}
.slider > .thumb {
  position: absolute;
  z-index: 3;
  width: 20px;
  height: 20px;
  background-color: #017fee;
  border-radius: 50%;
  top:50%;
}
.slider > .thumb.left {
  left: 0%;
  transform: translate(-15px, -10px);
}
.slider > .thumb.right {
  right: 0%;
  transform: translate(15px, -10px);
}

input[type="range"] {
  position: absolute;
  /* opacity로 가린 것을 이벤트도 비활성화하기 위해 */
  pointer-events: none;
  -webkit-appearance: none;
  z-index: 2;
  height: 5px;
  width: 100%;
  opacity: 0;
  left:0%;
}
input[type="range"]::-webkit-slider-thumb {
  /* 겹쳐진 두 thumb를 모두 활성화 */
  pointer-events: all;
  width: 20px;
  height: 20px;
  border-radius: 0;
  border: 0 none;
  background-color: red;
  cursor: pointer;

  /* appearance를 해야 위의 스타일들을 볼 수 있음 */
  -webkit-appearance: none;
}
.avg{
	display:inline-block;
	width:40px;
	font-weight:bold;
	font-size:10pt;
	background-color:#f7f7f7;
	border-radius:3px;
	margin:20px 0px;
	padding:3px 0px;
	cursor:pointer;
}
.check{
	margin:20px 0px;
	width:100%;
	text-align:left;
}
.check > input[type=checkbox]{
	margin:0px 10px;
	width:15px;
	height:15px;
}
.check > input[type=radio]{
	margin:0px 10px;
	width:15px;
	height:15px;
}
.container-fluid {
	margin-left: 0;
	margin-right: 0;
	padding: 0; /* Optional: If you want to remove padding as well */
	z-index:0;
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
	background: url(../img/houses2.jpg) no-repeat center center;
	background-size: cover;
	height:400px
}	
</style>
<div class="container-fluid " style="background-color:#FBFDFF; font-family: 'TheJamsil5Bold';">
	<div class="masthead py-5">
		<div class="container position-relative sticky-top">
			<div class="row justify-content-center">
				<div class="col-xl-12">
					<div class="text-left text-white">
						<input type="hidden" id="score" value="${searchVO.score}">
						<input type="hidden" id="sort" value="${searchVO.sort}">
						<!-- Page heading-->
						<br><br>
						<div class="text-left text-white fs-1 fw-bold ms-2">
							호텔
							<span class="text-right ms-0 fs-1 mb-1 text-warning fw-bold">.</span>
						</div>	
						<div class="card ">
							<div class="container-fluid ">
								<div class="text-center text-white py-4" style="line-height: 50px;">
									<div class="mt-2" style="background-color:white; border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;">
										<span style="color:#282828; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">여행지</span><br>
										<input type="text" value="${searchVO.location}" id="location" class="search form-control" style="box-shadow:0 0 0 0; font-weight:bold; font-size:11pt;width:230px;position:absolute; top:23px; left:10px; height:25px; outline:none;">
									</div>
									<div class="mt-2" style="background-color:white; border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;">
										<div class="row justify-content-center">
											<div class="col-md-5">
												<span style="color:#282828; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">체크인</span><br>
												<input type="text" value="${searchVO.start_date}" id="start_date" class="search form-control datepicker" style="padding:0px; box-shadow:0 0 0 0; font-size:11pt;width:100px;position:absolute; top:23px; left:10px; height:25px; outline:none;">
											</div>
											<div class="col-md-5">
												<span style="color:#282828; font-size:9pt; line-height:normal; position:absolute; top:5px; left:140px;">체크아웃</span><br>
												<input type="text" value="${searchVO.end_date}" id="end_date" class="search form-control datepicker" style="padding:0px; box-shadow:0 0 0 0; font-size:11pt; width:100px;position:absolute; top:23px; left:140px; height:25px; outline:none;">
											</div>
										</div>
									</div>
									<div class="mt-2" style="background-color:white; border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;">
										<span style="color:#282828; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">인원 수</span><br>
										<select class="search form-select" id="person" style="box-shadow:0 0 0 0; font-weight:bold; font-size:11pt;width:238px;position:absolute; top:23px; left:10px; height:25px; outline:none; padding:0;">
											<option selected></option>
											<option value="1" <c:if test="${searchVO.person eq 1}">selected</c:if>>1</option>
											<option value="2" <c:if test="${searchVO.person eq 2}">selected</c:if>>2</option>
											<option value="3" <c:if test="${searchVO.person eq 3}">selected</c:if>>3</option>
											<option value="4" <c:if test="${searchVO.person eq 4}">selected</c:if>>4</option>
											<option value="5" <c:if test="${searchVO.person eq 5}">selected</c:if>>5</option>
											<option value="6" <c:if test="${searchVO.person eq 6}">selected</c:if>>6</option>
											<option value="7" <c:if test="${searchVO.person eq 7}">selected</c:if>>7</option>
											<option value="8" <c:if test="${searchVO.person eq 8}">selected</c:if>>8</option>
											<option value="9" <c:if test="${searchVO.person eq 9}">selected</c:if>>9</option>
											<option value="10" <c:if test="${searchVO.person eq 10}">selected</c:if>>10</option>
										</select>
									</div>
									<div class="mt-2" onclick="searchMain()" style="background-color:#0863ec; width:80px; height:50px; display:inline-block; border-radius:5px; text-align:center; position:relative; cursor:pointer;">
										<span style="font-weight:bold;color:white; font-size:15pt; ">검색</span>
									</div>
								</div>
							</div>	
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class=" justify-content-center container marketing">
		<div class="album py-3 bg-body-tertiary" style="margin-top:20px;">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<div class="carousel-item d-flex active" style="text-align:center; padding:0px;">
						<div class="col">
							<div class="card ">
								<div class="card-body">
									<span onclick="searchMain()" class="cursor-pointer fw-semibold">최저가  정렬</span>
								</div>
							</div>
						</div>	
						<div class="col  px-1">
							<div class="card ">
								<div class="card-body">
									<span onclick="searchMain()" class="cursor-pointer fw-semibold">리뷰 많은 순 정렬</span>
								</div>
							</div>
						</div>	
						<div class="col">	
							<div class="card ">
								<div class="card-body">
									<span onclick="searchMain()" class="cursor-pointer fw-semibold">좋아요 많은 순 정렬</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container" style=" margin: 20px 18px 0px 0px; vertical-align: top;">
				<div class="row">
					<div class="card shadow-sm col-md-3 mt-3 text-center" style="height:1000px; padding:10px; display:block;">
						<div class="fw-semibold ms-3" style="font-size: 12pt; text-align: left;">가격</div>
						<div class="middle" style="margin:20px 0px; text-align:center;">
							<div class="multi-range-slider" style="position: relative; width:80%; display:inline-block;">
								<input type="range" id="input-left" min="0" max="100" value="0" />
								<input type="range" id="input-right" min="0" max="100" value="100" />
								<div class="slider">
									<div class="track"></div>
									<div class="range"></div>
									<div class="thumb left" ></div>
									<div class="thumb right"></div>
								</div>
							</div>
						</div>
						<div style="width:100%; margin-top:10px;">
							<input id="min_price" type="text" value="0" style="display:inline-block; text-align:center;font-size:10pt; width:100px; line-height:30px;height:30px; color:#0f294d; border-radius:4px; border:1px solid #ddd;"><span style="font-size:10pt; color:#0f294d;">원</span>
							<div style="display:inline-block;">-</div>
							<input id="max_price" type="text" value="1000000" style="display:inline-block; text-align:center;font-size:10pt; width:100px; line-height:30px;height:30px; color:#0f294d; border-radius:4px; border:1px solid #ddd;"><span style="font-size:10pt; color:#0f294d;">원</span>
						</div>
						<div style="width: 100%; margin: 30px 0px; border-top: 1px solid #f2f2f2;"></div>
						<div style="width: 100%;">
							<div class="fw-semibold ms-3" style="font-size: 12pt; text-align: left;">평점</div>
							<div class="avg">0↑</div>
							<div class="avg">1↑</div>
							<div class="avg">2↑</div>
							<div class="avg">3↑</div>
							<div class="avg">4↑</div>
						</div>
						<div style="width: 100%; margin: 30px 0px; border-top: 1px solid #f2f2f2;"></div>
						<div class="ms-3" style="width: 100%;">
							<div class="fw-semibold" style="font-size: 12pt; text-align: left;">숙소 종류</div>
							<div class="check" style="margin: 20px 0px; width: 100%; text-align: left;">
								<input type="radio" name="type" value="motel" <c:if test="${searchVO.type eq 'motel'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">모텔</span><br>
								<input type="radio" name="type" value="hotel" <c:if test="${searchVO.type eq 'hotel'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">호텔</span><br>
								<input type="radio" name="type" value="resort" <c:if test="${searchVO.type eq 'resort'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">리조트</span><br>
								<input type="radio" name="type" value="pension" <c:if test="${searchVO.type eq 'pension'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">펜션</span><br>
								<input type="radio" name="type" value="guesthouse" <c:if test="${searchVO.type eq 'guesthouse'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">게스트 하우스</span><br>
								<input type="radio" name="type" value="camping" <c:if test="${searchVO.type eq 'camping'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">캠핑  & 글램핑</span><br>
							</div>
						</div>
						<div style="width: 100%; margin: 30px 0px; border-top: 1px solid #f2f2f2;"></div>
						<div class="ms-3" style="width: 100%;">
							<div class="fw-semibold" style="font-size: 12pt; text-align: left;">숙소 내 시설</div>
							<div class="check" style="margin: 20px 0px; width: 100%; text-align: left;">
								<input type="checkbox" name="yn" id="inPool_yn"  value="Y" <c:if test="${searchVO.inPool_yn eq 'Y'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">내부 수영장</span><br>
								<input type="checkbox" name="yn" id="outPool_yn" value="Y" <c:if test="${searchVO.outPool_yn eq 'Y'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">야외 수영장</span><br>
								<input type="checkbox" name="yn" id="parking_yn" value="Y" <c:if test="${searchVO.parking_yn eq 'Y'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">주차장</span><br>
								<input type="checkbox" name="yn" id="pickup_yn" value="Y" <c:if test="${searchVO.pickup_yn eq 'Y'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">픽업</span><br>
								<input type="checkbox" name="yn" id="wifi_yn" value="Y" <c:if test="${searchVO.wifi_yn eq 'Y'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">와이파이</span><br>
								<input type="checkbox" name="yn" id="beach_yn" value="Y" <c:if test="${searchVO.beach_yn eq 'Y'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">인근해변</span><br>
								<input type="checkbox" name="yn" id="bbq_yn" value="Y" <c:if test="${searchVO.bbq_yn eq 'Y'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">바베큐</span><br>
								<input type="checkbox" name="yn" id="breakfast_yn" value="Y" <c:if test="${searchVO.breakfast_yn eq 'Y'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">조식</span><br>
								<input type="checkbox" name="yn" id="animal_yn" value="Y" <c:if test="${searchVO.animal_yn eq 'Y'}">checked</c:if>><span style="font-size: 10pt; color: #0f294d;">반려동물</span><br>
							</div>
						</div>
						<div class="mt-2" onclick="searchMain()" style="background-color:#0863ec; width:80%; padding:10px 0px; display:inline-block; border-radius:5px; cursor:pointer;">
							<span style="font-weight:bold;color:white; font-size:15pt; ">검색</span>
						</div>
					</div>
					<div class="col-md-9 pt-2" style="padding:0px 0px 0px 10px;">
						<c:forEach items="${list}" var="list">
							<div class="view border pe-3 shadow-sm d-flex my-2" style="width:100%; height: 200px; margin: 0px 0px; ">
								<c:choose>
									<c:when test="${empty list.logical_name}">
										<div class="hotel col" style="cursor: pointer; width: 200px; height: 180px;" onclick="location.href='<%=request.getContextPath() %>/rentalhome/rentalhomeView.do?rentalhome_idx=${list.rentalhome_idx}'"></div>
									</c:when>
									<c:otherwise>
										<div class="flex-shrink-0 avatar me-2 pt-2 ms-2">
											<img src="<%=request.getContextPath() %>/resources/upload/${list.physical_name}" style="cursor: pointer; border-radius:5px; width: 200px; height: 180px;" onclick="location.href='<%=request.getContextPath() %>/rentalhome/rentalhomeView.do?rentalhome_idx=${list.rentalhome_idx}'">
										</div>
									</c:otherwise>
								</c:choose>
								<div class="d-flex align-items-start ps-2 pt-2" style="width:70%; position:relative;">
									<div class="flex-column px-1 py-1" style="width:100%;">
											<a style="text-decoration: none; color: black;" href="<%=request.getContextPath() %>/rentalhome/rentalhomeView.do?rentalhome_idx=${list.rentalhome_idx}">
												<span style="font-size: 13pt; font-weight: bold; text-align:left;">${list.name}</span>
											</a>
										<div class="flex-column py-1" style="text-align: left;">
											<c:if test="${list.all_avg != 0.0}">
												<span class="py-1" style="font-size: 10pt; padding: 2px 7px; border-radius: 0px 5px 5px 10px; font-weight: bold; background-color: #333fff; color: white;">${list.all_avg}<span style="color: #e2e2e2;">/5</span></span>
											</c:if>
											<span style="font-size: 10pt; color: #686868;">이용자 리뷰 ${list.review_count}개</span>
										</div>
										<div class="flex-column ">
											<span style="font-size: 10pt; color: #686868;">${list.address}</span>
											<span style="font-size: 10pt; color: #686868;">현재 위치에서 134km</span>
										</div>
										<c:if test="${list.discount_type eq 'fix' }">
											<span style="position:absolute; bottom:50px; right:-50px; background-color:#529ffe; color:white; font-size:10pt; border-radius:20px 10px 0px 15px; padding:7px 10px;">${list.discount_reason} ${list.discount_money}원 할인</span><br>
										</c:if>
										<c:if test="${list.discount_type eq 'rate' }">
											<span style="position:absolute; bottom:50px; right:-50px; background-color:#529ffe; color:white; font-size:10pt; border-radius:20px 10px 0px 15px; padding:7px 10px;">${list.discount_reason} ${list.discount_money}% 할인</span><br>
										</c:if>
									</div>
								</div>
								<div class="flex-shrink-0 ms-1 d-flex" >
									<div class="flex-column px-1 py-3" style="text-align:right; width:180px;">
										<div style="display:inline-block; width:50%; text-align:center;">
										<input type="hidden" name="rentalhome_idx" value="${list.rentalhome_idx}">
										<input type="hidden" name="dupl_count" value="${list.dupl_count}">
										<span name="empty_star" style="top:15px; left: 800px; color:silver;" onclick="insert_like(this)">
											<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												<path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
											</svg>
										</span>
										<span name="fill_star" style="top:15px; left: 800px; color:#fe7c4d;"onclick="delete_like(this)">
											<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
										</span>
											<span name="like_count" style="color: #0f294d; font-size:13pt; font-weight: bold;">${list.like_count}</span>
										</div><br><br>
										<c:choose>
											<c:when test="${list.weekend_price eq null or list.weekend_price eq 0 }">
											<br>
												<span style="font-size: 12pt; font-weight: bold;">남은 객실이 없습니다.</span>
											</c:when>
											<c:otherwise>
										<%
											Calendar cal = Calendar.getInstance();
											int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

											if (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY) {
										%>
												<span style="font-size: 17pt; color: #666666; text-decoration: line-through;">${list.weekend_price}원</span><br>
												<span style="font-size: 12pt; color: #666666;">최저가</span>
												<span style="font-size: 20pt; font-weight: bold;">${list.weekend_discount_price}원</span>
										<%
											} else {
										%>
												<span style="font-size: 17pt; color: #666666; text-decoration: line-through;">${list.weekday_price}원</span><br>
												<span style="font-size: 12pt; color: #666666;">최저가</span>
												<span style="font-size: 20pt; font-weight: bold;">${list.weekday_discount_price}원</span>
										<%
											}
										%>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="d-flex justify-content-end my-3">
						<span onclick="location.href='rentalhomeReserveList.do'" class="btn btn-primary btn-sm mr-2" style="padding:10px 20px; cursor:pointer;">MY 예약 리스트</span>
						<div style="width:5px;"></div>
						<span onclick="location.href='rentalhomeWrite.do'" class="btn btn-primary btn-sm mr-2" style="padding:10px 20px;">숙소 등록</span>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<%-- 이전 페이지 링크 생성 --%>
							<li class="page-item">
							<% if (pageMaker.isPrev()){ %>
								<a class="page-link" href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do?page=<%=pageMaker.getStartPage()-1%>">Previous</a>
							<%} %> 
							</li>
							<% 
							for(int i = pageMaker.getStartPage();i<=pageMaker.getEndPage();i++) {
							%>
							<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do?page=<%=i%>">
								<%=i %>
							</a>
							</li>
							<%
							} 
							%>
							<%-- 다음 페이지 링크 생성 --%>
							<li class="page-item">
							<%if(pageMaker.isNext()&&pageMaker.getEndPage()>0 ){ %> 
								<a class="page-link" href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do?page=<%=pageMaker.getEndPage()+1%>">Next</a>
							<% } %> 
							</li>
						</ul>
						<br>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>