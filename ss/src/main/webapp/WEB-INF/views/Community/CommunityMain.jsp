<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<%@ page import = "java.util.ArrayList" %>

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

<html>
	<head>
		<title> 커뮤니티 메인 </title>
		<meta charset = "utf-8">
		
		<style>
			a
			{
				text-decoration: none;
			}
			h2
			{
				font-size: 1.4rem;
				font-family: verdana;
				color: black;
				font-weight: normal;
			}
			h2:hover
			{
				cursor: pointer;
				text-decoration: underline;
			}
			h2:active
			{
				color: lightsalmon;
			}
			h3
			{
				/* font-size: 1.2rem; */
				font-size: 1.0rem;
				font-family: verdana;
				font-weight: normal;
			}
			table
			{
				border-collapse : collapse;
			}
			th
			{
				background-color: lightgray;
			}
			input
			{
				font-size: 1.5rem;
				font-family: verdana;
			}
		</style>
		
		<script>	
			function boardSelect(boardType)
			{
				// 세션에 게시판 정보 쓰기
				sessionStorage.setItem("boardType", Number(boardType));
				// 게시판 이동
				location.href = "./Board_Select.jsp?" + "boardType=" + boardType + "&" + "page=1";
			}
		</script>
	</head>
	
	<body>
		<%
			// 페이지당 게시글 개수
			int unitPage = 10;
			// 페이징 블럭 크기
			int pagingBlockSize = 10;
			
			/*
			// 페이지 번호를 뺀 페이지 이동 url
			String moveUrl = "./Board_Select.jsp?" + "boardType=" + boardType;
			// 게시글 번호를 뺀 게시글 이동 url
			String viewUrl = "./View.jsp?" + "boardNumber=";
			*/
		
			/*
			// 선택된 페이지 번호 확인
			int nowPage = Integer.parseInt(request.getParameter("page"));
			System.out.println("페이지 번호: " + nowPage);
			*/
			
			// 선택된 게시판의 총 게시글 개수
			// Board_Control board_Control = new Board_Control();
			int boardCount = 0;
			/*
			if (boardType.equals("-1"))
			{
				// 전체 게시글
				boardCount = board_Control.getAllBoardCount();
			}
			else
			{
				// 선택된 게시판에 대한 게시글
				boardCount = board_Control.getAllBoardCount("board_type", boardType);
			}
			*/
			System.out.println("선택된 게시판의 총 게시글 개수: " + boardCount);
			
			// 최대 페이지 번호 계산
			/*
			int maxPage = (boardCount - 1) / unitPage + 1;
			// 페이징 블럭의 시작번호와 끝번호 계산
			int pageStart = ((nowPage - 1) / unitPage) * unitPage + 1;
			int pageEnd = pageStart + pagingBlockSize - 1;
			if (pageEnd > maxPage)
			{
				pageEnd = maxPage;
			}
			*/
		%>
			
		<table border = "0" style = "width: 100%; height: 100%;">
			<tr>
				<td width = "10%">
					<table border = "0" style = "width: 95%; height: 100%; margin-left: 5%">
						<tr style = "vertical-align: top">
							<td>				
								<%
									if (boardType != null && boardType.equals("-1")) { %> <a href = "javascript:boardSelect('-1')"> <h2 style = "font-weight: bold"> 전체글 보기 </h2> </a> <% }
									else { %> <a href = "javascript:boardSelect('-1')"> <h2> 전체글 보기 </h2> </a> <% }
								%>
								<%
									if (boardType != null && boardType.equals("0")) { %> <a href = "javascript:boardSelect('0')"> <h2 style = "font-weight: bold"> 공지사항 </h2> </a> <% }
									else { %> <a href = "javascript:boardSelect('0')"> <h2> 공지사항 </h2> </a> <% }
								%>
								<%
									if (boardType != null && boardType.equals("1")) { %> <a href = "javascript:boardSelect('1')"> <h2 style = "font-weight: bold"> 게임정보 </h2> </a> <% }
									else { %> <a href = "javascript:boardSelect('1')"> <h2> 정보 게시판 </h2> </a> <% }
								%>
								<%
									if (boardType != null && boardType.equals("2")) { %> <a href = "javascript:boardSelect('2')"> <h2 style = "font-weight: bold"> 이벤트 </h2> </a> <% }
									else { %> <a href = "javascript:boardSelect('2')"> <h2> 후기 게시판 </h2> </a> <% }
								%>
								<%
									if (boardType != null && boardType.equals("3")) { %> <a href = "javascript:boardSelect('3')"> <h2 style = "font-weight: bold"> 질문 게시판 </h2> </a> <% }
									else { %> <a href = "javascript:boardSelect('3')"> <h2> 질문 게시판 </h2> </a> <% }
								%>
								<%
									if (boardType != null && boardType.equals("4")) { %> <a href = "javascript:boardSelect('4')"> <h2 style = "font-weight: bold"> 창작 게시판 </h2> </a> <% }
									else { %> <a href = "javascript:boardSelect('4')"> <h2> 자유 게시판 </h2> </a> <% }
								%>
							</td>
						</tr>
					</table>
				</td>
			
				<td width = "90%">
					<table border = "1" style = "width: 100%; height: 100%;">
						<tr style = "height: 10%">
							<th style = "width: 5%">
								<h3> <b> 글 번호 </b> </h3>
							</th>
							<th style = "width: 55%">
								<h3> <b> 제목 </b> </h3>
							</th>
							<th style = "width: 20%">
								<h3> <b> 작성자 </b> </h3>
							</th>
							<th style = "width: 10%">
								<h3> <b> 작성일 </b> </h3>
							</th>
							<th style = "width: 5%">
								<h3> <b> 조회수 </b> </h3> 
							</th>
							<th style = "width: 5%">
								<h3> <b> 좋아요 </b> </h3>
							</th>
						</tr>
						<%
					/* 게시글 리스트를 화면에 출력 */
					for (int i = 0; i < 10; i++)
					{ %>
						<tr style = "height: 7%">
							<td style = "text-align: center">
								<h3> 1 </h3>
							</td>
							<td style = "text-align: left">
								<h3> &nbsp; 제목 입니다. </h3>
							</td>
							<td style = "text-align: left">
								<h3> &nbsp; 작성자 이름 </h3>
							</td>
							<td style = "text-align: center">
								<h3> 2023. 07. 26 </h3>
							</td>
							<td style = "text-align: center">
								<h3> 0 </h3>
							</td>
							<td style = "text-align: center">
								<h3> 0 </h3>
							</td>
						</tr> <%
					} %>
					</table>
				</td>
			</tr>
		</table>
		
		<%
			// 현재 선택된 게시판에 대한, 현재 선택된 페이지의 게시글 목록 리스트 생성
			/*
			ArrayList<Board_Manager> boardPageArray = new ArrayList<Board_Manager>();
			
			// 전체글 보기 게시판
			if (boardType.equals("-1"))
			{
				boardPageArray = board_Control.getBoardPage(nowPage);
				upperBoard = board_Control.getLastUpperBoard();
			}
			// 공지사항 게시판
			else if (boardType.equals("0"))
			{
				boardPageArray = board_Control.getNoticeBoardPage(nowPage);
				upperBoard = board_Control.getLastUpperBoard();
			}
			// 이외의 게시판
			else
			{
				boardPageArray = board_Control.getBoardPage(nowPage, "board_type", boardType);
				upperBoard = board_Control.getLastUpperBoard("board_type", boardType);
			}
			*/
			
			
		
			/* 한 페이지에 게시글 10개가 안된다면 */
			// ...
		
			/* 페이징 블럭 처리 */
			// ...
			
		%>
	</body>

<%@ include file = "../include/footer.jsp" %>