<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%
// 게시판 타입이 선택되었는지 확인후, 기본값 셋팅
String type = request.getParameter("type");
if( type == null || type.equals("") )
{
	type = "TT"; 			// 전체게시판으로 셋팅
}
%>
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
		.restaurant-favorite-btn{
	    width: 60px;
	    height: 60px;
	    background-color: #ff7f00;
	    color: white;
	    border: none;
	    border-radius: 5px;
	    font-size: 35px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    cursor: pointer;
	  	}
	  	
	  	
	  	.bd-sidebar {
		  position: sticky;
		  top: 0rem;
		  height: calc(100vh - 0rem);
		  background: #eee;
		
		  display: flex;
		  padding: 0;
		  overflow-y: hidden;
		  flex-direction: column;
		}
		.bd-sidebar-body {
		  height: 100%;
		  overflow-y: auto;
		  display: block;
		}
		.bd-sidebar-body .nav {
		  display: block;
		}
		.bd-sidebar-body .nav>li>a {
		  display: block;
		  padding: .25rem 1.5rem;
		  font-size: 90%;
		}
		.bd-sidebar-footer {
		  padding: 1rem;
		  background: #ddd;
		}
		
		
		</style>
</head>
<body>
	<div class="btns-board border-top d-flex justify-content-between px-3 border-bottom bg-light">					
		<a class="float-right" >
			<span>
				<c:if test="${ not empty login}">
				유저: ${login.uName} 권한:${login.uName}
				</c:if>
			</span>
		</a>
		<div class="float-right ">
			<button type="button" class="btn btn-outline-secondary" style="--bs-btn-padding-y: auto; --bs-btn-padding-x: auto; --bs-btn-font-size: .15rem;">
			<a href="eventWrite.do?type=<%= type %>" class=" float-right btn btn-sm btn-arca btn-arca-article-write" title="글쓰기"><span class="ion-compose"></span>&nbsp;글쓰기</a>
			<%-- 	<%
					if( loginVo != null )
					{
						%><a href="write.jsp?type=<%= type %>" class="btn btn-sm btn-arca btn-arca-article-write" title="글쓰기"><span class="ion-compose"></span>&nbsp;글쓰기</a><%
						%><a href="write.jsp?type=<%= type %>" class=" float-right btn btn-sm btn-arca btn-arca-article-write" title="글쓰기"><span class="ion-compose"></span>&nbsp;글쓰기</a><%
					}
				%>
 --%>		</button>
		</div>
	</div>	
	<div class="container-fluid offset-2" style="max-width: 1280px;">
		<div class="row " >
		<!-- 사이드바 부문 ======================================================================= -->
		
			<div class="bd-sidebar d-flex flex-column flex-shrink-0 p-3 bg-light " style="width: 280px;">
				<a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none offset-3">
					<span class="fs-4"  >지역별 구분</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<% String activeTab = type != null && !type.equals("") ? type : "TT"; %>
					<%
						String boardTitle = "";
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
							
							%>
				
				
				
					<li class="nav-item" >
						<a href="eventMain.do?type=TT" class="nav-link link-dark  <%= activeTab.equals("TT") ? "active" : "" %>"  style="text-align:center;">
							
							전체
						</a>
					</li>
					<li>
						<a href="eventMain.do?type=GG" class="nav-link link-dark <%= activeTab.equals("GG") ? "active" : "" %>" style="text-align:center;">
							
							경기
						</a>
					</li>
					<li>
						<a href="eventMain.do?type=GW" class="nav-link link-dark <%= activeTab.equals("GW") ? "active" : "" %>" style="text-align:center;">
							
							강원
						</a>
					</li>
					<li>
						<a href="eventMain.do?type=CB" class="nav-link link-dark <%= activeTab.equals("CB") ? "active" : "" %>" style="text-align:center;">
							
							충북
						</a>
					</li>
					<li>
						<a href="eventMain.do?type=CN" class="nav-link link-dark <%= activeTab.equals("CN") ? "active" : "" %>" style="text-align:center;">
							
							충남
						</a>
					</li>
					<li>
						<a href="eventMain.do?type=GB" class="nav-link link-dark <%= activeTab.equals("GB") ? "active" : "" %>" style="text-align:center;">
							
							경북
						</a>
					</li>
					<li>
						<a href="eventMain.do?type=GN" class="nav-link link-dark <%= activeTab.equals("GN") ? "active" : "" %>" style="text-align:center;">
							
							경남
						</a>
					</li>
					<li>
						<a href="eventMain.do?type=JB" class="nav-link link-dark <%= activeTab.equals("JB") ? "active" : "" %>" style="text-align:center;">
							
							전북
						</a>
					</li>
					<li>
						<a href="eventMain.do?type=JN" class="nav-link link-dark <%= activeTab.equals("JN") ? "active" : "" %>" style="text-align:center;">
							전남
						</a>
					</li>
					<li>
						<a href="eventMain.do?type=JJ" class="nav-link link-dark <%= activeTab.equals("JJ") ? "active" : "" %>" style="text-align:center;">
							
							제주
						</a>
					</li>
				</ul>
								
			</div>
			<!-- 사이드바 부문 ======================================================================= -->
			
			
			<!-- 메인 부문 ======================================================================= -->
			<div class="tab-content container-fluid ml-2 col-md-8" >
				
				<%
				for(int i=0; i<5; i++){
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
								<div class="button-container offset-8">
									<button class="restaurant-favorite-btn" onclick="handleFavoriteButtonClick(this);">❤</button>
									<p align="center"  style="font-size: 15px; color: #ff1493;">좋아요</p>
								</div>
							</div>
							<p class="restaurant-address" style="color: silver;">전북 김제시 부량면 벽골제로 442</p>
							<p class="restaurant-description">축제에 대한 설명 내용이 여기에 들어갑니다. 설명 글이
							긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더
							많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
							<p class="restaurant-address" style="color: silver; text-align:right;">
							<a href="<%=request.getContextPath()%>/event/eventView.do">상세보기</a></p>
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
								<div class="button-container offset-8">
									<button class="restaurant-favorite-btn" onclick="handleFavoriteButtonClick(this);">❤</button>
									<p align="center"  style="font-size: 15px; color: #ff1493;">좋아요</p>
								</div>
							</div>
							<p class="restaurant-address" style="color: silver;">전북 김제시 부량면 벽골제로 442</p>
							<p class="restaurant-description">축제에 대한 설명 내용이 여기에 들어갑니다. 설명 글이
							긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더
							많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
							<p class="restaurant-address" style="color: silver; text-align:right;"><a href="
							<%=request.getContextPath()%>/event/eventView.do">상세보기</a></p>
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
								<div class="button-container offset-8">
									<button class="restaurant-favorite-btn" onclick="handleFavoriteButtonClick(this);">❤</button>
									<p align="center"  style="font-size: 15px; color: #ff1493;">좋아요</p>
								</div>
							</div>
							<p class="restaurant-address" style="color: silver;">전북 김제시 부량면 벽골제로 442</p>
							<p class="restaurant-description">축제에 대한 설명 내용이 여기에 들어갑니다. 설명 글이
							긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더
							많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
							<p class="restaurant-address" style="color: silver; text-align:right;"><a href="
							<%=request.getContextPath()%>/event/eventView.do">상세보기</a></p>
						</div>
					</div>
				</div>
				<%
				}
				%>
				
		
				<nav aria-label="Page navigation example">
					 <ul class="pagination justify-content-center">
						<li class="page-item">
			<!-- 			<a href="첫번째 페이지로 이동하는 주소">|◀</a>&nbsp; -->
						<a class="page-link" href="<%=request.getContextPath() %>/eventMain.jsp?type=<%= type %>&page=1">
						
						Previous</a> &nbsp;
						<li class="page-item"><a class="page-link" href="<%=request.getContextPath() %>/eventMain.jsp?type=<%= type %>">Next</a></li>
					</ul>
				</nav>
			</div>			
				<!-- 메인 부문 ======================================================================= -->	
		</div>
	</div>


<%@ include file="../include/footer.jsp" %>