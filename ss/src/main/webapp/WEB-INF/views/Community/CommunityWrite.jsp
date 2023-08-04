<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<%
	String boardType = "";
	
	// url 에서 현재 선택 된 게시판 종류 얻기
	boardType = request.getParameter("boardType");
	System.out.println("boardType: " + boardType);
%>

<%--
<%
	// 로그인 정보가 없으면 진입 불가
	UserVO userVO = (UserVO)session.getAttribute("userVO");

	if (userVO == null)
	{
		// 로그인 페이지로 이동
		response.sendRedirect("Login.jsp");
		return;
	}
%>
--%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset = "UTF-8">
		<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
		<title> 커뮤니티 글쓰기 </title>	
	</head>

	<body>
		<div class = "container-fluid border-top">
			<div class = "row flex-nowrap" >
				<main class = "col-6 offset-3 py-md-1 pl-md-5 bd-content board-article border-end border-start" style = "height: 100vh;" role = "main">
					<article class = "container-fluid">
						<form name = "write" method = "post" action = "<%= request.getContextPath() %>/Community/CommunityWriteCheck.do" >	
							<input type = "hidden" name = "contentType" value = "html">
							<div class = "write-head border-top border-bottom py-md-1">
								글쓰기 &nbsp; | &nbsp; 작성자 <%-- <%= loginVo.getuName() %> --%> <input type = "hidden" name = "user_number" id = "user_number" value = "1">
							</div>
							<div class = "sub-row py-md-1">
							<span> 게시판 구분 </span> &nbsp;
							<span>
								<input type = "radio" class = "btn-check" name = "board_type" id = "success-outlined-1" autocomplete = "off" value = "1" <%= boardType.equals("1") ? "checked" : "" %> >								
								<label class = "btn btn-light" for = "success-outlined-1"> 공지사항 </label>								
							</span>
							<span>
								<input  type = "radio" class = "btn-check" name = "board_type" id = "success-outlined-2" autocomplete = "off" value = "2" <%= boardType.equals("2") ? "checked" : "" %> >
								<label class = "btn btn-light" for = "success-outlined-2"> 정보 게시판 </label>
							</span>
							<span>
								<input type = "radio" class = "btn-check" name = "board_type" id = "success-outlined-3" autocomplete = "off" value = "3" <%= boardType.equals("3") ? "checked" : "" %> >
								<label class = "btn btn-light" for = "success-outlined-3"> 후기 게시판 </label>
							</span>
							<span>
								<input type = "radio" class = "btn-check" name = "board_type" id = "success-outlined-4" autocomplete = "off" value = "4" <%= boardType.equals("4") ? "checked" : "" %> >
								<label class = "btn btn-light" for = "success-outlined-4"> 질문 게시판 </label>
							</span>
							<span>
								<input type = "radio" class = "btn-check" name = "board_type" id = "success-outlined-99" autocomplete = "off" value = "99" <%= boardType.equals("99") ? "checked" : "" %> >
								<label class = "btn btn-light" for = "success-outlined-99"> 자유 게시판 </label>
							</span>
							
							</div>
							<div class = "sub-row" id = "formAgreePreventDelete" style = "display: none">
								<label>
									선택하신 카테고리는 글 작성 후 수정/삭제가 불가능합니다. 동의하십니까?
								<input type = "checkbox" name = "agreePreventDelete">
								</label>
							</div>
							<div class = "row">
								<div class = "form-group col-12">
									<div class = "input-group input-group-sm">
										<div class = "input-group-prepend">
											<span class = "input-group-text"> 제목 </span>
										</div> &nbsp;
										<input type = "text" name = "board_title" class = "form-control form-control-sm " id = "communityTitle" maxlength = "256" required>
									</div>
								</div>
								<div class = "pt-1">
									<textarea id = "summernote" name = "board_content" style = "width: 100%; height: 45rem"></textarea>
								</div>    
							</div>						
			        		<div class = "pt-1 d-flex justify-content-end">
			            		<button class = "btn btn-light mx-1" type = "submit" style = "width: 10%; padding: 5px"> 완료 </button>			
							</div>
						</form>
					</article>	
				</main>
			</div>	
		</div>
	</body>		

<%@ include file="../include/footer.jsp" %>