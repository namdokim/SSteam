<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<%
	// url 에서 현재 선택 된 게시판 종류 얻기
	String boardType = "";
	
	try
	{
		boardType = request.getParameter("boardType");
	}
	catch (Exception e)
	{
		System.out.println("게시판 최초 선택");
	}
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title> 커뮤니티 메인 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
		<script>
			$(document).ready(function()
			{
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
			    if (itemsToShow >= $('.lead').length)
			    {
			    	$('#load').hide();
			    }
			});
		</script>
		
		<style type="text/css">
			a
			{
				text-decoration: none;
				color: black;
			}
			body
			{
				font-family: Arial, sans-serif;
				margin: 0;
				padding: 0;
			}
			.container
			{
				margin: 20px auto;
				max-width: 960px;
				padding: 0 20px;
			}
			.restaurant-item
			{
				border: none;
				margin-bottom: 20px;
				padding: 20px;
				display: flex;
				border-bottom: 1px solid #ddd;
			}
			.restaurant-thumbnail
			{
				flex: 0 0 auto;
				margin-right: 20px;
			}
			.restaurant-thumbnail img
			{
				width: 250px;
				height: 250px;
				object-fit: cover;
			}
			.restaurant-info
			{
				flex: 1 1 auto;
			}
			.restaurant-title
			{
				font-size: 24px;
				font-weight: bold;
				margin-bottom: 10px;
			}
			.restaurant-title span.mirai
			{
				font-family: "미라이", sans-serif;
				color: #ff7f00;
				font-size: 30px;
				margin-left: 10px;
			}
			.restaurant-rating
			{
				font-size: 16px;
				margin-bottom: 10px;
			}
			.restaurant-address
			{
				font-size: 10pt;
				color: silver;
			}
			.restaurant-description
			{
				font-size: 16px;
				line-height: 1.5;
				max-height: 4.5em;
				overflow: hidden;
				position: relative;
			}
			.restaurant-description::after
			{
				content: "";
				position: absolute;
				bottom: 0;
				right: 0;
				background: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 1) 70%);
				width: 100%;
				height: 1.5em;
			}
			.restaurant-more
			{
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
			.user-info
			{
				display: flex;
				align-items: center;
				margin-bottom: 10px;
			}
			.user-thumbnail
			{
				width: 40px;
				height: 40px;
				margin-right: 10px;
				border-radius: 50%;
				overflow: hidden;
			}
			.user-thumbnail img
			{
				width: 100%;
				height: 100%;
				object-fit: cover;
			}
			.user-nickname
			{
				font-size: 14px;
				font-weight: bold;
			}
			.restaurant-favorite-btn
			{
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
		  	.bd-sidebar
		  	{
				position: sticky;
				top: 0rem;
				height: calc(100vh - 0rem);
				background: #eee;
			
				display: flex;
				padding: 0;
				overflow-y: hidden;
				flex-direction: column;
			}
			.bd-sidebar-body
			{
				height: 100%;
				overflow-y: auto;
				display: block;
			}
			.bd-sidebar-body .nav 
			{
				display: block;
			}
			.bd-sidebar-body .nav>li>a
			{
				display: block;
				padding: .25rem 1.5rem;
				font-size: 90%;
			}
			.bd-sidebar-footer
			{
				padding: 1rem;
				background: #ddd;
			}
		</style>
	</head>
	
	<body>
		<div class = "btns-board border-top d-flex justify-content-between px-3 border-bottom bg-light">					
			<a class = "float-right" >
				<span>
					<c:if test = "${not empty login}">
						유저: ${login.uName} 권한: ${login.uName}
					</c:if>
				</span>
			</a>
			<div class = "float-right">
				<button type = "button" class = "btn btn-outline-secondary" style = "--bs-btn-padding-y: auto; --bs-btn-padding-x: auto; --bs-btn-font-size: 15rem">
				<a href = "CommunityWrite.do?type=<%= boardType %>" class = " float-right btn btn-sm btn-arca btn-arca-article-write" title = "글쓰기"> <span class = "ion-compose"> </span> &nbsp; 글쓰기 </a>
				<%--
				<%
					if( loginVo != null )
					{
						%><a href="write.jsp?type=<%= type %>" class="btn btn-sm btn-arca btn-arca-article-write" title="글쓰기"><span class="ion-compose"></span>&nbsp;글쓰기</a><%
						%><a href="write.jsp?type=<%= type %>" class=" float-right btn btn-sm btn-arca btn-arca-article-write" title="글쓰기"><span class="ion-compose"></span>&nbsp;글쓰기</a><%
					}
				%>
				--%>
				</button>
			</div>
		</div>	
		<div class = "container-fluid offset-2" style = "max-width: 1280px">
			<div class="row" >
			<!-- 사이드바 -->
				<div class = "bd-sidebar d-flex flex-column flex-shrink-0 p-3 bg-light" style = "width: 280px">
					<a href = "/" class = "d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none offset-3">
						<span class = "fs-4"> 지역별 구분 </span>
					</a>
					<hr>
					<ul class = "nav nav-pills flex-column mb-auto">
						<%--
						<% String activeTab = type != null && !type.equals("") ? type : "TT"; %>
						<%
							String boardTitle = "";
							switch (type)
							{
								case "T":
							        boardTitle = "전체글";
							        activeTab = "T";
							        break;
							    case "N":
							        boardTitle = "공지사항";
							        activeTab = "N";
							        break;
							    case "I":
							        boardTitle = "정보 게시판";
							        activeTab = "I";
							        break;
							    case "R":
							        boardTitle = "후기 게시판";
							        activeTab = "R";
							        break;
							    case "Q":
							        boardTitle = "질문 게시판 ";
							        activeTab = "Q";
							        break;
							    case "F":
							        boardTitle = "자유 게시판";
							        activeTab = "F";
							        break;
							}
						%>
						--%>
						<li class = "nav-item" >
							<a href = "CommunityMain.do?type=TT" class = "nav-link link-dark  <%-- <%= activeTab.equals("T") ? "active" : "" %> --%>"  style = "text-align:center">						
								전체글
							</a>
						</li>
						<li>
							<a href = "CommunityMain.do?type=GG" class = "nav-link link-dark <%-- <%= activeTab.equals("N") ? "active" : "" %> --%>" style = "text-align:center;">			
								공지사항
							</a>
						</li>
						<li>
							<a href="CommunityMain.do?type=GW" class = "nav-link link-dark <%-- <%= activeTab.equals("I") ? "active" : "" %> --%>" style = "text-align:center;">								
								정보 게시판
							</a>
						</li>
						<li>
							<a href="CommunityMain.do?type=CB" class = "nav-link link-dark <%-- <%= activeTab.equals("R") ? "active" : "" %> --%>" style = "text-align:center;">							
								후기 게시판
							</a>
						</li>
						<li>
							<a href="CommunityMain.do?type=CN" class = "nav-link link-dark <%-- <%= activeTab.equals("Q") ? "active" : "" %> --%>" style = "text-align:center;">							
								질문 게시판 
							</a>
						</li>
						<li>
							<a href="CommunityMain.do?type=GB" class = "nav-link link-dark <%-- <%= activeTab.equals("F") ? "active" : "" %> --%>" style = "text-align:center;">							
								자유 게시판
							</a>
						</li>					
					</ul>								
				</div>
				<!-- 사이드바 -->
				
				<!-- 메인 -->
				<div class = "tab-content container-fluid ml-1 col-md-9" >		
					<table class = "table table-striped">
						<thead>
							<tr class = "vrow-inner">
								<th class = "vcol col-id"> 번호 </th>
								<th class = "vcol col-title"> 제목 </th>
								<th class = "vcol col-author"> 작성자 </th>
								<th class = "vcol col-time"> 작성일 </th>
								<th class = "vcol col-view"> 조회수 </th>
								<th class = "vcol col-recom"> 추천수 </th>
							</tr>						
							<tr class = "vrow-inner" style = "background-color: lightgrey">					
								<th class = "vcol col-id"> <b> 공지 </b> </th>
								<th class = "vcol col-title">
									<b> 커뮤니티 게시판 이용 안내 </b>
								</th>
								<th class = "vcol col-author"> ㅎㅎ </th>
								<th class = "vcol col-time">
									2023. 07. 28
								</th>
								<th class = "vcol col-view"> 18734526 </th>
								<th class = "vcol col-recom"> 20 </th>
							</tr>
						</thead>
					</table>
					
					<nav aria-label = "Page navigation example">
						 <ul class = "pagination justify-content-center">
							<li class = "page-item">
								<!-- <a href = "첫번째 페이지로 이동하는 주소"> |◀ </a> &nbsp; -->
							<a class = "page-link" href = "index.jsp?type=<%= boardType %>&page=1">
								Previous
							</a> &nbsp;				
						</ul>
					</nav>
				</div>	
				<!-- 메인 -->	
			</div>
		</div>
	</body>

<%@ include file="../include/footer.jsp" %>