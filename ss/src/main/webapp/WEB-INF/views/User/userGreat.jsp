<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">

</script>
<style>
	#linknone {
	text-decoration : none	
}
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: black; font-weight:bold;  text-decoration: underline;}
	#star{
	/* display: flex; */
	}
	#likedel{
		font-size: 12px;
	}
</style>
<h1 style="text-align: center;">Great</h1>
<!-- 이미지 넣기  d-flex text-body-secondary 영역 안에 -->
<!-- <img src="#" class="bd-placeholder-img flex-shrink-0 me-2 rounded">
			<rect width="100%" height="100%" fill="#007bff"></rect>
			<text x="50%" y="50%" fill="#007bff"></text> -->
<!-- <h6 class="border-bottem pb-2 mb-0" style="font-size: 32px;"></h6> -->
<!-- p태그 본문내용 밑줄  class안에 border-bottom -->
<div class="container">
	<div class="d-flex row align-items-center p-4 my-3 bg-white rounded shadow-sm">
		<div class="col text-center" style="font-size: 32px"><a id="linknone" href="#rentalhome">숙박</a></div>
		<div class="col text-center" style="font-size: 32px"><a id="linknone" href="#food">맛집</a></div>
		<div class="col text-center" style="font-size: 32px"><a id="linknone" href="#event">축제</a></div>
	</div>
<!-- 숙박 -->
	<div class="d-flex align-items-center p-3 my-3 text-white bg-white bg-purple rounded shadow-sm">
		<div id="rentalhome" class="1h-1">
		<h1 class="h6 mb-0 text-white 1h-1"></h1>
		<small style="color: #424242; font-size: 32px; font-family: monospace;">숙박</small>
		</div>
	</div>
	<form id="searchTxtform">
	<input type="hidden" name="viewCount" id="viewCount" value="0">
	<input type="hidden" name="startCount" id="startCount" value="0">
	
	<div id="morelist" style="display: block;">
	<c:choose>
		<c:when test="">
			
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${!empty rentalhome_userlike}">
			<c:forEach var="like"  items="${rentalhome_userlike }">
				<div id="moreviewlist" class="my-1 p-3 row bg-body rounded shadow-sm">
				<div class="d-flex col-10 text-body-secondary " style="cursor: pointer;" onclick="location.href='<%= request.getContextPath()%>/rentalhome/rentalhomeView.do?rentalhome_idx=${like.rentalhome_idx}';">
					<p class=" pb-3 mb-0 small 1h-sm">
						<!-- 제목  -->
						<strong class="d-block text-gray-dark" style="font-size: 16px;"> ${like.name } <span style='color: #848484;'>숙박 타입: ${like.type } </span></strong>
						<!-- 본문내용 -->
						<span style="font-size: 12px; color: #848484;">${like.info }</span>
					</p>
				</div>
					<div id="star" class="col-2 align-items-right text-end" onclick="location.href='https://www.naver.com/';" style="cursor:;color:orange; float: right;">
						<svg xmlns="http://www.w3.org/2000/svg" width="42" height="32" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
						  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
						<br><span id="likedel">좋아요에서 뺴기</span>
					</div>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
	<!-- onclick="delete_(${status.index},${food.fNo})" -->
	<!-- <div class="d-block text-end"><button>좋아요</button></div> -->
		<small id="morelist_btn" class="d-block text-end mt-3">
			<a id="more_btn_a" href="javascript:rentalhomemore('morelist',10);" style="font-size: 3em;">더 보기</a>
		</small>
	</div> <!-- morelist -->
	</form>
<!-- <hr class="my-4"> -->
		<!-- 페이징 된 리스트 -->
	<div id="morelist_paging" style="display: none;">
		<c:if test="${!empty rentalhome_userlike}">
			
			<c:forEach var="like" items="${rentalhome_userlike }">
				<div id="moreviewlist" class="my-1 p-3 row bg-body rounded shadow-sm">
				<div class="d-flex col-10 text-body-secondary " style="cursor: pointer;" onclick="location.href='<%= request.getContextPath()%>/rentalhome/rentalhomeView.do?rentalhome_idx=${like.rentalhome_idx}';">
					<p class=" pb-3 mb-0 small 1h-sm">
						<!-- 제목  -->
						<strong class="d-block text-gray-dark" style="font-size: 16px;"> ${like.name } <span style='color: #848484;'>숙박 타입: ${like.type } </span></strong>
						<!-- 본문내용 -->
						<span style="font-size: 12px; color: #848484;">${like.info }</span>
					</p>
				</div>
					<div id="star" class="col-2 align-items-right text-end" onclick="location.href='https://www.naver.com/';" style="cursor:;color:orange; float: right;">
						<svg xmlns="http://www.w3.org/2000/svg" width="42" height="32" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
						  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
						<br>좋아요에서 뺴기
					</div>
				</div>
			</c:forEach>
				<small id="morelist_btn" class="d-block text-end mt-3">
					<a id="more_btn_a" href="javascript:rentalhomemore('morelist',10);" style="font-size: 3em;">더 보기</a>
				</small>
			
		</c:if>
	</div> <!-- morelist -->
<hr class="my-4">
<!-- 맛집 -->
	<div class="d-flex align-items-center p-3 my-3 text-white bg-white bg-purple rounded shadow-sm">
		<div id="food" class="1h-1" >
		<h1 class="h6 mb-0 text-white 1h-1"></h1>
		<small style="color: #424242; font-size: 32px; font-family: monospace;">맛집  </small>
		</div>
	</div>
	<c:choose>
		<c:when test="${!empty food_userlike }">
			<c:forEach var="like" items="${food_userlike }" varStatus="status">
				<div class="my-1 p-3 bg-body rounded shadow-sm">
				<div class="d-flex text-body-secondary">
					<p class="pb-3 mb-0 small 1h-sm border-bottom">
						<!-- 제목  -->
						<strong class="d-block text-gray-dark"> ${like.food_name} <span style='color: #848484;'> 가게 번호: ${like.food_phone } </span></strong>
						<!-- 본문내용 -->
						<span style="font-size: 12px; color: #848484;"> ${like.food_content }</span>
					</p>
				</div>
					<div class="d-block text-end">좋아요</div>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
		<small class="d-block text-end mt-3">
			<a href='https://www.naver.com/' style="font-size: 3em;">더 보기</a>
		</small>
		<hr class="my-4">
<!-- 축제 -->
	<div class="d-flex align-items-center p-3 my-3 text-white bg-white bg-purple rounded shadow-sm">
		<div id="event" class="1h-1">
		<h1 class="h6 mb-0 text-white 1h-1"></h1>
		<small style="color: #424242; font-size: 32px; font-family: monospace;">축제 </small>
		</div>
	</div>
		<div class="my-1 p-3 bg-body rounded shadow-sm">
		<h6 class="border-bottem pb-2 mb-0">큰 제목 제목 </h6>
		<div class="d-flex text-body-secondary">
			<p class="pb-3 mb-0 small 1h-sm border-bottom">
				<!-- 제목  -->
				<strong class="d-block text-gray-dark"> 제목 </strong>
				<!-- 본문내용 -->
				<span>특정 회원 기준 좋아요 리뷰 마이페이지에서 리스트 보게 해주기 각 카테고리별로 (하는중) -(쿼리문만 잘 되면은 2일정도)</span>
				<textarea rows="" cols="">
				마이페이지에서 좋아요 클릭취소 리뷰 삭제 수정 
				관리자 권한으로 해야되는 일 유저리스트 보고 거기서 밴 시키기
				</textarea>
			</p>
		</div>
			<div class="d-block text-end">좋아요</div>
		</div>
		<small class="d-block text-end mt-3">
			<a href='https://www.naver.com/' style="font-size: 3em;">더 보기</a>
		</small>
</div> <!-- container -->
<script type="text/javascript">
	
	function rentalhomemore(id, cnt){
		var list_length = $("#"+id+" #moreviewlist").length;
		var name = $("#likename").val();
		console.log("name="+name);
		console.log("id="+id);
		console.log("list_length="+list_length);
		console.log("cnt="+cnt);
		console.log("$('#searchTxtform').serialize()="+$('#searchTxtform').serialize());
		var aname = id+"_btn";
		var call_length = list_length;
		
		$('#startCount').val(call_length);
		$('#viewCount').val(cnt);
		$.ajax({
			url		: "<%= request.getContextPath()%>/User/rentalhomemore.do",
			type	: "POST",
			data	: $('#searchTxtform').serialize(),
			dataType : "JSON",
			success :function(data){
				console.log(data);
				console.log(data.totalCount);
				if(data.totalCount > 0){
					console.log("data.totalCount="+data.totalCount);
					var list = data.totalCount;
						if(name != ''){
							$('#'+aname).attr('href',"javascript:rentalhomemore('"+id+"',"+cnt+");");
							getMoreList(list);
						}else{
							/* 더보기 버튼 지우기  */
							$("#"+id+"_div").remove();
						}
				}else{
					alert("실패 하였습니다 ");
				}
			},
			error : function(){
				alert("요청실패");
			}
		});	
	}
	function getMoreList(list){
		console.log("이쪽 실행????");
		console.log("list="+list)
		var con = document.getElementById("morelist_paging");
		var conlist = document.getElementById("morelist");
		var content = "";
		var length = list.length;
		console.log("morelist_paging"+con);
		if(con.style.display== "none"){
			con.style.display = 'block';
			conlist.style.display = 'none';
			for(i=0; i<list;i++){
				console.log("resultVO list="+list);
				if(resultVO.name !=''){
					/* 전체 리스트 불러오는 html 작성 어마어마하게 많네  */
					content += "<h1>변경된 내용</h1>";
				}
			}
		}
		$("#morelist_paging").after(content);
	}
	// 스크립트 페이징
	/* 	var totaldata; // 전체 데이터 수
		var dataPerPage; // 현 페이지에 몇개 보여주는지 
		var pageCount = 10; // 나누어지는 페이지수
		var globalCurrentPage=1; //현제 페이지
		var dataList; //표시하는 페이터 리스트 
		dataPerPage = 10;
		//$("#dataPerPage").val(); 나중에 몇개 씩 보여주는지 할때 
		window.onload(function(){
			dataPerPage = 10;
			$.ajax({
				method:"GET",
				url : ,
			});
		});
	function getPaging(){
			
	}  */
</script>
<%@ include file="../include/footer.jsp" %>