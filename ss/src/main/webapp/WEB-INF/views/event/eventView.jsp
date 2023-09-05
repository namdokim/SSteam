<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<%@page import="com.ss.demo.domain.EventVO"%>
<%
// 파라메타로 조회할 게시글 번호를 받는다
String no = request.getParameter("no");

// 넘어온 게시글 번호가 없으면 메인으로 보낸다
//if (no == null) { response.sendRedirect("index.jsp"); return; }

// 게시글을 조회하기 위한 객체를 선언한다

EventVO ev = new EventVO();

// 본문에 포함된 엔터문자를 <br>태그로 변경한다
if (ev.getEvent_content() != null) {
	ev.setEvent_content(ev.getEvent_content().replace("\n", "<br>"));
}




%>

<title>이벤트 메인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=089c5e3c9c5fcbe308692c32c61c06b8&libraries=services,clusterer"></script>
<script>
window.onload = function()
{
	// 평점 ========================================
	const grade = document.getElementById("grade");
	const good = document.getElementById("good");
	const soso = document.getElementById("soso");
	const bad = document.getElementById("bad");
	console.log("실행완료");
	
	good.onclick = function(){
		good.style.color="orange";
		soso.style.color="silver";
		bad.style.color="silver";
		grade.value = 5;
		console.log(grade.value);
	}
	soso.onclick = function(){
		good.style.color="silver";
		soso.style.color="orange";
		bad.style.color="silver";
		grade.value = 3;
		console.log(grade.value);
	}
	bad.onclick = function(){
		good.style.color="silver";
		soso.style.color="silver";
		bad.style.color="orange";
		grade.value = 1;
		console.log(grade.value);
	}

	var mapContainer = document.getElementById('map'),									// 지도를 표시할 div 
	mapOption = { center: new kakao.maps.LatLng(33.450701, 126.570667), level: 7 };  
	var map = new kakao.maps.Map(mapContainer, mapOption); 								// 지도를 생성합니다   
	var geocoder = new kakao.maps.services.Geocoder(); 									// 주소-좌표 변환 객체를 생성합니다
	geocoder.addressSearch('${ev.event_local}', function(result, status){				// 주소로 좌표를 검색합니다
		if (status === kakao.maps.services.Status.OK) {									// 정상적으로 검색이 완료됐으면 
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			var marker = new kakao.maps.Marker({ map: map, position: coords });
			   var infowindow = new kakao.maps.InfoWindow({
				   content: '<div class="text-center" style="width:150px;">${ev.event_title}</div>'
		        });
		        infowindow.open(map, marker);// 결과값으로 받은 위치를 마커로 표시합니다
			map.setCenter(coords); } });												// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		
	$(document).ready(function() {
	  // 초기에 보여질 아이템 개수 설정
	  var itemsToShow = 3;
	  
	  // 더보기 버튼을 클릭할 때마다 추가로 보여질 아이템 개수 설정
	  var itemsToAdd = 10;
	  
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
	    if (itemsToShow >= $('.lead').length) {
	      $('#load').hide();
	    }
	  });
	});		
};






  $(document).ready(function() {
	reviewmodify.onclick = function(){
	if( review.value == "" ){ alert("리뷰 글을 작성해 주세요. "); $("#floatingTextarea3").focus(); return; }
		modal1.style.display = "none";
		document.body.style.overflow = "auto";
		
	} 
	  
    var imageUrl = $('#summernote-image').attr('src');
    var imageNode = '<img src="' + imageUrl + '">';
    $('#summernote').summernote({
      placeholder: '내용을 입력해주세요',
      tabsize: 2,
      height: 300
    });
    $('#summernote').summernote('pasteHTML', imageNode);
  });

function confirmDelete() {
    if (confirm("삭제하시겠습니까?")) {
        document.getElementById("deleteForm").submit();
    }else{   //취소
        return false;
    }
}

function eventReviewModify(obj,comment_number,event_review_grade){
	console.log(event_review_grade);
	const modify_grade = document.getElementById("modify_grade");
	const modify_good = document.getElementById("modify_good");
	const modify_soso = document.getElementById("modify_soso");
	const modify_bad = document.getElementById("modify_bad");
	
	
	console.log(obj.innerHTML);
	const number1 = document.getElementById("comment_number");
	const number = document.getElementById("com_number");
	const title = document.getElementById("review_title");
	const review = document.getElementById("floatingTextarea3");
	const array = document.getElementsByName("mobutton");
	const index = Array.prototype.indexOf.call(array, obj);
	console.log(comment_number);
	number1.value = comment_number;
	console.log(number1.value);
	title.value = document.getElementsByName("review_title")[index].innerHTML;
	review.value = document.getElementsByName("review_com")[index].innerHTML;
	console.log("인덱스::"+index);
	console.log(review.value);
		
	
	
	
	

		
// 리뷰 수정시, 평점 아이콘에 색 변경 
		if(event_review_grade == 5){
			modify_good.style.color = 'orange';
			modify_soso.style.color = 'silver';
			modify_bad.style.color = 'silver';
		}else if(event_review_grade == 3){
			modify_good.style.color = 'silver';
			modify_soso.style.color = 'orange';
			modify_bad.style.color = 'silver';
		}else{
			modify_good.style.color = 'silver';
			modify_soso.style.color = 'silver';
			modify_bad.style.color = 'orange';
		}
// 리뷰 수정시, 클릭 했을 때 색 변경 -> 이동 		
/* 		const modify_good = document.getElementById("modify_good");
		const modify_soso = document.getElementById("modify_soso");
		const modify_bad = document.getElementById("modify_bad"); */
		console.log("실행완료");
		modify_grade.value = event_review_grade;
		
		
		
		modify_good.onclick = function(){
			modify_good.style.color="orange";
			modify_soso.style.color="silver";
			modify_bad.style.color="silver";
			modify_grade.value = 5;
			console.log(modify_grade.value);
		}
		modify_soso.onclick = function(){
			modify_good.style.color="silver";
			modify_soso.style.color="orange";
			modify_bad.style.color="silver";
			modify_grade.value = 3;
			console.log(modify_grade.value);
		}
		modify_bad.onclick = function(){
			modify_good.style.color="silver";
			modify_soso.style.color="silver";
			modify_bad.style.color="orange";
			modify_grade.value = 1;
			console.log(modify_grade.value);
		}
	
	
}
	
	
</script>



<style type="text/css">
	
	
	.carousel-item {	
		height: 400px; 	
		width: 100%;
	
	}
	.carousel-slide {	
		width: 100%;
	}
	
	.carousel-indicators button 
	{
		background-color: gray;
	}
	.link-button
	{
		width: 100%;
		height: 100%;
	}
	.overflow-hidden {
	  overflow: hidden;
	   
	}
	
	

</style>
<body style="background-color:#f5fffd;">
	
	
<div class="container-fluid offset-2 col-md-8 shadow-sm overflow-hidden" style="background-color:white; font-family:'TheJamsil5Bold';">
	<div id="googtransko" class="goog-te-gadget" style="white-space:nowrap;">
	<!-- 메인 부문 ======================================================================= -->
	
		<div class="tab-content card my-2">
			<div id="myCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item d-flex active">
						<c:forEach items="${attach}" var="event" begin="1" end="3" >
							<img class="icon d-block w-33 mx-1 my-2" src="<%=request.getContextPath()%>/resources/upload/${event.attach_physical_name}" alt="아이콘" width="33%" height="100%">
						</c:forEach>
					</div>	
				    <div class="carousel-item d-flex">
				    <!-- 두 번째 세트의 이미지 -->
			    		<c:forEach items="${attach}" var="event" begin="4" end="6">
							<img class="icon d-block w-33 mx-1 my-2" src="<%=request.getContextPath()%>/resources/upload/${event.attach_physical_name}" alt="아이콘" width="33%" height="100%">							
						</c:forEach>				
					</div>
				    <div class="carousel-item  d-flex">
				      <!-- 세 번째 세트의 이미지 -->
						<c:forEach items="${attach}" var="event" begin="7" end="9">
							<img class="icon d-block w-33 mx-1 my-2" src="<%=request.getContextPath()%>/resources/upload/${event.attach_physical_name}" alt="아이콘" width="33%" height="100%">							
						</c:forEach>				
				    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev" onclick="prevCarousel()">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">이전</span>					
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next" onclick="nextCarousel()">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">다음</span>
			  </button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col text-center my-3 my-md-4">
			<h1 class="place_name">${ev.event_title}</h1>
			<h6 class="preriod d-flex flex-column">			
				<span class="local_info mr-1">
					${ev.event_local}		
				</span>
				<span class="date_format pl-5">
					${ev.event_start}	
					-
					${ev.event_end}			
					<span class="btn status_eventdate2 text-white p-0 px-2">
						예정
					</span>			
				</span>
			</h6>
			<div class="float-left justify-content-between px-2">
				<button type="button" class="btn btn-warning ms-2" data-bs-toggle="modal" data-bs-target="#reportModal1">
					신고하기
				</button>
				
				<!-- Modal -->
				<div class="modal custom-modal fade" id="reportModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
       <!--  <div class="modal-dialog modal-dialog-centered modal-lg"> -->
			        <div class="modal-dialog modal-lg">
			            <div class="modal-content" style="display:flex; z-index:1500;">
			                <div class="modal-header">
			                    <h5 class="modal-title" id="exampleModalLabel">맛집 신고</h5>
			                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			                </div>
			                <div class="modal-body">
			                <label for="reportReason" class="form-label float-left">신고 이유</label><br>
			                
						       <!-- 신고 이유 입력란 -->
						      <div class="float-left" style="margin-right:20px; display:inline-block;">
								<input class="form-check-input" type="radio" name="food_report_reson" value="스팸">
								<label class="form-check-label" for="reason1">스팸</label>
						      </div>
						       <div class="float-left" style="margin:0px 20px; display:inline-block;">
								<input class="form-check-input" type="radio" name="food_report_reson" value="욕설 및 비방">
							    <label class="form-check-label" for="reason2">욕설 및 비방</label>
						      </div>
						      <div class="float-left" style="margin:0px 20px; display:inline-block;">
								<input class="form-check-input" type="radio" name="food_report_reson" value="부적절한 콘텐츠">
							    <label class="form-check-label" for="reason3">부적절한 콘텐츠</label>
						      </div>
						      <div class="float-left" style="margin:0px 20px; display:inline-block;">
								<input class="form-check-input" type="radio" name="food_report_reson" value="기타">
							    <label class="form-check-label" for="reason4">기타 </label>
						      </div><br><br>
						       <div class="mb-3">
						           <label for="reportReason" class="form-label float-left">신고 내용 </label>
						           <textarea style="resize:none" class="form-control" id="food_report_content" name="food_report_content" rows="4"></textarea>
						       </div>
						   </div>
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			                    <button type="button" class="btn btn-primary" onclick="insert_report()">신고 완료</button>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			<div class="float-right justify-content-between px-2">
				<%
					if( login != null )
					{
						%><a href="eventDelete.do?event_number=${ev.event_number}" class=" float-right btn btn-danger btn-arca-article-write" title="글삭제"><span class="ion-compose"></span>&nbsp;글삭제</a><%
					}
				%>
			</div>
			<div class="float-right justify-content-between">
				<%
					if( login != null )
					{
						%><button class="btn btn-outline-secondary" onclick="location.href='eventModify.do?event_number=${ev.event_number}'">축제 정보 수정</button><%
					}
				%>
			</div> 
					
		</div>
	</div>
	<nav class="row mb-3 text-center py-2 shadow-sm">
		<ul class="col-4 ">
			<a type="button" class="btn btn-light nav-link link-button" href="#scrollspyHeading1">
				행사정보
			</a>
		</ul >
		<ul class="col-4 border-start">
			<a type="button" class="btn btn-light nav-link link-button" href="#scrollspyHeading2">
				리뷰
			</a>
		</ul >
		<ul class="col-4 border-start">
			<a type="button" class="btn btn-light nav-link link-button" href="#scrollspyHeading3">
				위치안내
			</a>
		</ul>
	</nav >
	<div class="col-lg-10 mx-auto ">
	<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class=" mx-auto py-2" tabindex="0" id="scrollspyHeading1" >
		<h3>행사기간</h3>
		<br>
		<h4 style="color:gray">${ev.event_start} ~ ${ev.event_end}	</h4>
	</div>
	<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top mx-auto py-2" tabindex="0"  >
		<h3>행사장소</h3>
		<br>
		<h4 style="color:gray">${ev.event_local}</h4>
	</div>
	<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top mx-auto py-2" tabindex="0"  >
		<h3>이용요금</h3>
		<br>
		<h4 style="color:gray">무료</h4>
	</div>
	
	<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top border-bottom mx-auto py-2" tabindex="0"  >
		<h3>전화번호</h3>
		<br>
		<h4 style="color:gray">${ev.event_tel}</h4>
	</div>
	<div class="detail_info mb-5 expandable-init pt-2" style="padding-top: 1px; padding-bottom: 1px;">
		<div class=" mb-4 justify-content-center lead" id="summernote-content">				
			${ev.event_content}			
			<button type="button" class="btn btn-link mb-4 text-end" href="#" id="load">
			MORE
			</button>
		</div>
		
		
	</div>
<script type="text/javascript">
  function DoSubmit() {
	if ($("#comment_title").val() == "") {
	 alert("제목을 입력하세요");
	 $("#comment_title").focus();
	 return false;
    }
    if ($("#comment_content").val() == "") {
	      alert("내용을 입력하세요");
	      $("#comment_content").focus();
	      return false;
	    }
	comment_content = comment_content.replace("<p>","");
	comment_content = comment_content.replace("</p>","");
	
    return confirm("작성된 게시물을 저장하시겠습니까?");
  }
</script>	
<div class="border-top mx-auto py-2 d-flex justify-content-between" data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" tabindex="0" id="scrollspyHeading2">
  <h3 >
    리뷰 (<span name="count_all">${erv.count_all}</span>)
  </h3>
  <div class="col-md-8 me-5 ps-0 pe-5 pt-1 d-flex ">
    <h4 style="color: black;">
      <span class=" me-5"style="color:silver; margin-right: 10px;">
        전체(<span name="count_all">${erv.count_all}</span>)&nbsp;&nbsp;|&nbsp;
        맛있다(<span id="count_good">${erv.count_good}</span>)&nbsp;&nbsp;|&nbsp;
        괜찮다(<span id="count_soso">${erv.count_soso}</span>)&nbsp;&nbsp;|&nbsp;
        별로(<span id="count_bad">${erv.count_bad}</span>)&nbsp;&nbsp;&nbsp;
      </span>
    </h4>

  </div>
   	<div class="row col-md-2 align-items-md-end float-right px-3">
		<%
				if( login != null )
				{
					%><button type="button" class="btn btn-primary nav-link link-buttonfloat-right" data-bs-toggle="modal" data-bs-target="#exampleModalCenteredScrollable2">
		 리뷰작성
		</button><%
				}
			%>
      <%--   <button type="button" class="btn btn-primary nav-link link-button"
        onclick="location.href ='<%=request.getContextPath()%>/event/eventReviewWrite.do?event_number=${ev.event_number}'">
           	 리뷰작성
        </button> --%>
	</div>
</div>
	<div class="modal fade" id="exampleModalCenteredScrollable2" tabindex="-1" aria-labelledby="exampleModalCenteredScrollableLabel2" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable modal-xl">
		    <div class="modal-content" style="height:60%">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenteredScrollableLabel">리뷰 더보기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <!-- 모달 내용을 이곳에 추가 -->
		        <div style="margin:20px; text-align:left;">
		        	<form name="write" method="post" action="eventReviewWrite.do" onsubmit="return DoSubmit();">
		        		<input type="hidden" name="event_number" value="${ev.event_number}">
						<p><span style="color:#ff7f00; font-size:20pt;">축제&nbsp;</span><span style="color:silver;">에 대한 솔직한 맛 리뷰를 써주세요</span></p>
							<div class="review1 card ">
								<div class="form-group mb-0">
									<div class="rating-buttons d-flex mt-3 ps-3">
										<input type ="hidden" id="grade" name="event_review_grade" value="5" >
										<p class="flex" style="color:orange;" id="good">
											<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16"  >
												<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
												<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75a.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25a.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1 .672-1 1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
											</svg>&nbsp;&nbsp;&nbsp;맛있다&nbsp;&nbsp;&nbsp;
										</p>
										<p class="flex" style="color:silver;" id="soso">
											<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16" >
												<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
												<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
											</svg>&nbsp;&nbsp;&nbsp;괜찮다&nbsp;&nbsp;&nbsp;
										</p>
										<p class="flex" style="color:silver;" id="bad">
											<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16"  >
												<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
												<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25a.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
											</svg>&nbsp;&nbsp;&nbsp;별로&nbsp;&nbsp;&nbsp;
										</p>
									</div>
								</div>
								<div class="form-group px-1 py-1">
									
										<span style="font-weight:bold; font-size:15pt; text-color:silver;;">리뷰 제목 </span>
									<input type="text" name="comment_title" class="form-control form-control-sm mb-2" value="${erv.comment_title}" id="${erv.comment_title}" maxlength="256" required="">
									<div class="form-floating">
									  <textarea class="form-control" name="comment_content" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px" value="${erv.comment_content}">${erv.comment_content}</textarea>
									  <label for="floatingTextarea2" style="text-color:silver;"></label>
									</div>
								</div>
							</div>
							<p style="color:silver; float:right;">0/10000</p><br>
							<div class="container1" style="text-align: right;">
								<button type="button" class="btn btn-danger" data-bs-dismiss="modal" aria-label="Close">취소</button>
								<button class="btn btn-light " type="submit" style="width:10%; padding:5px;" onclick="DoSubmit();">리뷰 올리기</button>	
							</div>
						</form>
					</div>
		    	</div>
		    </div>
		  </div>
		</div>
		
		
		<!-- Modal -->
		<div class="modal custom-modal fade" id="reportModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <!--  <div class="modal-dialog modal-dialog-centered modal-lg"> -->
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content" style="display:flex; z-index:1500;">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">맛집 신고</h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                <label for="reportReason" class="form-label float-left">신고 이유</label><br>
	                
				       <!-- 신고 이유 입력란 -->
				      <div class="float-left" style="margin-right:20px; display:inline-block;">
						<input class="form-check-input" type="radio" name="food_report_reson" value="스팸">
						<label class="form-check-label" for="reason1">스팸</label>
				      </div>
				       <div class="float-left" style="margin:0px 20px; display:inline-block;">
						<input class="form-check-input" type="radio" name="food_report_reson" value="욕설 및 비방">
					    <label class="form-check-label" for="reason2">욕설 및 비방</label>
				      </div>
				      <div class="float-left" style="margin:0px 20px; display:inline-block;">
						<input class="form-check-input" type="radio" name="food_report_reson" value="부적절한 콘텐츠">
					    <label class="form-check-label" for="reason3">부적절한 콘텐츠</label>
				      </div>
				      <div class="float-left" style="margin:0px 20px; display:inline-block;">
						<input class="form-check-input" type="radio" name="food_report_reson" value="기타">
					    <label class="form-check-label" for="reason4">기타 </label>
				      </div><br><br>
				       <div class="mb-3">
				           <label for="reportReason" class="form-label float-left">신고 내용 </label>
				           <textarea style="resize:none" class="form-control" id="food_report_content" name="food_report_content" rows="4"></textarea>
				       </div>
				   </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	                    <button type="button" class="btn btn-primary" onclick="insert_report()">신고 완료</button>
	                </div>
	            </div>
	        </div>
	    </div>
		<c:forEach items="${list}" var="review">
			<div class="lead review container review-container card py-3 my-2 shadow-sm lead" >
				<div class="row">
					<div class="col-md-2 text-center px-0">
			            <h1 class="font-400 ">
			                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-person-circle " viewBox="0 0 16 16" color="gray">
			                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			                    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			                </svg>
			                <br>
			            </h1>
			             <h3>
		                ${login.uName}	
		                </h3>		              
		                  
			        </div>
			        
			        <div class="col-md-10 ">
						<button class="btn btn-outline-danger btn-sm py-0 ml-3 delbutton float-right" onclick="confirmDelete()">
							리뷰삭제
						</button>
						<form action="eventReviewDelete.do" method="POST" id="deleteForm">
							<input type="hidden" name="comment_number" value="${review.comment_number}">
							<input type="hidden" name="event_number" value="${review.event_number}">
				        </form>
				        <div class="modal fade" id="exampleModalCenteredScrollable3" tabindex="-1" aria-labelledby="exampleModalCenteredScrollableLabel3" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-scrollable modal-xl">
								    <div class="modal-content" style="height:60%">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalCenteredScrollableLabel">리뷰 수정</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <!-- 모달 내용을 이곳에 추가 -->
								        <div style="margin:20px; text-align:left;">
								        	<form name="write" method="post" action="eventReviewModify.do">
									        	<input type="hidden" id="comment_number" name="comment_number1">
									        	<input type="hidden" name="event_number" value="${review.event_number}">
												<p><span style="color:#ff7f00; font-size:20pt;">축제&nbsp;</span><span style="color:silver;">에 대한 솔직한 맛 리뷰를 써주세요</span></p>
													<div class="review1 card ">
														<div class="form-group mb-0">
															<div class="rating-buttons d-flex mt-3 ps-3">
																<input type ="hidden" id="modify_grade" name="event_review_grade" value="5" >														
																<p class="flex" style="color:orange;" id="modify_good">
																	<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16"  >
																		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																		<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75a.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25a.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1 .672-1 1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
																	</svg>&nbsp;&nbsp;&nbsp;맛있다&nbsp;&nbsp;&nbsp;
																</p>
																<p class="flex" style="color:sliver;" id="modify_soso">
																	<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16" >
																		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																		<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
																	</svg>&nbsp;&nbsp;&nbsp;괜찮다&nbsp;&nbsp;&nbsp;
																</p>
																<p class="flex" style="color:sliver;" id="modify_bad">
																	<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16"  >
																		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																		<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25a.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
																	</svg>&nbsp;&nbsp;&nbsp;별로&nbsp;&nbsp;&nbsp;
																</p>
															</div>
														</div>
														<div class="form-group px-1 py-1">
															<input type="hidden" id="com_number" value="${erv.comment_number}">
																<span style="font-weight:bold; font-size:15pt; text-color:silver;;">리뷰 제목 </span>
															<input type="text" name="comment_title" class="form-control form-control-sm mb-2" value="${erv.comment_title}" id="review_title" maxlength="256" required="">
															
															<div class="form-floating">
															  <textarea class="form-control" name="comment_content" placeholder="Leave a comment here" id="floatingTextarea3" style="height: 200px">${erv.comment_content}</textarea>
															  <label for="floatingTextarea3" style="text-color:silver;"></label>
															</div>
														</div>
													</div>
													<p style="color:silver; float:right;">0/10000</p><br>
													<div class="container1" style="text-align: right;">
														<button type="button" class="btn btn-danger" data-bs-dismiss="modal" aria-label="Close">취소</button>
														<button class="btn btn-light " type="submit" style="width:10%; padding:5px;">리뷰 올리기</button>	
													</div>
												</form>
											</div>
								    	</div>
								    </div>
								  </div>
								</div>
								<%
									if( login != null )
									{
										%><button type="button" name="mobutton" onclick="eventReviewModify(this,${review.comment_number})" class="btn btn-outline-dark btn-sm py-0 ml-3 delbutton float-right" data-bs-toggle="modal" data-bs-target="#exampleModalCenteredScrollable3">
											 리뷰수정
											</button><%
									}
								%>
						<h3>
						<span class="number"  name="com_number">${review.comment_number}</span>.
						<span class="title px-2" name="review_title" value="${review.comment_title}">${review.comment_title}</span> 
						<button type="button" class="btn btn-sm btn-warning ms-2" data-bs-toggle="modal" data-bs-target="#reportModal2">
							신고하기
						</button>
						</h3>
						<span name="review_com" class="bottom-10 py-md-1 Place_ReviewContent">${review.comment_content}</span>
						<div class="d-flex float-right me-3" name="review_icon" style="border:0px solid black; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;">
							<c:if test="${review.event_review_grade eq 5}">
								<svg xmlns="http://www.w3.org/2000/svg" style="color:orange;" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
									<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
									<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75a.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25a.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1 .672-1 1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
								</svg><br> 
								<span style="font-size:18px; color:orange; ">맛있다</span>
							</c:if>
							
							<c:if test="${review.event_review_grade eq 3}">
							<svg xmlns="http://www.w3.org/2000/svg" style="color:orange;" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
								<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
							</svg><br> 
							<span style="font-size:18px; color:orange; ">괜찮다</span>
							</c:if>
							
							<c:if test="${review.event_review_grade eq 1}">					
							<svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
								<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
							</svg><br> 
							<span style="font-size:18px; color:orange; ">별로</span>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<button type="button" class="btn btn-link mb-4 text-end" href="#" id="load">
			더보기
		</button>
		
		
<!-- 			<p style="text-align: center;"><span style="color:#000000;"> 첫 리뷰를 작성해 주세요 </span></p> -->
	<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="border-top mx-auto py-3 mt-5" tabindex="0" id="scrollspyHeading1" >
		<p class="ititle" id="scrollspyHeading3">위치안내</p>
		<br>
		
		<div id="map" style="width: 100%; height: 40vh; overflow: hidden;"></div>
	</div>
	
<!-- 	<div class="row">
		<div class="col-12 col-md-6" id="scrollspyHeading3">
		<p class="ititle1 mt-3 my-md-4">주변 음식</p>					
			<div class="double-slider-hold-arround owl-carousel owl-no-dots visible-slider-medium owl-loaded owl-drag">
				<div class="owl-stage-outer">
					<div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 2275px;">
						<div class="owl-item active" style="width: 222.5px; margin-right: 5px;">
							<a href="https://xn--ok0b236bp0a.com/place/6541" onfocus="blur()" class="" target="_self">
								<div class="card caption arround_place" data-uid="6541">
									<img class="caption-image  lazyload ing_fest" src="https://image.xn--ok0b236bp0a.com/content_place_info/thumb-2020021318244515815858855751_380x380.jpg" data-src="https://image.xn--ok0b236bp0a.com/content_place_info/thumb-2020021318244515815858855751_380x380.jpg">
									<div class="card-body text-center my-2 p-1">
										<h5 class="card-title ing_card_title">두꺼비회관</h5>
										<span class="card-text ">
											<small class=" ing_card_desc ">김제시 동서8길 <span class="badge badge-secondary distancce_near">7 km</span></small>
										</span>
									</div>
								</div>
							</a>
						</div>
						<div class="owl-item active" style="width: 222.5px; margin-right: 5px;">
							<div>
								<a href="https://xn--ok0b236bp0a.com/place/4804" onfocus="blur()" class="" target="_self">
									<div class="card caption arround_place" data-uid="4804">
										<img class="caption-image  lazyload ing_fest" src="https://image.xn--ok0b236bp0a.com/content_place_info/thumb-2020021316594315815807838712_380x380.jpg" data-src="https://image.xn--ok0b236bp0a.com/content_place_info/thumb-2020021316594315815807838712_380x380.jpg" title="">
										<div class="card-body text-center my-2 p-1">
											<h5 class="card-title ing_card_title">지평선바지락죽</h5>
											<span class="card-text ">
												<small class=" ing_card_desc ">김제시 중앙로 <span class="badge badge-secondary distancce_near">7 km</span></small>
											</span>
											
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="owl-nav disabled"><div class="owl-prev"><i class="fa fa-angle-left"></i></div><div class="owl-next"><i class="fa fa-angle-right"></i></div></div><div class="owl-dots"><div class="owl-dot active"><span></span></div><div class="owl-dot"><span></span></div><div class="owl-dot"><span></span></div><div class="owl-dot"><span></span></div><div class="owl-dot"><span></span></div></div>
			</div>
		</div>
	</div>	 -->
</div>	
</div>
		<!-- 메인 부문 ======================================================================= -->
	

		
	

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=471bd87d2c2bfa282198a74a11556a57&libraries=services"></script>
<%@ include file="../include/footer.jsp" %>