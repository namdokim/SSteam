<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<%
	// 로그인 정보 얻기
	UserVO userVO = (UserVO)session.getAttribute("login");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset = "UTF-8">
		<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
		<title> 커뮤니티 글 보기 </title>	
	</head>

	<body>
		<div class = "container-fluid border-top">
			<div class = "row flex-nowrap" >
				<main class = "col-6 offset-3 py-md-1 pl-md-5 bd-content board-article border-end border-start" style = "height: 100vh;" role = "main">
					<article class = "container-fluid">
						<form name = "write" method = "post" action = "<%= request.getContextPath() %>/Community/CommunityWriteCheck.do" >	
							<input type = "hidden" name = "contentType" value = "html">
							<div class = "sub-row py-md-1">
								<c:choose>
									<c:when test="${communityBoardVO.board_type == 1}">
										공지사항
							        </c:when>
									<c:when test="${communityBoardVO.board_type == 2}">
										정보 게시판
									</c:when>
									<c:when test="${communityBoardVO.board_type == 3}">
										후기 게시판
									</c:when>
									<c:when test="${communityBoardVO.board_type == 4}">
										질문 게시판
									</c:when>
									<c:otherwise>
										자유 게시판
									</c:otherwise>
							    </c:choose>
							</div> <br>
							<div class = "write-head border-top border-bottom py-md-1">
								작성자:　${communityBoardVO.user_name}
							</div> <br>
							<div class = "row">
								<div class = "form-group col-12">
									<div class = "input-group input-group-sm">
										<div name = "board_title" class = "form-control form-control-sm " id = "communityTitle" maxlength = "256"> ${communityBoardVO.board_title} </div>
									</div>
								</div>
								<div class = "pt-1">
									<div id = "summernote" name = "board_content" style = "width: 100%; height: 45rem"> ${communityBoardVO.board_content} </div>
								</div>
							</div>
							<script>
								function deleteBoard(boardNumber)
								{
							        window.location.href = "CommunityDelete.do?boardNumber=" + boardNumber;
							    }
	
							    function modifyBoard(boardNumber)
							    {
							        window.location.href = "CommunityModify.do?boardNumber=" + boardNumber;
							    }
							</script>
							<div class = "boardControl">
								<c:if test = "${not empty login && login.uNo == communityBoardVO.uNo}">
									<input type = "button" class = "btn btn-outline-secondary" value = "글 삭제" name = "btn" id = "btn" onclick = "deleteBoard(${communityBoardVO.board_number})"> &nbsp;
									<input type = "button" class = "btn btn-outline-secondary" value = "글 수정" name = "btn" id = "btn" onclick = "modifyBoard(${communityBoardVO.board_number})"> &nbsp;
								</c:if>
								<input type = "button" class = "btn btn-outline-secondary" value = "글 목록" name = "btn" id = "btn" onclick = "window.history.back()"> &nbsp;
							</div>
						</form>
					</article>	
				</main>
			</div>	
		</div>
	</body>		

<%@ include file="../include/footer.jsp" %>