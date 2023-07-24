<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박 메인</title>
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
	.like {
		width: 300px;
		height: 300px;
		background-image: url(../img/love_full.png);
		background-size: contain;
		background-repeat: no-repeat;
		background-position: center;
	}
	.datepicker{
		font-weight:bold;
	}
</style>
</head>
<body>
<div style="width:1920px; text-align:center; background-color:#f5f9fe; padding:50px 0px;">
	<div class="view" style="width:1224px; margin:0 auto; padding:10px;  line-height:50px; ">
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
	<div style="width:1224px; margin:0 auto;line-height:50px; ">
		<div style="width:300px; height:50px; display:inline-block; margin:20px 18px 0px 0px;">
			<span style="font-size:18pt; font-weight:bold;">숙소 검색 결과 68개</span>
		</div>
		<div class="view" style="height:50px; line-height:50px; width:900px; display:inline-block;">
			<div style="width:280px; display:inline-block;">
				<span style="font-size:10pt; font-weight:bold;">최저가  정렬</span>
			</div>
			<div style="background-color:#cccccc; display:inline-block; width:1px; height:25px; line-height:30px;">&nbsp;</div>
			<div style="width:280px; display:inline-block;">
				<span style="font-size:10pt; font-weight:bold;">리뷰 많은 순 정렬</span>
			</div>
			<div style="background-color:#cccccc; display:inline-block; width:1px; height:25px; line-height:30px;">&nbsp;</div>
			<div style="width:280px; display:inline-block;">
				<span style="font-size:10pt; font-weight:bold;">좋아요 많은 순 정렬</span>
			</div>
		</div>
	</div>
	<div style="width:300px; height:1000px; display:inline-block; margin:20px 18px 0px 0px; vertical-align:top;">
		<div class="view" style="width:300px; height:1000px; display:inline-block;">
			금액, 평점, 숙소 종류, (내부 수영장, 야외 수영장, 주차장, 픽업, 객실 내 흡연, 와이파이, 인근해변, 바베큐, 조식, 반려동물), 침대 종류 및 갯수
		</div>
	</div>
	<div style="width:900px; height:1000px; display:inline-block; margin:20px 0px 50px 0px; vertical-align:top;">
		
		<div style="width:900px; display:inline-block; vertical-align:top;">
			<%
				for(int i=0; i<5; i++){
			%>
				<div class="view" style="width:100%; height:200px; display:inline-block; margin-bottom:10px;vertical-align:top; position:relative;">
					<div class="hotel"style="width:200px; height:180px; border-radius:10px; display:inline-block; position:absolute; top:10px; left:10px;">
						<a href="<%=request.getContextPath() %>/rentalhome/rentalhomeView.do">이미지</a>
					</div>
					<div style="width:550px; height:180px; display:inline-block; position:absolute; top:10px; left:220px; text-align:left;">
						<div style="width:100%; text-align:left; display:inline-block; margin:5px;">
							<a href="#"><span style="font-size:13pt; font-weight:bold;">페어필드 바이 메리어트 서울 (Fairfield by Marriott Seoul)</span></a>
						</div>
						<div style="width:450px; height:200px; text-align:left; display:inline-block; margin:5px;">
							<span style="font-size:10pt; padding:2px 7px; border-radius:0px 5px 5px 10px;font-weight:bold; background-color:#333fff; color:white;">8.1<span style="color:#e2e2e2;">/10</span></span>
							<span style="font-size:10pt; color:#686868;">이용자 리뷰 113개</span><br>
							<span style="font-size:10pt; color:#686868;">대한민국 서울특별시 영등포구 경인로 870</span>
							<span style="font-size:10pt; color:#686868;">현재 위치에서 134km</span>
						</div>
					</div>
					<div class="like" style="width:50px; height:50px; text-align:center; display:inline-block; position:absolute; top:15px; left:800px;">
					</div>
					<div style="width:150px; height:80px; text-align:right; display:inline-block; position:absolute; top:100px; left:700px;">
						<span style="font-size:15pt; color:#666666; text-decoration:line-through;">21,000원</span><br>
						<span style="font-size:12pt; font-weight:bold;"><span style="color:#f51818;">6,000원</span> 할인</span><br>
						<span style="font-size:10pt; color:#666666;">최저가</span>
						<span style="font-size:18pt; font-weight:bold;">15,000원</span>
					</div>
				</div>
			<%
				}
			%>
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="../include/footer.jsp" %>