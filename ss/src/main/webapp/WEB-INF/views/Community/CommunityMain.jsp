<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ include file="../include/header.jsp" %>

<%
	// url 에서 현재 선택 된 게시판의 게시글 얻기
	List<String> nowPageBoardList = (List<String>)request.getAttribute("nowPageBoardList");
%>

<%
	// 로그인 정보에 따라서 채팅 닉네임 설정
	UserVO userVO = (UserVO)session.getAttribute("login");
	String name = "";

	if (userVO == null)
	{
		name = "게스트";
	}
	else
	{
		name = userVO.getuName();
	}

%>

<!DOCTYPE html>
<html lang = "en">
	<head>
		<meta charset = "UTF-8">
		<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
		<title> 커뮤니티 메인 </title>
		<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>
		<script src = "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"> </script>
		<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"> </script>
		<link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
		<script src = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"> </script>
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
			#messages
			{
				/* 크기 고정 */
				min-height: 300px;
		        max-height: 300px;
		        /* 스크롤 */
		        overflow-y: auto;
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
					<a href = "CommunityWrite.do?boardType=${boardType}" class = " float-right btn btn-sm btn-arca btn-arca-article-write" title = "글쓰기"> <span class = "ion-compose"> </span> 글쓰기 </a>
				</button>
			</div>
		</div>	
		<div class = "container-fluid offset-2" style = "max-width: 1280px">
			<div class = "row" >
			<!-- 사이드바 -->
				<div class = "bd-sidebar d-flex flex-column flex-shrink-0 p-3 bg-light" style = "width: 280px">
					<a class = "d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none offset-3">
						<span class = "fs-4"> 게시판 구분 </span>
					</a>
					<hr>
					<ul class = "nav nav-pills flex-column mb-auto">
						<li class="nav-item">
						    <c:choose>
						        <c:when test = "${boardType == 0}">
						            <a href = "CommunityMain.do?boardType=0&nowPage=1" class = "nav-link link-dark" style = "text-align:center; font-weight: bold"> 전체글 </a>
						        </c:when>
						        <c:otherwise>
						            <a href = "CommunityMain.do?boardType=0&nowPage=1" class = "nav-link link-dark" style = "text-align:center"> 전체글 </a>
						        </c:otherwise>
						    </c:choose>
						</li>
						<li>
							<c:choose>
						        <c:when test = "${boardType == 1}">
						            <a href = "CommunityMain.do?boardType=1&nowPage=1" class = "nav-link link-dark" style = "text-align:center; font-weight: bold"> 공지사항 </a>
						        </c:when>
						        <c:otherwise>
						            <a href = "CommunityMain.do?boardType=1&nowPage=1" class = "nav-link link-dark" style = "text-align:center"> 공지사항 </a>
						        </c:otherwise>
						    </c:choose>
						</li>
						<li>
							<c:choose>
						        <c:when test = "${boardType == 2}">
						            <a href = "CommunityMain.do?boardType=2&nowPage=1" class = "nav-link link-dark" style = "text-align:center; font-weight: bold"> 정보 게시판 </a>
						        </c:when>
						        <c:otherwise>
						            <a href = "CommunityMain.do?boardType=2&nowPage=1" class = "nav-link link-dark" style = "text-align:center"> 정보 게시판 </a>
						        </c:otherwise>
						    </c:choose>
						</li>
						<li>
							<c:choose>
						        <c:when test = "${boardType == 3}">
						            <a href = "CommunityMain.do?boardType=3&nowPage=1" class = "nav-link link-dark" style = "text-align:center; font-weight: bold"> 후기 게시판 </a>
						        </c:when>
						        <c:otherwise>
						            <a href = "CommunityMain.do?boardType=3&nowPage=1" class = "nav-link link-dark" style = "text-align:center"> 후기 게시판 </a>
						        </c:otherwise>
						    </c:choose>
						</li>
						<li>
							<c:choose>
						        <c:when test = "${boardType == 4}">
						            <a href = "CommunityMain.do?boardType=4&nowPage=1" class = "nav-link link-dark" style = "text-align:center; font-weight: bold"> 질문 게시판 </a>
						        </c:when>
						        <c:otherwise>
						            <a href = "CommunityMain.do?boardType=4&nowPage=1" class = "nav-link link-dark" style = "text-align:center"> 질문 게시판 </a>
						        </c:otherwise>
						    </c:choose>
						</li>
						<li>
							<c:choose>
						        <c:when test = "${boardType == 99}">
						            <a href = "CommunityMain.do?boardType=99&nowPage=1" class = "nav-link link-dark" style = "text-align:center; font-weight: bold"> 자유 게시판 </a>
						        </c:when>
						        <c:otherwise>
						            <a href = "CommunityMain.do?boardType=99&nowPage=1" class = "nav-link link-dark" style = "text-align:center"> 자유 게시판 </a>
						        </c:otherwise>
						    </c:choose>
						</li>
					</ul>
					<a class = "d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none offset-5">
						<span class = "fs-4"> 채팅 </span>
					</a>
					<hr>
					<div class = "nav nav-pills flex-column mb-auto">
			        	<!-- 메시지 표시 공간 -->
				        <div id = "messages">
				        
			    		</div> <br>
				  		<div style = "display: flex; align-items: center">
				  			<input type = "text" id = "sender" value = "${name}" style = "display: none">
			  				<input type = "text" id = "messageInput"> &nbsp;
				        	<button type = "button" class = "btn btn-outline-secondary" style = "white-space: nowrap" onclick = "send()"> 전송 </button>
				  		</div>
			    	</div>
					<script>
				        var ws;
				        var messages = document.getElementById("messages");
				        
				        window.onload = function()
				        {
				        	openSocket();
				        }
			
				        // 웹 소켓 열기
				        function openSocket()
				        {
				        	// 웹 소켓 연결에 오류가 없다면
				            if (ws !== undefined && ws.readyState !== WebSocket.CLOSED)
				            {
				                writeResponse("WebSocket is already opened.");
				                return;
				            }
				        	
				            // 웹 소켓 객체 생성
				            ws = new WebSocket("ws://localhost:8090/<%= request.getContextPath() %>/echo.do");
				            
				            /* 웹 소켓 요청 대기 */
				            // 웹 소켓 열기를 요청 받았을 때
				            ws.onopen = function(event)
				            {
				                if(event.data === undefined)
				                {
				              		return;
				                }
				                writeResponse(event.data);
				            };
				            // 메시지 보내기를 요청 받았을 때
				            ws.onmessage = function(event)
				            {
				                console.log('writeResponse');
				                console.log(event.data)
				                writeResponse(event.data);
				            };
				            // 웹 소켓 닫기를 요청 받았을 때
				            ws.onclose = function(event)
				            {
				                writeResponse("대화 종료");
				            }
				        }
				        
				        // 메시지 전송
				        function send()
				        {
				            var text = document.getElementById("messageInput").value + ", " + document.getElementById("sender").value;
				            ws.send(text);
				            text = "";
				        }
				         
				        // 웹 소켓 닫기
				        function closeSocket()
				        {
				            ws.close();
				        }
				         
				        // 메시지 표시
				        function writeResponse(text)
				        {
				            messages.innerHTML += "<br>" + text;
				            
				         	// 스크롤을 가장 아래로 이동
				            messages.scrollTop = messages.scrollHeight;
				        }
				
				        // 메시지 초기화
				        function clearText()
				        {
				            console.log(messages.parentNode);
				            messages.parentNode.removeChild(messages)
				       	}
			        </script>
				</div>
				<!-- 사이드바 -->
				
				<!-- 메인 -->
				<div class = "tab-content container-fluid ml-1 col-md-9" >		
					<table class = "table table-striped">
							<tr class = "vrow-inner" style = "background-color: lightgrey">
								<th class = "vcol col-id" style = "text-align: center; width: 10%"> 번호 </th>
								<th class = "vcol col-title" style = "text-align: center; width: 40%"> 제목 </th>
								<th class = "vcol col-author" style = "text-align: center; width: 15%"> 작성자 </th>
								<th class = "vcol col-time" style = "text-align: center; width: 15%"> 작성일 </th>
								<th class = "vcol col-view" style = "text-align: center; width: 10%"> 조회수 </th>
								<th class = "vcol col-recom" style = "text-align: center; width: 10%"> 추천 </th>
							</tr>
						<c:forEach items = "${nowPageBoardList}" var = "element">
							<tr class = "vrow-inner">
								<td class = "vcol col-id" style = "text-align: center"> ${element.board_number} </td>
								<td class = "vcol col-title"> <a href = "CommunityView.do?boardNumber=${element.board_number}&isHit=true"> ${element.board_title} </a> </td>
								<td class = "vcol col-author" style = "text-align: center"> ${element.user_name} </td>
								<td class = "vcol col-time" style = "text-align: center"> ${element.write_date} </td>
								<td class = "vcol col-view" style = "text-align: center"> ${element.hit_count} </td>
								<td class = "vcol col-recom" style = "text-align: center"> 추천추천 </td>
							</tr>
						</c:forEach>
					</table>
					
					<!-- 페이징 블럭 처리 -->
					<nav aria-label = "Page navigation example">
						<ul class = "pagination justify-content-center">
							<script>
								// 사용할 변수 초기화
								var nowPage = ${nowPage};
								var pagingBlockSize = ${pagingBlockSize};
								var boardType = ${boardType};
								var pageStart = ${pageStart};
								var pageEnd = ${pageEnd};
								var boardCount = ${boardCount};
								
								// console.log("nowPage: " + nowPage);
								// console.log("pagingBlockSize: " + pagingBlockSize);
								// console.log("boardType: " + boardType);
								// console.log("pageStart: " + pageStart);
								// console.log("pageEnd: " + pageEnd);
								// console.log("boardCount: " + boardCount);
								
								// 현재 페이지 번호가 페이징 블럭 크기를 넘는다면
								if (nowPage > pagingBlockSize)
								{
									// 이전 페이지로 이동 기능 추가
									document.write('<li class = "page-item">');
					            	document.write('	<a class = "page-link" href = "CommunityMain.do?boardType=' + boardType + '&nowPage=' + (pageStart - 1) + '"> Previous </a>');
					            	document.write('</li>');
								}
								// 숫자 페이징 블럭 생성
								for (var i = pageStart; i <= pageEnd; i++)
								{
							        document.write('<li class="page-item">');
							        document.write('	<a class = "page-link" href="CommunityMain.do?boardType=' + boardType + '&nowPage=' + i + '">' + i + '</a>');
							        document.write('</li>');
							    }
								// 선택된 게시판의 총 게시글 개수가 100개가 넘고, 마지막 페이징 블럭이 아니라면
							    if (boardCount > 100 && pageEnd !== maxPage)
							    {
							        // 다음 페이지로 이동 기능 추가
							        document.write('<li class = "page-item">');
							        document.write('	<a class = "page-link" href = "CommunityMain.do?boardType=' + boardType + '&nowPage=' + (pageEnd + 1) + '"> Next </a>');
							        document.write('</li>');
							    }
							</script>
						</ul>
					</nav>
				</div>	
				<!-- 메인 -->	
			</div>
		</div>
	</body>

<%@ include file="../include/footer.jsp" %>