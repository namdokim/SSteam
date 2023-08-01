<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

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
						<form name = "write" method = "post" action="<%= request.getContextPath() %>/Community/CommunityWriteCheck.do" >	
							<input type = "hidden" name = "contentType" value = "html">
							<div class = "write-head border-top border-bottom py-md-1">
								글쓰기 &nbsp; | &nbsp; 작성자 <%-- <%= loginVo.getuName() %> --%> <input type = "hidden" name = "user_number" id = "user_number" value = "1">
							</div>
							<div class = "sub-row py-md-1">
							<span> 게시판 구분 </span> &nbsp;
							<span>
								<input type = "radio" class = "btn-check" name = "board_type" id = "success-outlined-T" autocomplete = "off" value = "T" <%-- <%= boardType.equals("T") ? "checked" : "" %> --%> >								
								<label class = "btn btn-light" for = "success-outlined-T"> 전체 게시글 </label>								
							</span>
							<span>
								<input type = "radio" class = "btn-check" name = "board_type" id = "success-outlined-N" autocomplete = "off" value = "N" <%-- <%= boardType.equals("GG") ? "checked" : "" %> --%> >								
								<label class = "btn btn-light" for = "success-outlined-N"> 공지사항 </label>								
							</span>
							<span>
								<input  type = "radio" class = "btn-check" name = "board_type" id = "success-outlined-I" autocomplete = "off" value = "I" <%-- <%= boardType.equals("I") ? "checked" : "" %> --%> >
								<label class = "btn btn-light" for = "success-outlined-I"> 정보 게시판 </label>
							</span>
							<span>
								<input type = "radio" class = "btn-check" name = "board_type" id = "success-outlined-R" autocomplete = "off" value = "R" <%-- <%= boardType.equals("R") ? "checked" : "" %> --%> >
								<label class = "btn btn-light" for = "success-outlined-R"> 후기 게시판 </label>
							</span>
							<span>
								<input type = "radio" class = "btn-check" name = "board_type" id = "success-outlined-Q" autocomplete = "off" value = "Q" <%-- <%= boardType.equals("Q") ? "checked" : "" %> --%> >
								<label class = "btn btn-light" for = "success-outlined-Q"> 질문 게시판 </label>
							</span>
							<span>
								<input type = "radio" class = "btn-check" name = "board_type" id = "success-outlined-F" autocomplete = "off" value = "F" <%-- <%= boardType.equals("F") ? "checked" : "" %> --%> >
								<label class = "btn btn-light" for = "success-outlined-F"> 자유 게시판 </label>
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