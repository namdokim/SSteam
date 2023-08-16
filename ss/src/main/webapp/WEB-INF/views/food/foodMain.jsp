<%@page import="com.ss.demo.domain.PageMaker"%>
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
<%
	if(session.getAttribute("login") != null)
	{
		System.out.println("로그인 됨");
	}
	PageMaker pageMaker = (PageMaker)request.getAttribute("pageMaker");
%>
<!-- ======================================================================================= -->

<<<<<<< HEAD
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.3.min.js"></script>
=======
<%-- 	<script src="<%=request.getContextPath()%>/js/jquery-3.6.3.min.js"></script> --%>
>>>>>>> main
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script>
	function insert(index,fNo)
	{
		/* alert("가고싶다를 등록 완료 했습니다."); */
		var like_empty = document.getElementsByClassName("dislike")[index];
		var like_full = document.getElementsByClassName("like")[index];

		$.ajax({
		    		url: 'insert_like.do', 
		    		method: 'post', 
		    		data:{ 
		    			fNo:fNo
		    		},											
		    		success: function(data){
		    			if(data == 1){
			    			like_empty.style.display="none";
			    			like_full.style.display="block";
		    			}else{
		    				alert("로그인을 해주세요. ")
		    				location.href = "<%=request.getContextPath()%>/User/userLogin.do";
		    				
		    			}
		    			/* like_count.innerHTML = data; */
		    		},
		    		error: function(xhr, status, error){
		    			console.log('Error:', error);
		    		}
		    	});  
		
	}	
	function delete_(index,fNo){
		var like_empty = document.getElementsByClassName("dislike")[index];
		var like_full = document.getElementsByClassName("like")[index];
		
		$.ajax({
    		url: 'delete_like.do', 
    		method: 'post', 
    		data:{ 
    			fNo:fNo
    		},											
    		success: function(data){
    			
    			like_full.style.display="none";
    			like_empty.style.display="block";
    			/* like_count.innerHTML = data; */
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', error);
    		}
    	});  
	}
	</script>
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
<<<<<<< HEAD
	  	.header {
    	background-color: whitesmoke;
    	color: #000;
    	padding: 20px;
    	text-align: center;
  		}
=======
>>>>>>> main

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
	 	button {
	    margin-left: 10px;
		background-color: #007bff;
	    color: #fff;
	    border: none;
	    padding: 10px 20px;
	    border-radius: 3px;
	    cursor: pointer;
   		}



		/* 1. 가고싶다, 리뷰쓰기 버튼의 모양 제거 */
	    .button1 {
	    background: none;
	    border: none;
	    cursor: pointer;
	    font-size: 35px; /* 아이콘 크기를 24px로 설정 */
	    color: silver; /* 변경된 부분: 기본 색상을 회색으로 설정 */
	    }

		.button1:hover {
		color: orange;
		}


/* 	    button:hover {
	    background-color: #0056b3;
	    } */
	</style>
</head>


<!-- ============================================================================== -->
	
<!-- <body> -->

    
	<div class="header">
		<div style="font-size: 10pt; color:silver;">68,003 클릭 | 2023-09-07</div>
		<div style="font-size: 18pt; color:black;"> 지역별 맛집</div>
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

				   <%--  location.href = "<%=request.getContextPath()%>/User/userLogin.do"; --%>

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
				<a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none offset-3">
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
							
							서울 / 경기
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

				<c:forEach items="${list}" var="food" varStatus="status">

					<div class="container tab-pane fade show p-0 active" style="margin-right: 18rem;">
						<div class="restaurant-item" >
							<!-- 이미지 -->
							<div class="restaurant-thumbnail">
								<!-- <img src="https://mp-seoul-image-production-s3.mangoplate.com/406312/1763517_1635134765363_16478?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일"> -->
								
								<c:choose>
									<c:when test="${empty food.food_attach_logical_name}">

										<img onclick="location.href ='<%=request.getContextPath() %>/food/foodView.do?fNo=${food.fNo}'" src="https://mp-seoul-image-production-s3.mangoplate.com/406312/1763517_1635134765363_16478?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일">

									<%-- 	<img onclick="location.href ='<%=request.getContextPath() %>/food/foodView.do?fNo=${food.fNo}'" src="https://mp-seoul-image-production-s3.mangoplate.com/406312/1763517_1635134765363_16478?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일"> --%>
										<img onclick="location.href ='<%=request.getContextPath() %>/food/foodView.do?fNo=${food.fNo}'" src="<%=request.getContextPath() %>/img/x.png" alt="맛집 썸네일">
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
									<div class="button-container" style=" width:150px; text-align:center; position:relative;">
 											<!-- <button class="restaurant-favorite-btn" onclick="handleFavoriteButtonClick(this);">❤</button>
 											<p align="center"  style="font-size: 15px; color: #ff1493;">좋아요</p> -->
											<div onclick="insert(${status.index},${food.fNo})" class="button1 dislike" style="color:silver; position:absolute; top:-45px; right:0px; z-index:100;">
												<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
												  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
												</svg>
												<br>가고싶다
											</div>
												
											<div onclick="delete_(${status.index},${food.fNo})" class="button1 like" style="color:orange; position:absolute; top:-45px; right:0px; z-index:100;">
												<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
												  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
												</svg>
												<br>가고싶다
											</div>
											<script>
												var count = ${food.count};
											 	if(count>0){
											 		document.getElementsByClassName("dislike")[${status.index}].style.display="none";
											 		document.getElementsByClassName("like")[${status.index}].style.display="block";
											 	}else{
											 		document.getElementsByClassName("dislike")[${status.index}].style.display="block";
											 		document.getElementsByClassName("like")[${status.index}].style.display="none";
											 		
											 	}
											</script>
									</div>
								</div>
								<p class="restaurant-address" style="color: silver;">${food.food_address}</p>
								<p class="restaurant-description">${food.food_content}</p>
								<p class="restaurant-address" style="color: silver; text-align:right;">
								<a href="<%=request.getContextPath()%>/food/foodView.do?fNo=${food.fNo}">${food.food_name} 더보기></a></p>
								
<!--  글 수정, 삭제 버튼  (로그인시에만 보임/ 글쓴사람만 보임) --> 
<<<<<<< HEAD
					
=======
>>>>>>> main
								<div style="float:right;">
									<form name="frm" action="delete.do" method="post" style="display: inline;">
								        <input type="hidden" name="fNo" value="${food.fNo}">
								       <%--  <% if(session.getAttribute("login") != null) { %> --%>
								       <c:if test="${login.uNo eq food.uNo}">
								        	<button onclick="delFn()">삭제하기</button> 
								       <%--  <% } %> --%>
								       </c:if>
								    </form>
								</div>
								<div style="float:right; margin-right: 10px;">
									<c:if test="${login.uNo eq food.uNo}">
									<%-- <% if(session.getAttribute("login") != null) { %> --%>
										<button onclick="location.href='<%=request.getContextPath()%>/food/foodMainModify.do?fNo=${food.fNo}'">수정하기</button>
									<%-- <% } %>  --%>
									</c:if>
<<<<<<< HEAD
										
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

=======
								</div>
>>>>>>> main
							</div>
						</div>
					</div>
				</c:forEach>			
<<<<<<< HEAD
								
<!-- 페이징S ----------------------------------------------------------------------- -->

	 			<%-- <nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
					
				        이전 페이지 링크 생성
				        <li class="page-item">
				            <a class="page-link" href="foodMain.do?type=<%= type %>&page=1">Previous</a>
				        </li>
				
				        숫자 버튼 생성
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
				
				        다음 페이지 링크 생성
				        <li class="page-item">
				            <a class="page-link" href="foodMain.do?type=<%= type %>&page=<%= totalPages %>">Next</a>
				        </li>
					</ul>
					<br>
				</nav> --%>
=======
>>>>>>> main
<!-- 페이징 디자인 NEW -->				
				<div style="width:100%; text-align:center; margin:20px 0px;">
					<% if (pageMaker.isPrev()){ %>
					<a href="<%=request.getContextPath()%>/food/foodMain.do?page=<%=pageMaker.getStartPage()-1%>"><span style="padding:0px 10px;">◀</span></a>
					<%} %>
					<% 
					for(int i = pageMaker.getStartPage();i<=pageMaker.getEndPage();i++) {
					%>
					<a href="<%=request.getContextPath()%>/food/foodMain.do?page=<%=i%>">
						<span style="padding:0px 10px;"><%=i %></span>
					</a>
					<%	
					}
					%>
					<%if(pageMaker.isNext()&&pageMaker.getEndPage()>0 ){ %>
					<a href="<%=request.getContextPath()%>/food/foodMain.do?page=<%=pageMaker.getEndPage()+1%>"><span style="padding:0px 10px;"></span>▶</a>
					<% } %>
				</div>
			</div>
<<<<<<< HEAD
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
=======
>>>>>>> main
<!-- =========================================================================================== -->
<%@ include file="../include/footer.jsp" %>