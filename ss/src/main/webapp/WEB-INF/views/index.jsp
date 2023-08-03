<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<style>
	body{
		background-color: #CEECF5;
	}
	#slide {
		/* width: 400px; */
		height: 600px;
	}
	#carouselExampleCaptions {
		margin-left: 5%;
		margin-right: 5%;
	}
	</style>
	<!-- 전광판 점보트론 -->
	<style type="text/css">
		/* 깜빡임 효과를 위해서  */
		@keyframes blink-effect {
		50% { opacity: 0; }
		}
		.notice {
		/* background-image : url('img/jumbotronBackground.jpg'); */
		background-color: black;
		background-position: center;
		background-size: 1em;
		background-repeat: no-repeat;
		text-shadow: black 0.2em 0.2em 0.2em;
		color : red;
		}
		.jumbotroncontainer{
			margin-left: 5%;
			margin-right: 5%;
		}
		
		.notice-text-center{
		animation: blink-effect 1s step-end infinite;
		}
	</style>
	
	<!-- ======================================= main page ============================-->
	
	
	<!-- 전광판 점보 트론  -->
<div class="jumbotroncontainer"> <!--어떤 내용이 담기는 하나의 공간, 그릇-->
	<div class="notice">
		<c:if test="${empty login}">
		<span class="notice-text-center">로그인을 해주세요 로그인이 안되잇어요</span>
		</c:if>
		<c:if test="${not empty login}">
		<span class="notice-text-center">${login.uName}님 환영합니다</span>
		</c:if>
			<!-- <p class="text-center"> 코딩 부스터는 IT 교육 사이트입니다. 다양한 IT 관련 무료 및 유료 강의가 존재합니다.</p>
			<p class="text-center">
				<a class="bit btn-primary btn-lg" href="tt" role="button">강의 들으러 가기</a>
			</p> -->
	</div>
</div>
	<!-- 이미지 슬라이드 캐러셀 -->
	<!-- data-bs-interval="3000" 지연시간 설정 -->
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item active" data-bs-interval="3000">
			<img id="slide" src="./img/main2.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				<h5>First slide label</h5>
				<p>Some representative placeholder content for the first slide.</p>
				</div>
		</div>
		<div class="carousel-item" data-bs-interval="3000">
			<img id="slide" src="./img/main3.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				<h5>Second slide label</h5>
				<p>Some representative placeholder content for the second slide.</p>
				</div>
		</div>
		<div class="carousel-item" data-bs-interval="3000">
			<img id="slide" src="./img/main4.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				<h5>Third slide label</h5>
				<p>Some representative placeholder content for the third slide.</p>
				</div>
		</div>
	</div> 
	<!-- 슬라이드 쇼 컨트롤 -->
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	<span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
	<span class="carousel-control-next-icon" aria-hidden="true"></span>
	<span class="visually-hidden">Next</span>
	</button>
</div> <!-- 슬라이드 쇼 div 끝  -->
	<!-- 지도앱  margin-left: 5%; margin-right: 5%; -->
	<div style="float: left; width: 40%; margin-left: 5%; margin-right: 5%;">
		<img alt="지도 구현" src="./img/map.jpg">
		<!-- <textarea rows="20" style="width:100%; margin-left: 5%;">MAP 구현 </textarea> -->
	</div>
	<!-- 베스트글 보여주기  -->
	<div style="float: left; width: 40%; margin-left: 5%; margin-right: 5%; ">
		<table border="1" style=" width: 90%; height: 100%;  margin-right: 5%; ">
			<tr>
				<td>1
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>2
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>3
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>4
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>1
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>2
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>3
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
			<tr>
				<td>4
				</td>
				<td>1-1
				</td>
				<td>1-2
				</td>
			</tr>
		</table>
	</div>
	<div>
	</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<!-- 채팅 테스트 개발 중 (혁수) -->
<a href = "<%=request.getContextPath() %>/Community/ChattingTest.do"> 채팅 테스트 </a>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>