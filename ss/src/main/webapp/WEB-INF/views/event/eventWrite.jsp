<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%
// 로그인 정보를 세션에서 확인한 후
// 1. 로그인 정보가 없으면, 메인으로 돌려보냄
// 2. 로그인 정보가 있으면, 이 페이지를 사용자에게 노출시킴
/* if( loginVo == null )
{
//	response.sendRedirect("ss/event/eventView.do");		// 상세페이지로 돌려보냄
	response.sendRedirect("login.jsp");		// 로그인 화면으로 보냄
	return;
} */
// 파라메타를 통해 사용자가 글을 작성하려는 게시판이 어느것인지 판단하기 위해,
// 'type'이름으로 데이터를 받는다
// String type = request.getParameter("type");
// if( type == null ) type = "TT";		// 기본 게시판은 TT : 전체 디폴트
// LType 변수를 request 파라미터에서 읽어옵니다.
String LType = request.getParameter("LType");
if (LType == null) {
    LType = "TT"; // LType이 파라미터로 제공되지 않은 경우 기본값을 설정합니다.
}

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이벤트 메인</title>


<script src="./js/write.js"></script>
</head>
<body>
	<div class="container-fluid border-top">
		<div class="row flex-nowrap" >
			<main class="col-6 offset-3 py-md-1 pl-md-5 bd-content board-article border-end border-start" style="height: 100vh;" role="main">
				<article class="container-fluid">
					<form name="write" method="post" action="eventWriteAction.do" onsubmit="return DoSubmit();" >	
						<input type="hidden" name="contentType" value="html">
						<div class="write-head border-top border-bottom py-md-1">
							글쓰기 | 작성자<%--  <%= loginVo.getuName() %> --%> <input type="hidden" name="uNo" id="uNo" value="1">
						</div>
						<div class="sub-row py-md-1">
						<span>글머리</span>
						<span>
							<input type="radio" class="btn-check" name="LType" id="success-outlined-TT" autocomplete="off" value="TT" <%= LType.equals("TT") ? "checked" : "" %>>								
							<label class="btn btn-light" for="success-outlined-TT">전체</label>								
						</span>
						<span>
							<input type="radio" class="btn-check" name="LType" id="success-outlined-GG" autocomplete="off" value="GG" <%= LType.equals("GG") ? "checked" : "" %>>								
							<label class="btn btn-light" for="success-outlined-GG">경기</label>								
						</span>
						<span>
							<input  type="radio" class="btn-check" name="LType" id="success-outlined-GW" autocomplete="off" value="GW" <%= LType.equals("GW") ? "checked" : "" %> >
							<label class="btn btn-light" for="success-outlined-GW">강원</label>
						</span>
						<span>
							<input type="radio" class="btn-check" name="LType" id="success-outlined-CB" autocomplete="off" value="CB" <%= LType.equals("CB") ? "checked" : "" %> >
							<label class="btn btn-light" for="success-outlined-CB">충북</label>
						</span>
						<span>
							<input type="radio" class="btn-check" name="LType" id="success-outlined-CN" autocomplete="off" value="CN" <%= LType.equals("CN") ? "checked" : "" %> >
							<label class="btn btn-light" for="success-outlined-CN">충남</label>
						</span>
						<span>
							<input type="radio" class="btn-check" name="LType" id="success-outlined-GB" autocomplete="off" value="GB" <%= LType.equals("GB") ? "checked" : "" %> >
							<label class="btn btn-light" for="success-outlined-GB">경북</label>
						</span>
						<span>
							<input type="radio" class="btn-check" name="LType" id="success-outlined-GN" autocomplete="off" value="GN" <%= LType.equals("GN") ? "checked" : "" %> >
							<label class="btn btn-light" for="success-outlined-GN">경남</label>
						</span>
						<span>
							<input type="radio" class="btn-check" name="LType" id="success-outlined-JB" autocomplete="off" value="JB" <%= LType.equals("JB") ? "checked" : "" %> >
							<label class="btn btn-light" for="success-outlined-JB">전북</label>
						</span>
						<span>
							<input type="radio" class="btn-check" name="LType" id="success-outlined-JN" autocomplete="off" value="JN" <%= LType.equals("JN") ? "checked" : "" %> >
							<label class="btn btn-light" for="success-outlined-JN">전남</label>
						</span>
						<span>
							<input type="radio" class="btn-check" name="LType" id="success-outlined-JJ" autocomplete="off" value="JJ" <%= LType.equals("JJ") ? "checked" : "" %> >
							<label class="btn btn-light" for="success-outlined-JJ">제주</label>
						</span>
						</div>
						<div class="sub-row" id="formAgreePreventDelete" style="display:none;">
							<label>
							선택하신 카테고리는 글 작성 후 수정/삭제가 불가능합니다. 동의하십니까?
							<input type="checkbox" name="agreePreventDelete">
							</label>
						</div>
						<div class="row">
							<div class="form-group col-12">
								<div class="input-group input-group-sm">
									<div class="input-group-prepend">
										<span class="input-group-text">제목</span>
									</div>
									<input id ="event_title"  type="text" name="event_title" class="form-control form-control-sm " id="event_title" maxlength="256" required="">
								</div>
								<div class="input-group input-group-sm">
									<div class="input-group-prepend">
										<span class="input-group-text">날짜</span>
									</div>
									<input type="text" name="event_start" class="form-control form-control-sm " id="event_start" maxlength="256" required="">
									<input type="text" name="event_end" class="form-control form-control-sm " id="event_end" maxlength="256" required="">
								</div>
								<div class="input-group input-group-sm">
									<div class="input-group-prepend">
										<span class="input-group-text">위치</span>
									</div>
									<input type="text" name="event_local" class="form-control form-control-sm " id="event_local" maxlength="256" required="">
								</div>
								<div class="input-group input-group-sm">
									<div class="input-group-prepend">
										<span class="input-group-text">전화번호</span>
									</div>
									<input type="text" name="event_tel" class="form-control form-control-sm " id="event_tel" maxlength="256" required="">
								</div>
								
								
							</div>
							<div class="pt-1">
								<textarea id="summernote" name="event_content">
							
								</textarea>
							</div>
							
						</div>
						
						<div class="hidden-preview-checkbox">
							<input type="checkbox" name="hidden_preview" id="hidden_preview">
							<label for="hidden_preview">미디어 미리보기를 숨기시겠습니까?</label>
							<span class="ion-help-circled" data-toggle="tooltip" data-placement="top" title="" data-original-title="채널 목록에서 이미지 미리보기가 표시되지 않습니다."></span>
						</div>							
						<div class="pt-1 d-flex justify-content-end">
							<button class="btn btn-light mx-1" type="submit" style="width:10%; padding:5px;" onclick="DoSubmit();">제출</button>
						</div>
					</form>
				</article>	
			</main>
		</div>	
	</div>
	
	<script type="text/javascript">
	
	   function DoSubmit() {
	
		
			if ($("#event_title").val() == "") {
			 alert("제목을 입력하세요");
			 $("#event_title").focus();
			 return false;
		    }
		    if ($("#event_content").val() == "") {
			      alert("내용을 입력하세요");
			      $("#event_content").focus();
			      return false;
			    }
			
			event_content = event_content.replace("<p>","");
			event_content = event_content.replace("</p>","");
			
		    return confirm("작성된 게시물을 저장하시겠습니까?");
		  }
	</script>
	
	

<%@ include file="../include/footer.jsp" %>