<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<style>

	#slide {
		/* width: 400px; */
		height: 500px;
	}
	#carouselExampleCaptions {
		/* margin-left: 5%;
		margin-right: 5%; */
	}
	</style>
	<!-- 전광판 점보트론 -->
	<style type="text/css">
		/* 깜빡임 효과를 위해서  */
		@keyframes blink-effect {
		50% { opacity: 0.1; }
		}
		.notice {
		/* background-image : url('img/jumbotronBackground.jpg'); */
		background-color: write;
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
	
	<!-- 전광판 점보 트론  -->
<div class="jumbotroncontainer"> <!--어떤 내용이 담기는 하나의 공간, 그릇-->
	<div class="notice">
		<c:if test="${empty login}">
		<span class="notice-text-center">로그인을 해주세요 로그인이 안되잇어요</span>
		</c:if>
		<c:if test="${not empty login}">
		<span class="notice-text-center">${login.uName}님 환영합니다//<%= login.getuNick() %>님 이랏샤이마세!</span>
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
			<img id="slide" src="./img/natural_wind.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				<h5>First slide label</h5>
				<p>Some representative placeholder content for the first slide.</p>
				</div>
		</div>
		<div class="carousel-item" data-bs-interval="3000">
			<img id="slide" src="./img/Jamaica.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
				<h5>Second slide label</h5>
				<p>Some representative placeholder content for the second slide.</p>
				</div>
		</div>
		<div class="carousel-item" data-bs-interval="3000">
			<img id="slide" src="./img/hotel.jpg" class="d-block w-100" alt="...">
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
<!-- 	<div style="float: left; width: 40%; margin-left: 5%; margin-right: 5%;">
		<img alt="지도 구현" src="./img/map.jpg">
		<textarea rows="20" style="width:100%; margin-left: 5%;">MAP 구현 </textarea>
	</div> -->
	<!-- 슬라이더 밑 보여주기  -->
	<!-- fill이 인식이 안됨  -->
	<hr class="featurette-divider">
	<div class="container marketing">
		<div class="row featurette">
			<div class="col-md-7 order-md-2">
				<h2 class="featurette-heading fw-normal lh-1">
				"OH Yeay, it'that Good"
				<span class="text-body-secondary"> see you next time</span>
				</h2>
				<p class="lead">
				쏼라쏼라,헤에이 쏼라쏼라,헤에이 쏼라쏼라,헤에이 쏼라쏼라,헤에이 쏼라쏼라,헤에이 쏼라쏼라,헤에이 쏼라쏼라,헤에이 
				</p>
			</div>
			<div class="col-md-5 order-md-1">
				<svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
				<%-- <img src="<%=request.getContextPath() %>/img/ss1.jpg" width="500" height="500"> --%>
					<title>Placeholder</title>
					<rect width="100%" height="100%" fill="var(--bs-secondary-bg)"></rect>
					<text x="50%" y="50%" fill="var(--bs-secondary-color)">500x500</text>
				</svg>
				
			</div>
		</div>
	</div> <!-- container marketing -->
	<hr class="featurette-divider">
	<!-- 베스트글 보여주기  -->
	<div>	
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>