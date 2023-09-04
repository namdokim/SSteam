<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@page import="com.ss.demo.domain.EventVO"%>
<%-- <%@page import="com.ss.demo.domain.EventDAO"%>  --%>
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
	String type = request.getParameter("type");
// LType 변수를 request 파라미터에서 읽어옵니다.
String LType = request.getParameter("${vo.LType}");
if (LType == null) {
    LType = "TT"; // LType이 파라미터로 제공되지 않은 경우 기본값을 설정합니다.
} 

/* EventVO vo = new EventVO();
	EventVO vo = EventDAO.Read(uNo, false); 
	if( event_number == null || event_number.equals("") )
	{
		response.sendRedirect("index.jsp");		// 로그인 화면으로 보냄
		return;
	}
	String type = request.getParameter("type");
	if( type == null ) type = "TT";	
	EventDAO ed = new EventDAO();
	EventVO vo;
	// 파라메타로 넘어온 게시글 번호로 게시글을 조회
	int bNo = 0;
	try
	{
		event_number = Integer.parseInt(event_number);	// 문자열 no를 정수로
		vo = vo.Read(bNo, true);		// bNo를 인자로, 조회수를 증가시키는 read()호출
	}catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("index.jsp");
		return;
	}
*/
//본문에 포함된 엔터문자를 <br>태그로 변경한다
/* if (vo.getEvent_content() != null) {
vo.setEvent_content(vo.getEvent_content().replace("<p>", ""));
vo.setEvent_content(vo.getEvent_content().replace("</p>", ""));
} */
%>

<script>
window.onload = function() { $("#event_title").focus(); }
</script>
<script>
  // 서머노트 초기화 함수
  $(document).ready(function() {
    $('#event_content').summernote();
  });

  // 폼 서브밋 이벤트 핸들러
  function submitForm() {
    // 서머노트에서 수정된 내용을 가져옴
    var modifiedContents = $('#event_content').summernote('code');
    // 수정된 내용을 hidden 필드에 설정
    $('#modifiedContents').val(modifiedContents);
    // 폼 서브밋
    document.modifyForm.submit();
  }
</script>
<script>
/* window.onload = function(){
	const openButton = document.getElementById("open-gallery-button");
	const modal = document.getElementById("gallery-modal");
	const closeButton = document.getElementById("close-button");

	openButton.addEventListener("click", () => {
	  modal.style.display = "block";
	  document.body.style.overflow = "hidden";
	});

	closeButton.addEventListener("click", () => {
	  modal.style.display = "none";
	  document.body.style.overflow = "auto";
	});

	window.addEventListener("click", (event) => {
	  if (event.target === modal) {
	    modal.style.display = "none";
	    document.body.style.overflow = "auto";
	  }
	});
} */
</script>
<style type="text/css">

.form-signin .scrollable-x {
  overflow-x: auto;
  white-space: nowrap;
}

.form-signin {
  max-width: 700px;
  padding: 15px;
}

.form-signin input {
  margin-bottom: 1px;


}
.datepicker{
	font-weight:bold;

}

.masthead:before {
    content: "";
    position: absolute;
    background-color: #1c375e;
    height: 100%;
    width: 100%;
    top: 0;
    left: 0;
    opacity: 0.3;
}		
.masthead {
    position: relative;
    background: url(../img/pxfuel.jpg) no-repeat  center;
    background-size: cover;
    height:400px
}	

</style>
<!-- <script src="./js/write.js"></script> -->
<body>
	<div class="masthead text-center pt-5" style="height:150%; font-family: 'TheJamsil5Bold'; ">
	<div class="form-signin card shadow-sm w-100 m-auto" >
		<form name="write" method="post" action="eventModify.do" onsubmit="return DoSubmit();" enctype="multipart/form-data" >	
			<a class="navbar-brand" href="<%=request.getContextPath()%>/event/eventMain.do" title="Arcalive">
			<svg xmlns="http://www.w3.org/2000/svg" style="color:#02c9a5" width="72" height="60" fill="currentColor" class="bi bi-house-add" viewBox="0 0 16 16">
			  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h4a.5.5 0 1 0 0-1h-4a.5.5 0 0 1-.5-.5V7.207l5-5 6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
			  <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 1 0 1 0v-1h1a.5.5 0 1 0 0-1h-1v-1a.5.5 0 0 0-.5-.5Z"/>
			</svg>
			</a>
			<h1 class="h3 mb-3 fw-normal" style="color:#02c9a5">축제 수정</h1>
	
			<div class="form-floating py-2">
				<input type="hidden" name="event_number" value="${ev.event_number}">
				<input type="text" class="form-control" id="event_title" placeholder="가게 이름" name="event_title" value="${ev.event_title}">
				<label for="floatingInput" class="text-muted">축제 이름</label>
			</div>
			<div class="row mb-3">
				<div class="form-floating col">	
					<input type="text" class="form-control me-2 datepicker" id="event_start" placeholder="체크 인" name="event_start" value="${ev.event_start}" readonly>
					<label for="floatingInput" class="text-muted ms-2">시작일</label>
				</div>
					
					~		
				
				<div class="form-floating col">	
					<input type="text" class="form-control datepicker" id="event_end" placeholder="체크 아웃" name="event_end" value="${ev.event_end}" readonly>
					<label for="floatingInput2" class="text-muted ms-2">종료일</label>
				</div>
			</div>
						
			<div class="d-flex">
				<h5 class="text-muted text-left ms-2 mt-2">지역 구분</h5>
			</div>
			<div class="sub-row pb-md-3">
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
			
			<div class="d-flex ms-2">
			<span class=" btn  py-1 my-1 float-left w-25" style="background-color:#02c9a5; color:white; " id="search_address" style="cursor:pointer;">주소 찾기</span>
			</div>
			<div class="form-floating ">
				<input type="text" name="event_local" class="form-control" id="event_local" value="${ev.event_local}" readonly>
				<label for="floatingInput" class="text-muted">위치</label>
			</div>
			<div class="form-floating mt-2">
				<input type="text" class="form-control" id="event_tel" placeholder="전화번호" name="event_tel" value="${ev.event_tel}">
				<label for="floatingInput" class="text-muted">전화번호</label>
			</div>
				<div class="d-flex">
				<h4 class="text-muted text-left ms-2 mt-2">상세요강</h4>
			</div>
			<div class="form-floating mb-3" style="text-align: left">
				<textarea id="summernote" name="event_content">${ev.event_content}</textarea>
				<script>
					$(document).ready(function() {
					    $('#summernote').summernote({
					      height: 300,
					      callbacks: {
					        onChange: function(contents, $editable) {
					          $('#summernoteInput').val(event_content);
					        }
					      }
					    });
					  });
				</script>
				
			</div>

			<div class="d-flex ms-2">
				<h1 class="h5 my-3 fw-normal text-muted">파일 업로드</h1>
			</div>	
		
			<div class="card">
					<span style="font-weight:bold;">첨부한 이미지는 최상단 슬라이드에 위치합니다</span>
				<div class="d-flex">
					<label class="btn float-left ms-2 my-2" style="background-color:#02c9a5; color:white; ">
					이미지 선택			
					<input type="file" name="multiFile" multiple style="display: none;">
					</label>
					<div class="btn float-right ms-2 my-2" data-bs-toggle="modal" data-bs-target="#exampleModal" style="display:inline-block; cursor:pointer; background-color:#02c9a5; color:white; ">등록된 이미지 보기</div>
				</div>	
				<div class="ms-4" id="preview" style="overflow-y: auto; max-height: 230px; text-align: left;"></div>
			</div>	
			<br>
			<button class="w-100 btn" style="background-color:#02c9a5; color:white; ">
				등록
			</button>
		</form>
	</div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">등록된 이미지 보기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <div style="margin:24px; text-align:left;">
		    <c:forEach items="${attach}" var="attach">
			    <div style="display:inline-block; margin:20px 0px;">
			   		<img src="<%=request.getContextPath()%>/resources/upload/${attach.attach_physical_name}" style="width:350px; height:230px; border-radius:5px; display:inline-block;"><br>
				    <form action="eventThumbnail.do" method="post" style="display:inline-block;">
				    	<input type="hidden" name=attach_number value="${attach.attach_number}">
				    	<input type="hidden" name="event_number" value="${attach.event_number}">
				   		<button style="border:0px; background-color:transparent; border-radius:5px; padding:10px; height:50px; line-height:25px;font-weight:bold;">썸네일 등록</button>
				    </form>
				    <form action="eventDelete_attach.do" method="post" style="display:inline-block;">
				    	<input type="hidden" name="attach_number" value="${attach.attach_number}">
				    	<input type="hidden" name="event_number" value="${attach.event_number}">
				   		<button style="border:0px; background-color:transparent; border-radius:5px; padding:10px; height:50px; line-height:25px;font-weight:bold;">등록 이미지 삭제</button>
				    </form>
			    </div>
		    </c:forEach>
	    </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
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
			eventVO.event_content = event_content.replace("<p>","");
			eventVO.event_content = event_content.replace("</p>","");
		    return confirm("작성된 게시물을 저장하시겠습니까?");
		  }
	</script>
	
	

<%@ include file="../include/footer.jsp" %>