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
		<link href="${pageContext.request.contextPath}/resources/css/font_style.css" rel="stylesheet" type="text/css">
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
		<!-- owlcarousel -->
		<!-- Owl Carousel CSS 파일을 CDN을 통해 불러오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.carousel.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.theme.default.min.css">
		
		<!-- Owl Carousel JavaScript 파일을 CDN을 통해 불러오기 -->
		<script src="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/owl.carousel.min.js"></script>
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
		<style type="text/css">
		.owl-nav{
			display:none;
		}
		</style>
	</head>
	<!-- 화면 상위 단 -->
	<body>
	<!-- 헤더영역 시작 -->
	<!-- 시맨틱 헤더 영역 선언  -->
	<!-- <header> -->
	<!-- style="background-image: linear-gradient(to bottom right, #32AAFF, #BEEFFF); -->
	<header class="p-2 py-2 border-bottom" style="background-color:white; font-family:'TheJamsil5Bold';">
		<div class="root-container">
			<div class="d-flex ms-4 align-items-center justify-content-center justify-content-lg-start">
				<a class="navbar-brand mx-4 offset-3" href="<%=request.getContextPath() %>/" title="Arcalive" style="padding: 0px;">
					<img src="${pageContext.request.contextPath}/resources/img/logo_test4.png" width="200px" height="60px">
				</a>
			
				<ul class="nav col-12  col-lg-auto me-lg-auto ms-5 mb-0" style="text-color: black; display: flex; flex-direction: row; height:40px;">
					<li class="nav-item col-6 col-lg-auto px-3 mb-0" >
						<a class="nav-link py-0" href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do">
							<h4 class="mt-3" style="color:black">숙박 </h4>
						</a>
					</li>
					<li class="nav-item col-6 col-lg-auto px-3">
						<a class="nav-link py-0" href="<%=request.getContextPath()%>/food/foodMain.do">
							<h4 class="mt-3" style="color:black">맛집 </h4>
						</a>
					</li>
					<li class="nav-item col-6 col-lg-auto px-3">
						<a class="nav-link py-0" href="<%=request.getContextPath()%>/event/eventMain.do">
							<h4 class="mt-3" style="color:black">축제 </h4>
						</a>
					</li>
				</ul> 
				<div class="col-12 col-lg-auto mb-3 px-3 mb-lg-0 me-lg-3">
					<c:if test="${empty login}">
						<span class="username d-none d-sm-inline" style="text-align: center; font-size:18px;">글쓰기 권한이 없습니다 로그인하십시오</span>
					</c:if>
					<c:if test="${not empty login}">
						<div style="text-align: center; font-size:18px;">${login.uName}님 환영합니다.</div>
					</c:if>
				</div>
				<div class="text-end" style="width: 250px">
					<c:if test="${empty login}">
						<div class="d-flex">
							<a class="btn btn-primary me-3" href="<%= request.getContextPath()%>/User/userLogin.do">로그인</a>
							<br>
							<a class="btn btn-warning" href="<%= request.getContextPath()%>/User/joinCheck.do">회원가입</a>
						</div>
					</c:if>
					<c:if test="${not empty login}">
						<div class="d-flex">
							<a class="btn btn-primary me-3" href="<%= request.getContextPath()%>/User/profile.do">마이페이지</a>
								<br>
							<a class="btn btn-warning" href="<%= request.getContextPath()%>/User/userLogoutAction.do">로그아웃</a>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</header>