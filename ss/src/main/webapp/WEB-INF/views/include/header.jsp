<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.ss.demo.domain.UserVO" %>
<%
	UserVO login = (UserVO)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>게시판</title>
		<!-- lib 모음  -->
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<!-- 부트스트랩 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<!-- 부트스트랩의 달력 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker.min.css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>                     
		<!-- popper -->
		<script src="https://unpkg.com/@popperjs/core@2"></script>
		<!-- summernote -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
		<%-- 
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,500,500i">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/animate.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style.css">
		 --%>
		<!-- 스크롤 바 스크립트 -->
	<script type="text/javascript">
	window.onscroll = function(){navigo ()};
		function navigo (){
		  const header = document.querySelector('.headertop');
		  const headerheight = header.clientHeight;
		document.addEventListener('scroll', onScroll, { passive: true });
		 function onScroll () {
		     const scrollposition = pageYOffset;
		   const nav = document.querySelector('.navbar');
		   if (headerheight<=scrollposition){
		     nav.classList.add('fix')
		   }
		   else {
		     nav.classList.remove('fix');
		   }
		 } 
		  
		}
	</script>
		
	<!-- 이미지 파일 미리보기  -->
	<script type="text/javascript">
	$(document).ready(function (e){
		$("input[type='file']").change(function(e){
			//div 내용 비워주기
			$('#preview').empty();
				var files = e.target.files;
				var arr =Array.prototype.slice.call(files);
			//업로드 가능 파일인지 체크
			for(var i=0;i<files.length;i++){
				if(!checkExtension(files[i].name,files[i].size)){
				return false;
				}
			}
		preview(arr);
		});//file change
		function checkExtension(fileName,fileSize){
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 20971520;  //20MB
			if(fileSize >= maxSize){
				alert('파일 사이즈 초과');
				$("input[type='file']").val("");  //파일 초기화
				return false;
			}
			if(regex.test(fileName)){
				alert('업로드 불가능한 파일이 있습니다.');
				$("input[type='file']").val("");  //파일 초기화
				return false;
				}
				return true;
			} //checkExtension 끝
		function preview(arr){
			arr.forEach(function(f){
				//파일명이 길면 파일명...으로 처리
				var fileName = f.name;
				if(fileName.length > 10){
					fileName = fileName.substring(0,7)+"...";
				}
				//div에 이미지 추가
				var str = '<div style="display: inline-flex; padding: 10px;"><li>';
					str += '<span>'+fileName+'</span><br>';
				//이미지 파일 미리보기
				if(f.type.match('image.*')){
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
					reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					//str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
					str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
					str += '</li></div>';
					$(str).appendTo('#preview');
				} 
					reader.readAsDataURL(f);
				}else{
					str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
					$(str).appendTo('#preview');
				}
			});//arr.forEach
		}
	});
	</script>

	</head>
<style>
	/* ass 믹스인을 사용하여 고유한 컨테이너 */
/* 	@mixin header-container($padding-x: $container-padding-x) {
	width: 100%;
	height: 5%;
	padding-right: $padding-0;
	padding-left: $padding-0;
	margin-right: auto;
	margin-left: auto;
	} */
	/* 스크롤 다운시 고정되는 바 스타일  및 네비 바 고정  */
	a:hover{
		/* background: yellowgreen; */
	}
	/* .fix {
	position:fixed;
	animation: down 0.5s ease;
	} */
	@keyframes down {
		0%{
		transform: translateY(-50px)
		}
		100%{
		transform: translateY(0px)
		}
	}
	.navbar{
	/* #A9E2F3 */
	background-color: write;
	opacity: 0.8;
	box-shadow: 0 2px 0px 0px gray;
	width:100%; 
	color:white; 
	text-align:center;
	top:0;
	left:0;
	z-index:100;
	}
	/* 카테고리 바  */
	.nav-link {
	font-size: 1.5rem; /* 원하는 크기로 조정하세요 */
	padding: 0.5rem 1rem; /* 원하는 패딩 크기로 조정하세요 */
	}
	/* navbar 로고 영역  */
	.header-container .header-navbar
	{
		margin-left: 5%;
		margin-right: 0;
	}
	/* 검색기능 위치 영역 */
	.header-search{
		margin-right:50%;
		margin-left: 0;
	}
	/* 드롭다운 버튼 영역  */
	.header-dropdown
	{
		margin-right: 5%;
	}
	.dropdown-menu{
		--bs-dropdown-min-width: 7rem;
	}
	#dropdownbox{
		
		border:none;
		background-color:transparent;
		z-index: 100;
	}
	#dropdownbox li .btn{
		width: 100%;
	}
	.resp {
	position: relative;
	width: 100%;
	}
	.header-dropdown{
	opacity: 1;
	}
	/* 메인 상단 이미지 햇던거  */
/* 	.overlay {
	position: absolute ;
	width: 100%;
	height: 100%;
	top: 0;
	}
	.mainimg{
	margin: 80px auto 30px auto;
	right: 40%;
	bottom: 40rem;
	text-align: center;
	/* color: #fff; */
	color: #212529;
	} */
	.nav-link
	{
	padding: 5px;
	padding-left: 0px;
	padding-right: 0px;
	}
	#cate{
	padding-left: 0px;
	padding-right: 0px;
	}
	
	.featurette-heading {
    margin-top: 7rem;
	}
	h2{
		font-size: 50px;
	}
	/* .lh-1 {
    line-height: 1!important;
	} */
	rect{
		color: #e9ecef; !important;
	}
	#bottomClick{
		opacity: 0.7;
		z-index: 999;
		margin-bottom: 12px;
	}
</style>
	<!-- 화면 상위 단 -->
	<body>
		<!-- 헤더영역 시작 -->
		<!-- 시맨틱 헤더 영역 선언  -->
<!-- <header> -->
	<div class="header-container">
		<nav class="navbar" role="navigation">
			<!-- 로고 표시 영역  -->
			<div class="header-navbar" >
				<a class="navbar-brand ms-3 offset-2" href="<%=request.getContextPath() %>/" title="Arcalive" style="padding: 0px;">
					<img src="<%=request.getContextPath() %>/img/logo.png" width="80px" height="40px">
				</a>
			</div>
			<!-- 검색기능 -->
			<!-- 		
			<div class="header-search">
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
			</div> 
			-->
			<!-- drop down bar -->
			<div id="header-dropdown" class="header-dropdown">
				<div class="dropdown-center" >
				<c:if test=""></c:if>
					<button class="btn btn-secondary " type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" data-bs-display="static"  data-bs-auto-close="outside" aria-expanded="false">
					<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" style="color: white;" class="bi bi-person-circle" viewBox="0 0 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
					</button>
						<c:if test="${empty login}">
					<ul id="dropdownbox" class="dropdown-menu" >
						<li><a class="btn btn-primary" href="<%= request.getContextPath()%>/User/userLogin.do">로그인</a></li>
						<%-- <li><a class="btn btn-warning" href="<%= request.getContextPath()%>/User/userJoin.do">회원가입</a></li> --%>
						<li><a class="btn btn-warning" href="<%= request.getContextPath()%>/User/joinCheck.do">회원가입</a></li>
					</ul>
						</c:if>
						<c:if test="${not empty login}">
					<ul id="dropdownbox" class="dropdown-menu" >
						<li><a class="btn btn-primary" href="<%= request.getContextPath()%>/User/mypage.do">마이페이지</a></li>
						<li><a class="btn btn-warning" href="<%= request.getContextPath()%>/User/userLogoutAction.do">로그아웃</a></li>
					</ul>
				</c:if>
				</div>
			</div> <!-- dropdown 영역 끝  -->
		</nav>	<!-- 헤더 상단 바 끝  -->
	</div>	<!-- header-container -->
	
				<!-- 검색 기능 표시 영역  -->
				<!--<div class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 offset-2" >
					<form class="form-inline search-form mb-0 offset-3" id="siteSearchForm" method="get" action="#">
						<div class="search-input-wrapper">
							<span class="ion-search icon"></span>
							<input type="hidden" name="target" value="all">
							<input type="search" name="keyword" class="form-control" placeholder="찾기" value="">
						</div>
					</form>
				</div> 
				<ul class="nav ml-auto ml-lg-0 ">
					<li class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search"></li>
					<li class="nav-item d-lg-none">
						<a class="nav-link" href="../index.jsp" id="siteSearchBtn">
							<span class="ion-search icon h5"></span>
						</a>
					</li>	-->
					<%-- <li class="nav-item dropdown">
						<a class="d-block link-dark text-decoration-none ms-3 dropdown-toggle" href="../index.jsp" title="Notification" data-toggle="dropdown" aria-expanded="false" >
							<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" style="color: white;" class="bi bi-bell-fill" viewBox="0 0 16 16">
								<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
							  </svg>
							<span class="ion-android-notifications h5"></span>
						</a>
						<div class="dropdown-menu noti-dropdown-menu right">
							<div class="title">
								알림
								<button class="btn btn-secondary btn-sm float-right" id="removeAllBtn">모두 읽기</button>
							</div>
							<div class="dropdown-divider"></div>
							<ul class="noti-item-list"></ul>
							<div class="dropdown-divider"></div>
								<div class="d-block text-center">
								<small><a href="/u/notification">전체 보기</a></small>
							</div>
						</div>
					</li>
					<li class="dropdown text-end">
						<a href="#" class="d-block link-dark ms-3 me-3 text-decoration-none dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false">
				        	 <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" style="color: white;" class="bi bi-person-circle" viewBox="0 0 16 16">
								  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
								  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
							</svg>
						</a>
					<ul class="dropdown-menu text-small shadow " style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate(0px, 34px);" data-popper-placement="bottom-end">
						<li>
							<div class="help-item" style="text-align:center;">
						       	<div>
						<a class="btn btn-primary"  href="<%= request.getContextPath()%>/User/userLogin.do">로그인</a>
						</div>
						<div style="margin-top: 0.5rem;">
						<a class="btn btn-warning" href="<%= request.getContextPath()%>/User/userJoin.do">회원가입</a>
								</div>
							</div>
						</li>
					</ul>
							<!-- 
							<a href="#" class="d-block link-dark ms-3 me-3 text-decoration-none dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false">
							<span class="username d-none d-sm-inline" style="color: white; text-align: center;">		 &nbsp;&nbsp;</span>
					        	<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" style="color: white;" class="bi bi-person-circle" viewBox="0 0 16 16">
									<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
									<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
								</svg>
							</a>
							<div class="dropdown-menu user-dropdown-menu right ">
								<div class="user-info" style="text-align: center;">
									<div class="username" style="text-align: center;">
									</div>		
								</div>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="logout.jsp" class="btn sfnm">로그아웃</a>
							</div>
					</li>	
				</ul>
							-->
				<%-- <div class="nav-item offset-3" style="margin-right: 2rem;">
				</div>					
				<div class="nav-item offset-1" style="margin-right: 2rem;">
					<a class="nav-link" style="color: black; align:center;" 
						href="<%=request.getContextPath()%>/food/foodMain.do">맛집</a>
				</div>
				<div class="nav-item offset-1" style="margin-right: 2rem;">
					<a class="nav-link" style="color: black; align:center;" 
						href="<%=request.getContextPath()%>/event/eventMain.do">축제</a>
				</div>
				<div class="nav-item offset-1" style="margin-right: 36rem;">
					<a class="nav-link " style="color: black; text-align: center;" 
						href="<%=request.getContextPath()%>/Community/CommunityMain.do"> 커뮤니티 </a>
				</div>	 --%>	
<%-- 		<div class="resp natural_wind">
			<img src="<%=request.getContextPath()%>/img/aaaa.png" width="100%" height="300px" style="object-fit:cover;">
				<div class="overlay splittext">
						<div class="contents">
							<div class="mainimg" id="mainimg">
							<h1> WELCOME!!</h1>
							<p style="text-align: center;"> 좋은 여행이 되시길</p>
						</div>
					</div>
				</div>	
		</div> --%>
		<!-- 카테고리 -->		
	<div class="headertop">
		<div id="category" class="container">
			<div class="row">
				<div id="cate" class="col rounded border ">
					<a class="nav-link" aria-current="page" style="color: black; text-align:center;" 
						href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do">숙박</a>
				</div>
				<div id="cate" class="col rounded border ">
					<a class="nav-link" style="color: black; text-align:center;" 
						href="<%=request.getContextPath()%>/food/foodMain.do">맛집</a>
				</div>
				<div id="cate" class="col rounded border ">
					<a class="nav-link" style="color: black; text-align:center;" 
						href="<%=request.getContextPath()%>/event/eventMain.do">축제</a>
				</div>
				<div id="cate" class="col rounded border ">
					<a class="nav-link " style="color: black; text-align: center;" 
						href="<%=request.getContextPath()%>/Community/CommunityMain.do?boardType=0"> 커뮤니티 </a>
				</div>
			</div>
		</div>
	</div>
	
<!-- </header> -->
<!-- 헤더영역 끝 -->