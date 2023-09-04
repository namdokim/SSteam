<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %> 
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/foodView.css"> --%>
																	<!-- VIEW/CSS -->
<style>
	.container						{ margin: 0px auto; max-width: 1380px; }																					/* 전체 컨테이너의 스타일 */
	.food-item						{ border: none; margin-bottom: 20px; padding: 20px; display: flex; border-bottom: 0px solid #ddd; align-items: flex-start; }/* 음식 아이템의 스타일 */
	.user-info						{ display:flex; align-items: center; justify-content: center; margin-bottom: 10px; }										/* 사용자 정보의 스타일 */
	.user-thumbnail					{  width: 70px; height: 70px; margin-right: 10px; border-radius: 50%; overflow: hidden; }									/* 사용자 썸네일의 스타일 */
	.user-thumbnail img				{ width: 100%; height: 100%; object-fit: cover; }																			/* 사용자 썸네일 이미지의 스타일 */
	.user-nickname					{ font-size: 20px; }																										/* 사용자 닉네임의 스타일 */

	<style>
    .food-item2 					{ display: flex; justify-content: space-between; align-items: center; }														/* 음식 아이템 2 스타일 */
    .food-item2 button				{ margin-left: 10px; }																										/* 음식 아이템 2 버튼 스타일 */
    .header-images					{ display: flex; justify-content: center; overflow-x: auto; white-space: nowrap; width:100%; }								/* 헤더 이미지 스타일 */			
    .header-images img				{ width: 250px; height: 250px; object-fit: cover; margin-right: 10px; }														/* 헤더 이미지 스타일 */
    .food-item2 button.like.clicked { color: orange; }																											/* 음식 아이템 2 좋아요 버튼 스타일 */
	.food-item2 .button1			{ background: none; border: none; cursor: pointer; font-size: 35px; color: silver; } 										/* 음식 아이템 2 버튼 1 스타일 */
	.food-item2 .button1:hover 		{ color: orange; }																											/* 음식 아이템 2 버튼 1 호버 스타일 */
	.food-item2 button.like.clicked { color: orange; } 																											/* 음식 아이템 2 좋아요 버튼 클릭 스타일 */
	.view1							{ border-radius:10px; background-color:white; box-shadow:1px 1px 1px 1px #ddd; }											/* 모달 뷰 1 스타일 */
	.modal							{ display: none; position: fixed; z-index: 1000; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); overflow: auto; } /* 모달 스타일 */
	.gallery-content				{ display: flex; flex-wrap: wrap; justify-content: center; padding: 20px; }													/* 모달 내용 스타일 */
	.gallery-content img			{ max-width: 100%; height: auto; margin:2px 0px; } 																			/* 모달 이미지 스타일 */
	.close-review-button			{ color: white; font-size: 30px; position: absolute; top: 10px; right: 20px; cursor: pointer; }								/* 모달 닫기 버튼 스타일 */
    
    .form-group 					{ margin-bottom: 15px; }																									/* 폼 그룹 스타일 */
    .form-group label				{ display: block; font-weight: bold; margin-bottom: 5px; }																	/* 폼 그룹 레이블 스타일 */
    																																							/* 폼 그룹 입력 필드 및 텍스트 영역 스타일 */
    .form-group input[type="text"],
    .form-group textarea			{ width: 100%; padding: 8px; border: 1px solid #ccc;  border-radius: 3px; font-size: 16px; }								

    .form-group textarea			{ resize: none; height: 200px; border: none; }																			/* 폼 그룹 텍스트 영역 스타일 */
    .form-group button				{ background-color: #007bff; color: #fff; border: none; padding: 10px 20px; border-radius: 3px; cursor: pointer; }			/* 폼 그룹 버튼 스타일 */
    .form-group button:hover		{ background-color: #0056b3; }																								/* 폼 그룹 버튼 호버 스타일 */
	.form-group1					{ position: relative; overflow: hidden; display: inline-block; width: 100px; height: 100px; border: 2px solid silver; border-radius: 8px; cursor: pointer; }/* 폼 그룹 1 스타일 */
	.form-group1 input[type="file"]	{ position: absolute; left: 0; top: 0; opacity: 0; width: 100%; height: 100%; cursor: pointer; }							/* 폼 그룹 1 파일 입력 필드 스타일 */
	.form-group1::before 			{ content: "+"; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-size: 32px; color: silver; }/* 폼 그룹 1 파일 입력 필드 앞 스타일 */

    .rating-buttons					{ display: flex; align-items: center; }																						/* 평가 버튼 그룹 스타일 */
    .rating-button					{ margin-right: 10px; background-color: #007bff; color: #fff; border: none; padding: 8px 16px; border-radius: 3px; cursor: pointer; }/* 평가 버튼 스타일 */
	.rating-button:hover			{ background-color: #0056b3; }																								/* 평가 버튼 호버 스타일 */
	
	.review1						{ border: 1px solid silver; width: 100%; height: 40%; padding: 16px; }														/* 리뷰 컨테이너 스타일 */
	.custom-button					{ display: inline-block; background-color: orange; color: white; border: none; border-radius: 10px; padding: 10px 20px; text-decoration: none; transition: background-color 0.3s, transform 0.3s; cursor: pointer; }/* 사용자 지정 버튼 스타일 */
	.custom-button:hover			{ background-color: darkorange;  transform: scale(1.05); }																	/* 사용자 지정 버튼 호버 스타일 */
	
	.container1_SubmitButton		{ padding: 12px 24px; min-width:140px; min-height:50px; margin-right: 16px; border: 1px solid #FFA500;  border-radius: 50px; font-size:16px; color:black; text-align:center; background-color:#FFA500; }/* 컨테이너1 서브밋 버튼 스타일 */
 	.container1_CancleButton		{ padding: 12px 24px; min-width:70px; min-height:50px; margin-right: 16px; border: 1px solid silver; border-radius: 20px; font-size:16px; color:silver; text-align:center; background-color:#FFFFFF; }/* 컨테이너1 취소 버튼 스타일 */
    
    /* 직접 작성한 스타일 */
    .custom-modal 					{ display: none; position: fixed; z-index: 1500; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); overflow: auto; }
</style>																
																	<!-- VIEW/스크립트  -->
<script>
window.onload = function() 
{
	const fNo = ${vo.fNo};
	var like_empty = document.getElementsByClassName("like")[0];
	var like_full = document.getElementsByClassName("like")[1];
	var love = document.getElementById("love");

	if (${like_dupl} > 0){ like_empty.style.display="none";	like_full.style.display="block"; }		// 로그인 한 유저가 이미 좋아요를 누른 상태 (처음 들어왔을 때, 유저가 이미 체크한 경우라면,꽉 찬 별을 보여 줌.)
	else if(${like_dupl} == 0){ like_full.style.display="none"; like_empty.style.display="block"; } // 로그인 한 유저가 좋아요를 안 누른 상태 
	else{ like_full.style.display="none"; like_empty.style.display="block"; } 						// 로그인 안 한 상태 (체크하지 않은 경우라면 ,빈 별을 보여 줌.)

	// 1. like_empty 요소를 클릭했을 때 실행되는 함수
	like_empty.onclick = function(){
		$.ajax({
		url:'insert_like.do', 
		method:'post', 
		data:{ fNo:fNo },	
		success: function(data){
			if(data > 0){like_empty.style.display="none"; like_full.style.display="block"; love.innerText=data}
			else{ alert("로그인을 해주세요."); location.href = "<%=request.getContextPath()%>/User/userLogin.do";}},
		error: function(xhr, status, error){console.log('Error:', error);} }); }

	// 2. like_full 요소를 클릭했을 때 실행되는 함수
	like_full.onclick = function(){
		$.ajax({
		url:'delete_like.do', 
		method:'post', 
		data:{ fNo:fNo },	
		success: function(data){like_full.style.display="none"; like_empty.style.display="block"; love.innerText=data},
		error: function(xhr, status, error){ console.log('Error:', error);} }); }

	// -> 식당의 위치를 보여주는 지도
	var mapContainer = document.getElementById('map'),									// 지도를 표시할 div 
	mapOption = { center: new kakao.maps.LatLng(33.450701, 126.570667), level: 3 };  
	var map = new kakao.maps.Map(mapContainer, mapOption); 								// 지도를 생성합니다   
	var geocoder = new kakao.maps.services.Geocoder(); 									// 주소-좌표 변환 객체를 생성합니다
	geocoder.addressSearch('${vo.food_address}', function(result, status){				// 주소로 좌표를 검색합니다
		if (status === kakao.maps.services.Status.OK) {									// 정상적으로 검색이 완료됐으면 
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			var marker = new kakao.maps.Marker({ map: map, position: coords });			// 결과값으로 받은 위치를 마커로 표시합니다
			map.setCenter(coords); } });												// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다

	const openReviewButton = document.getElementById("open-review-button");				// "open-review-button" 요소 가져오기
	const modal = document.getElementById("modal");										// "modal" 요소 가져오기
	const closeReviewButton = document.getElementById("close-review-button");			// "close-review-button" 요소 가져오기
	var uid = '${sessionScope.login.uId}';												// 로그인한 사용자의 아이디(uid) 가져오기
	console.log("로그인했을때의 uid 값:" + uid);												// 콘솔에 로그인한 사용자의 아이디 출력

	// -> openReviewButton 버튼을 클릭할 때의 동작 
	openReviewButton.addEventListener("click", () => {
		if(uid != ""){modal.style.display = "block"; document.body.style.overflow = "hidden";}
		else{if(confirm("로그인 하시겠습니까? ")) {location.href='<%=request.getContextPath()%>/User/userLogin.do';}} });
	
	// -> Close 버튼을 클릭할 때의 동작 
	closeReviewButton.addEventListener("click", () => {
		modal.style.display = "none";
		document.body.style.overflow = "auto"; });
	// -> 모달 외부 클릭 시 모달 닫기 동작 
	window.addEventListener("click", (event) => {
		if (event.target === modal) {
		modal.style.display = "none";
		document.body.style.overflow = "auto";} });
			
	// -> 수정 모달 창
	const modal1 = document.getElementById("modal1");
	const closeReviewButton1 = document.getElementById("close-review-button1");
	
	closeReviewButton1.addEventListener("click", () => {
		modal1.style.display = "none";
		document.body.style.overflow = "auto"; });
	
	window.addEventListener("click", (event) => {
		if(event.target === modal1) {
		modal1.style.display = "none";
		document.body.style.overflow = "auto";} });
	
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
	
	
	
}
	
	// 3. 모달을 닫는 함수
	function closeModal() {
		const modal = document.getElementById('modal');
		const modal1 = document.getElementById('modal1');
		modal.style.display = 'none';
		modal1.style.display = 'none';
		document.body.style.overflow = "auto"; } //스크롤 허용 

		
	// 4. 뷰 페이지에서 -> 리뷰의 수정버튼을 눌렀을 때 뜨는 -> 리뷰 수정 모달 창 
	function foodReviewModify(obj, food_review_number, food_review_grade){
		console.log(food_review_grade);
		const modify_grade = document.getElementById("modify_grade");
		const modify_good = document.getElementById("modify_good");
		const modify_soso = document.getElementById("modify_soso");
		const modify_bad = document.getElementById("modify_bad");
		
		const modal1 = document.getElementById("modal1");
		const reviewmodify = document.getElementById("reviewmodify");
		const review = document.getElementById("review2");
		const array = document.getElementsByName("mobutton");
		const index = Array.prototype.indexOf.call(array, obj);
		
// 리뷰 수정시, 평점 아이콘에 색 변경 
		if(food_review_grade == 5){
			modify_good.style.color = 'orange';
			modify_soso.style.color = 'silver';
			modify_bad.style.color = 'silver';
		}else if(food_review_grade == 3){
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
		modify_grade.value = food_review_grade;
		
		
		
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
//		
		modal1.style.display = "block";
		document.body.style.overflow = "hidden";
		review.value = document.getElementsByName("review3")[index].innerHTML;
		console.log(index);
		console.log(review.value);
			
		reviewmodify.onclick = function(){
		if( review.value == "" ){ alert("리뷰 글을 작성해 주세요. "); $("#review2").focus(); return; }
			modal1.style.display = "none";
			document.body.style.overflow = "auto";
			foodReviewModify_ajax(obj,food_review_number); } }


	// 5. 리뷰 수정 창이 뜨고, 리뷰 수정 완료 버튼을 누르면 실행되는 함수 
	function foodReviewModify_ajax(obj,food_review_number){
		const review = document.getElementById("review2");
		const array = document.getElementsByName("mobutton"); 
		const index = Array.prototype.indexOf.call(array, obj);
		const modify_grade = document.getElementById("modify_grade");
		const review_icon = document.getElementsByName("review_icon");
		const avg = document.getElementById("avg");
		
		const count_all = document.getElementsByName("count_all");
		const count_good = document.getElementById("count_good");
		const count_soso = document.getElementById("count_soso");
		const count_bad = document.getElementById("count_bad");
		
		console.log(food_review_number);
		console.log(review.value);
		console.log(index);
		
		$.ajax({
			url:'foodReviewModify.do', 					
			method:'post', 								
			data: { food_review_number:food_review_number, food_review_content:review.value, food_review_grade:modify_grade.value},								
			success: function(data) { alert("리뷰가 수정되었습니다. "); document.getElementsByName("review3")[index].innerHTML=review.value; review.value=""; 
				if(modify_grade.value == 5)
				{
					review_icon[index].innerHTML='<svg xmlns="http://www.w3.org/2000/svg" style="color:orange;" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">'
												+'<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>'
												+'<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75a.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25a.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1 .672-1 1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>'
												+'</svg><br>'
												+'<span style="font-size:18px; color:orange; ">맛있다</span><br>';
				}else if(modify_grade.value == 3)
				{
					review_icon[index].innerHTML='<svg xmlns="http://www.w3.org/2000/svg" style="color:orange;" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">'
												+'<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>'
												+'<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>'
												+'</svg><br>'
												+'<span style="font-size:18px; color:orange; ">괜찮다</span><br>';
				}else
				{
					review_icon[index].innerHTML='<svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">'
												+'<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>'
												+'<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>'
												+'</svg><br>'
												+'<span style="font-size:18px; color:orange; ">별로</span><br>';
					
				}
				console.log(data.avg);
				avg.innerText = data.avg;
				for(var i=0; i<count_all.length; i++){
					count_all[i].innerText = data.count_all;
				}
				count_good.innerText = data.count_good;
				count_soso.innerText = data.count_soso;
				count_bad.innerText = data.count_bad;
				
			}, 
			error: function(xhr, status, error) { console.log('Error:', error); } }); }
	
	// 
	
	
	// 6. foodreview 추가 함수
	function insert_foodreview(){
		const fNo = document.getElementById("fNo");			
		const review = document.getElementById("review");	
		const grade = document.getElementById("grade");	
		
		console.log(review.value);
		if( review.value == "" ){ alert("리뷰 글을 작성해 주세요. "); $("#review").focus(); return; }
		$.ajax({
			url:'insert_foodreview.do', 				
			method:'post', 							
			data: {fNo:fNo.value, food_review_content:review.value, food_review_grade:grade.value },									
			
			success:function(data){
				const modal = document.getElementById("modal");
				document.getElementById("review").value = "";
				modal.style.display = "none";
				document.body.style.overflow = "auto";
				$("#testDiv").prepend('<div id="insertDiv"></div>');
				alert("리뷰 등록이 완료 되었습니다. ");
				
				var html = '<div style="border:0px solid red; display: flex;">' +
				   '<input type="hidden" name="food_review_number" value="'+ data.food_review_number+ '">'+
				   '<div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>' +
		           '<div class="user-thumbnail">' +
		           '<img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">' +
		           '</div><br>' +
		           '<div class="user-nickname">' + data.uNick + '</div>' +
		           '</div>' +
		           '<div style="border:0px solid black;  width:70%;"><br>' +
		           '<div style="color:silver;">' + data.food_review_writedate + 
		           '<button onclick="select_review_number(this)" name="review_report" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reviewreportModal">리뷰 신고</button></div><br>' +
		           '<div name="review3">' + data.food_review_content + '</div><br>' +
		           // 리뷰내용들어갈 자리
		           '</div>' +
		           '<div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>';
					
				if (data.food_review_grade == 5) {
					html += '<div name="review_icon" style="border:0px solid black; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;">' +
							'<svg xmlns="http://www.w3.org/2000/svg" style="color:orange;" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">' +
							'<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>' +
							'<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75a.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25a.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1 .672-1 1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>' +
							'</svg><br>'+
							'<span style="font-size:18px; color:orange;">맛있다</span></div><br>';
				} else if (data.food_review_grade == 3) {
					html += '<div name="review_icon" style="border:0px solid black; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;">' +
							'<svg xmlns="http://www.w3.org/2000/svg" style="color:orange;" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">' +
							'<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>' +
							'<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>' +
							'</svg><br>' +
							'<span style="font-size:18px; color:orange;">괜찮다</span></div><br>';
				} else {
					html += '<div name="review_icon" style="border:0px solid black; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;">' +
							'<svg xmlns="http://www.w3.org/2000/svg" style="color:orange;" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">' +
							'<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>' +
							'<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25a.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>' +
							'</svg><br>' +
							'<span style="font-size:18px; color:orange;">별로</span></div><br>';
				}
		
				html += '<div>' +
						'<button class="container1_CancleButton" name="mobutton" onclick="foodReviewModify(this,' + data.food_review_number + ')">수정</button>' +
						'<form action="foodReviewDelete.do" method="post">' +
						'<input type="hidden" name="food_review_number" value="' + data.food_review_number + '">' +
						'<input type="hidden" name="fNo" value="' + data.fNo + '">' +
						'<button class="container1_CancleButton">삭제</button>' +
						'</form>' +
						'</div>' +
						'</div>' +
						'</div>' +
						'<hr>';


					document.getElementById("insertDiv").innerHTML = html; 
			},error: function(xhr, status, error) {console.log('Error:', error);} }) }
	
	// 메뉴 삭제하는 함수 
	function delete_Menu(index,food_menu_number){
/* 	.style.display="none";
	.style.display="block"; */
		
		$.ajax({
			url:"delete_menu.do",
			method:'post', 	
			data: {food_menu_number:food_menu_number},
			success:function(){
				const menu = document.getElementsByClassName("menu");
				menu[index].style.display="none";
			}
		});
	}
// 식당 신고 
	function insert_report(){
		const food_report_content = document.getElementById("food_report_content");
		const food_report_resons = document.getElementsByName("food_report_reson");
		const modal_backdrop  = document.getElementsByClassName("modal-backdrop ");
		const fNo = ${vo.fNo};
		
		
		var reson_value = ""
		food_report_resons.forEach(function(food_report_reson) {
            if (food_report_reson.checked) {
                reson_value = food_report_reson.value;
            }
        });
		
		console.log(fNo);
		console.log(food_report_content.value);
		
		// data => data:{키:값} => 컨트롤러에서 키와 VO의 멤버변수와 같으면(안똑같으면 @RequestParam) 받아서 , 컨트롤러의 매개변수에 값을 넣는다 .
		$.ajax({
			url:"insert_report.do",
			method:'post', 	
			data: {food_report_content:food_report_content.value, food_report_reson:reson_value, fNo:fNo },
			success:function(){
				alert("신고 접수가 완료되었습니다.");
				document.getElementById("reportModal").style.display="none";
				document.body.style.overflow = "auto";
				// 자바스크립트에서는 int i =0; 아님 -> var 로 쓸 것 
				for( var i =0; i<modal_backdrop.length; i++){
					modal_backdrop[i].style.display="none";
					
				}
			}
		});
	}
	
// 리뷰 신고 
 	function insert_review_report(){
		const food_review_report_content = document.getElementById("food_review_report_content");
		const food_review_report_resons = document.getElementsByName("food_review_report_reson");
		const modal_backdrop  = document.getElementsByClassName("modal-backdrop");
		
	 	const food_review_number = document.getElementById("review_number").value; 
		console.log(food_review_number);
		
		var reson_value = ""
			food_review_report_resons.forEach(function(food_review_report_reson) {
	            if (food_review_report_reson.checked) {
	                reson_value = food_review_report_reson.value;
	            }
	        });
		
		// data => data:{키:값} => 컨트롤러에서 키와 VO의 멤버변수와 같으면(안똑같으면 @RequestParam) 받아서 , 컨트롤러의 매개변수에 값을 넣는다 .
		$.ajax({
			url:"insert_review_report.do",
			method:'post', 	
			data: {food_review_report_content:food_review_report_content.value, food_review_report_reson:reson_value, food_review_number:food_review_number},
			success:function(){
				alert("신고 접수가 완료되었습니다.");
				document.getElementById("reportModal").style.display="none";
				document.getElementById("reviewreportModal").style.display="none";
				document.body.style.overflow = "auto";
				// 자바스크립트에서는 int i =0; 아님 -> var 로 쓸 것 
				for( var i =0; i<modal_backdrop.length; i++){
					modal_backdrop[i].style.display="none";
				}
			}
		});
	} 
	// ajax로 보낼 review_number 세팅 해 주는 것 . 
	function select_review_number(obj){
		const review_report = document.getElementsByName("review_report");
		const index = Array.prototype.indexOf.call(review_report, obj);
		const food_review_number = document.getElementsByName("food_review_number");
		const review_number = document.getElementById("review_number");
		console.log(index);
		
		review_number.value = food_review_number[index].value;
		console.log(review_number.value);
	}
</script>

																		<!-- 실제로 보여지는 곳 -->
<!-- 1 VIEW-Modal X -> 상단사진 5개 -->
<div class="header-images">
	<div>
		<c:forEach items="${listAttach}" var="listAttach">
			<img src="<%=request.getContextPath() %>/resources/upload/${listAttach.food_attach_physical_name}" width="250" height="250" alt="맛집 썸네일">  
		</c:forEach>
	</div>
</div>

<!-- 1 VIEW-Modal X -> [식당 이름, 평균평점, 리뷰쓰기버튼, 가고싶다별표시] -->
<div class="container"  style="font-family:'TheJamsil5Bold';">
<div class="food-item">
<div class="food-item2" style="float: left; width:70%;"> 
	<div>
		<div style="width: 100%; position:relative;"><br><br>
			<h2>
				<span>
					<span style="color: black;">${vo.food_name}</span>
					<c:if test="${roundedGrade!=0.0}">
						<span id="avg" style="color: orange;">&nbsp;${roundedGrade}</span>
					</c:if>
				</span>
				
				<!--  빈 별  -->
				<button class="button1" style="float: right;"><span class="like" style="color:silver; position:absolute; top:50px; right:0;">
				<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
				  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
				</svg>
				<br>가고싶다</span></button>
				
				<button class="button1" style="float: right;"><span class="like" style="color:orange; position:absolute; top:50px; right:0;">
				<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
					<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				</svg>
				<br>가고싶다</span></button>
				<button class="button1" id="open-review-button" style="float: right; display:inline-block; cursor:pointer; position:absolute; top:50px; right:150px;">
				<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
					<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
				</svg>
				<br>리뷰쓰기</button>
			</h2>
<!-- (2 REVIEW-Modal O)-->
				<div class="modal" id="modal">
					<div class="gallery-content">
						<div class="close-review-button" id="close-review-button" style="display:inline-block;">&times;</div>
						<div class="view1" style="width:1224px; padding:20px;">
							<div style="text-align:left; margin:20px;">
								<span style="font-weight:bold; font-size:15pt;">리뷰 쓰기 </span>
							</div>
							<div style="margin:20px; width:1144px; height:1px; background-color:lightgray;"></div>
							<div style="margin:20px; text-align:left;">
								<p><span style="color:#ff7f00; font-size:20pt;">맛집&nbsp;</span><span style="color:silver;">에 대한 솔직한 맛 리뷰를 써주세요</span></p><br>
									<div class="review1">
										<div class="form-group">
											<div class="rating-buttons">
												<input type ="hidden" id="grade" value="5" >
												<p style="color:orange;" id="good">
													<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16"  >
														<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
														<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75a.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25a.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1 .672-1 1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
													</svg>&nbsp;&nbsp;&nbsp;맛있다&nbsp;&nbsp;&nbsp;
												</p>
												<p style="color:silver;" id="soso">
													<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16" >
														<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
														<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
													</svg>&nbsp;&nbsp;&nbsp;괜찮다&nbsp;&nbsp;&nbsp;
												</p>
												<p style="color:silver;" id="bad">
													<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16"  >
														<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
														<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25a.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
													</svg>&nbsp;&nbsp;&nbsp;별로&nbsp;&nbsp;&nbsp;
												</p>
											</div>
										</div>
										<div class="form-group">
											<input type="hidden" id="fNo" value="${vo.fNo}">
											<textarea id="review" name="review" required placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
										</div>
									</div>
								<!-- <p style="color:silver; float:right;">0/10000</p><br> --><br>
								<div class="container1" style="text-align: right;">
									<button class="container1_CancleButton" type="button" onclick="closeModal()">취소</button>
									<button class="container1_SubmitButton" onclick="insert_foodreview()">리뷰 올리기</button>
								</div>
							</div>
						</div>		
					</div>
				</div>
				<!-- (2 REVIEW-Modal O) -->
				<div class="modal" id="modal1">
					<div class="gallery-content">
						<div class="close-review-button" id="close-review-button1" style="display:inline-block;">&times;</div>
						<div class="view1" style="width:1224px; padding:20px;">
							<div style="text-align:left; margin:20px;">
								<span style="font-weight:bold; font-size:15pt;">리뷰 수정  </span>
							</div>
							<div style="margin:20px; width:1144px; height:1px; background-color:lightgray;"></div>
							<div style="margin:20px; text-align:left;">
								<p><span style="color:#ff7f00; font-size:20pt;">맛집&nbsp;</span><span style="color:silver;">에 대한 솔직한 맛 리뷰를 써주세요</span></p><br>
									<div class="review1">
										<div class="form-group">
											<div class="rating-buttons">
												<input type ="hidden" id="modify_grade" >
												<p id="modify_good" style="color:silver;">
													<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
														<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
														<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75a.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25a.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1 .672-1 1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
													</svg>&nbsp;&nbsp;&nbsp;맛있다&nbsp;&nbsp;&nbsp;
												</p>
												<p id="modify_soso" style="color:silver;">
													<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
														<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
														<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
													</svg>&nbsp;&nbsp;&nbsp;괜찮다&nbsp;&nbsp;&nbsp;
												</p>
												<p id="modify_bad" style="color:silver;">
													<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
														<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
														<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25a.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
													</svg>&nbsp;&nbsp;&nbsp;별로&nbsp;&nbsp;&nbsp;
												</p>
											</div>
										</div>
										<div class="form-group">
											<input type="hidden" id="fNo" value="${vo.fNo}">
											<textarea id="review2" name="review" required placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
										</div>
									</div>
								<!-- <p style="color:silver; float:right;">0/10000</p><br> --><br>
								<div class="container1" style="text-align: right;">
									<button class="container1_CancleButton" type="button" onclick="closeModal()">취소</button>
									<button class="container1_SubmitButton" id="reviewmodify">리뷰 수정</button>
								</div>
							</div>
						</div>		
					</div>
				</div>
		</div>
	</div><br>
	
<!-- 1 VEIW-MODAL X -> 등록한 식당정보 내용 -->
	<p>
		<span style="margin-right: 5px;">👁️</span><span>${vo.food_hit}</span>&nbsp;
		<span style="margin-right: 5px;">✏️</span><span name="count_all">${foodreviewVO.count_all}</span>&nbsp;
		<span style="margin-right: 5px;">⭐</span><span id="love">${countLike}</span>&nbsp;
        <!-- 신고 버튼 -->
        	<c:if test = "${login != null }">
		        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reportModal">
		            맛집 신고
		        </button>
	        </c:if>
    <!-- 식당 모달 -->
    <div class="modal custom-modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
       <!--  <div class="modal-dialog modal-dialog-centered modal-lg"> -->
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="display:flex; z-index:1500;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">맛집 신고</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                <label for="reportReason" class="form-label">신고 이유</label><br>
                
			       <!-- 신고 이유 입력란 -->
			      <div style="margin-right:20px; display:inline-block;">
					<input class="form-check-input" type="radio" name="food_report_reson" value="스팸">
					<label class="form-check-label" for="reason1">스팸</label>
			      </div>
			       <div style="margin:0px 20px; display:inline-block;">
					<input class="form-check-input" type="radio" name="food_report_reson" value="욕설 및 비방">
				    <label class="form-check-label" for="reason2">욕설 및 비방</label>
			      </div>
			      <div style="margin:0px 20px; display:inline-block;">
					<input class="form-check-input" type="radio" name="food_report_reson" value="부적절한 콘텐츠">
				    <label class="form-check-label" for="reason3">부적절한 콘텐츠</label>
			      </div>
			      <div style="margin:0px 20px; display:inline-block;">
					<input class="form-check-input" type="radio" name="food_report_reson" value="기타">
				    <label class="form-check-label" for="reason4">기타 </label>
			      </div><br><br>
			       <div class="mb-3">
			           <label for="reportReason" class="form-label">신고 내용 </label>
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
   <!-- 모달 -->
		
	</p><hr><br><br>
	<p>
		<img src="../img/which.png" alt="위치 아이콘" style="width:28px; height:28px; cursor:pointer;">
		주소 :
		${vo.food_address}
	</p>
	<p>
		<img src="../img/foodcall.png" alt="전화번호 아이콘" style="width:28px; height:28px; cursor:pointer;">
		전화번호 : 
		${vo.food_phone}
	</p>
	<p>
		<img src="../img/foodnoodle.png" alt="음식 아이콘" style="width:28px; height:28px; cursor:pointer;">
		음식 종류 :
		${vo.food_food_kind}
	</p>
	<p>
		<img src="../img/foodmoney.png" alt="돈 아이콘" style="width:28px; height:28px; cursor:pointer;">
		가격대 :
		${vo.food_avg_price}
	</p>
	<p>
		<img src="../img/foodwork.png" alt="일 아이콘" style="width:28px; height:28px; cursor:pointer;">
		영업시간 : 
		${vo.food_working_hours}
	</p>
	<p>
		<img src="../img/foodtree.png" alt="나무 아이콘" style="width:28px; height:28px; cursor:pointer;">
		휴일 :
		${vo.food_holiday}
	</p>
	<p><strong>
		<img src="../img/insta.png" alt="Instagram 아이콘" style="width:28px; height:28px; cursor:pointer;">
		웹사이트 
		</strong> <a href="${vo.food_website}">식당 홈페이지로 가기</a>
	</p><br><br>
	<h3 style="display:inline-block;">메뉴</h3>
	<c:if test="${login.uNo eq vo.uNo}">
		<button class="container1_SubmitButton" onclick = "location.href='<%=request.getContextPath()%>/food/foodMenuWrite.do?fNo=${vo.fNo}'">메뉴등록버튼 </button>
	</c:if>
	<ul>
		
		<c:forEach items="${list}" var="vo" varStatus="status">
			<li class="menu">
				<c:if test="${login.uNo eq vo.uNo}">
					<button style="background-color:transparent; border:0px; color:orange;" onclick="delete_Menu(${status.index},${vo.food_menu_number})">
					<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-file-excel" viewBox="0 0 16 16">
						<path d="M5.18 4.616a.5.5 0 0 1 .704.064L8 7.219l2.116-2.54a.5.5 0 1 1 .768.641L8.651 8l2.233 2.68a.5.5 0 0 1-.768.64L8 8.781l-2.116 2.54a.5.5 0 0 1-.768-.641L7.349 8 5.116 5.32a.5.5 0 0 1 .064-.704z"/>
						<path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
					</svg>
					</button>
				</c:if>
				
					<%-- <button style="color:red;" onclick="delete_Menu(${status.index},${vo.food_menu_number})">-</button> --%>
				${vo.food_menu_name} - ${vo.food_menu_price}원 
				<hr style="width : 40%;">
			</li>
		</c:forEach>
	</ul><br><br>
	<div style="float: right; color:silver;"> 업데이트날짜 : ${vo.food_write_date}</div><br><hr>
</div>
	<div class="food-item3" style="float: right; width:5%; border:0px solid silver;"></div> 
	<div class="food-item4" style="float: right; width:25%; border:0px solid silver; /* background-color:#e9e9e9; */"> 
		<div id="map" style="width:100%;height:400px;"></div>
	</div>
</div>
</div>
<!-- 2 REVIEW-MODAL X -->  
<div class="container">
	<div class="food-item">
		<div class="food-item2" style="width:70%; border:0px solid blue;">
			<div style="border:0px solid black; width:100%;">
				<h4 style="color: black;">리뷰(<span name="count_all">${foodreviewVO.count_all}</span>)
					<span style="color:silver; float:right;">
						전체(<span name="count_all">${foodreviewVO.count_all}</span>)&nbsp;&nbsp;|&nbsp;
						맛있다(<span id="count_good">${foodreviewVO.count_good}</span>)&nbsp;&nbsp;|&nbsp;
						괜찮다(<span id="count_soso">${foodreviewVO.count_soso}</span>)&nbsp;&nbsp;|&nbsp;
						별로(<span id="count_bad">${foodreviewVO.count_bad}</span>)&nbsp;&nbsp;&nbsp;
					</span>
				</h4>
			</div><br>
			
<!-- 첫 번째 댓글S -->  
			<div id="testDiv" > 
				<div id="insertDiv"></div>
			</div>
<!-- 리뷰신고 모달 -->
				    <div class="modal custom-modal fade" id="reviewreportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				       <!--  <div class="modal-dialog modal-dialog-centered modal-lg"> -->
				        <div class="modal-dialog modal-lg">
				            <div class="modal-content" style="display:flex; z-index:1500;">
				           		<input type="hidden" id="review_number">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="exampleModalLabel">리뷰 신고</h5>
				                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                </div>
				                <div class="modal-body">
				                <label for="reportReason" class="form-label">리뷰 신고 이유</label><br>
				                
							       <!-- 신고 이유 입력란 -->
							      <div style="margin-right:20px; display:inline-block;">
									<input class="form-check-input" type="radio" name="food_review_report_reson" value="스팸">
									<label class="form-check-label" for="reason1">스팸</label>
							      </div>
							       <div style="margin:0px 20px; display:inline-block;">
									<input class="form-check-input" type="radio" name="food_review_report_reson" value="욕설 및 비방">
								    <label class="form-check-label" for="reason2">욕설 및 비방</label>
							      </div>
							      <div style="margin:0px 20px; display:inline-block;">
									<input class="form-check-input" type="radio" name="food_review_report_reson" value="부적절한 콘텐츠">
								    <label class="form-check-label" for="reason3">부적절한 콘텐츠</label>
							      </div>
							      <div style="margin:0px 20px; display:inline-block;">
									<input class="form-check-input" type="radio" name="food_review_report_reson" value="기타">
								    <label class="form-check-label" for="reason4">기타 </label>
							      </div><br><br>
							       <div class="mb-3">
							           <label for="reportReason" class="form-label">리뷰 신고 내용 </label>
							           <textarea style="resize:none" class="form-control" id="food_review_report_content" name="food_review_report_content" rows="4"></textarea>
							       </div>
							   </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				                    <button type="button" class="btn btn-primary" onclick="insert_review_report()">리뷰 신고 완료</button>
				                </div>
				            </div>
				        </div>
				    </div>
<!-- 모달 끝 -->
			<c:forEach items="${listReview}" var="listReview" varStatus="status">
				<div style="border:0px solid red; display: flex;">
				<input type="hidden" name="food_review_number" value="${listReview.food_review_number}">
					<div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>
						<div class="user-thumbnail">
							<img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">
						</div><br>
						<div class="user-nickname">${listReview.uNick}</div>
					</div>
					<div style="border:0px solid black;  width:70%;"><br>
						<div style="color:silver;">${listReview.food_review_writedate}
						 <!-- 리뷰 신고 버튼 -->
			        	<c:if test = "${login != null }">
					        <button onclick="select_review_number(this)" name="review_report" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reviewreportModal">
					            리뷰 신고
					        </button>
				        </c:if>
				    </div>
				        <br>
						<!-- 2 REVIEW-MODAL X -> 리뷰 시작 -->
						<div name="review3"> ${listReview.food_review_content}</div><br>
					</div>
					<div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>
						<div name="review_icon" style="border:0px solid black; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;">
							<c:if test="${listReview.food_review_grade eq 5}">
								<svg xmlns="http://www.w3.org/2000/svg" style="color:orange;" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
									<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
									<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75a.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25a.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1 .672-1 1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
								</svg><br> 
								<span style="font-size:18px; color:orange; ">맛있다</span><br>
							</c:if>
							
							<c:if test="${listReview.food_review_grade eq 3}">
							<svg xmlns="http://www.w3.org/2000/svg" style="color:orange;" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
								<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
							</svg><br> 
							<span style="font-size:18px; color:orange; ">괜찮다</span><br>
							</c:if>
							
							<c:if test="${listReview.food_review_grade eq 1}">					
							<svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
								<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
							</svg><br> 
							<span style="font-size:18px; color:orange; ">별로</span><br>
							</c:if>
						</div><br>
						<div>
							<!-- 2 REVIEW-MODAL X -> 수정 버튼 -->
							<c:if test="${login.uNo eq listReview.uNo}">
								<button class="container1_CancleButton" name="mobutton" onclick="foodReviewModify(this,${listReview.food_review_number},${listReview.food_review_grade})" >수정 </button>
							<form action="foodReviewDelete.do" method="post">
								<input type="hidden" name="food_review_number" value="${listReview.food_review_number}"> 
								<input type="hidden" name="fNo" value="${listReview.fNo}"> 
								<button class="container1_CancleButton" >삭제</button>
							</form>
							</c:if>
						</div>
					</div>
				</div><hr> 
			</c:forEach><br><br>
			<!-- 첫 번째 댓글E -->
		</div>
	</div>
</div>

<!-- ========================  카카오지도api (8080포트설정) 지도 위치 바꾸지 말 것 ==========================================-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=471bd87d2c2bfa282198a74a11556a57&libraries=services"></script>
<%@ include file="../include/footer.jsp" %>