<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.ss.demo.domain.UserVO" %>
<%
	UserVO login = (UserVO)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SS</title>
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
		
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,500,500i">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/animate.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style.css">
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,500,500i">
	<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
</head>
<body>
	<!-- Top menu -->
		<nav class="navbar navbar-inverse navbar-fixed-top navbar-no-bg" role="navigation">
			::before
			<div class="container">
			::before
				<div class="navbar-header">
				::before
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html">Bootstrap Search Template</a>
					::after
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="top-navbar-1">
					<ul class="nav navbar-nav navbar-right navbar-search-button">
						<li><a class="search-button" href="#"><i class="fa fa-search"></i></a></li>
					</ul>
					<form class="navbar-form navbar-right navbar-search-form disabled wow fadeInLeft" role="form" action="" method="post">
						<div class="form-group">
							<input type="text" name="search" placeholder="Search..." class="search form-control">
						</div>
					</form>
					<ul class="nav navbar-nav navbar-right navbar-menu-items wow fadeIn">
						<li><a href="#">Home</a></li>
						<li><a href="#">Services</a></li>
						<li><a href="#">About</a></li>
						<li><a href="#">Mission</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
			</div>
		</nav>
        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/scripts.js"></script>
