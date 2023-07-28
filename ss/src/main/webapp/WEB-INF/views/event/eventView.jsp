<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이벤트 메인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	
	<script>
$(document).ready(function() {
  // 초기에 보여질 아이템 개수 설정
  var itemsToShow = 2;
  
  // 더보기 버튼을 클릭할 때마다 추가로 보여질 아이템 개수 설정
  var itemsToAdd = 2;
  
  // 모든 lead 아이템을 숨깁니다.
  $('.lead').hide();
  
  // 초기에 일부 아이템만 보이도록 설정
  $('.lead:lt(' + itemsToShow + ')').show();
  
  // 더보기 버튼을 클릭할 때 이벤트 처리
  $('#load').on('click', function(e) {
    e.preventDefault();
    
    // 보이도록 할 아이템의 인덱스 범위 계산
    var startIndex = itemsToShow;
    var endIndex = itemsToShow + itemsToAdd;
    
    // 인덱스 범위에 해당하는 아이템 보이기
    $('.lead:lt(' + endIndex + '):lt(' + endIndex + ')').show();
    
    // 보여진 아이템 개수 업데이트
    itemsToShow += itemsToAdd;
    
    // 더보기 버튼 숨기기 (만약 모든 아이템을 다 보여줬을 경우)
    if (itemsToShow >= $('.lead').length) {
      $('#load').hide();
    }
  });
});
</script>

	<style type="text/css">
		
		.carousel-item {	
			height: 400px; 	
			width: 100%;
		
		}
		.carousel-slide {	
			
			width: 100%;
		
		}
		
		.carousel-indicators button 
		{
			background-color: gray;
		}
		.link-button
		{
			width: 100%;
			height: 100%;
		}
		.overflow-hidden {
		  overflow: hidden;
		}
		
	</style>
</head>
<body>
	
	
	<div class="container-fluid offset-2 col-md-8 shadow-sm overflow-hidden" >
		<!-- 메인 부문 ======================================================================= -->
		<div class="tab-content ">
			<div id="myCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active d-flex">
			      <!-- 첫 번째 세트의 이미지 -->
			      <img class="icon d-block w-100" src="<%=request.getContextPath() %>/img/hotel.jpg" alt="아이콘" width="100%" height="100%">
			      <img class="icon d-block w-100" src="<%=request.getContextPath() %>/img/bed.png" alt="아이콘" width="100%" height="100%">
			      <img class="icon d-block w-100" src="<%=request.getContextPath() %>/img/bbq.png" alt="아이콘" width="100%" height="100%">
			    </div>
			    <div class="carousel-item d-flex">
			      <!-- 두 번째 세트의 이미지 -->
			      <img class="icon d-block w-100" src="<%=request.getContextPath() %>/img/hotel.jpg" alt="아이콘" width="100%" height="100%">
			      <img class="icon d-block w-100" src="<%=request.getContextPath() %>/img/hotel.jpg" alt="아이콘" width="100%" height="100%">
			      <img class="icon d-block w-100" src="<%=request.getContextPath() %>/img/hotel.jpg" alt="아이콘" width="100%" height="100%">
			    </div>
			    <div class="carousel-item  d-flex">
			      <!-- 세 번째 세트의 이미지 -->
			      <img class="icon d-block w-100" src="<%=request.getContextPath() %>/img/hotel.jpg" alt="아이콘" width="100%" height="100%">
			      <img class="icon d-block w-100" src="<%=request.getContextPath() %>/img/hotel.jpg" alt="아이콘" width="100%" height="100%">
			      <img class="icon d-block w-100" src="<%=request.getContextPath() %>/img/hotel.jpg" alt="아이콘" width="100%" height="100%">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev" onclick="prevCarousel()">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">이전</span>					
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next" onclick="nextCarousel()">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">다음</span>
			  </button>
			</div>
		</div>
		<div class="row">
		<div class="col text-center my-3 my-md-4">
			<h1 class="place_name">김제지평선축제</h1>
			<h6 class="preriod">							
				<span class="local_info mr-1">
					전라북도 김제시				
				</span>
				<span class="date_format">
					2023. 10. 05				-
					2023.10. 09
					<span class="btn status_eventdate2 text-white p-0 px-2">
						예정
					</span>			
				</span>
			</h6>
						
			</div>
		</div>
		<nav class="row mb-3 text-center py-2 shadow-sm">
			<ul class="col-4 ">
				<a type="button" class="btn btn-light nav-link link-button" href="#scrollspyHeading1">
					행사정보
				</a>
			</ul >
			<ul class="col-4 border-start">
				<a type="button" class="btn btn-light nav-link link-button" href="#scrollspyHeading2">
					리뷰
				</a>
			</ul >
			<ul class="col-4 border-start">
				<a type="button" class="btn btn-light nav-link link-button" href="#scrollspyHeading3">
					주변정보
				</a>
			</ul>
		</nav >
		<div class="col-lg-10 mx-auto ">
			<div class="lead mb-4">
			대한민국 명예대표 문화관광축제 중 유일하게 전통농경문화를 주제로 개최하는 김제지평선축제는 우리나라 최고(最古), 최대(最大) 수리시설인 김제 벽골제를 중심으로 진행된다.
			<br> 
			광활한 지평선을 무대로 개최되는 대통령배 전국 농악경연대회를 비롯한 다양한 볼거리와 아궁이 쌀밥 짓기, 메뚜기 잡기, 벼 수확 체험 등 각종 농경문화체험프로그램 및 330M 가래떡 뽑기 퍼포먼스, 대형 쌀떡 모자이크 만들기와 같은 이슈 메이킹 프로그램도 현장에서 참여 할 수 있다.
			</div>
			<div class="lead mb-4">
			대한민국 명예대표 문화관광축제 중 유일하게 전통농경문화를 주제로 개최하는 김제지평선축제는 우리나라 최고(最古), 최대(最大) 수리시설인 김제 벽골제를 중심으로 진행된다. 
			<br> 
			광활한 지평선을 무대로 개최되는 대통령배 전국 농악경연대회를 비롯한 다양한 볼거리와 아궁이 쌀밥 짓기, 메뚜기 잡기, 벼 수확 체험 등 각종 농경문화체험프로그램 및 330M 가래떡 뽑기 퍼포먼스, 대형 쌀떡 모자이크 만들기와 같은 이슈 메이킹 프로그램도 현장에서 참여 할 수 있다.
			</div>
			<div class="lead mb-4">
			대한민국 명예대표 문화관광축제 중 유일하게 전통농경문화를 주제로 개최하는 김제지평선축제는 우리나라 최고(最古), 최대(最大) 수리시설인 김제 벽골제를 중심으로 진행된다.
			<br> 
			광활한 지평선을 무대로 개최되는 대통령배 전국 농악경연대회를 비롯한 다양한 볼거리와 아궁이 쌀밥 짓기, 메뚜기 잡기, 벼 수확 체험 등 각종 농경문화체험프로그램 및 330M 가래떡 뽑기 퍼포먼스, 대형 쌀떡 모자이크 만들기와 같은 이슈 메이킹 프로그램도 현장에서 참여 할 수 있다.
			</div>
			<div class="lead mb-4">
			대한민국 명예대표 문화관광축제 중 유일하게 전통농경문화를 주제로 개최하는 김제지평선축제는 우리나라 최고(最古), 최대(最大) 수리시설인 김제 벽골제를 중심으로 진행된다. 
			<br> 
			광활한 지평선을 무대로 개최되는 대통령배 전국 농악경연대회를 비롯한 다양한 볼거리와 아궁이 쌀밥 짓기, 메뚜기 잡기, 벼 수확 체험 등 각종 농경문화체험프로그램 및 330M 가래떡 뽑기 퍼포먼스, 대형 쌀떡 모자이크 만들기와 같은 이슈 메이킹 프로그램도 현장에서 참여 할 수 있다.
			</div>
			
			<button type="button" class="btn btn-link mb-4 text-end" href="#" id="load">
			MORE
			</button>
		</div>
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top mx-auto py-2" tabindex="0" id="scrollspyHeading1" >
			<h3>행사기간</h3>
			<br>
			<h4 style="color:gray">2023.08.22 ~ 2023.09.10</h4>
		</div>
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top mx-auto py-2" tabindex="0"  >
			<h3>행사장소</h3>
			<br>
			<h4 style="color:gray">전라북도 김제시 부량면 신용리 242-2</h4>
		</div>
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top mx-auto py-2" tabindex="0"  >
			<h3>이용요금</h3>
			<br>
			<h4 style="color:gray">무료</h4>
		</div>
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top mx-auto py-2" tabindex="0"  >
			<h3>홈페이지</h3>
			<br>
			<a class="btn btn-lg btn-link" href="www.gimje.go.kr" role="button">www.gimje.go.kr</a>
		</div>
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top mx-auto py-2" tabindex="0"  >
			<h3>주최 / 주관</h3>
			<br>
			<h4 style="color:gray">김제시 / (사)김제시지평선축제제전위원회</h4>
		</div>
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top mx-auto py-2" tabindex="0"  >
			<h3>전화번호</h3>
			<br>
			<h4 style="color:gray">063-540-3172</h4>
		</div>
		<div class="detail_info mb-5 expandable-init" style="padding-top: 1px; padding-bottom: 1px;">
			<p style="text-align: center;"><img src="https://xn--ok0b236bp0a.com/data/editor/2302/20230215130120_b5bea023ec8455e11b3bebf0e2d232b2_swsc.png" class="lazyload lazy img-fluid loaded" style="margin: auto auto;" data-ll-status="loaded"></p>

			<p style="text-align: center;">&nbsp;</p>
			
			<p style="text-align: center;"><span style="font-size:12px;"><strong><span style="color:#000000;">끝없는 감동, 다시 지평선에서!</span></strong></span></p>
			
			<p style="text-align: center;"><span style="font-size:12px;"><strong><span style="color:#000000;"><span style="background-color:#ccffff;">제25회 김제지평선축제</span></span></strong></span></p>
			
			<p style="text-align: center;">&nbsp;</p>
			
			<p style="text-align: center;"><span style="font-size:12px;"><span style="color:#2980b9;">축제기간</span><span style="color:#000000;"> : 2023.10.05~2023.10.09</span></span></p>
			
			<p style="text-align: center;"><span style="font-size:12px;"><span style="color:#2980b9;">축제장소</span><span style="color:#000000;"> : 김제 벽골제</span></span></p>
			
			<p style="text-align: center;"><span style="font-size:12px;"><span style="color:#2980b9;">운영시간</span><span style="color:#000000;"> : 09:00~22:00</span></span></p>
			
			<p style="text-align: center;"><span style="font-size:12px;"><span style="color:#2980b9;">이용요금</span><span style="color:#000000;"> : 무료</span></span></p>
			
			<p style="text-align: justify;">&nbsp;</p>
			
			<p style="text-align: justify;"><span style="font-size:12px;"><span style="color:#000000;">대한민국 명예대표 문화관광축제 중 유일하게 전통농경문화를 주제로 개최하는 김제지평선축제는 우리나라 최고(最古), 최대(最大) 수리시설인 김제 벽골제를 중심으로 진행된다.</span></span></p>
			
			<p style="text-align: justify;"><span style="font-size:12px;"><span style="color:#000000;">광활한 지평선을 무대로 개최되는 대통령배 전국 농악경연대회를 비롯한 다양한 볼거리와 아궁이 쌀밥 짓기, 메뚜기 잡기, 벼 수확 체험 등 각종 농경문화체험프로그램 및 330M 가래떡 뽑기 퍼포먼스, 대형 쌀떡 모자이크 만들기와 같은 이슈 메이킹 프로그램도 현장에서 참여 할 수 있다.</span></span></p>
			
			<p style="text-align: center;">&nbsp;</p>
			
			<p style="text-align: center;"><span style="font-size:12px;"><span style="color:#000000;">[ 내용출처 : 한국관광공사 ]</span></span></p>
			
			<p style="text-align: center;">&nbsp;</p>
			
		</div>
		
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top mx-auto py-2" tabindex="0" id="scrollspyHeading2" >
			<h3>
			리뷰
			<div class="row col-md-2 align-items-md-end float-right">
			    <a href="<%=request.getContextPath()%>/event/eventReviewWrite.do">
			        <button type="button" class="btn btn-primary nav-link link-button">
			           	 리뷰작성
			        </button>
			    </a>
			</div>
			</h3>
			<br>
			<p style="text-align: center;"><span style="color:#000000;"> 첫 리뷰를 작성해 주세요 </span></p>
		</div>
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top mx-auto py-2" tabindex="0" id="scrollspyHeading1" >
			<p class="ititle">위치안내</p>
			<br>
			
			<div id="map" style="width: 100%; height: 40vh; overflow: hidden;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=471bd87d2c2bfa282198a74a11556a57&libraries=services,clusterer"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(35.75479164366817 , 126.8537350106012), // 지도의 중심좌표
				        level: 7 // 지도의 확대 레벨
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption);
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(35.75479164366817 , 126.8537350106012); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				var iwContent = '<div style="padding:5px;">지평선 축제 <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(35.75479164366817 , 126.8537350106012); //인포윈도우 표시 위치입니다
				
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker); 
			</script>
		</div>
		
		<div class="row">
			<div class="col-12 col-md-6" id="scrollspyHeading3">
			<p class="ititle1 mt-3 my-md-4">주변 음식</p>					
				<div class="double-slider-hold-arround owl-carousel owl-no-dots visible-slider-medium owl-loaded owl-drag">
					<div class="owl-stage-outer">
						<div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 2275px;">
							<div class="owl-item active" style="width: 222.5px; margin-right: 5px;">
								<div>
									<a href="https://xn--ok0b236bp0a.com/place/6541" onfocus="blur()" class="" target="_self">
										<div class="card caption arround_place" data-uid="6541">
											<img class="caption-image  lazyload ing_fest" src="https://image.xn--ok0b236bp0a.com/content_place_info/thumb-2020021318244515815858855751_380x380.jpg" data-src="https://image.xn--ok0b236bp0a.com/content_place_info/thumb-2020021318244515815858855751_380x380.jpg">
											<div class="card-body text-center my-2 p-1">
												<h5 class="card-title ing_card_title">두꺼비회관</h5>
												<span class="card-text ">
													<small class=" ing_card_desc ">김제시 동서8길 <span class="badge badge-secondary distancce_near">7 km</span></small>
												</span>
												
											</div>
										</div>
									</a>
								</div>
							</div>
							<div class="owl-item active" style="width: 222.5px; margin-right: 5px;">
								<div>
									<a href="https://xn--ok0b236bp0a.com/place/4804" onfocus="blur()" class="" target="_self">
										<div class="card caption arround_place" data-uid="4804">
											<img class="caption-image  lazyload ing_fest" src="https://image.xn--ok0b236bp0a.com/content_place_info/thumb-2020021316594315815807838712_380x380.jpg" data-src="https://image.xn--ok0b236bp0a.com/content_place_info/thumb-2020021316594315815807838712_380x380.jpg" title="">
											<div class="card-body text-center my-2 p-1">
												<h5 class="card-title ing_card_title">지평선바지락죽</h5>
												<span class="card-text ">
													<small class=" ing_card_desc ">김제시 중앙로 <span class="badge badge-secondary distancce_near">7 km</span></small>
												</span>
												
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="owl-nav disabled"><div class="owl-prev"><i class="fa fa-angle-left"></i></div><div class="owl-next"><i class="fa fa-angle-right"></i></div></div><div class="owl-dots"><div class="owl-dot active"><span></span></div><div class="owl-dot"><span></span></div><div class="owl-dot"><span></span></div><div class="owl-dot"><span></span></div><div class="owl-dot"><span></span></div></div>
				</div>
			</div>
		</div>	
	</div>
			<!-- 메인 부문 ======================================================================= -->
		

		
	


<%@ include file="../include/footer.jsp" %>