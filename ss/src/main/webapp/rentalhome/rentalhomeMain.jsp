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
</style>
</head>
<body>
<div style="width:1920px; text-align:center;">
	<div style="border:1px solid black; width:1224px; height:100px; margin:0 auto; padding:10px;">
		<div style="border:1px solid black; width:250px; height:100%; display:inline-block;" >
			여행지 설정
		</div>
		<div style="border:1px solid black; width:250px; height:100%; display:inline-block;" >
			체크인 체크아웃
		</div>
		<div style="border:1px solid black; width:250px; height:100%; display:inline-block;" >
			인원수 설정
		</div>
		<div style="border:1px solid black; width:150px; height:100%; display:inline-block;" >
			검색
		</div>
	</div>
	<div style="border:1px solid black; width:200px; height:1000px; display:inline-block; margin:10px;">
		검색조건
	</div>
	<div style="border:1px solid black; width:1000px; display:inline-block; vertical-align:top; margin:10px;">
			<div style="border:1px solid black; width:900px; height:50px; display:inline-block; vertical-align:top; margin:10px 0px 10px 0px; padding:10px;">
				<div style="border:1px solid black; width:250px; height:100%; display:inline-block; vertical-align:top;">
					가격
				</div>
				<div style="border:1px solid black; width:250px; height:100%; display:inline-block; vertical-align:top;">
					리뷰
				</div>
				<div style="border:1px solid black; width:250px; height:100%; display:inline-block; vertical-align:top;">
					좋아요
				</div>
			</div>
		<%
			for(int i=0; i<5; i++){
		%>
			<div style="border:1px solid black; width:900px; height:200px; display:inline-block; vertical-align:top; position:relative; margin:10px;">
				<div style="width:200px; height:180px; border:1px solid black; display:inline-block; position:absolute; top:10px; left:10px;">
					<a href="<%=request.getContextPath() %>/rentalhome/rentalhomeView.do">이미지</a>
				</div>
				<div style="width:550px; height:180px; border:1px solid black; display:inline-block; position:absolute; top:10px; left:220px;">
					<div style="width:500px; height:50px; border:1px solid black; text-align:center; display:inline-block; margin:5px;">
						<a href="#">숙소 이름</a>
					</div>
					<div style="width:250px; height:100px; border:1px solid black; text-align:center; display:inline-block; margin:5px;">
						숙소 정보
					</div>
					<div style="width:250px; height:100px; border:1px solid black; text-align:center; display:inline-block; margin:5px;">
							청결
							위치
							서비스
							시설
					</div>
				</div>
				<div style="width:80px; height:50px; border:1px solid black; text-align:center; display:inline-block; position:absolute; top:15px; left:800px;">
					좋아요 이미지
				</div>
				<div style="width:80px; height:100px; border:1px solid black; text-align:center; display:inline-block; position:absolute; top:75px; left:800px;">
					정상가<br>
					할인가<br>
					최종가
				</div>
			</div>
		<%
			}
		%>
	</div>
</div>
</body>
</html>
<%@ include file="../include/footer.jsp" %>