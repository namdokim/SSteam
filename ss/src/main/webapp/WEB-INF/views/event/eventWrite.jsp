<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@page import="com.ss.demo.domain.EventVO"%>
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

EventVO ev = new EventVO();

//본문에 포함된 엔터문자를 <br>태그로 변경한다
if (ev.getEvent_content() != null) {
ev.setEvent_content(ev.getEvent_content().replace("<p>", ""));
ev.setEvent_content(ev.getEvent_content().replace("</p>", ""));
}
%>




<!DOCTYPE html>
<html>


<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이벤트 메인</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/datepicker.css">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script>
	$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});

	$(function () {
	  $('.datepicker').datepicker();
	});
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
			ev.event_content = event_content.replace("<p>","");
			ev.event_content = event_content.replace("</p>","");
			ev.event_discript = event_discript.replace("<p>","");
			ev.event_discript = event_discript.replace("</p>","");
		    return confirm("작성된 게시물을 저장하시겠습니까?");
		  }
		window.onload = function()
		{
		   document.getElementById("search_address").addEventListener("click", function(){
		      new daum.Postcode({
		         oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            document.getElementById("event_local").value = data.address; // 주소 넣기
		         }
		      }).open();
		   });
		}
		function DoSubmit() {
		    var event_title = document.getElementById("event_title").value;
		    var event_content = $('#summernote').summernote('code');
		    var event_start = document.getElementById("event_start").value;
		    var event_local = document.getElementById("event_local").value;
		    var event_tel = document.getElementById("event_tel").value;
		    var multiFile = document.getElementById("multiFile");

		    // Check if any of the required fields are empty
		    if (event_title.trim() === "") {
		        alert("제목을 입력하세요");
		        document.getElementById("event_title").focus();
		        return false;
		    }

		    if (event_content.trim() === "") {
		        alert("내용을 입력하세요");
		        $('#summernote').summernote('focus');
		        return false;
		    }
		    if (event_local.trim() === "") {
		        alert("위치를 입력하세요");
		        document.getElementById("event_local").focus();
		        return false;
		    }
		    if (event_start.trim() === "") {
		        alert("날짜를 입력하세요");
		        document.getElementById("event_start").focus();
		        return false;
		    }
		    if (event_tel.trim() === "") {
		        alert("전화번호를 입력하세요");
		        document.getElementById("event_tel").focus();
		        return false;
		    }
				
		    // Additional validation can be added here if needed
		    if (multiFile.files.length === 0) {
	            alert('파일을 선택해주세요.');
	            return false;
	        }
		    return confirm("작성된 게시물을 저장하시겠습니까?");
		}
	</script>
<!-- <script src="./js/write.js"></script> -->
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
    background: url(${pageContext.request.contextPath}/resources/img/pxfuel.jpg) no-repeat  center;
    background-size: cover;
    height:400px
}	

</style>
</head>
<div class="masthead text-center pt-5" style="height:150%; ">
	<div class="form-signin card shadow-sm w-100 m-auto" >
		<form name="write" method="post" action="eventWrite.do" onsubmit="return DoSubmit();" enctype="multipart/form-data" >	
			<a class="navbar-brand" href="<%=request.getContextPath()%>/event/eventMain.do" title="Arcalive">
			<svg xmlns="http://www.w3.org/2000/svg" style="color:#02c9a5" width="72" height="60" fill="currentColor" class="bi bi-house-add" viewBox="0 0 16 16">
			  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h4a.5.5 0 1 0 0-1h-4a.5.5 0 0 1-.5-.5V7.207l5-5 6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
			  <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 1 0 1 0v-1h1a.5.5 0 1 0 0-1h-1v-1a.5.5 0 0 0-.5-.5Z"/>
			</svg>
			</a>
			<h1 class="h3 mb-3 fw-normal" style="color:#02c9a5">축제 등록하기</h1>
	
			<div class="form-floating py-2">
				<input type="text" class="form-control" id="event_title" placeholder="가게 이름" name="event_title">
				<label for="floatingInput" class="text-muted">축제 이름</label>
			</div>
			<div class="row mb-3">
				<div class="form-floating col">	
					<input type="text" class="form-control me-2 datepicker" id="event_start" placeholder="체크 인" name="event_start" readonly>
					<label for="floatingInput" class="text-muted ms-2">시작일</label>
				</div>
					
					~		
				
				<div class="form-floating col">	
					<input type="text" class="form-control datepicker" id="event_end" placeholder="체크 아웃" name="event_end" readonly>
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
				<input type="text" name="event_local" class="form-control" id="event_local" readonly>
				<label for="floatingInput" class="text-muted">위치</label>
			</div>
			<div class="form-floating mt-2">
				<input type="text" class="form-control" id="event_tel" placeholder="전화번호" name="event_tel">
				<label for="floatingInput" class="text-muted">전화번호</label>
			</div>
				<div class="d-flex">
				<h4 class="text-muted text-left ms-2 mt-2">상세요강</h4>
			</div>
			<div class="form-floating mb-3" style="text-align: left">
				<textarea id="summernote" name="event_content"></textarea>
				<script>
					$('#summernote').summernote({
					  placeholder: '내용을 입력해주세요',
					  tabsize: 2,
					  height: 300
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
					<input type="file" name="multiFile" id="multiFile" multiple style="display: none;">
					</label>
				</div>	
				<div class="ms-4" id="preview" style="overflow-y: auto; max-height: 300px; text-align: left;"></div>
			</div>	
			<br>
			<button class="w-100 btn" style="background-color:#02c9a5; color:white; ">
				등록
			</button>
		</form>
	</div>
</div>

<!-- 카카오 맵 API 스크립트 -->
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=471bd87d2c2bfa282198a74a11556a57"></script>
	<script>
		// 지도 API를 사용하여 지도 보여주기
		function showMap() {
		var inputLocation = document.getElementById('location').value;
		var mapDiv = document.getElementById('map');
		mapDiv.style.display = 'block';
		
		var geocoder = new kakao.maps.services.Geocoder();
		
		geocoder.addressSearch(inputLocation, function (result, status) {
		if (status === kakao.maps.services.Status.OK) {
		var mapOptions = {
		center: new kakao.maps.LatLng(result[0].y, result[0].x),
		level: 3
		};
		var map = new kakao.maps.Map(mapDiv, mapOptions);
		var marker = new kakao.maps.Marker({
		position: new kakao.maps.LatLng(result[0].y, result[0].x)
		});
		marker.setMap(map);
		} else {
		alert('지도를 표시할 수 없습니다.');
		}
		});
		}
	</script> -->
	
	<!-- 유효성 검사확인  -->
	
<%@ include file="../include/footer.jsp" %> 	
	
