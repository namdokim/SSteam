<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
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
</script>
<style type="text/css">
	a {
		text-decoration:none;
		color:black;
	}
	.like {
		width: 300px;
		height: 300px;
		background-image: url(../img/love_full.png);
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
		box-shadow:1px 1px 1px 1px #ddd;
	}
	.map{
		background-image: url(../img/map2.jpg);
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	.search{
		border:none;
		color:#444444;
	}
	.search:hover{
		border-bottom:2px solid #0863ec;
		border-radius:0px;
	}
</style>
<div style="width:1920px; text-align:center; background-color:#f0f7fe; padding:20px 0px;">
	<div class="view" style="width:1224px; margin:0 auto; padding:10px;  line-height:50px;">
		<div style="border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
			<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">여행지</span><br>
			<input type="text" class="search" style="font-weight:bold; font-size:11pt;width:230px;position:absolute; top:23px; left:10px; height:25px; outline:none;">
		</div>
		<div style="border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
				<div class="row justify-content-center">
					<div class="col-md-5">
						<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">체크인</span><br>
						<input type="text" class="search form-control datepicker" style="padding:0px; box-shadow:0 0 0 0; font-size:11pt;width:100px;position:absolute; top:23px; left:10px; height:25px; outline:none;">
				</div>
				<div class="col-md-5">
						<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:140px;">체크아웃</span><br>
						<input type="text"  class="search form-control datepicker" style="padding:0px; box-shadow:0 0 0 0; font-size:11pt; width:100px;position:absolute; top:23px; left:140px; height:25px; outline:none;">
					</div>
				</div>
		</div>
		<div style="border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
			<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">인원 수</span><br>
			<select class="search" style="font-weight:bold; font-size:11pt;width:230px;position:absolute; top:23px; left:10px; height:25px; outline:none; ">
				<option selected ></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select>
		</div>
		<div style="background-color:#0863ec; width:80px; height:50px; display:inline-block; border-radius:5px; text-align:center; position:relative;" >
			<span style="font-weight:bold;color:white; font-size:15pt;">검색</span><br>
		</div>
	</div>
	<div class="view" style="width:1224px; text-align:left; height:600px; margin:10px auto; padding:10px; position:relative;">
		<div style="width:1000px; height:500px; margin:0 auto; padding:10px; display:inline-block; position:absolute; top:10px; left:10px;"> 
			<span style="font-size:20pt; font-weight:bold;">${rentalhomeVO.name}</span><br>
			<span style="color:#545454;">${rentalhomeVO.address}</span><br>
			<div style="width:700px; margin:5px 0px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; word-break:break-all">
				<span style="font-size:10pt; color:#545454;">${rentalhomeVO.info}</span><br>
			</div>
		</div>
		<div class="like" style="width:50px; height:50px; margin:0 auto; display:inline-block; position:absolute; top:37px; left:820px;">
		</div>
		<div style="width:100px; text-align:center; height:80px; margin:0 auto; display:inline-block; position:absolute; top:30px; left:850px;">
			<span style="font-size:30pt; color:#FA5858; font-weight:bold;">30</span>
		</div>
		<span style="text-align:center; width:160px; height:80px; padding:20px 20px; position:absolute; top:30px; left:1040px; background-color:#0863ec; border-radius:20px; font-size:20pt; color:white; font-weight:bold;">객실선택</span>
		<div class="hotel" style="width:380px; height:210px; border-radius:5px; margin:10px; display:inline-block; position:absolute; top:120px; left:10px;">
		</div>
		<div class="hotel" style="width:380px; height:210px; border-radius:5px; margin:10px; display:inline-block; position:absolute; top:120px; left:410px;">
		</div>
		<div class="hotel" style="width:380px; height:210px; border-radius:5px; margin:10px; display:inline-block; position:absolute; top:120px; left:810px;">
		</div>
		<div style="border:1px solid #ddd; border-radius:5px;text-align:left; width:300px; height:210px; position:absolute; top:340px; left:10px; margin:10px; padding:10px 20px;" >
			<div style="width:100px; height:30px; margin:5px 0px 10px 0px;"><span style="font-weight:bold;color:#282828;">리뷰 점수</span></div>
			<div style="width:140px; display:inline-block; margin:10px 0px;"><span style="font-weight:bold;">청결</span>&nbsp;&nbsp;8<br>
				<span style="border-radius:10px; font-weight:bold; background-color:#045FB4; padding:1px; color:transparent;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
			</div>
			<div style="width:100px; display:inline-block; margin:5px 0px;"><span style="font-weight:bold;">위치</span>&nbsp;&nbsp;6<br>
				<span style="border-radius:10px; font-weight:bold; background-color:#045FB4; padding:1px; color:transparent;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
			</div>
			<div style="width:140px; display:inline-block; margin:5px 0px;"><span style="font-weight:bold;">서비스</span>&nbsp;&nbsp;9<br>
				<span style="border-radius:10px; font-weight:bold; background-color:#045FB4; padding:1px; color:transparent;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
			</div>
			<div style="width:100px; display:inline-block; margin:5px 0px;"><span style="font-weight:bold;">시설</span>&nbsp;&nbsp;4<br>
				<span style="border-radius:10px; font-weight:bold; background-color:#045FB4; padding:1px; color:transparent;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
			</div>
		</div>
		<div style="border:1px solid #ddd; border-radius:5px; text-align:left;width:360px; height:210px; position:absolute; top:340px; left:320px; padding:10px 20px;margin:10px;" >
			<div style="width:100px; height:30px; margin:5px 0px;"><span style="font-weight:bold;color:#282828;">호텔 시설</span></div>
				<c:if test="${rentalhomeVO.inPool_yn == 'Y' || rentalhomeVO.outPool_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/pool.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">수영장</span>
					</div>
				</c:if>
				<c:if test="${not empty rentalhomeVO.parking_yn}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/parking.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">주차장</span>
					</div>
				</c:if>
				<c:if test="${not empty rentalhomeVO.pickup_yn}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/pickup.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">픽업</span>
					</div>
				</c:if>
				<c:if test="${not empty rentalhomeVO.wifi_yn}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/wifi.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
					</div>
				</c:if>
				<c:if test="${not empty rentalhomeVO.beach_yn}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/beach.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">인근해변</span>
					</div>	
				</c:if>
				<c:if test="${not empty rentalhomeVO.bbq_yn}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/bbq.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">바베큐</span>
					</div>
				</c:if>
				<c:if test="${not empty rentalhomeVO.breakfast_yn}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/breakfast.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">조식</span>
					</div>
				</c:if>
				<c:if test="${not empty rentalhomeVO.animal_yn}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/dog.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">반려동물</span>
					</div>
				</c:if>
			</div>
		<div class="map" style="text-align:center;border:1px solid #ddd; border-radius:5px; width:500px; height:210px; position:absolute; top:340px; left:690px; margin:10px;" >
		</div>
	</div>
	<div class="view" style="width:1224px; text-align:left; margin:20px auto;">
		<div style="width:100%; text-align:left; padding:0px 20px; border-bottom:1px solid #d5d9e0;">
			<div style="width:150px; height:100%; display:inline-block; padding:10px 0px; font-weight:bold;">객실</div>
			<div style="width:150px; height:100%; display:inline-block; padding:10px 0px; font-weight:bold;">리뷰</div>
			<div style="width:150px; height:100%; display:inline-block; padding:10px 0px; font-weight:bold;">숙소 규정</div>
			<button onclick="location.href='rentalhomeWrite_room.do'"style="background-color:transparent; border:0px;width:150px; height:100%; display:inline-block; padding:10px 0px; font-weight:bold;">객실 등록하기</button>
		</div>
		<%
			for(int i=0; i<5; i++){
		%>
		<div style="width:100%; height:200px; text-align:center; position:relative; border-bottom:1px solid #d5d9e0;">
			<div class="hotel" style="border-radius:20px; width:200px; height:150px; margin:20px; display:inline-block; position:absolute; top:0px; left:0px;"></div>
			<div style="text-align:left; width:790px; height:150px; margin:20px; padding:10px; display:inline-block; position:absolute; top:0px; left:210px;">
				<div style="margin-bottom:10px;">
					<span style="font-weight:bold; font-size:15pt;">설무리 방</span><br>
				</div>
				<div style="display:inline-block; width:180px; height:30px;">
					<img src="../img/user.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">성인2명 - 성인 5명</span>
				</div>
				<div style="display:inline-block; width:120px; height:30px;">
					<img src="../img/dont-smoke.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">금연객실</span>
				</div>
				<div style="display:inline-block; width:150px; height:30px;">
					<img src="../img/bed.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">싱글침대 2개</span>
				</div>
				<div style="display:inline-block; width:100px; height:30px;">
					<img src="../img/wifi.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
				</div>
				<br>
				<div style="width:100%; text-align:right; padding-top:20px;">
					<span style="font-size:20pt; color:#666666; text-decoration:line-through;">21,000원</span>
					<span style="font-size:25pt; font-weight:bold; ">15,000원</span>
				</div>
			</div>
			<span onclick="location.href='rentalhomeReserve.do'"style="cursor:pointer; text-align:center; width:160px; height:80px; padding:20px 20px; position:absolute; top:80px; margin:10px; left:1030px; background-color:#0863ec; border-radius:20px; font-size:20pt; color:white; font-weight:bold;">예약</span>
			<span style="cursor:pointer; text-align:center; height:40px;  position:absolute; top:0px; margin:10px; left:1080px; font-size:12pt; color:gray; text-decoration:underline;">객실 정보 수정</span>
			<span style="cursor:pointer; text-align:center; height:40px;  position:absolute; top:40px; margin:10px; left:1115px; font-size:12pt; color:gray; text-decoration:underline;">객실 삭제</span>
		</div>
		<%
			}
		%>
	</div>
	<div class="view" style="width:1224px; height:450px; text-align:left; padding:10px; margin:10px auto; position:relative;">
		<span style="font-weight:bold; font-size:15pt; padding:10px;">주변숙소</span>&nbsp;<span style="color:gray;">1박 기준 객실 최저가</span>
		<div class="hotel" style="width:270px; height:150px; border-radius:10px 10px 0px 0px; margin:10px; position:absolute; top:60px; left:10px;"></div>
		<div style="box-shadow: 5px 5px 5px 5px #d5d9e0; width:270px; height:200px; border-radius:0px 0px 10px 10px; margin:10px; padding:10px; position:absolute; top:210px; left:10px;">
			<div style="width:100%; height:150px;">
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

		<div class="hotel" style="width:270px; height:150px; border-radius:10px 10px 0px 0px; margin:10px; position:absolute; top:60px; left:315px;"></div>
		<div style="box-shadow: 5px 5px 5px 5px #d5d9e0; width:270px; height:200px; border-radius:0px 0px 10px 10px; margin:10px; position:absolute; top:210px; left:315px;"></div>

		<div class="hotel" style="width:270px; height:150px; border-radius:10px 10px 0px 0px; margin:10px; position:absolute; top:60px; right:315px;"></div>
		<div style="box-shadow: 5px 5px 5px 5px #d5d9e0; width:270px; height:200px; border-radius:0px 0px 10px 10px; margin:10px; position:absolute; top:210px; right:315px;"></div>

		<div class="hotel" style="width:270px; height:150px; border-radius:10px 10px 0px 0px; margin:10px; position:absolute; top:60px; right:10px;"></div>
		<div style="box-shadow: 5px 5px 5px 5px #d5d9e0; width:270px; height:200px; border-radius:0px 0px 10px 10px; margin:10px; position:absolute; top:210px; right:10px;"></div>
	</div>
	<div class="view" style="width:1224px; text-align:left; padding:20px; margin:10px auto;">
		<span style="font-weight:bold; font-size:15pt;">리뷰</span><span style="font-size:10pt;">(107)</span><br>
		<div style="text-align:center; display:inline-block; width:300px; margin-right:100px;">
		<span style="border-radius:20px; font-size:30pt; font-weight:bold; padding:20px;">7.5/10</span>
		</div>
		<div style="display:inline-block; width:700px;">
			<div style="width:350px; display:inline-block;"><span style="font-weight:bold;">청결</span>&nbsp;&nbsp;8<br>
				<span style="border-radius:10px; font-weight:bold; background-color:#045FB4; padding:1px; color:transparent;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
			</div>
			<div style="width:300px; display:inline-block;"><span style="font-weight:bold;">위치</span>&nbsp;&nbsp;6<br>
				<span style="border-radius:10px; font-weight:bold; background-color:#045FB4; padding:1px; color:transparent;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
			</div>
			<div style="width:350px; display:inline-block;"><span style="font-weight:bold;">서비스</span>&nbsp;&nbsp;9<br>
				<span style="border-radius:10px; font-weight:bold; background-color:#045FB4; padding:1px; color:transparent;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
			</div>
			<div style="width:300px; display:inline-block;"><span style="font-weight:bold;">시설</span>&nbsp;&nbsp;4<br>
				<span style="border-radius:10px; font-weight:bold; background-color:#045FB4; padding:1px; color:transparent;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span>
			</div>
		</div>
		<div style="border:1px solid #f1f7fd;border-radius:10px; width:1150px; height:200px; margin-top:30px; padding:20px; position:relative;">
			<div class="user" style="position:absolute;"></div>
			<div style="position:absolute; width:200px; top:20px; left:80px; font-size:15pt; font-weight:bold;">김남도</div>
			<div style="position:absolute; width:200px; top:50px; left:80px; color:#777777;">2023-07-18</div>
			<div style="position:absolute; width:300px; top:100px; color:#777777;">페어필드 바이 메리어트 서울</div>
			<div style="position:absolute; width:300px; top:130px; color:#777777;">설무리 방</div>
			<div style="position:absolute; width:300px; top:160px; color:#777777;">투숙일: 2023-07-15</div>
			<div style="position:absolute; width:50px; top:30px; left:200px;">
				<span style="font-size:18pt; font-weight:bold; padding:10px; border-radius:10px; color:#0156df;">8.1/10</span>
			</div>
			<div style="position:absolute; width:750px; top:30px; left:350px;">
			영등포역과 아주 가깝고 바로앞에 버스 정류장도 있어서 위치는 아주 좋아요. 오픈한지 얼마 안되어 그런지 시설은 아주 깨끗하고 깔끔하고 무엇보다 침구류가 너무 좋더라구요. 
			</div>
		</div>
	</div>
	<div class="view" style="width:1224px; text-align:left; padding:20px; margin:10px auto;">
		<span style="font-weight:bold; font-size:15pt;">숙소 규정</span><br>
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
			<c:if test="${not empty rentalhomeVO.parking_yn}">
				<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
					<img src="../img/parking.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">주차장</span>
				</div>
			</c:if>
			<c:if test="${not empty rentalhomeVO.pickup_yn}">
				<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
					<img src="../img/pickup.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">픽업</span>
				</div>
			</c:if>
			<c:if test="${not empty rentalhomeVO.wifi_yn}">
				<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
					<img src="../img/wifi.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
				</div>
			</c:if>
			<c:if test="${not empty rentalhomeVO.beach_yn}">
				<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
					<img src="../img/beach.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">인근해변</span>
				</div>	
			</c:if>
			<c:if test="${not empty rentalhomeVO.bbq_yn}">
				<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
					<img src="../img/bbq.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">바베큐</span>
				</div>
			</c:if>
			<c:if test="${not empty rentalhomeVO.breakfast_yn}">
				<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
					<img src="../img/breakfast.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">조식</span>
				</div>
			</c:if>
			<c:if test="${not empty rentalhomeVO.animal_yn}">
				<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
					<img src="../img/dog.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">반려동물</span>
				</div>
			</c:if>
			
		</div>
	</div>
		<!-- and login.id eq vo.id -->
<%-- 				<c:if test="${not empty login}"> --%>
					<div style="width:1224px; display:inline-block; text-align:right; margin:20px 0px;">
						<span onclick="location.href='rentalhomeModify.do?rentalhome_idx=${rentalhomeVO.rentalhome_idx}'" style="padding:15px; color:white; background-color:#0863ec; border-radius:10px; font-weight:bold; font-size:11pt; cursor:pointer;">숙소 정보 변경</span>
					</div>
<%-- 				</c:if> --%>
</div>
<%@ include file="../include/footer.jsp" %>