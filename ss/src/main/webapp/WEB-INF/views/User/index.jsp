<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link rel="stylesheet" href="css/font.css">
	<style>

	#slide {
		/* width: 400px; */
		height: 500px;
	}
	  .carousel-inner.rounded {
        border-radius: 70px; /* 원하는 크기로 조정 */
        overflow: hidden; /* 내용이 넘칠 경우 테두리를 넘치지 않도록 함 */
    }
    
        /* 스타일링 */
           .dark-overlay::before {
            content: ""; /* 가상 요소 생성 */
            position: absolute; /* 절대 포지션으로 이미지 위에 배치 */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #1c375e;/* 어둡게 만들기 위한 검은색 레이어 */
            opacity: 0.5; /* 투명도 조절 */
            pointer-events: none; /* 가상 요소에 마우스 이벤트를 허용하지 않음 */
        }

 
	</style>
	
	<!-- 전광판 점보 트론  -->
<!-- 	style="background: linear-gradient( to top right, #32AAFF, #BEEFFF);" -->
<main style="font-family:'TheJamsil5Bold';" >
	
	<!-- 이미지 슬라이드 캐러셀 -->
	<!-- data-bs-interval="3000" 지연시간 설정 -->
	<div class=" justify-content-center marketing" >
		<div id="carouselExampleCaptions" class="carousel slide " data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" class="active2" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" class="active3" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner rounded">
				<a class="carousel-item active dark-overlay"  data-bs-interval="6000" href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do" >
					<img id="slide" src="./img/houses.jpg" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h2>요즘 핫한 숙박 발견!</h2>
						<h5>오늘 가장 인기 많은 숙박시설</h5>
					</div>
				</a>
				<a class="carousel-item active2 dark-overlay" data-bs-interval="6000" href="<%=request.getContextPath()%>/food/foodMain.do">
					<img id="slide" src="./img/food.jpg" class="d-block w-100 " alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h2>요즘 핫한 맛집 발견!</h2>
						<h5>오늘 가장 인기 많은 맛집 핫 플레이스</h5>
					</div>
				</a>
				<a class="carousel-item active3 dark-overlay" data-bs-interval="6000" href="<%=request.getContextPath()%>/event/eventMain.do">
					<img id="slide" src="./img/hotel.jpg" class="d-block w-100 " alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h2>요즘 핫한 축제 발견!</h2>
						<h5>오늘 가장 인기 많은 축제 핫 플레이스</h5>
					</div>
				</a>
			</div> 
		</div> <!-- 슬라이드 쇼 div 끝  -->
	</div>	
	<!-- 지도앱  margin-left: 5%; margin-right: 5%; -->
<!-- 	<div style="float: left; width: 40%; margin-left: 5%; margin-right: 5%;">
		<img alt="지도 구현" src="./img/map.jpg">
		<textarea rows="20" style="width:100%; margin-left: 5%;">MAP 구현 </textarea>
	</div> -->
	<!-- 슬라이더 밑 보여주기  -->
	<!-- fill이 인식이 안됨  -->
	<div class="container marketing mt-5">
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
	<%@ include file="/WEB-INF/views/include/Homebest.jsp" %>
	<%@ include file="/WEB-INF/views/include/Foodbest.jsp" %>
	<%@ include file="/WEB-INF/views/include/Festbest.jsp" %>
</main>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>