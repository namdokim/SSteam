<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<%
// 게시판 타입이 선택되었는지 확인후, 기본값 셋팅
String type = request.getParameter("type");
if( type == null || type.equals("") )
{
	type = "T"; 			// 전체게시판으로 셋팅
}

// 페이지번호가 선택되었는지, 확인하고, 없으면 1페이지로 가정
String curPage = request.getParameter("page");
int pageNo = 1;
try { pageNo = Integer.parseInt(curPage); }catch(Exception e) {}
System.out.println("페이지 번호 : " + pageNo);


%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<style>
		.title {
	        text-decoration: none;
	    }
	
	    .title:hover {
	        text-decoration: underline;
	    }
		 a {
        color: black;
        
    	}
		.bd-sidebar {
		  position: sticky;
		  top: 4rem;
		  height: calc(100vh - 4rem);
		  background: #eee;
		  border-right: 1px solid rgba(0,0,0,.1);
		  max-width: 220px;
		  display: flex;
		  padding: 0;
		  overflow-y: hidden;
		  flex-direction: column;
		}
		.bd-sidebar-body {
		  height: 100%;
		  overflow-y: auto;
		  display: block;
		}
		.bd-sidebar-body .nav {
		  display: block;
		}
		.bd-sidebar-body .nav>li>a {
		  display: block;
		  padding: .25rem 1.5rem;
		  font-size: 90%;
		}
		.bd-sidebar-footer {
		  padding: 1rem;
		  background: #ddd;
		}
		</style>
<!-- 메인 내용 작성 영역 =========================================== -->
<div class="container-fluid">
	<div class="row flex-nowrap" >
		<main class="col-6 offset-2 py-md-1 pl-md-5 bd-content board-article border-end border-start" style="height: 100vh;" role="main">
			<article class="container-fluid"  >
				<div class="container my-2" >
					<div class="row ">
						<div class="col-sm-2 left " style="display: flex; justify-content: center; align-items: center;">
							<a class="channel-icon-link" href="index.jsp" aria-label="채널로 이동">
								<img class="channel-icon" src="<%=request.getContextPath() %>/static/1684481351.jpeg" alt="채널 아이콘" width="64" height="64">
							</a>
						</div>
							<div class="col-sm-7 right">
								<div class="row head">	
									<div class="col-8 col-sm-6">
										<a href="index.jsp" class="title" data-channel-name="게임 게시판">
											<span title="게임 게시판" style="font-size: 20px;">게임 게시판</span>
										</a>
										<a href="index.jsp" class="info-btn" role="button">
											<span class="ion-ios-information-outline"></span>
										</a>
									</div>
									
								</div>
								<div class="description">
									<div>
									<span>구독자 xxxxx명</span>
									<span class="sep text-muted">|</span>
									<span>알림수신 xxx명</span>
									</div>
									<div>
									게임이야기를 하는채널입니다 정떡,종떡,성떡금지
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<script>
						var container = document.getElementById('map');
						var options = {
							center: new kakao.maps.LatLng(33.450701, 126.570667),
							level: 3
						};
				
						var map = new kakao.maps.Map(container, options);
					</script>
					<div id="map" style="width:500px;height:400px;"></div>
					
					
					
					
					
					
<!-- 컨테이너 기본 템플릿 =============================================== -->								
				<div class="btns-board border-top d-flex justify-content-between">					
					<div class="d-flex">
						<div class="float-left">
							<a class="btn btn-sm btn-outline-secondary btn-arca float-left border border-secondary" href="index.jsp">
								<span class="ion-android-list"></span>
								<span>전체글</span>
							</a>
						</div>
						<div class="float-start">
							<a class="btn btn-sm btn-danger float-left" href="index.jsp">
								<span class="ion-star"></span>
								<span>개념글</span>
							</a>
						</div>
						<div class="float-start">
							<select class="form-select form-select-sm" aria-label=".form-select-sm example" style="width: 75px;">
								<option value="">등록순</option>
								<option value="rating">추천순 (24시간)</option>
								<option value="rating72">추천순 (3일)</option>
								<option value="ratingAll">추천순 (전체)</option>
								<option value="commentCount">댓글갯수순 (3일)</option>
								<option value="recentComment">최근댓글순</option>
							</select>
						</div>
						<div class="float-start">
							<select class="form-select form-select-sm" aria-label=".form-select-sm example" style="width: 75px;">
								<option value="">추천컷</option>
								<option>5</option>
								<option>10</option>
								<option>20</option>
								<option>30</option>
								<option>50</option>
								<option>70</option>
								<option>100</option>
								<option value="etc">기타</option>
							</select>
						</div>
					</div>
					<div class="float-right ">
						<button type="button" class="btn btn-outline-secondary" style="--bs-btn-padding-y: auto; --bs-btn-padding-x: auto; --bs-btn-font-size: .15rem;">
							<%
								
							%>
						</button>
					</div>
				</div>	
				
				<ul class="nav nav-tabs">
					<% String activeTab = type != null && !type.equals("") ? type : "T"; %>
					<%
							String boardTitle = "";
					switch (type)
					{
					    case "T":
					        boardTitle = "전체";
					        activeTab = "T";
					        break;
					    case "N":
					        boardTitle = "공지";
					        activeTab = "N";
					        break;
					    case "I":
					        boardTitle = "정보";
					        activeTab = "I";
					        break;
					    case "P":
					        boardTitle = "파티";
					        activeTab = "P";
					        break;
					    case "S":
					        boardTitle = "나눔";
					        activeTab = "S";
					        break;
					    case "TAX":
					        boardTitle = "박제";
					        activeTab = "TAX";
					        break;
					}
							
							%>
						
				  <li class="nav-item">
				    <a class="nav-link <%= activeTab.equals("T") ? "active" : "" %>" aria-current="page" style="color: black;" href="index.jsp?type=T">전체</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link <%= activeTab.equals("N") ? "active" : "" %>" style="color: black;" href="index.jsp?type=N">공지</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link <%= activeTab.equals("I") ? "active" : "" %>" style="color: black;" href="index.jsp?type=I">정보</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link <%= activeTab.equals("P") ? "active" : "" %>" style="color: black;" href="index.jsp?type=P">파티</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link <%= activeTab.equals("S") ? "active" : "" %>" style="color: black;" href="index.jsp?type=S">나눔</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link <%= activeTab.equals("TAX") ? "active" : "" %>" style="color: black;" href="index.jsp?type=TAX">박제</a>	
				  </li>
				</ul>
							
				<table class="table table-striped">
					<thead>
						<tr class="vrow-inner">
							<th class="vcol col-id">번호</th>
							<th class="vcol col-title">제목</th>
							<th class="vcol col-author">작성자</th>
							<th class="vcol col-time">작성일</th>
							<th class="vcol col-view">조회수</th>
							<th class="vcol col-recom">추천수</th>
						</tr>
						
						<tr class="vrow-inner" style="background-color: lightgrey;">
						
							<th class="vcol col-id"><b>공지</b></th>
							<th class="vcol col-title">
								<b>아카라이브 모바일 앱 이용 안내(iOS/Android)</b>
							</th>
							<th class="vcol col-author">*ㅎㅎ</th>
							<th class="vcol col-time">
							2020.08.18
							</th>
							<th class="vcol col-view">18734526</th>
							<th class="vcol col-recom">20</th>
						</tr>

						<tr class="vrow-inner" style="background-color: lightgrey;">
							<th class="vcol col-id"><b>공지</b></th>
							<th class="vcol col-title">
								<b>핫딜 채널 이용 안내</b>
							</th>
							<th class="vcol col-author"> *ㅎㄹ</th>
							<th class="vcol col-time">
							2023.04.28
							</th>
							<th class="vcol col-view">3654</th>
							<th class="vcol col-recom">32</th>
						</tr>
						
							<%

							%>
					
								<%	
							
								%>
					</thead>
				</table>
				
			
<!-- 컨테이너 기본 템플릿 =============================================== -->			
			</article>	
		</main>
	
		<div class="col-3 bd-sidebar" style="height: 80%; overflow-y: auto;">
			<div class="bd-sidebar-body">
				<ul class="nav">
					<li><a>Side 1</a></li>
					<li><a>Side 2</a></li>
					<li><a>Side 3</a></li>
					<li><a>Side 4</a></li>
					<li><a>Side 5</a></li>
					<li><a>Side 6</a></li>
					<li><a>Side 7</a></li>
					<li><a>Side 8</a></li>
				</ul>
				<br>
			</div>
			<div class='bd-sidebar-footer'>
				Sidebar Footer
			</div>
		</div>
		
	</div>	
</div>	

<!-- 메인 내용 작성 영역 =========================================== -->
	<p class="text-center">
			<small class="text-muted" data-datetime="2023-05-23T05:39:45.029Z" data-format="" data-localdate=""></small>
	</p>
	
<%@ include file="../include/footer.jsp" %>