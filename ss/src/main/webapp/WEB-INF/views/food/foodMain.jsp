<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<!-- 게시판 타입 선택 ========================================================================= -->
<%
	// 게시판 타입이 선택되었는지 확인후, 기본값 셋팅
	String type = request.getParameter("type");

	if( type == null || type.equals("") )
	{
		type = "TT"; 			// 전체게시판으로 셋팅
	}
%>

<!-- ======================================================================================= -->
<!DOCTYPE html>
<html lang="en">


<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>맛집 메인</title>
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.3.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	
	
<!-- CSS 스타일 ============================================================================== -->
	<style type="text/css">
		
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
		border: none;
		margin-bottom: 20px;
		padding: 20px;
		display: flex;
		border-bottom: 1px solid #ddd;
		align-items: flex-start; /* 요소들을 flex 컨테이너의 위쪽에 정렬합니다. */
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
		/* max-width 속성을 추가하여 정보 컨테이너의 최대 너비를 제한함 . */
		max-width: calc(100% - 270px); /* 썸네일 너비와 마진을 전체 너비에서 뺀 값으로 설정함. */
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
		width: 60px;
		height: 60px;
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
		
		font-size: 20px;
		font-weight: bold;
		}
		
		/* 오렌지색 정사각형 모양의 버튼 스타일 */
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
	  	.header {
    	background-color: whitesmoke;
    	color: #000;
    	padding: 20px;
    	text-align: center;
  		}

     	.container1_CancleButton {
	    padding: 12px 24px;
	 	min-width:140px;
	 	min-height:50px;
	    margin-right: 16px; 
	    border: 1px solid #FFA500;
	    border-radius: 50px;
	 	font-size:16px;
	 	color:black;
	 	text-align:center;
	 	background-color:#FFA500;
	 	}
	</style>
</head>


<!-- ============================================================================== -->
	
<body>

    
	<div class="header">
		<div style="font-size: 10pt; color:silver;">68,003 클릭 | 2023-09-07</div>
		<div style="font-size: 18pt; color:black;"> 지역별 맛집 TOP 5</div>
		<div style="font-size: 10pt; color:silver;">“맛있는 여행으로 즐거운 추억을 만들어보세요!”</div>
		<br>
			
<!-- ⚫️로그인 되었을 경우에만 '식당 등록하기' 버튼 보이기  -->
		<div style="text-align: center;">
			<% if(session.getAttribute("login") == null) { %>
			    <!-- 미로그인 상태에서 버튼 클릭시 경고 메시지 -->
			    <button class="container1_CancleButton" onclick="showLoginAlert();">식당 등록하기</button>
			    <script>
				  function showLoginAlert() {
				    alert("로그인을 해주세요.");
				  }
				</script>

			<% } else { %>
			    <!-- 로그인 상태에서 버튼 클릭시 식당 등록 페이지로 이동 -->
			    <button class="container1_CancleButton" onclick="location.href='<%=request.getContextPath()%>/food/foodMainWrite.do?type=<%= type %>'">식당 등록하기</button>
			<% } %>
		</div>
		
	</div>
	<br>
<!-- ⚫ 검색기능 (화면설계 o 기능구현하기x)  -->
	<form action="foodMain.do" method="get" style="text-align: center;">
		<select name="searchType">
			<option value="food_name">식당이름</option> 
			<option value="food_address">식당주소</option> 
		</select> &nbsp; 
		<input type="text" name="searchValue" size="30" value="" placeholder="검색어를 입력하세요"> &nbsp;
		<button type="submit">검색</button>
	</form>
	<!-- form 태그  -->
<%-- 	<form action="foodMain.do" method="get">
		<select name="searchType">
			<option value="food_name" <c:if test="${param.searchType eq 'food_name'}">selected</c:if>>식당이름 </option>
			<option value="food_address" <c:if test="${param.searchType eq 'food_address'}">selected</c:if>>식당주소 </option>
		</select>
		<input type="text" name="searchValue" size="30" value="${param.searchValue }">
		<button>검색</button>
	</form>
	 --%>
	<div class="container-fluid offset-2" style="max-width: 1280px;">
		<br>
		<div class="row " >
<!-- 사이드바S ======================================================================= -->


			<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
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
						<a href="foodMain.do?type=TT" class="nav-link link-dark  <%= activeTab.equals("TT") ? "active" : "" %>"  style="text-align:center;">
							
							전체
						</a>
					</li>
					<li>
						<a href="foodMain.do?type=GG" class="nav-link link-dark <%= activeTab.equals("GG") ? "active" : "" %>" style="text-align:center;">
							
							경기
						</a>
					</li>
					<li>
						<a href="foodMain.do?type=GW" class="nav-link link-dark <%= activeTab.equals("GW") ? "active" : "" %>" style="text-align:center;">
							
							강원
						</a>
					</li>
					<li>
						<a href="foodMain.do?type=CB" class="nav-link link-dark <%= activeTab.equals("CB") ? "active" : "" %>" style="text-align:center;">
							
							충북
						</a>
					</li>
					<li>
						<a href="foodMain.do?type=CN" class="nav-link link-dark <%= activeTab.equals("CN") ? "active" : "" %>" style="text-align:center;">
							
							충남
						</a>
					</li>
					<li>
						<a href="foodMain.do?type=GB" class="nav-link link-dark <%= activeTab.equals("GB") ? "active" : "" %>" style="text-align:center;">
							
							경북
						</a>
					</li>
					<li>
						<a href="foodMain.do?type=GN" class="nav-link link-dark <%= activeTab.equals("GN") ? "active" : "" %>" style="text-align:center;">
							
							경남
						</a>
					</li>
					<li>
						<a href="foodMain.do?type=JB" class="nav-link link-dark <%= activeTab.equals("JB") ? "active" : "" %>" style="text-align:center;">
							
							전북
						</a>
					</li>
					<li>
						<a href="foodMain.do?type=JN" class="nav-link link-dark <%= activeTab.equals("JN") ? "active" : "" %>" style="text-align:center;">
							전남
						</a>
					</li>
					<li>
						<a href="foodMain.do?type=JJ" class="nav-link link-dark <%= activeTab.equals("JJ") ? "active" : "" %>" style="text-align:center;">
							
							제주
						</a>
					</li>
				</ul>
			</div>
<!-- 사이드바E ======================================================================= -->


			
			<div class="tab-content container-fluid ml-2 col-md-8" >
<!-- 메인 부문S ======================================================================= -->
				<%-- <c:forEach items="${list}" var="food" begin="0" end="9"> --%>
				<c:forEach items="${list}" var="food">
				
					<div class="container tab-pane fade show p-0 active" style="margin-right: 18rem;">
						<div class="restaurant-item" >
						
							<!-- 이미지 -->
							<div class="restaurant-thumbnail">
								<!-- <img src="https://mp-seoul-image-production-s3.mangoplate.com/406312/1763517_1635134765363_16478?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일"> -->
								
								<c:choose>
									<c:when test="${empty food.food_attach_logical_name}">
										<img onclick="location.href ='<%=request.getContextPath() %>/food/foodView.do?fNo=${food.fNo}'" src="https://mp-seoul-image-production-s3.mangoplate.com/406312/1763517_1635134765363_16478?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일">
									</c:when>
									<c:otherwise>
										<img src="<%=request.getContextPath() %>/resources/upload/${food.food_attach_physical_name}" onclick="location.href ='<%=request.getContextPath() %>/food/foodView.do?fNo=${food.fNo}'">           
									</c:otherwise>
								</c:choose>
							</div>
							
							<div class="restaurant-info">
							<%-- 	<h2 class="restaurant-title"><span>${food.fNo}. </span><span>${food.food_name}</span><!-- <span class="mirai">4.7</span> --> --%>
								<h2 class="restaurant-title"><span></span><span>${food.food_name}</span><!-- <span class="mirai">4.7</span> -->
								</h2>
								<div class="user-info">
								
									<div class="user-thumbnail">
										<img src="https://slp-
										statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?
										width=580&format=webp" alt="사용자 썸네일">
									</div>
									
									<div class="user-nickname" style = "width:375px;">세이콩</div>
									<div class="button-container">
 											<button class="restaurant-favorite-btn" onclick="handleFavoriteButtonClick(this);">❤</button>
 											<p align="center"  style="font-size: 15px; color: #ff1493;">좋아요</p>
									</div>
								</div>
								
								<p class="restaurant-address" style="color: silver;">${food.food_address}</p>
								<p class="restaurant-description">${food.food_content}</p>
								<p class="restaurant-address" style="color: silver; text-align:right;">
								<a href="<%=request.getContextPath()%>/food/foodView.do?fNo=${food.fNo}">${food.food_name} 더보기></a></p>
								
<!--  글 수정, 삭제 버튼  (로그인시에만 보임) --> 
					
								<div style="float:right;">
									<form name="frm" action="delete.do" method="post" style="display: inline;">
								        <input type="hidden" name="fNo" value="${food.fNo}">
								        <% if(session.getAttribute("login") != null) { %>
								        	<button onclick="delFn()">삭제하기</button> 
								        <% } %>
								    </form>
								</div>
								<div style="float:right; margin-right: 10px;">
										<% if(session.getAttribute("login") != null) { %>
											<button onclick="location.href='<%=request.getContextPath()%>/food/foodMainModify.do?fNo=${food.fNo}'">수정하기</button>
										<% } %> 
										
<!-- 해당 글을 작성한 유저에게만 삭제하기 수정하기 버튼이 보이게 함 -->		
								<%-- <% if(session.getAttribute("login") != null && session.getAttribute("login").equals(String.valueOf(food.uNo))) { %>
						        <div style="float:right;">
						            <form name="frm" action="delete.do" method="post" style="display: inline;">
						                <input type="hidden" name="fNo" value="${food.fNo}">
						                <button onclick="delFn()">삭제하기</button> 
						            </form>
						        </div>
						        <div style="float:right; margin-right: 10px;">
						            <button onclick="location.href='<%=request.getContextPath()%>/food/foodMainModify.do?fNo=${food.fNo}'">수정하기</button>
						        </div>
						    <% } %> --%>
								</div>

							</div>
						</div>
					</div>
				</c:forEach>			
								
<!-- 페이징S ----------------------------------------------------------------------- -->

	 			<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
					
				        <%-- 이전 페이지 링크 생성 --%>
				        <li class="page-item">
				            <a class="page-link" href="foodMain.do?type=<%= type %>&page=1">Previous</a>
				        </li>
				
				        <%-- 숫자 버튼 생성 --%>
				        <% int totalPages = 5; // 총 페이지 수 (예시로 5로 설정) %>
				        <% for (int i = 1; i <= totalPages; i++) 
				        { 
				        %>
				            <li class="page-item">
				                <a class="page-link" href="foodMain.do?type=<%= type %>&page=<%= i %>"><%= i %></a>
				            </li>
				        <%
				        } 
				        %>
				
				        <%-- 다음 페이지 링크 생성 --%>
				        <li class="page-item">
				            <a class="page-link" href="foodMain.do?type=<%= type %>&page=<%= totalPages %>">Next</a>
				        </li>
					</ul>
					<br>
				</nav>
			</div>
<!-- 지도 표시되는 부분  ===============================================================================-->	



			<div style="color:#ff7f00; height:80px; font-size:18pt; border-top: 1px solid #ddd; display: flex; align-items: center; /* justify-content: center; */">
			  리스트 지도
			</div>
			
			<div id="map" style="width:100%;height:400px; margin:0 auto;"></div>
		</div>
	</div>
	
	
	
<!-- ========================  카카오지도api (8080포트설정하기) ==========================================-->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=471bd87d2c2bfa282198a74a11556a57"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			/* center: new kakao.maps.LatLng(33.450701, 126.570667), */
			center: new kakao.maps.LatLng(37.521202058933774, 127.02618079647772),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치
		var markerPosition  = new kakao.maps.LatLng(37.521202058933774, 127.02618079647772); 
		
		// 마커를 생성
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드 
		// marker.setMap(null);  
		
		// 글 삭제 
		function delFn(){
			document.frm.submit();
		}
	</script>
<!-- =========================================================================================== -->
	
</body>
</html><br>
<%@ include file="../include/footer.jsp" %>




