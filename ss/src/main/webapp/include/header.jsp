<%@page import="com.ss.demo.controller.userController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% // 설정 파일을 인클루드 한다 %>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	

<%
	//userVo loginVo = (userVo)session.getAttribute("loginUser");


	//if( loginVo != null ) loginVo.PrintInfo();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
		<script type="text/javascript" src="./smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<link rel="stylesheet" href="./css/board.css"/>
		<link rel="apple-touch-icon" href="/static/apple-icon.png">
		<link rel="canonical" href="#">
		<script src="https://unpkg.com/micromodal/dist/micromodal.min.js"></script>
		<script>
		 MicroModal.init({
		   onShow: modal => console.info(`${modal.id} is shown`), // [1]
		   onClose: modal => console.info(`${modal.id} is hidden`), // [2]
		   openTrigger: 'data-custom-open', // [3]
		   closeTrigger: 'data-custom-close', // [4]
		   openClass: 'is-open', // [5]
		   disableScroll: true, // [6]
		   disableFocus: false, // [7]
		   awaitOpenAnimation: false, // [8]
		   awaitCloseAnimation: false, // [9]
		   debugMode: false // [10]
		 });
		</script>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
				<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		
		<script src="https://unpkg.com/@popperjs/core@2"></script>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/static/assets/dist/style.css">
		
		 <!-- include libraries(jQuery, bootstrap) -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>                     
 
	</head>
	<body>
		<header>
			<div class="root-container">
				<div class="navbar-wrapper " >
					<nav class="navbar navbar-dark d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start "  style="background-color: #99ffff; ">
						<a class="navbar-brand ms-3 offset-2" href="<%=request.getContextPath() %>/index.jsp" title="Arcalive">
							<svg class=" ms-3 offset-4" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-google-play" viewBox="0 0 16 16">
								<path d="M14.222 9.374c1.037-.61 1.037-2.137 0-2.748L11.528 5.04 8.32 8l3.207 2.96 2.694-1.586Zm-3.595 2.116L7.583 8.68 1.03 14.73c.201 1.029 1.36 1.61 2.303 1.055l7.294-4.295ZM1 13.396V2.603L6.846 8 1 13.396ZM1.03 1.27l6.553 6.05 3.044-2.81L3.333.215C2.39-.341 1.231.24 1.03 1.27Z"/>
							</svg>
						</a>
						<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 offset-2" >
							<form class="form-inline search-form mb-0 offset-3" id="siteSearchForm" method="get" action="#">
								<div class="search-input-wrapper">
									<span class="ion-search icon"></span>
									<input type="hidden" name="target" value="all">
									<input type="search" name="keyword" class="form-control" placeholder="찾기" value="">
								</div>
							</form>
						</ul>
						<ul class="nav  ml-auto ml-lg-0 ">
							<li class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search"></li>
							<li class="nav-item d-lg-none">
								<a class="nav-link" href="../index.jsp" id="siteSearchBtn">
									<span class="ion-search icon h5"></span>
								</a>
							</li>
							<li class="nav-item dropdown">
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
									<%
									String uName = (String) session.getAttribute("uName");
									String uNick = (String) session.getAttribute("uNick");
									if( session.getAttribute("uId") == null )
									{
									
									%> 
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
									<%
									}else
									{
									%>	
									
									<a href="#" class="d-block link-dark ms-3 me-3 text-decoration-none dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false">
									<span class="username d-none d-sm-inline" style="color: white; text-align: center;">			<%--	<%= loginVo.getuName() %> (<%= loginVo.getuNo() %>)	--%> &nbsp;&nbsp;</span>
							        	<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" style="color: white;" class="bi bi-person-circle" viewBox="0 0 16 16">
											<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
											<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
										</svg>
									</a>
									<div class="dropdown-menu user-dropdown-menu right ">
										<div class="user-info" style="text-align: center;">
											<div class="username" style="text-align: center;">
											<%= uName %> (<%= uNick %>)&nbsp;&nbsp;
											</div>		
										</div>
												<%-- <%= loginNo %> <%= loginId %> <%= loginName %>님&nbsp;&nbsp; --%>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="<%= request.getContextPath()%>/User/userLogoutAction.do" class="btn sfnm">로그아웃</a>
									</div>
									<%
								}
								%> 
							</li>	
						</ul>
					</nav>
				</div>
				<style>
					.nav-link {
					font-size: 1.2rem; /* 원하는 크기로 조정하세요 */
					padding: 0.5rem 1rem; /* 원하는 패딩 크기로 조정하세요 */
					}
				</style>
	<!-- 카테고리 -->	
				<ul class=" nav-tabs nav-scroller py-1 mb-2 " >
					<nav class="nav d-flex justify-content-between" >						
						<div class="nav-item offset-2" style="margin-right: 2rem;">
							<a class="nav-link" aria-current="page" style="color: black; align:center;" 
								href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do">숙박</a>
						</div>					
						<div class="nav-item offset-1" style="margin-right: 2rem;">
							<a class="nav-link" style="color: black; align:center;" 
								href="<%=request.getContextPath()%>/Food/FoodMain.do">맛집</a>
						</div>
						<div class="nav-item offset-1" style="margin-right: 2rem;">
							<a class="nav-link" style="color: black; align:center;" 
								href="index.jsp?type=P">축제</a>
						</div>
						<div class="nav-item offset-1" style="margin-right: 24rem;">
							<a class="nav-link " style="color: black; text-align: center;" 
								href="index.jsp?type=S">커뮤니티</a>
						</div>									
					</nav>
				</ul>						
			</div>
		</header>