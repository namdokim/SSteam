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
// 	// 오늘 날짜를 가져오기
// 	var today = new Date();
// 	var start_date = new Date(today);
// 	start_date.setDate(start_date.getDate()+1);
// 	var end_date = new Date(today);
// 	end_date.setDate(end_date.getDate()+2);
	
// 	// to.ISOString() : YYYY-MM-DDTHH:mm:ss.sssZ 형식으로 설정
// 	document.getElementById("start_date").value = start_date.toISOString().split('T')[0];
// 	document.getElementById("end_date").value = end_date.toISOString().split('T')[0];
// 	document.getElementById("person").value = '2'
	
	const inputLeft = document.getElementById("input-left");
	const inputRight = document.getElementById("input-right");

	const thumbLeft = document.querySelector(".slider > .thumb.left");
	const thumbRight = document.querySelector(".slider > .thumb.right");
	const range = document.querySelector(".slider > .range");

	const minPriceInput = document.getElementById("min-price");
	const maxPriceInput = document.getElementById("max-price");

	const setLeftValue = () => {
	  const _this = inputLeft;
	  const [min, max] = [parseInt(_this.min), parseInt(_this.max)];
	  // 교차되지 않게, 1을 빼준 건 완전히 겹치기보다는 어느 정도 간격을 남겨두기 위해.
	  _this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1);
	  // input, thumb 같이 움직이도록
	  const percent = ((_this.value - min) / (max - min)) * 100;
	  thumbLeft.style.left = percent + "%";
	  range.style.left = percent + "%";
	  document.getElementById("min-price").value = inputLeft.value*10000;
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
	  document.getElementById("max-price").value = inputRight.value*10000;
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
  position: relative;
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
</style>

<div style="width:1920px; text-align:center; background-color:#dfecfb; padding-bottom:50px;">
	<div style="position:sticky; top:0px; background-color:#0863ec; z-index:100; border-radius:0px 0px 50px 50px; width:100%; margin:0 auto; padding:10px;  line-height:50px; ">
		<div style="background-color:white; border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
			<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">여행지</span><br>
			<input type="text" value="${searchVO.location}" id="location" class="search" style="font-weight:bold; font-size:11pt;width:230px;position:absolute; top:23px; left:10px; height:25px; outline:none;">
		</div>
		<div style="background-color:white; border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
			<div class="row justify-content-center">
				<div class="col-md-5">
					<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">체크인</span><br>
					<input readonly type="text" value="${searchVO.start_date}" id="start_date" class="search form-control datepicker" style="padding:0px; box-shadow:0 0 0 0; font-size:11pt;width:100px;position:absolute; top:23px; left:10px; height:25px; outline:none;">
				</div>
				<div class="col-md-5">
					<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:140px;">체크아웃</span><br>
					<input readonly type="text" value="${searchVO.end_date}" id="end_date" class="search form-control datepicker" style="padding:0px; box-shadow:0 0 0 0; font-size:11pt; width:100px;position:absolute; top:23px; left:140px; height:25px; outline:none;">
				</div>
			</div>
		</div>
		<div style="background-color:white; border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
			<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">인원 수</span><br>
			<select class="search" id="person" style="font-weight:bold; font-size:11pt;width:230px;position:absolute; top:23px; left:10px; height:25px; outline:none; ">
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
		<div onclick="search()" style="cursor:pointer;background-color:#0863ec; width:80px; height:50px; display:inline-block; border-radius:5px; text-align:center; position:relative;" >
			<span style="font-weight:bold;color:white; font-size:15pt;">검색</span><br>
		</div>
	</div>
	<div style="width:1224px; margin:0 auto;line-height:50px; ">
		<div style="width:300px; height:50px; display:inline-block; margin:20px 18px 0px 0px;">
			<span style="font-size:18pt; font-weight:bold;">숙소 검색 결과 68개</span>
		</div>
		<div class="view" style="height:50px; line-height:50px; width:900px; display:inline-block;">
			<div style="width:280px; display:inline-block;">
				<span style="cursor:pointer; font-size:10pt; font-weight:bold;">최저가  정렬</span>
			</div>
			<div style="background-color:#cccccc; display:inline-block; width:1px; height:25px; line-height:30px;">&nbsp;</div>
			<div style="width:280px; display:inline-block;">
				<span style="cursor:pointer; font-size:10pt; font-weight:bold;">리뷰 많은 순 정렬</span>
			</div>
			<div style="background-color:#cccccc; display:inline-block; width:1px; height:25px; line-height:30px;">&nbsp;</div>
			<div style="width:280px; display:inline-block;">
				<span style="cursor:pointer; font-size:10pt; font-weight:bold;">좋아요 많은 순 정렬</span>
			</div>
		</div>
	</div>
	<div style="width:300px; height:1000px; display:inline-block; margin:20px 18px 0px 0px; vertical-align:top; ">
		<div class="view" style="width:300px; height:1000px; display:inline-block; padding:20px;">
		<div style="text-align:left;font-size:12pt; font-weight:bold;">가격</div>
			<div class="middle" style="margin:20px 0px;">
				<div class="multi-range-slider">
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
				<input id="min-price" type="text" value="0" style="display:inline-block; text-align:center;font-size:10pt; width:100px; line-height:30px;height:30px; color:#0f294d; border-radius:4px; border:1px solid #ddd;"><span style="font-size:10pt; color:#0f294d;">원</span>
				<div style="display:inline-block;">-</div>
				<input id="max-price" type="text" value="1000000" style="display:inline-block; text-align:center;font-size:10pt; width:100px; line-height:30px;height:30px; color:#0f294d; border-radius:4px; border:1px solid #ddd;"><span style="font-size:10pt; color:#0f294d;">원</span>
			</div>
			<div style="width:100%; margin:30px 0px; border-top:1px solid #f2f2f2;"></div>
			<div style="width:100%;">
				<div style="text-align:left;font-size:12pt; font-weight:bold;">평점</div>
				<div class="avg">5↑</div>
				<div class="avg">6↑</div>
				<div class="avg">7↑</div>
				<div class="avg">8↑</div>
				<div class="avg">9↑</div>
			</div>
			<div style="width:100%; margin:30px 0px; border-top:1px solid #f2f2f2;"></div>
			<div style="width:100%;">
				<div style="text-align:left;font-size:12pt; font-weight:bold;">숙소 종류</div>
				<div class="check" style="margin:20px 0px; width:100%;text-align:left;">
					<input type="radio" name="type" value="motel"><span style="font-size:10pt; color:#0f294d;">모텔</span><br>
					<input type="radio" name="type" value="hotel"><span style="font-size:10pt; color:#0f294d;">호텔</span><br>
					<input type="radio" name="type" value="resort"><span style="font-size:10pt; color:#0f294d;">리조트</span><br>
					<input type="radio" name="type" value="pension"><span style="font-size:10pt; color:#0f294d;">펜션</span><br>
					<input type="radio" name="type" value="guesthouse"><span style="font-size:10pt; color:#0f294d;">게스트 하우스</span><br>
					<input type="radio" name="type" value="camping"><span style="font-size:10pt; color:#0f294d;">캠핑  & 글램핑</span><br>
				</div>
			</div>
			<div style="width:100%; margin:30px 0px; border-top:1px solid #f2f2f2;"></div>
			<div style="width:100%;">
				<div style="text-align:left;font-size:12pt; font-weight:bold;">숙소 내 시설</div>
				<div class="check" style="margin:20px 0px; width:100%;text-align:left;">
					<input type="checkbox" name="inPool_yn" value="Y"><span style="font-size:10pt; color:#0f294d;">내부 수영장</span><br>
					<input type="checkbox" name="outPool_yn" value="Y"><span style="font-size:10pt; color:#0f294d;">야외 수영장</span><br>
					<input type="checkbox" name="parking_yn" value="Y"><span style="font-size:10pt; color:#0f294d;">주차장</span><br>
					<input type="checkbox" name="pickup_yn" value="Y"><span style="font-size:10pt; color:#0f294d;">픽업</span><br>
					<input type="checkbox" name="wifi_yn" value="Y"><span style="font-size:10pt; color:#0f294d;">와이파이</span><br>
					<input type="checkbox" name="beach_yn" value="Y"><span style="font-size:10pt; color:#0f294d;">인근해변</span><br>
					<input type="checkbox" name="bbq_yn" value="Y"><span style="font-size:10pt; color:#0f294d;">바베큐</span><br>
					<input type="checkbox" name="breakfast_yn" value="Y"><span style="font-size:10pt; color:#0f294d;">조식</span><br>
					<input type="checkbox" name="animal_yn" value="Y"><span style="font-size:10pt; color:#0f294d;">반려동물</span><br>
				</div>
			</div>
		</div>	
	</div>
	<div style="width:900px; display:inline-block; margin:10px 0px 50px 0px; vertical-align:top;">
		
		<div style="width:900px; display:inline-block; vertical-align:top;">
			<%
				//for(int i=0; i<10; i++){
			%>
			<c:forEach items="${list}" var="list">
				<div class="view" style="width:100%; height:200px; display:inline-block; margin:10px 0px;vertical-align:top; position:relative;">
					<c:choose>
						<c:when test="${empty list.logical_name}">
							<div class="hotel" style="cursor:pointer;width:200px; height:180px; border-radius:10px; display:inline-block; position:absolute; top:10px; left:10px;" onclick="location.href ='<%=request.getContextPath() %>/rentalhome/rentalhomeView.do?rentalhome_idx=${list.rentalhome_idx}&location=${searchVO.location}&start_date=${searchVO.start_date}&end_date=${searchVO.end_date}&person=${searchVO.person}'">
							</div>
						</c:when>
						<c:otherwise>
							<img src="<%=request.getContextPath() %>/resources/upload/${list.physical_name}" style="cursor:pointer; width:200px; height:180px; border-radius:10px; display:inline-block; position:absolute; top:10px; left:10px;" onclick="location.href ='<%=request.getContextPath() %>/rentalhome/rentalhomeView.do?rentalhome_idx=${list.rentalhome_idx}&location=${searchVO.location}&start_date=${searchVO.start_date}&end_date=${searchVO.end_date}&person=${searchVO.person}'">
						</c:otherwise>
					</c:choose>
					<div style="width:550px; height:180px; display:inline-block; position:absolute; top:10px; left:220px; text-align:left;">
						<div style="width:100%; text-align:left; display:inline-block; margin:5px;">
							<a style="text-decoration:none; color:black;" href="<%=request.getContextPath() %>/rentalhome/rentalhomeView.do?rentalhome_idx=${list.rentalhome_idx}">
<!-- 								<span style="font-size:13pt; font-weight:bold;">페어필드 바이 메리어트 서울 (Fairfield by Marriott Seoul)</span> -->
								<span style="font-size:13pt; font-weight:bold;">${list.name}</span>
							</a>
						</div>
						<div style="width:450px; height:120px; text-align:left; display:inline-block; margin:5px;">
							<span style="font-size:10pt; padding:2px 7px; border-radius:0px 5px 5px 10px;font-weight:bold; background-color:#333fff; color:white;">8.1<span style="color:#e2e2e2;">/10</span></span>
							<span style="font-size:10pt; color:#686868;">이용자 리뷰 113개</span><br>
<!-- 							<span style="font-size:10pt; color:#686868;">대한민국 서울특별시 영등포구 경인로 870</span> -->
							<span style="font-size:10pt; color:#686868;">${list.address}</span>
							<span style="font-size:10pt; color:#686868;">현재 위치에서 134km</span>
						</div>
					</div>
					<div style="width:100px; text-align:center; display:inline-block; position:absolute; top:60px; left:775px;">
					<span style="color:#0f294d; font-weight:bold;">62</span>
					</div>
					<img class="like" src="../img/love_full.png" style="width:50px; height:50px; position:absolute; top:15px; left:800px;">
					<div style="width:150px; height:80px; text-align:right; display:inline-block; position:absolute; top:100px; left:700px;">
						<span style="font-size:15pt; color:#666666; text-decoration:line-through;">21,000원</span><br>
						<span style="font-size:12pt; font-weight:bold;"><span style="color:#f51818;">6,000원</span> 할인</span><br>
						<span style="font-size:10pt; color:#666666;">최저가</span>
						<span style="font-size:18pt; font-weight:bold;">15,000원</span>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="width:100%; text-align:right; margin:20px 0px;">
			<span onclick="location.href='rentalhomeReserveList.do'" style="padding:12px 20px; color:white; background-color:#0863ec; border-radius:10px; font-weight:bold; font-size:11pt; cursor:pointer;">MY 예약 리스트</span>
			<span onclick="location.href='rentalhomeWrite.do'" style="padding:12px 20px; color:white; background-color:#0863ec; border-radius:10px; font-weight:bold; font-size:11pt; cursor:pointer;">숙소 등록</span>
		</div>
		<div style="width:100%; text-align:right; margin:20px 0px;">
			<% if (pageMaker.isPrev()){ %>
			<a href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do?page=<%=pageMaker.getStartPage()-1%>"><span style="padding:0px 10px;">◀</span></a>
			<%}
			for(int i = pageMaker.getStartPage();i<=pageMaker.getEndPage();i++) {
			%>
			<a href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do?page=<%=i%>">
				<span style="padding:0px 10px;"><%=i %></span>
			</a>
			<%	
			}
			if(pageMaker.isNext()&&pageMaker.getEndPage()>0 ){ %>
			<a href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do?page=<%=pageMaker.getEndPage()+1%>"><span style="padding:0px 10px;"></span>▶</a>
			<% } %>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>