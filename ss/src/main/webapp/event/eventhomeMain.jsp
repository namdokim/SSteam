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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

	<style type="text/css">
/* CSS 스타일 */
		a {
			text-decoration: none;
			color: black;
		}
		body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
		}
		.header {
		background-color: whitesmoke;
		color: #000;
		padding: 20px;
		text-align: center;
		}
		.container {
		margin: 20px auto;
		max-width: 960px;
		padding: 0 20px;
		}
		.restaurant-item {
		border: none; /* 회색 선 제거 */
		margin-bottom: 20px;
		padding: 20px;
		display: flex;
		border-bottom: 1px solid #ddd; /* 바닥선만 추가 */
		}
		.restaurant-thumbnail {
		flex: 0 0 auto;
		margin-right: 20px;
		}
		.restaurant-thumbnail img {
		width: 250px;
		height: 250px;
		object-fit: cover;
		}
		.restaurant-info {
		flex: 1 1 auto;
		}
		.restaurant-title {
		font-size: 24px;
		font-weight: bold;
		margin-bottom: 10px;
		}
		.restaurant-title span.mirai {
		font-family: "미라이", sans-serif;
		color: #ff7f00;
		font-size: 30px;
		
		margin-left: 10px;
		}
		.restaurant-rating {
		font-size: 16px;
		margin-bottom: 10px;
		}
		.restaurant-address {
		font-size: 10pt;
		color: silver;
		}
		.restaurant-description {
		font-size: 16px;
		line-height: 1.5;
		max-height: 4.5em;
		overflow: hidden;
		position: relative;
		}
		.restaurant-description::after {
		content: "";
		position: absolute;
		bottom: 0;
		right: 0;
		background: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 1) 70%);
		width: 100%;
		height: 1.5em;
		}
		.restaurant-more {
		color: #ff7f00;
		cursor: pointer;
		position: absolute;
		bottom: 0;
		right: 0;
		margin: 0;
		padding: 0;
		background: none;
		border: none;
		font-size: 16px;
		line-height: 1;
		}
		.user-info {
		display: flex;
		align-items: center;
		margin-bottom: 10px;
		}
		.user-thumbnail {
		width: 40px;
		height: 40px;
		margin-right: 10px;
		border-radius: 50%;
		overflow: hidden;
		}
		.user-thumbnail img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		}
		.user-nickname {
		
		font-size: 14px;
		font-weight: bold;
		}
		</style>
</head>
<body>
	
	
	<div class="container-fluid offset-2" style="max-width: 1280px;">
		<div class="row " >
		<!-- 사이드바 부문 ======================================================================= -->
		
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
				<a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none offset-3">
					<span class="fs-4"  >지역별 구분</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<% //String activeTab = type != null && !type.equals("") ? type : "TT"; %>
					<%
						/*	String boardTitle = "";
					switch (type)
					{
						case "TT":
					        boardTitle = "전체";
					        activeTab = "TT";
					        break;
					    case "GG":
					        boardTitle = "경기";
					        activeTab = "GG";
					        break;
					    case "GW":
					        boardTitle = "강원";
					        activeTab = "GW";
					        break;
					    case "CB":
					        boardTitle = "충북";
					        activeTab = "CB";
					        break;
					    case "CN":
					        boardTitle = "충남";
					        activeTab = "CN";
					        break;
					    case "GB":
					        boardTitle = "경북";
					        activeTab = "GB";
					        break;
					    case "GN":
					        boardTitle = "경남";
					        activeTab = "GN";
					        break;
					    case "JB":
					        boardTitle = "전북";
					        activeTab = "JB";
					        break;
					    case "JN":
					        boardTitle = "전남";
					        activeTab = "JN";
					        break;
					    case "JJ":
					        boardTitle = "제주";
					        activeTab = "JJ";
					        break;
					}
							*/
							%>
				
				
				
					<li class="nav-item" >
						<a href="#" class="nav-link active" aria-current="page"  style="text-align:center;">
							
							전체
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark " style="text-align:center;">
							
							경기
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark " style="text-align:center;">
							
							강원
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark" style="text-align:center;">
							
							충북
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark " style="text-align:center;">
							
							충남
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark " style="text-align:center;">
							
							경북
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark " style="text-align:center;">
							
							경남
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark" style="text-align:center;">
							
							전북
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark" style="text-align:center;">
							전남
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark " style="text-align:center;">
							
							제주
						</a>
					</li>
				</ul>
								
			</div>
			<!-- 사이드바 부문 ======================================================================= -->
			
			
			<!-- 메인 부문 ======================================================================= -->
			<div class="tab-content container-fluid ml-2 col-md-8" >
				
				<%
				//for(int i=0; i<5; i++){
				%>
				
				<div class="container tab-pane fade show p-0 active" style="margin-right: 18rem;">
					<div class="restaurant-item" >
						<div class="restaurant-thumbnail">
				
							<img class="caption-image owl-lazy current_fest" src="https://image.xn--ok0b236bp0a.com/content_festival/thumb-2021042808590116195679413716_421x300.jpg" data-src="https://image.xn--ok0b236bp0a.com/content_festival/thumb-2021042808590116195679413716_421x300.jpg" data-copyright="" style="opacity: 1;" title="">
						</div>
						<div class="restaurant-info">
							<h2 class="restaurant-title"><span> 김제 지평선 축제 </span><span class="mirai">4.7</span>
							</h2>
							<div class="user-info">
								<div class="user-thumbnail">
								
									<img src="https://slp-
									statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?
									
									width=580&format=webp" alt="사용자 썸네일">
								</div>
								<div class="user-nickname">세이콩</div>
							</div>
							<p class="restaurant-address" style="color: silver;">전북 김제시 부량면 벽골제로 442</p>
							<p class="restaurant-description">축제에 대한 설명 내용이 여기에 들어갑니다. 설명 글이
							긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더
							많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
							<p class="restaurant-address" style="color: silver; text-align:right;"><a href="
							<%=request.getContextPath()%>/event/eventhomeView.do">상세보기</a></p>
						</div>
					</div>
				</div>
				<div class="container tab-pane fade show p-0 active" style="margin-right: 18rem;">
					<div class="restaurant-item" >
						<div class="restaurant-thumbnail">
				
							<img class="caption-image owl-lazy current_fest" src="https://image.xn--ok0b236bp0a.com/content_festival/thumb-2021042808590116195679413716_421x300.jpg" data-src="https://image.xn--ok0b236bp0a.com/content_festival/thumb-2021042808590116195679413716_421x300.jpg" data-copyright="" style="opacity: 1;" title="">
						</div>
						<div class="restaurant-info">
							<h2 class="restaurant-title"><span> 김제 지평선 축제 </span><span class="mirai">4.7</span>
							</h2>
							<div class="user-info">
								<div class="user-thumbnail">
								
									<img src="https://slp-
									statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?
									
									width=580&format=webp" alt="사용자 썸네일">
								</div>
								<div class="user-nickname">세이콩</div>
							</div>
							<p class="restaurant-address" style="color: silver;">전북 김제시 부량면 벽골제로 442</p>
							<p class="restaurant-description">축제에 대한 설명 내용이 여기에 들어갑니다. 설명 글이
							긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더
							많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
							<p class="restaurant-address" style="color: silver; text-align:right;"><a href="
							<%=request.getContextPath()%>/event/eventhomeView.do">상세보기</a></p>
						</div>
					</div>
				</div>
				<div class="container tab-pane fade show p-0 active" style="margin-right: 18rem;">
					<div class="restaurant-item" >
						<div class="restaurant-thumbnail">
				
							<img class="caption-image owl-lazy current_fest" src="https://image.xn--ok0b236bp0a.com/content_festival/thumb-2021042808590116195679413716_421x300.jpg" data-src="https://image.xn--ok0b236bp0a.com/content_festival/thumb-2021042808590116195679413716_421x300.jpg" data-copyright="" style="opacity: 1;" title="">
						</div>
						<div class="restaurant-info">
							<h2 class="restaurant-title"><span> 김제 지평선 축제 </span><span class="mirai">4.7</span>
							</h2>
							<div class="user-info">
								<div class="user-thumbnail">
								
									<img src="https://slp-
									statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?
									
									width=580&format=webp" alt="사용자 썸네일">
								</div>
								<div class="user-nickname">세이콩</div>
							</div>
							<p class="restaurant-address" style="color: silver;">전북 김제시 부량면 벽골제로 442</p>
							<p class="restaurant-description">축제에 대한 설명 내용이 여기에 들어갑니다. 설명 글이
							긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더
							많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
							<p class="restaurant-address" style="color: silver; text-align:right;"><a href="
							<%=request.getContextPath()%>/event/eventhomeView.do">상세보기</a></p>
						</div>
					</div>
				</div>
		
				<nav aria-label="Page navigation example ">
					<ul class="pagination offset-3">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav>
			</div>
				<!-- 메인 부문 ======================================================================= -->
		</div>
	</div>
	


<%@ include file="../include/footer.jsp" %>