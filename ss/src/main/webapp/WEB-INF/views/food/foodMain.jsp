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

<%-- 	<script src="<%=request.getContextPath()%>/js/jquery-3.6.3.min.js"></script> --%>
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<!-- <link rel="stylesheet" href="../css/style.css"> -->
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
	// 식당 등록 버튼 
	function showLoginAlert() {
		alert("로그인을 해주세요.");
		location.href = "<%=request.getContextPath()%>/User/userLogin.do";
	}
	</script>
<!-- CSS 스타일 ============================================================================== -->
	<style type="text/css">
		.active{
			background-color:#ffb64c;
		}
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
		font-size: 32px;
		font-weight: bold;
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
		font-size: 11pt;
		color: silver;
		}
		.restaurant-description {
		font-size: 16px;
		line-height: 1;
		max-height: 8.5em;
		overflow: hidden;
		position: relative;
		}
		.restaurant-description::after {
		content: "";
		position: absolute;
		bottom: 0;
		right: 0;
		/* background: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 1) 70%); */
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
	    font-size: 25px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    cursor: pointer;
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
	 	button {
	    margin-left: 8px;
		background-color: #ff9424;
	    color: black;
	    border: none;
	    padding: 7px 11px;
	    border-radius: 3px;
	    cursor: pointer;
   		}

		/* 1. 가고싶다, 리뷰쓰기 버튼의 모양 제거 */
	    .button1 {
	    background: none;
	    border: none;
	    cursor: pointer;
	    font-size: 25px; /* 아이콘 크기를 24px로 설정 */
	    color: silver; /* 변경된 부분: 기본 색상을 회색으로 설정 */
	    }
		.button1:hover {
		color: orange;
		}
		
		/* 메인디자인 통일 */
		.view{
		border-radius:10px;
		background-color:white;
	
		}
		.search{
			border:none;
			color:#444444;
		}
		.search:hover{
			border-bottom:2px solid #0863ec;
			border-radius:0px;
		}
		.hotel {
			background-image: url(../img/hotel.jpg);
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;
		}
		.image {
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;
		}
		.like {
			background-size: contain;
			background-repeat: no-repeat;
			background-position: center;
		}
		.datepicker{
			font-weight:bold;
		}
	
		.middle {
		  position: relative;
		  width: 100%;
		  max-width: 500px;
		}
		
		.slider {
		  position: relative;
		  z-index: 1;
		  height: 5px;
		  margin: 0 15px;
		}
		.slider > .track {
		  position: absolute;
		  z-index: 1;
		  left: 0;
		  right: 0;
		  top: 0;
		  bottom: 0;
		  border-radius: 5px;
		  border-shadow:2px 2px 2px 2px #dddddd;
		  background-color: #e2e2e2;
		}
		.slider > .range {
		  position: absolute;
		  z-index: 2;
		  left: 25%;
		  right: 25%;
		  top: 0;
		  bottom: 0;
		  border-radius: 5px;
		  background-color: #017fee;
		}
		.slider > .thumb {
		  position: absolute;
		  z-index: 3;
		  width: 20px;
		  height: 20px;
		  background-color: #017fee;
		  border-radius: 50%;
		  top:50%;
		}
		.slider > .thumb.left {
		  left: 25%;
		  transform: translate(-15px, -10px);
		}
		.slider > .thumb.right {
		  right: 25%;
		  transform: translate(15px, -10px);
		}
		
		input[type="range"] {
		  position: absolute;
		  /* opacity로 가린 것을 이벤트도 비활성화하기 위해 */
		  pointer-events: none;
		  -webkit-appearance: none;
		  z-index: 2;
		  height: 5px;
		  width: 100%;
		  opacity: 0;
		  left:0%;
		}
		input[type="range"]::-webkit-slider-thumb {
		  /* 겹쳐진 두 thumb를 모두 활성화 */
		  pointer-events: all;
		  width: 20px;
		  height: 20px;
		  border-radius: 0;
		  border: 0 none;
		  background-color: red;
		  cursor: pointer;
		
		  /* appearance를 해야 위의 스타일들을 볼 수 있음 */
		  -webkit-appearance: none;
		}
		.avg{
			display:inline-block;
			width:40px;
			font-weight:bold;
			font-size:10pt;
			background-color:#f7f7f7;
			border-radius:3px;
			margin:20px 0px;
			padding:3px 0px;
			cursor:pointer;
		}
		.check{
			margin:20px 0px;
			width:100%;
			text-align:left;
		}
		.check > input[type=checkbox]{
			margin:0px 10px;
			width:15px;
			height:15px;
		}
		.check > input[type=radio]{
			margin:0px 10px;
			width:15px;
			height:15px;
		}
		.container-fluid {
		    margin-left: 0;
		    margin-right: 0;
		    padding: 0; /* Optional: If you want to remove padding as well */
		    z-index:0;
		  }
		.masthead:before {
		    content: "";
		    position: absolute;
		    background-color: #1c375e;
		    height: 100%;
		    width: 100%;
		    top: 0;
		    left: 0;
		    opacity: 0.5;
		}		
		.masthead {
		    position: relative;
		    background: url(../img/food.jpg) no-repeat center center;
		    background-size: cover;
		    height:400px
		}	
	</style>
</head>
<!-- ============================================================================== -->
<div class="container-fluid " style="background-color:#FFFCF5;">
	<div class="masthead py-5">
		<div class="container position-relative">
		    <div class="row justify-content-center">
		        <div class="col-xl-9">
		            <div class="text-center text-white">
               			 <!-- Page heading-->
                		<!-- <div class="py-0" style="font-size: 10pt; ">68,003 클릭 | 2023-09-07</div> -->
							<h2> 지역별 맛집 </h2>
							<h6 class="mb-1">“맛있는 여행으로 즐거운 추억을 만들어보세요!”</h6>
							<br>
					
				<!-- 검색기능 (화면설계 o 기능구현하기x)  -->
						<form class="form-subscribe" action="foodMain.do" method="get" id="contactForm" data-sb-form-api-token="API_TOKEN">
							<div class="row">
								<div class="col-auto px-0">
									<select name="searchType" class="form-select-sm font-weight-bold " size="1" aria-label="Size 3 select example" style="height: 50px; color:#777777;" >
										<option value="food_name" <c:if test="${searchVO.searchType == 'food_name'}">selected</c:if>>식당이름</option> 
										<option value="food_address" <c:if test="${searchVO.searchType == 'food_address'}">selected</c:if>>식당주소</option> 
									</select> &nbsp; 
								</div>	
								
					   			<div class="col">
							        <!-- <input class="form-control form-control-lg" id="emailAddress" type="text" placeholder="검색어를 입력하세요" data-sb-validations="required,email" data-sb-can-submit="no"> -->
									<input class="form-control form-control-lg" id="emailAddress" type="text" placeholder="검색어를 입력하세요" data-sb-validations="required,email" data-sb-can-submit="no" name="searchValue" size="30" value="${searchVO.searchValue}" > &nbsp;
							        <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:required">Email Address is required.</div>
							        <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:email">Email Address Email is not valid.</div>
							    </div>
							    <div class="col-auto"><button class="btn btn-primary btn-lg " id="submitButton" type="submit">검색</button></div>
							</div>
						
						<!-- 로그인 되었을 경우에만 '식당 등록하기' 버튼 보이기  -->
							<div class="pt-4 mb-5 " style="text-align: center;">
								<% if(session.getAttribute("login") == null) { %>
								    <!-- 미로그인 상태에서 버튼 클릭시 경고 메시지 -->
								 
							    	<button type="button" class= "btn btn-lg container1_CancleButton" style="background-color:#FFA500; color:#FFEFB3;" onclick="showLoginAlert()">식당 등록하기</button>
					
								<% } else { %>
								    <!-- 로그인 상태에서 버튼 클릭시 식당 등록 페이지로 이동 -->
								    <!--  사업자 회원만 식당 등록 가능함  -->
								    <c:choose>
									  <c:when test ="${login.uType eq 'business'}">
									    <button type="button" class="container1_CancleButton" onclick="location.href='<%=request.getContextPath()%>/food/foodMainWrite.do?type=<%= type %>'">식당 등록하기</button>
								  	  </c:when>
								  	  <c:otherwise>
									    <button type="button" class="container1_CancleButton" onclick="showLoginBusiness()">식당 등록하기</button>
								  	  </c:otherwise>
								    </c:choose>
								    <script>
									  function showLoginBusiness() {
									    alert("사업자가 아닙니다.");
									   <%--  location.href = "<%=request.getContextPath()%>/User/userLogin.do"; --%>
									  }
									</script>
								<% } %>
							</div>
	<!-- 로그인 되었을 경우에만 '식당 등록하기' 버튼 보이기  -->
							<!-- Submit success message-->
							<!---->
							<!-- This is what your users will see when the form-->
							<!-- has successfully submitted-->
	                        <!-- <div class="d-none" id="submitSuccessMessage">
	                            <div class="text-center mb-3">
	                                <div class="fw-bolder">Form submission successful!</div>
	                                <p>To activate this form, sign up at</p>
	                                <a class="text-white" href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
	                            </div>
	                        </div>
	                        <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div> -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
					
							
							
<!-- 사이드바 -->							
<div class="row justify-content-center" style="font-family:'TheJamsil5Bold';">
		<div class="col-12 col-md-8 text-center ">
			<div class="root-container" style=" margin: 20px 18px 0px 0px; vertical-align: top;">
				<div class="row me-3">
					<div class="root-container" style=" margin: 20px 18px 0px 0px; vertical-align: top;">
						<div class="row justify-content-center me-5">					
							
							<div class="shadow-sm col-md-3 mt-2 card rounded-3" style="height: 900px; padding: 10px; position:sticky;" >
								
								<a href="#" class="d-flex align-items-center my-3 mb-md-0 me-md-auto link-dark text-decoration-none offset-3">
								<span class="fs-4 ms-3 font-weight-bold" >지역별 구분</span>
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
										<a href='foodMain.do?type=TT&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}' class="nav-link link-dark  <%= activeTab.equals("TT") ? "active" : "" %>"  style="text-align:center;">
											
											전체
										</a>
									</li>
									<li>
										<a href='foodMain.do?type=GG&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}' class="nav-link link-dark <%= activeTab.equals("GG") ? "active" : "" %>" style="text-align:center;">
											
											서울 / 경기
										</a>
									</li>
									<li>
										<a href='foodMain.do?type=GW&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}' class="nav-link link-dark <%= activeTab.equals("GW") ? "active" : "" %>" style="text-align:center;">
											
											강원
										</a>
									</li>
									<li>
										<a href='foodMain.do?type=CB&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}' class="nav-link link-dark <%= activeTab.equals("CB") ? "active" : "" %>" style="text-align:center;">
											
											충북
										</a>
									</li>
									<li>
										<a href='foodMain.do?type=CN&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}'class="nav-link link-dark <%= activeTab.equals("CN") ? "active" : "" %>" style="text-align:center;">
											
											충남
										</a>
									</li>
									<li>
										<a href='foodMain.do?type=GB&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}'class="nav-link link-dark <%= activeTab.equals("GB") ? "active" : "" %>" style="text-align:center;">
											
											경북
										</a>
									</li>
									<li>
										<a href='foodMain.do?type=GN&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}'class="nav-link link-dark <%= activeTab.equals("GN") ? "active" : "" %>" style="text-align:center;">
											
											경남
										</a>
									</li>
									<li>
										<a href='foodMain.do?type=JB&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}' class="nav-link link-dark <%= activeTab.equals("JB") ? "active" : "" %>" style="text-align:center;">
											
											전북
										</a>
									</li>
									<li>
										<a href='foodMain.do?type=JN&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}'class="nav-link link-dark <%= activeTab.equals("JN") ? "active" : "" %>" style="text-align:center;">
											전남
										</a>
									</li>
									<li>
										<a href='foodMain.do?type=JJ&searchType=${searchVO.searchType}&searchValue=${searchVO.searchValue}' class="nav-link link-dark <%= activeTab.equals("JJ") ? "active" : "" %>" style="text-align:center;">
											
											제주
										</a>
									</li>
								</ul>
							</div>
							
							
				<!-- 사이드바E ======================================================================= -->
							<div class="col-md-9 ">
								<c:forEach items="${list}" var="food" begin="0" end="9" varStatus="status">
										<!-- <div class="view border shadow-sm d-flex my-2 align-items-center" style="width: 100%; height:300px;"> -->
										<div class="view border shadow-sm d-flex my-2 align-items-center" style="width: 1000px; height:300px;">
										
										<!-- 이미지 -->
											<!-- <img src="https://mp-seoul-image-production-s3.mangoplate.com/406312/1763517_1635134765363_16478?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일"> -->
											<c:choose>
												<c:when test="${empty food.food_attach_logical_name}">
													<div class="restaurant-thumbnail flex-shrink-0 me-3 py-2 ms-4">
													<%-- 	<img onclick="location.href ='<%=request.getContextPath() %>/food/foodView.do?fNo=${food.fNo}'" src="https://mp-seoul-image-production-s3.mangoplate.com/406312/1763517_1635134765363_16478?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일"> --%>
														<img style="cursor: pointer; width: 250px; height: 250px;" onclick="location.href ='<%=request.getContextPath() %>/food/foodView.do?fNo=${food.fNo}'" src="<%=request.getContextPath() %>/img/x.png" alt="맛집 썸네일">
													</div>
												</c:when>
												<c:otherwise>
													<div class="restaurant-thumbnail flex-shrink-0 me-3 py-2 ms-4">
														<img style="cursor: pointer; width: 250px; height: 250px;" src="<%=request.getContextPath() %>/resources/upload/${food.food_attach_physical_name}" onclick="location.href ='<%=request.getContextPath() %>/food/foodView.do?fNo=${food.fNo}'">           
													</div>
												</c:otherwise>
											</c:choose>
												
											<div class="restaurant-info col-12 align-items-start">
												<div class="flex-column py-1" style="text-align: left; height:250px;">
													<h2 class="restaurant-title flex-column px-1" style="margin:0px;">
														<span>${food.food_name}</span><!-- <span class="mirai">4.7</span> -->
														<c:if test="${food.avg != 0.0}">
															<span class="mirai">${food.avg}</span>
														</c:if>
													</h2>
													<p class="fs-6 restaurant-address" style="color: silver; margin:10px 0px;">
													<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
													  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
													</svg>
													${food.food_address}
													</p>
													<div class="mt-3">
														<a href="${food.food_website}" target="_blank">
														    <img src="../img/insta.png" alt="Instagram 아이콘" style="width:28px; height:28px; cursor:pointer;">
														</a>
														<span style="font-size:13pt; background-color:#ffb64c; padding:3px 8px; border-radius:41px;">#${food.food_food_kind}</span> 
														<span style="font-size:13pt; background-color:#ffb64c; padding:3px 8px; border-radius:41px;">#${food.food_avg_price}</span>
													</div>
													<div class="restaurant-description mt-3" style="display:inline-block; width:470px; height:120px;">
													    ${food.food_content}
													</div>


													
												</div>
											</div>	
													
											<div class="flex-shrink-0  d-flex justify-content-end align-items-end" style=" padding:0px 30px 30px 0px; position:relative; height:100%;"> 
												<div class="flex-column px-1 pt-2" style="text-align: right;">
													<!-- 별 위치 여기 맞나?  -->
													<div class="button-container" style=" width:150px; text-align:center;" >
														<div onclick="insert(${status.index},${food.fNo})" class="button1 dislike" style="color:silver; position:absolute; top:40px; right:50px; z-index:100;">
															<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
															  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
															</svg>
															<br>가고싶다
														</div>
															
														<div onclick="delete_(${status.index},${food.fNo})" class="button1 like" style="color:orange; position:absolute; top:40px; right:50px; z-index:100;">
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
													<div class="justify-content-end" style="text-align:right;">
														<a href="<%=request.getContextPath()%>/food/foodView.do?fNo=${food.fNo}">${food.food_name} 더보기></a>
													</div>
											
											
													
													
											<!-- <div class="user-info"> -->
											
											<!-- </div> -->
											<%-- 	<p class="restaurant-address" style="color: silver;">${food.food_address}</p>
												<p class="restaurant-description">${food.food_content}</p>--%>
												<!-- <p class="restaurant-address" style="color: silver; text-align:right;"> -->
				
												
				<!--  글 수정, 삭제 버튼  (로그인시에만 보임/ 글쓴사람만 보임) --> 
											
													<div class="justify-content-between pt-3 ">
														<form name="frm" action="delete.do" method="post" style="display: inline;">
													        <input type="hidden" name="fNo" value="${food.fNo}">
													       <%--  <% if(session.getAttribute("login") != null) { %> --%>
													       <c:if test="${login.uNo eq food.uNo}">
													        	<button onclick="delFn()">삭제하기</button> 
													       <%--  <% } %> --%>
													       </c:if>
													    </form>
													<!-- </div> -->
													
													<!-- <div style="float:right; margin-right: 10px;"> -->
														<c:if test="${login.uNo eq food.uNo}">
														<%-- <% if(session.getAttribute("login") != null) { %> --%>
															<button onclick="location.href='<%=request.getContextPath()%>/food/foodMainModify.do?fNo=${food.fNo}'">수정하기</button>
														<%-- <% } %>  --%>
														</c:if>
													<!-- </div> -->
													</div>
												</div>
											</div>
										</div>
								</c:forEach>	
				<!-- 페이징 디자인 NEW -->		
								<br>
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center" style="font-size:17pt;">
										<li class="page-item">
											<% if (pageMaker.isPrev()){ %>
											<a href="<%=request.getContextPath()%>/food/foodMain.do?page=<%=pageMaker.getStartPage()-1%>"><span style="padding:0px 10px;">◀</span></a>
											<%} %>
										</li>
										<% 
										for(int i = pageMaker.getStartPage();i<=pageMaker.getEndPage();i++) {
										%>
										<li class="page-item">
											<a href="<%=request.getContextPath()%>/food/foodMain.do?page=<%=i%>">
												<span style="padding:0px 10px;"><%=i %></span>
											</a>	
										</li>		
										<%	
										}
										%>
										<%if(pageMaker.isNext()&&pageMaker.getEndPage()>0 ){ %>
										<a href="<%=request.getContextPath()%>/food/foodMain.do?page=<%=pageMaker.getEndPage()+1%>"><span style="padding:0px 10px;"></span>▶</a>
										<% } %>
										<!-- <li class="page-item"> -->
											<%-- <a class="page-link" href="<%=request.getContextPath()%>/food/foodMain.do?page<%=pageMaker.getEndPage()+1%>">Next</a> --%>
										<!-- </li> -->
									</ul>
									<br>
								</nav>	
								
							</div>
						</div>
					</div>	
				</div>
			</div>	
			
		</div>
	</div>
</div>
<!-- =========================================================================================== -->
<%@ include file="../include/footer.jsp" %>