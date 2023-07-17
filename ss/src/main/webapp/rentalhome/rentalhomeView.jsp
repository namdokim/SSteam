<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박 메인</title>
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
	.hotel {
		width: 300px;
		height: 300px;
		background-image: url(../img/hotel.jpg);
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
</style>
</head>
<body>
<div style="width:1920px; text-align:center;">
	<div style="border:1px solid black; width:1224px; height:100px; margin:0 auto; padding:10px;">
		<div style="border:1px solid black; width:250px; height:100%; display:inline-block;" >
			여행지 설정
		</div>
		<div style="border:1px solid black; width:250px; height:100%; display:inline-block;" >
			체크인 체크아웃 설정
		</div>
		<div style="border:1px solid black; width:250px; height:100%; display:inline-block;" >
			인원수 설정
		</div>
		<div style="border:1px solid black; width:150px; height:100%; display:inline-block;" >
			검색
		</div>
	</div>
	<div style="border:1px solid black; width:1224px; text-align:left; height:525px; margin:10px auto; padding:10px; position:relative;">
		<div style="border:1px solid black; width:1000px; height:500px; margin:0 auto; padding:10px; display:inline-block; position:absolute; top:10px; left:10px;"> 
			<span style="font-size:20pt;">페어필드 바이 메리어트 서울 (Fairfield by Marriott Seoul)</span><br>
			<span>주소-대한민국 서울특별시 영등포구 경인로 870 (07306)</span><br>
			<span>페어필드 바이 메리어트 서울 (Fairfield by Marriott Seoul)의 숙소 정보</span><br>
		</div>
		<div class="like" style="border:1px solid black; width:100px; height:80px; margin:0 auto; display:inline-block; position:absolute; top:30px; left:750px;">
		</div>
		<div style="border:1px solid black; width:100px; text-align:center; height:80px; margin:0 auto; display:inline-block; position:absolute; top:30px; left:850px;">
			<span style="font-size:30pt; color:#FA5858; font-weight:bold;">30</span>
		</div>
		<span style="text-align:center; width:160px; height:80px; padding:20px 20px; position:absolute; top:30px; left:1040px; background-color:#045FB4; border-radius:20px; font-size:20pt; color:white; font-weight:bold;">객실선택</span>
		<div class="hotel" style="width:300px; height:210px; border-radius:20px; margin:10px; display:inline-block; position:absolute; top:130px; left:10px;">
		</div>
		<%
			for(int i=0; i<3; i++){
				int result = 210;
				result = result * i;
		%>
				<div class="hotel" style="width:200px; height:100px; border-radius:20px; display:inline-block; position:absolute; top:140px; left:<%=330+result %>px;">
				</div>
		<%
			}
			for(int i=0; i<3; i++){
				int result = 210;
				result = result * i;
		%>			
				<div class="hotel" style="width:200px; height:100px; border-radius:20px; display:inline-block; position:absolute; top:250px; left:<%=330+result %>px;">
				</div>
		<%
			}
		%>
		<div style="border-radius:20px; background-color:#FAFAFA; width:300px; height:100px; position:absolute; top:360px; left:10px; margin:10px;" >
			청결 위치 서비스 시설
		</div>
		<div style="border-radius:20px; background-color:#FAFAFA; width:310px; height:100px; position:absolute; top:360px; left:320px; margin:10px;" >
			지도
		</div>
		<div style="border-radius:20px; background-color:#FAFAFA; width:300px; height:100px; position:absolute; top:360px; left:640px; margin:10px;" >
			숙소 시설 정보
		</div>
	</div>
	<div style="border:1px solid black; width:1224px; text-align:left; margin:10px auto;">
		<div style="border:1px solid black; width:100%; height:50px; text-align:center;">
			<div style="border:1px solid black; width:300px; height:100%; display:inline-block; padding:10px;">객실</div>
			<div style="border:1px solid black; width:300px; height:100%; display:inline-block; padding:10px;">리뷰</div>
			<div style="border:1px solid black; width:300px; height:100%; display:inline-block; padding:10px;">예약 및 취소 안내</div>
		</div>
		<div style="border:1px solid black; width:100%; height:240px; text-align:center; padding:10px; position:relative;">
			<div class="hotel" style="border:1px solid black; width:300px; height:200px; margin:10px; display:inline-block; position:absolute; top:0px; left:0px;"></div>
			<div style="text-align:left; border:1px solid black; width:690px; height:200px; margin:10px; display:inline-block; position:absolute; top:0px; left:310px;">
				<span style="font-weight:bold; font-size:15pt;">설무리 방</span><br><br>
				<span style="font-size:10pt;">최소 인원</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="font-size:10pt;">최대 인원</span><br>
				<span style="font-size:10pt;">흡연 객실여부</span><br>
				<span style="font-size:10pt;">침대정보</span><br> 
			</div>
			<span style="text-align:center; width:160px; height:80px; padding:20px 20px; position:absolute; top:120px; margin:10px; left:1030px; background-color:#045FB4; border-radius:20px; font-size:20pt; color:white; font-weight:bold;">예약</span>
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="../include/footer.jsp" %>