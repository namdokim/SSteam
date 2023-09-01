<%@page import="com.ss.demo.domain.EventVO"%>
<%@page import="com.ss.demo.domain.PageMaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%@ page import="java.util.List" %>
<%
	// 게시판 타입이 선택되었는지 확인후, 기본값 셋팅
String type = request.getParameter("type");
if( type == null || type.equals("") )
{
	type = "TT"; 			// 전체게시판으로 셋팅
}

EventVO vo = new EventVO();

// 본문에 포함된 엔터문자를 <br>태그로 변경한다
if (vo.getEvent_content() != null) {
	vo.setEvent_content(vo.getEvent_content().replace("\n", "<br>"));
}
PageMaker pageMaker = (PageMaker)request.getAttribute("pageMaker");
%>
<script>
window.onload = function(){
	const event_count = document.getElementsByName("event_count");
	for(var i = 0; i< document.getElementsByName("like").length; i++){
		console.log(event_count[i].value);
		if(event_count[i].value == 0){
			document.getElementsByName("dislike")[i].style.display="none";
			document.getElementsByName("like")[i].style.display="block";	
		}else{
			document.getElementsByName("dislike")[i].style.display="block";
			document.getElementsByName("like")[i].style.display="none";				
		}
	}
}

function insert_like(obj,event_number)
{
	const like = document.getElementsByName("like");
	const dislike = document.getElementsByName("dislike");
	const index = Array.from(like).indexOf(obj);
	
	console.log(Array.from(like).indexOf(obj));
	
	
	
	console.log(event_number);
	
	$.ajax({
         url: 'insert_like.do', // 요청할 URL
         method: 'POST', // HTTP 메서드
         data:{
        	 event_number:event_number
         },
         success: function(data) {
			if( data == 1 ){
			dislike[index].style.display="block";
			like[index].style.display="none";	
        	alert("등록되었습니다")
				
			}else
			{				
				
			alert("이미 누르셨습니다")
			
			}
			
         },
         error: function(xhr, status, error) {
        	
             console.log('등록 실패:', error);
         }
     });
}
function delete_like(obj,event_number)
{
	const like = document.getElementsByName("like");
	const dislike = document.getElementsByName("dislike");
	const index = Array.from(dislike).indexOf(obj);

	console.log(Array.from(dislike).indexOf(obj));
	
	$.ajax({
	    url: 'delete_like.do', // 요청할 URL
	    method: 'POST', // HTTP 메서드
	    data:{
	    	event_number: event_number
	    },
	    success: function(data) {
	        // 요청 성공 시 호출되는 콜백 함수
	        dislike[index].style.display="none";
			like[index].style.display="block";	
        	alert("삭제되었습니다")
	        console.log('데이터 가져오기 성공:', data);
	    },
	    error: function(xhr, status, error) {
	        // 요청 실패 시 호출되는 콜백 함수
	         alert("삭제실패")
	        console.log('데이터 가져오기 실패:', error);
	    }
	});
}


$(document).ready(function() {
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
    if (itemsToShow >= $('.lead').length) {
      $('#load').hide();
	
		}
  });
});


<%-- function insert(index,event_number)
{
	/* alert("가고싶다를 등록 완료 했습니다."); */
	var like_empty = document.getElementsByClassName("dislike")[index];
	var like_full = document.getElementsByClassName("like")[index];

	$.ajax({
	    		url: 'insert_like.do', 
	    		method: 'post', 
	    		data:{ 
	    			event_number:event_number
	    		},											
	    		success: function(data){
	    			if(data == 1){
		    			like_empty.style.display="none";
		    			like_full.style.display="block";
	    			}else{
	    				alert("로그인을 해주세요. ")
	    				location.href = "<%=request.getContextPath()%>/User/userLogin.do";
	    				
	    			}
	    			/* like_count.innerHTML = data; */
	    		},
	    		error: function(xhr, status, error){
	    			console.log('Error:', error);
	    		}
	    	});  
	
}	
function delete_(index,event_number){
	var like_empty = document.getElementsByClassName("dislike")[index];
	var like_full = document.getElementsByClassName("like")[index];
	
	$.ajax({
		url: 'delete_like.do', 
		method: 'post', 
		data:{ 
			event_number:event_number
		},											
		success: function(data){
			
			like_full.style.display="none";
			like_empty.style.display="block";
			/* like_count.innerHTML = data; */
		},
		error: function(xhr, status, error){
			console.log('Error:', error);
		}
	});  
}
 --%>

</script>
	<style type="text/css">

	a {
		text-decoration:none;
		color:black;
	}
	.view{
		border-radius:10px;
		background-color:white;
	
	}
	.search{
		border:none;
		color:#444444;
	}
	.search:hover{
		border-bottom:2px solid #0863ec;
		border-radius:0px;
	}
	.hotel {
		background-image: url(../img/hotel.jpg);
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	.image {
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	.like {
		background-size: contain;
		background-repeat: no-repeat;
		background-position: center;
	}
	.datepicker{
		font-weight:bold;
	}
	
.middle {
  position: relative;
  width: 100%;
  max-width: 500px;
}

.slider {
  position: relative;
  z-index: 1;
  height: 5px;
  margin: 0 15px;
}
.slider > .track {
  position: absolute;
  z-index: 1;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  border-radius: 5px;
  border-shadow:2px 2px 2px 2px #dddddd;
  background-color: #e2e2e2;
}
.slider > .range {
  position: absolute;
  z-index: 2;
  left: 25%;
  right: 25%;
  top: 0;
  bottom: 0;
  border-radius: 5px;
  background-color: #017fee;
}
.slider > .thumb {
  position: absolute;
  z-index: 3;
  width: 20px;
  height: 20px;
  background-color: #017fee;
  border-radius: 50%;
  top:50%;
}
.slider > .thumb.left {
  left: 25%;
  transform: translate(-15px, -10px);
}
.slider > .thumb.right {
  right: 25%;
  transform: translate(15px, -10px);
}

input[type="range"] {
  position: absolute;
  /* opacity로 가린 것을 이벤트도 비활성화하기 위해 */
  pointer-events: none;
  -webkit-appearance: none;
  z-index: 2;
  height: 5px;
  width: 100%;
  opacity: 0;
  left:0%;
}
input[type="range"]::-webkit-slider-thumb {
  /* 겹쳐진 두 thumb를 모두 활성화 */
  pointer-events: all;
  width: 20px;
  height: 20px;
  border-radius: 0;
  border: 0 none;
  background-color: red;
  cursor: pointer;

  /* appearance를 해야 위의 스타일들을 볼 수 있음 */
  -webkit-appearance: none;
}
.avg{
	display:inline-block;
	width:40px;
	font-weight:bold;
	font-size:10pt;
	background-color:#f7f7f7;
	border-radius:3px;
	margin:20px 0px;
	padding:3px 0px;
	cursor:pointer;
}
.check{
	margin:20px 0px;
	width:100%;
	text-align:left;
}
.check > input[type=checkbox]{
	margin:0px 10px;
	width:15px;
	height:15px;
}
.check > input[type=radio]{
	margin:0px 10px;
	width:15px;
	height:15px;
}
.container-fluid {
    margin-left: 0;
    margin-right: 0;
    padding: 0; /* Optional: If you want to remove padding as well */
    z-index:0;
  }
.masthead:before {
    content: "";
    position: absolute;
    background-color: #1c375e;
    height: 100%;
    width: 100%;
    top: 0;
    left: 0;
    opacity: 0.5;
}		
.masthead {
    position: relative;
    background: url(../img/backboard.jpg) no-repeat center center ;
    background-size: cover;
    height:400px
}	
</style>
<div class="container-fluid " style="background-color:#fafefb;">
	<div class="masthead py-5">
		<div class="container position-relative">
		    <div class="row justify-content-center">
		        <div class="col-xl-9">
		            <div class="text-center text-white">
		                <!-- Page heading-->
		                	<br>
		                	<br>
		                	<br>
		                	<div class="py-0" style="font-size: 10pt; ">현재 축제 307개 | 2023-09-07</div>
								<h2> 지역별 축제 TOP 5</h2>
								<h6 class="mb-1">“신나는 여행으로 즐거운 추억을 만들어보세요!”</h6>
								<br>
							<form class="form-subscribe" action="eventMain.do" method="get" id="contactForm" data-sb-form-api-token="API_TOKEN">
								    <!-- Email address input-->
								<div class="row">
									<div class="col-auto px-0" style="display: none;">
								    	<select class="form-select-sm font-weight-bold " size="1" aria-label="Size 3 select example" style="height: 50px; color:#777777;" >
											<option value="event_title" >축제 이름</option>
										</select>
									 </div>	
								    <div class="col">
								        <input class="form-control form-control-lg" id="emailAddress" type="text" placeholder="검색어를 입력하세요" data-sb-validations="required,email" data-sb-can-submit="no">
								        <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:required">Email Address is required.</div>
								        <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:email">Email Address Email is not valid.</div>
								    </div>
								    <div class="col-auto"><button class="btn btn-lg " id="submitButton" type="submit" style="background-color: #02c9a5; color: white">검색</button></div>
								</div>
								<div class="pt-4 mb-5 " style="text-align: center;">
									<%
										if( login != null )
										{
											%>
											<a class="btn btn-lg" style="background-color: #02c9a5; color: white" href="eventWrite.do?type=<%= type %>" >글쓰기</a>
											
												
											<%
										}
									%>
								 
								</div>
								<!-- Submit success message-->
								<!---->
								<!-- This is what your users will see when the form-->
								<!-- has successfully submitted-->
		                        <div class="d-none" id="submitSuccessMessage">
		                            <div class="text-center mb-3">
		                                <div class="fw-bolder">Form submission successful!</div>
		                                <p>To activate this form, sign up at</p>
		                                <a class="text-white" href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
		                            </div>
		                        </div>
		                        <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
					
<!-- <body> -->
	
	<div class="row justify-content-center">
		<div class="col-12 col-md-8 text-center ">
			<div class="root-container" style=" margin: 20px 18px 0px 0px; vertical-align: top;">
				<div class="row me-3">
					<div class="root-container" style=" margin: 20px 18px 0px 0px; vertical-align: top;">
						<div class="row justify-content-center me-5">					
							<div class="shadow-sm col-md-3 mt-2 card rounded-3" style="height: 900px; padding: 10px; position:sticky;" >
								<a href="#" class="d-flex align-items-center my-3 mb-md-0 me-md-auto link-dark text-decoration-none offset-3">
								<span class="fs-4 ms-3 font-weight-bold" >지역별 구분</span>
								</a>
								<hr>
								<ul class="nav nav-pills flex-column mb-auto fw-semibold">
									<% String activeTab = type != null && !type.equals("") ? type : "TT"; %>
									<%
										String boardTitle = "";
										switch (type)
										{
											case "TT":
										        boardTitle = "전체";
										        activeTab = "TT";
										        break;
										    case "GG":
										        boardTitle = "경기";
										        activeTab = "GG";
										        break;
										    case "GW":
										        boardTitle = "강원";
										        activeTab = "GW";
										        break;
										    case "CB":
										        boardTitle = "충북";
										        activeTab = "CB";
										        break;
										    case "CN":
										        boardTitle = "충남";
										        activeTab = "CN";
										        break;
										    case "GB":
										        boardTitle = "경북";
										        activeTab = "GB";
										        break;
										    case "GN":
										        boardTitle = "경남";
										        activeTab = "GN";
										        break;
										    case "JB":
										        boardTitle = "전북";
										        activeTab = "JB";
										        break;
										    case "JN":
										        boardTitle = "전남";
										        activeTab = "JN";
										        break;
										    case "JJ":
										        boardTitle = "제주";
										        activeTab = "JJ";
										        break;
										}
									%>
								
								
									<li class="nav-item" >
										<a href="eventMain.do?type=TT" class="nav-link link-dark  <%= activeTab.equals("TT") ? "active" : "" %>"  style="text-align:center;">
											
											전체
										</a>
									</li>
									<li>
										<a href="eventMain.do?type=GG" class="nav-link link-dark <%= activeTab.equals("GG") ? "active" : "" %>" style="text-align:center;">
											
											서울 / 경기
										</a>
									</li>
									<li>
										<a href="eventMain.do?type=GW" class="nav-link link-dark <%= activeTab.equals("GW") ? "active" : "" %>" style="text-align:center;">
											
											강원
										</a>
									</li>
									<li>
										<a href="eventMain.do?type=CB" class="nav-link link-dark <%= activeTab.equals("CB") ? "active" : "" %>" style="text-align:center;">
											
											충북
										</a>
									</li>
									<li>
										<a href="eventMain.do?type=CN" class="nav-link link-dark <%= activeTab.equals("CN") ? "active" : "" %>" style="text-align:center;">
											
											충남
										</a>
									</li>
									<li>
										<a href="eventMain.do?type=GB" class="nav-link link-dark <%= activeTab.equals("GB") ? "active" : "" %>" style="text-align:center;">
											
											경북
										</a>
									</li>
									<li>
										<a href="eventMain.do?type=GN" class="nav-link link-dark <%= activeTab.equals("GN") ? "active" : "" %>" style="text-align:center;">
											
											경남
										</a>
									</li>
									<li>
										<a href="eventMain.do?type=JB" class="nav-link link-dark <%= activeTab.equals("JB") ? "active" : "" %>" style="text-align:center;">
											
											전북
										</a>
									</li>
									<li>
										<a href="eventMain.do?type=JN" class="nav-link link-dark <%= activeTab.equals("JN") ? "active" : "" %>" style="text-align:center;">
											전남
										</a>
									</li>
									<li>
										<a href="eventMain.do?type=JJ" class="nav-link link-dark <%= activeTab.equals("JJ") ? "active" : "" %>" style="text-align:center;">
											
											제주
										</a>
									</li>
								</ul>
							
							</div>
							
							<div class="col-md-9" style="max-width: 900px">
								<c:forEach items="${list}" var="event" begin="0" end="5" varStatus="status">
									<div class="view border pe-5 shadow-sm d-flex my-2" style=" width: 900px;">										
											<!-- 이미지 -->
												<!-- <img src="https://mp-seoul-image-production-s3.mangoplate.com/406312/1763517_1635134765363_16478?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일"> -->
												<c:choose>
													<c:when test="${empty event.attach_logical_name}">
														<div class="restaurant-thumbnail flex-shrink-0 mx-3 py-2">
														<%-- <img onclick="location.href ='<%=request.getContextPath() %>/food/foodView.do?fNo=${food.fNo}'" src="https://mp-seoul-image-production-s3.mangoplate.com/406312/1763517_1635134765363_16478?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일"> --%>
															<img class="rounded-2" style="cursor: pointer; width: 200px; height: 180px;" onclick="location.href ='<%=request.getContextPath() %>/event/eventView.do?event_number=${event.event_number}'" src="https://mp-seoul-image-production-s3.mangoplate.com/406312/1763517_1635134765363_16478?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일">
														</div>
													</c:when>
													<c:otherwise>
														<div class="restaurant-thumbnail flex-shrink-0 mx-3 py-2">
															<img class="rounded-2" style="cursor: pointer; width: 200px; height: 180px;" src="<%=request.getContextPath() %>/resources/upload/${event.attach_physical_name}" onclick="location.href ='<%=request.getContextPath() %>/event/eventView.do?event_number=${event.event_number}'">
														</div>
													</c:otherwise>
												</c:choose>
											<div class="restaurant-info col-7 d-flex align-items-start">
											<%-- 	<h2 class="restaurant-title"><span>${food.fNo}. </span><span>${food.food_name}</span><!-- <span class="mirai">4.7</span> --> --%>
												<div class="flex-column py-1" style="text-align: left;">
													<h2 class="restaurant-title flex-column px-1" src="<%=request.getContextPath() %>/resources/upload/${event.attach_physical_name}" onclick="location.href ='<%=request.getContextPath() %>/event/eventView.do?event_number=${event.event_number}'">
													<span>${event.event_number}. </span><span>${event.event_title} </span><span class="mirai"><c:if test="${event.avg != 0.0}">${event.avg}</c:if> </span>
													</h2>
											
													<div class="user-thumbnail py-1">
														<img class="rounded-circle" width="48" height="48" src="https://slp-
														statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?
														width=580&format=webp" alt="사용자 썸네일">
														<span class="user-nickname" >세이콩</span>
													</div>
													<p class="fs-6 restaurant-address" style="color: silver;">${event.event_local}</p>
													
												</div>
												
												
												
				<!--  글 수정, 삭제 버튼  (로그인시에만 보임/ 글쓴사람만 보임) --> 
									
												
												
														
				<!-- 해당 글을 작성한 유저에게만 삭제하기 수정하기 버튼이 보이게 함 -->		
												<%-- <% if(session.getAttribute("login") != null && session.getAttribute("login").equals(String.valueOf(food.uNo))) { %>
										        <div style="float:right;">
										            <form name="frm" action="delete.do" method="post" style="display: inline;">
										                <input type="hidden" name="fNo" value="${food.fNo}">
										                <button onclick="delFn()">삭제하기</button> 
										            </form>
										        </div>
										        <div style="float:right; margin-right: 10px;">
										            <button onclick="location.href='<%=request.getContextPath()%>/food/eventMainModify.do?fNo=${food.fNo}'">수정하기</button>
										        </div>
										    <% } %> --%>
												
				
											</div>
											<div class="flex-shrink-0  d-flex col-2 justify-content-end">
												<input type="hidden" name="event_count" value="${event.count}">
									        	<div class="flex-column me-2 my-3" style="text-align: right;">
										        	<div class="button-container mt-5 mx-3" style=" width:150px; text-align:center; position:relative;">
			 											<!-- <button class="restaurant-favorite-btn" onclick="handleFavoriteButtonClick(this);">❤</button>
			 											<p align="center"  style="font-size: 15px; color: #ff1493;">좋아요</p> -->
		 											<c:if test="${not empty login.uNo}">
														<div onclick="insert_like(this,${event.event_number})" name="like" class="button1 me-2" style="color:silver; position:absolute; top:-45px; right:0px; z-index:100;">
															<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
															  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
															</svg>
															<br>가고싶다
														</div>
														
														<div onclick="delete_like(this,${event.event_number})" name="dislike" class="button1 me-2 mb-2" style="color:orange; position:absolute; top:-45px; right:0px; z-index:100;">
															<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
															  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
															</svg>
															<br>가고싶다
														</div>
													</c:if>
													</div> 
										        	<br>
												
													<a class="btn btn-lg btn-primary mb-2 mt-4" href="<%=request.getContextPath()%>/event/eventView.do?event_number=${event.event_number}">상세보기</a>
									        	</div>
									        </div>	
									</div>
								</c:forEach>
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
								        <%-- 이전 페이지 링크 생성 --%>
								        <li class="page-item">
				<%-- 				        <% if (pageMaker.isPrev()){ %> --%>
								            <a class="page-link" href="<%=request.getContextPath()%>/event/eventMain.do?page=<%=pageMaker.getStartPage()-1%>">Previous</a>
				<%-- 						<%} %> --%>
								        </li>
										<% 
										for(int i = pageMaker.getStartPage();i<=pageMaker.getEndPage();i++) {
										%>
										<li class="page-item">
										<a class="page-link" href="<%=request.getContextPath()%>/event/eventMain.do?page=<%=i%>">
											<%=i %>
										</a>
										</li>
								        <%
								        } 
								        %>
								        <%-- 다음 페이지 링크 생성 --%>
								        <li class="page-item">
				<%-- 				        <%if(pageMaker.isNext()&&pageMaker.getEndPage()>0 ){ %> --%>
								            <a class="page-link" href="<%=request.getContextPath()%>/event/eventMain.do?page=<%=pageMaker.getEndPage()+1%>">Next</a>
				<%-- 				        <% } %> --%>
								        </li>
									</ul>
									<br>
								</nav>
							</div>
						</div>
					</div>	
				</div>
			</div>	
			
		</div>
	</div>
</div>


<%@ include file="../include/footer.jsp" %>