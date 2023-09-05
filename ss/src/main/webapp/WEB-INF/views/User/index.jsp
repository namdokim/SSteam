<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
    $('.owl-carousel').owlCarousel({
      items: 3, // Number of items to display
      loop: true, // Enable loop
      margin: 10, // Spacing between items
      nav: true, // Enable navigation buttons
      responsive:{
        0:{
            items:1 // Number of items to display on smaller screens
        },
        768:{
            items:2 // Number of items to display on medium screens
        },
        992:{
            items:3 // Number of items to display on larger screens
        }
      },
      autoplay: true, // Enable auto play
      autoplayTimeout: 8000 // Time between auto scrolls in milliseconds (5 seconds in this example)
    });
  });
</script>
<style>

	#slide {
		/* width: 400px; */
		height: 500px;
	}
	.carousel-item img {
  max-width: 100%;
  max-height: 100%;
  width: auto;
  height: auto;
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
	<div class=" justify-content-center marketing "  style="font-family: 'TheJamsil5Bold';">
		<div id="carouselExampleCaptions" class="carousel slide " data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" class="active2" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" class="active3" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner rounded">
				<a class="carousel-item active dark-overlay"  data-bs-interval="6000" href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do" >
					<img id="slide" src="${pageContext.request.contextPath}/resources/img/backboard.jpg" class="d-block w-100 img-fluid" alt="..." style="object-fit: cover;">
					<div class="carousel-caption d-none d-md-block">
						<h2>요즘 핫한 숙박 발견!</h2>
						<h5>오늘 가장 인기 많은 숙박시설</h5>
					</div>
				</a>
			
				<a class="carousel-item active2 dark-overlay" data-bs-interval="6000" href="<%=request.getContextPath()%>/food/foodMain.do">
					<img id="slide" src="${pageContext.request.contextPath}/resources/img/food.jpg" class="d-block w-100 img-fluid" alt="..." style="object-fit: cover;">
					<div class="carousel-caption d-none d-md-block">
						<h2>요즘 핫한 맛집 발견!</h2>
						<h5>오늘 가장 인기 많은 맛집 핫 플레이스</h5>
					</div>
				</a>
				<a class="carousel-item active3 dark-overlay" data-bs-interval="6000" href="<%=request.getContextPath()%>/event/eventMain.do">
					<img id="slide" src="${pageContext.request.contextPath}/resources/img/festi.jpg" class="d-block w-100 img-fluid" alt="..." style="object-fit: cover;">
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

	<!-- 베스트글 보여주기  -->
	<div class="album py-3 bg-body-tertiary ">
		<div class="container">
			<div style="text-align:left; margin:20px;">
				<span style="font-weight:bold; font-size:20pt;">인기있는 베스트 숙소 TOP 10</span><span class="text-muted" style="font-size:10pt; padding:0px 20px;"> 유저들의 즐겨찾기 기준으로 정했습니다.</span>
			</div>
			<div class="owl-carousel owl-theme">
				<c:forEach items="${rentalhome_list}" var="list">
					<div class="item" >
						<div class="col">
							<div class="card shadow-sm">
								<a class="bd-placeholder-img card-img-top" href="<%=request.getContextPath()%>/rentalhome/rentalhomeView.do?rentalhome_idx=${list.rentalhome_idx}" >
									<img class="d-block w-100 " src="<%=request.getContextPath() %>/resources/upload/${list.physical_name}" width="100%" height="225px" role="img" aria-label="Placeholder: Thumbnail"  alt="...">
								</a>
								<div class="card-body" style="height:200px; position:relative;">							
									<h4 class="card-text" style="font-weight:bold;">${list.name}</h4>
									
									<div class="text-muted">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
										  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
										</svg>
										${list.address}</div>
									<div class="text-muted mt-2">
										<c:if test="${list.all_avg != 0.0}">
											<span class="py-1" style="font-size: 10pt; padding: 2px 7px; border-radius: 0px 5px 5px 10px; font-weight: bold; background-color: #333fff; color: white;">${list.all_avg }<span style="color: #e2e2e2;">/5</span></span>&nbsp;&nbsp;이용자 리뷰 ${list.review_count}
										</c:if>
									</div>
									<div style="text-align:right;">
										<c:if test="${not empty list.room_name }">
											<div style="position:absolute; bottom:5px; right:15px;">
												<c:if test="${not empty list.discount_reason}">
													<small class="text-body-secondary" style="background-color:#333fff; color:white; font-size:12pt; border-radius:20px 10px 0px 15px; padding:7px 12px;">
														${list.discount_reason} ${list.discount_money}
														<c:if test="${list.discount_type eq 'rate'}">%</c:if>
														<c:if test="${list.discount_type eq 'fix'}">원</c:if>
													</small><br>
												</c:if>
												<div class="mt-1">
													<div class="me-3" style="display:inline-block; font-size:20pt;">${list.room_name } </div>
													<span class="text-muted" style="text-decoration:line-through; ">
														${list.weekday_price}원
													</span>
													<span style="font-weight:bold; font-size:18pt;">
														${list.weekday_discount_price}원
													</span>
												</div>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<hr class="featurette-divider">
	<div class="album py-3 bg-body-tertiary ">
			<div class="container">
				<div style="text-align:left; margin:20px;">
					<span style="font-weight:bold; font-size:20pt;">인기있는 베스트 맛집 TOP 10 </span> <span class="text-muted" style="font-size:10pt; padding:0px 20px;"> 유저들의 즐겨찾기 기준으로 정했습니다.</span>
				</div>
				<div class="owl-carousel owl-theme">
					<c:forEach items="${food_list}" var="list">
						<div class="item" >
							<div class="col">
								<div class="card shadow-sm">
									<a class="bd-placeholder-img card-img-top" href="<%=request.getContextPath()%>/food/foodView.do?fNo=${list.fNo}" >
										<img class="d-block w-100 " src="<%=request.getContextPath() %>/resources/upload/${list.food_attach_physical_name}" width="100%" height="225px" role="img" aria-label="Placeholder: Thumbnail"  alt="...">
									</a>
									<div class="card-body" style="height:200px; position:relative;">							
										<h4 class="card-text" style="font-weight:bold;">${list.food_name}
										<c:if test="${list.avg != 0.0 }">
											<span style="color: #ff7f00; font-size: 18pt;">${list.avg}</span>
										</c:if>
										</h4>
										
										<div class="text-muted">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
											  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
											</svg>
											${list.food_address}</div>
										<div class="mt-2">
											<span style="font-size:12pt; background-color:#ffb64c; padding:3px 8px; border-radius:41px;">#${list.food_food_kind}</span> 
											<span style="font-size:12pt; background-color:#ffb64c; padding:3px 8px; border-radius:41px;">#${list.food_avg_price}</span>
										</div>
										<div class="mt-3">
											<span>
												<img src="${pageContext.request.contextPath}/resources/img/foodcall.png" alt="전화번호 아이콘" style="display:inline-block; width:28px; height:28px; cursor:pointer;">
												전화번호 : ${list.food_phone}
											</span><br>
											<span>
												<img src="${pageContext.request.contextPath}/resources/img/foodwork.png" alt="일 아이콘" style="display:inline-block; width:28px; height:28px; cursor:pointer;">
												영업시간 : ${list.food_working_hours}
											</span>
										</div>
										<strong>
											<a href="${list.food_website}" target="_blank">
											    <img src="${pageContext.request.contextPath}/resources/img/insta.png" alt="Instagram 아이콘" style="width:55px; height:55px; position:absolute; bottom:20px; right:20px; cursor:pointer;">
											</a>
										</strong>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	<hr class="featurette-divider">
	<div class="album py-3 bg-body-tertiary ">
		<div class="container">
			<div style="text-align:left; margin:20px;">
				<span style="font-weight:bold; font-size:20pt;">인기있는 베스트 축제 TOP 10 </span> <span class="text-muted" style="font-size:10pt; padding:0px 20px;"> 유저들의 즐겨찾기 기준으로 정했습니다.</span>
			</div>
			<div class="owl-carousel owl-theme">
				<c:forEach items="${event_list}" var="list">
					<div class="item" >
						<div class="col">
							<div class="card shadow-sm">
								<a class="bd-placeholder-img card-img-top" href="<%=request.getContextPath()%>/event/eventView.do?event_number=${list.event_number}" >
									<img class="d-block w-100 " src="<%=request.getContextPath() %>/resources/upload/${list.attach_physical_name}" width="100%" height="225px" role="img" aria-label="Placeholder: Thumbnail"  alt="...">
								</a>
								<div class="card-body">
									<h4 class="card-text">${list.event_title }
										<c:if test="${list.avg != 0.0 }">
											<span style="color: #ff7f00; font-size: 18pt;">${list.avg}</span>
										</c:if>
									</h4>
									<div class="text-muted mb-3">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
										  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
										</svg>
										${list.event_local }
									</div>
									<div class="mt-3">
										<span>
											<img src="${pageContext.request.contextPath}/resources/img/foodcall.png" alt="전화번호 아이콘" style="display:inline-block; width:28px; height:28px; cursor:pointer;">
											전화번호 : <span>${list.event_tel}</span>
										</span><br>
										<span>
											<img src="${pageContext.request.contextPath}/resources/img/foodwork.png" alt="일 아이콘" style="display:inline-block; width:28px; height:28px; cursor:pointer;">
											영업시간 : <span>${list.event_start}</span> - <span>${list.event_end}</span>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
</main>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>