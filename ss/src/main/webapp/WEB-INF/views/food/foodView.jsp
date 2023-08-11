<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->

<!-- CSS 스타일 ================================================-->
<style>
	body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    }
    .header {
    background-color: whitesmoke;
    color: #000;
    padding: 20px;
    text-align: center;
    }
	.container {
	margin: 20px auto;
	max-width: 960px;
	padding: 0 20px;
	}
	.restaurant-item {
	border: none;
	margin-bottom: 20px;
	padding: 20px;
	display: flex;
	border-bottom: 0px solid #ddd;
	align-items: flex-start; /* 요소들을 flex 컨테이너의 위쪽에 정렬합니다. */
	}

    .restaurant-thumbnail {
    flex: 0 0 auto;
    margin-right: 20px;
    }
    .restaurant-thumbnail img {
    width: 250px;
    height: 250px;
    object-fit: cover;
    }
    .restaurant-info {
    flex: 1 1 auto;
    }
    .restaurant-title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
    color: black; /* 검정색으로 변경 */
    }
    .restaurant-rating {
    font-size: 16px;
    margin-bottom: 10px;
    color: orange; /* 오렌지색으로 변경 */
    }
    .restaurant-address {
    font-size: 10pt;
    color: silver;
    }
    .restaurant-description {
    font-size: 16px;
    line-height: 1.5;
    max-height: 4.5em;
    overflow: hidden;
    position: relative;
    margin-left: 150%; /* 1.5배 오른쪽으로 이동 */
    text-align: center; /* 가운데 정렬 추가 */
    }
    .restaurant-description::after {
    content: "";
    position: absolute;
    bottom: 0;
    right: 0;
    background: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 1) 70%);
    width: 100%;
    height: 1.5em;
    }
    .restaurant-more {
    color: #ff7f00;
    cursor: pointer;
    position: absolute;
    bottom: 0;
    right: 0;
    margin: 0;
    padding: 0;
    background: none;
    border: none;
    font-size: 16px;
    line-height: 1;
    }
	.user-info {
	 display:flex;
	 align-items: center; /* 수직 방향으로 중앙 정렬 */
  	 justify-content: center; /* 수평 방향으로 가운데 정렬 */
 	 margin-bottom: 10px;
	}
    .user-thumbnail {
     width: 70px;
     height: 70px;
     margin-right: 10px;
     border-radius: 50%;
     overflow: hidden;
      
    }
    .user-thumbnail img {
     width: 100%;
     height: 100%;
     object-fit: cover;
    }
    .user-nickname {
    font-size: 20px;
  /* font-weight: bold; */
    }
	.restaurant-item2 {
    width:100%; /* 필요한 가로 간격으로 조정하세요 */
  	}
  	
    <style> 
    .restaurant-item2 {
    display: flex;
    justify-content: space-between;
    align-items: center;
    }

    .restaurant-item2 button {
    margin-left: 10px;
    }
    .header-images {
    display: flex;
    justify-content: center;
    overflow-x: auto;
    white-space: nowrap;
    width:100%;
    /* 추가된 부분: 가로 스크롤 가능하도록 설정 */
    }

    .header-images img {
    width: 250px;
    height: 250px;
    object-fit: cover;
    margin-right: 10px;
    /* 추가된 부분: 이미지 사이 간격 설정 */
    }

    .restaurant-item2 button.like.clicked {
    color: orange;
    }
    
   /* 컨테이너의 최대 너비를 설정하고 중앙 정렬 */
    .container {
    margin: 0px auto;
    max-width: 1380px; /* 원하는 최대 너비 값 설정 (여기서는 1200px로 설정) */
    }
    
   /* 1. 가고싶다, 리뷰쓰기 버튼의 모양 제거 */
    .restaurant-item2 button {
    background: none;
    border: none;
    cursor: pointer;
    font-size: 35px; /* 아이콘 크기를 24px로 설정 */
    color: silver; /* 변경된 부분: 기본 색상을 회색으로 설정 */
    }

    /* 2. 리뷰쓰기 버튼에 hover 효과 추가 */
    .restaurant-item2 button:hover {
    color: orange;
    }

    /* 3. 가고싶다 버튼 클릭시 오렌지색으로 변경 */
    .restaurant-item2 button.like.clicked {
    color: orange;
    }
    /* 가고싶다 버튼 모양 설정 */
	.restaurant-item2 button.like {
	  /* 기본 스타일: 빈 별 모양 (예: ☆) */
	content: "☆";
	}
	
	/* 가고싶다 버튼 클릭시 오렌지색으로 변경 */
    .restaurant-item2 button.like.clicked {
    content: "★";
    color: orange;
	}
	
	/* 모달 */
	.view1{
	border-radius:10px;
	background-color:white;
	box-shadow:1px 1px 1px 1px #ddd;
	}
	
	/* 갤러리 모달 스타일 */
	.gallery-modal {
	display: none;
	position: fixed;
	z-index: 1000;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	overflow: auto;
	}
	
	.gallery-content {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	padding: 20px;
	}
	
	.gallery-content img {
	max-width: 100%;
	height: auto;
	margin:2px 0px;
	} 
	.close-button {
	color: white;
	font-size: 30px;
	position: absolute;
	top: 10px;
	right: 20px;
	cursor: pointer;
	}	
	
	/* 리뷰페이지 스타일 */
/* 	 .container {
    width: 80%;
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
   /* border: 1px solid #ddd; */
   /* background-color: #f9f9f9; */
	} */
	
    .form-group {
    margin-bottom: 15px;
    }
    .form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    }
    
    .form-group input[type="text"],
    .form-group textarea {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
    }
    .form-group textarea {
    resize: vertical;
    height: 100px;
    /* Remove text-area border */
    border: none;
    }
    .form-group button {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 3px;
    cursor: pointer;
    }
    .form-group button:hover {
    background-color: #0056b3;
    }
    .rating-buttons {
    display: flex;
    align-items: center;
    }
    .rating-button {
    margin-right: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 8px 16px;
    border-radius: 3px;
    cursor: pointer;
    }
    .rating-button:hover {
    background-color: #0056b3;
    }
    .review1 {
    border: 1px solid silver;
    width: 100%;
    height: 40%;
    padding: 16px;
    }
     .container1_CancleButton {
    padding: 12px 24px;
 	min-width:140px;
 	min-height:50px;
    margin-right: 16px; 
    border: 1px solid #7F7F7F;
    border-radius: 50px;
 	font-size:16px;
 	color:#7F7F7F;
 	text-align:center;
 	background-color:#FFFFFF;
 	}
     .container1_SubmitButton {
    padding: 12px 24px; 
 	min-width:140px;
 	min-height:50px;
    margin-right: 16px; 
    border: 1px solid #E9E9E9;;
    border-radius: 50px; 
 	font-size:16px;
 	color:#FFFFFF;
 	text-align:center;
 	background-color:#E9E9E9;
 	}
 	.form-group1 {
    position: relative;
    overflow: hidden;
    display: inline-block;
    width: 100px;
    height: 100px;
    border: 2px solid silver;
    border-radius: 8px;
    cursor: pointer;
	}
  .form-group1 input[type="file"] {
    position: absolute;
    left: 0;
    top: 0;
    opacity: 0;
    width: 100%;
    height: 100%;
    cursor: pointer;
	}
  .form-group1::before {
    content: "+";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 32px;
    color: silver;
	}
	
</style>

<!-- 스크립트 ================================================  -->
<script>

	// 화면 크기에 따라 컨텐츠의 크기를 설정하는 함수
	function adjustContentSize() 
	{
		const container = document.querySelector('.container');
		const containerWidth = container.offsetWidth;
		const aspectRatio = 1; // 컨텐츠의 가로:세로 비율 (1:1로 설정)
		const contentHeight = containerWidth / aspectRatio;
		
		container.style.height = `${contentHeight}px`;
	}

	// 페이지 로드 시 컨텐츠 크기를 설정
	window.addEventListener('load', adjustContentSize);
	// 화면 크기가 변경될 때마다 컨텐츠 크기를 다시 설정
	window.addEventListener('resize', adjustContentSize);

	// 가고싶다 버튼 클릭 이벤트 처리
/* 	const likeButton = document.querySelector('.restaurant-item2 button.like');
	likeButton.addEventListener('click', () => 
	{
		likeButton.classList.toggle('clicked');
		// Add or remove the "clicked" class based on the button state
		if (likeButton.classList.contains('clicked')) {
		likeButton.textContent = '★\n가고싶다';
		} else {
		likeButton.textContent = '☆\n가고싶다';
		}
	}); */
</script>
<script>
window.onload = function()
{
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
	
	// ====================================================================== 수정 모달 창
/* 	const openButton1 = document.getElementsByName("open-gallery-button1"); */
	const modal1 = document.getElementById("gallery-modal1");
	const closeButton1 = document.getElementById("close-button1");
	
/* 	for (const button of openButtons) {
		  button.addEventListener("click", () => {
		    modal1.style.display = "block";
		    document.body.style.overflow = "hidden";
		  }); */
		  
	/* openButton1.addEventListener("click", () => {
	  modal1.style.display = "block";
	  document.body.style.overflow = "hidden";
	}); */

	closeButton1.addEventListener("click", () => {
	  modal1.style.display = "none";
	  document.body.style.overflow = "auto";
	});

	window.addEventListener("click", (event) => {
	  if (event.target === modal1) {
	    modal1.style.display = "none";
	    document.body.style.overflow = "auto";
	  }
	});
	
}

function closeModal() 
{
    const modal = document.getElementById('gallery-modal');
    const modal1 = document.getElementById('gallery-modal1');
    modal.style.display = 'none';
    modal1.style.display = 'none';
}

// 리뷰 수정 모달 창 =====================================
function foodReviewModify(obj,food_review_number)
{
	console.log(obj.innerHTML);
	console.log(food_review_number);
	/* const openButton1 = obj; */
	const modal1 = document.getElementById("gallery-modal1");
	const reviewmodify = document.getElementById("reviewmodify");
	
	modal1.style.display = "block";
	document.body.style.overflow = "hidden";
	// 기존에 등록된 이벤트 리스너 제거
	/* reviewmodify.removeEventListener("click", reviewModifyHandler); */
	reviewmodify.onclick = function(){
		 modal1.style.display = "none";
		  document.body.style.overflow = "auto";
		  foodReviewModify_ajax(obj,food_review_number);
	}
// 	reviewmodify.addEventListener("click", () => {
// 		  modal1.style.display = "none";
// 		  document.body.style.overflow = "auto";
// 		  foodReviewModify_ajax(obj,food_review_number);
// 		});

}
// 수정창이 뜨고,리뷰수정완료버튼을 누르면 실행되는 함수 
function foodReviewModify_ajax(obj,food_review_number){
	/* 	const uNo = document.getElementById("uNo"); */
	const review = document.getElementById("review2");
	const array = document.getElementsByName("mobutton"); // 예시: 클래스 이름이 my-element인 요소들의 배열
	const index = Array.prototype.indexOf.call(array, obj);
	
	console.log(food_review_number);
	console.log(review.value);
	console.log(index);
	
	//=================================================== 여기까지 됨. 
	
	$.ajax({
		url: 'foodReviewModify.do', 				// 요청을 보낼 서버의 URL 주소
		method: 'post', 							// HTTP 요청 방식 (GET, POST 등)
		data: { 									// 요청에 포함될 데이터 (옵션)
			/* uNo:uNo.value, */
			food_review_number:food_review_number,
			food_review_content:review.value
		},											
		success: function() 
		{
			alert("성공1");
			document.getElementsByName("review3")[index].innerHTML=review.value;
			review.value="";
			
		},
		error: function(xhr, status, error) {
			console.log('Error:', error);
		}
	});
	
}

</script>
<script>
function insert_foodreview(){
/* 	const uNo = document.getElementById("uNo"); */
	const fNo = document.getElementById("fNo");
	const review = document.getElementById("review");
	console.log(review.value);
	
	
	$.ajax({
		url: 'insert_foodreview.do', 				// 요청을 보낼 서버의 URL 주소
		method: 'post', 							// HTTP 요청 방식 (GET, POST 등)
		data: { 									// 요청에 포함될 데이터 (옵션)
			/* uNo:uNo.value, */
			fNo:fNo.value,
			food_review_content:review.value
		},											
		dataType:"json",
		success: function(json) 
		{
			
			const modal = document.getElementById("gallery-modal");
			document.getElementById("review").value = "";
			modal.style.display = "none";
			document.body.style.overflow = "auto";
			$("#testDiv").prepend('<div id="insertDiv"></div>');
			
			alert("성공2");
			 
			var html ='<div style="border:0px solid red; display: flex;">'
						+'<div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>'
						+'<div class="user-thumbnail">'
						+'<img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">'
						+'</div><br>'
					/* 	+'<div class="user-nickname">세이콩</div>' */
						+'<div class="user-nickname">'+json.uNick+'</div>'
						+'</div>'
						+'<div style="border:0px solid black;  width:70%;"><br>'
						/* +'<span style="color:silver;">2023-06-23</span>' */
						+'<div style="color:silver;">'+json.food_review_writedate+'</div><br>'
						+'<div name="review3">'+json.food_review_content+'</div><br>'
						<!-- 리뷰내용들어갈 자리 -->
						+'</div>'
						+'<div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>'
						+'<svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">'
						+'<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>'
						+'<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>'
						+'</svg><br>'
						+'<span style="font-size:18px; color:orange; ">별로</span>'
						+'<div>'
				       <%--  +'<a href="<%=request.getContextPath()%>/food/foodView.do?food_review_number=' + json.food_review_number + '">수정</a>'   --%>
	     			/* 	+'<button id="open-gallery-button1">수정 </button>' */
	     				+'<button name="mobutton" onclick="foodReviewModify(this,' + json.food_review_number + ') " >수정 </button>'
				        +'<form action="foodReviewDelete.do" method="post">'
				        +'<input type="hidden" name="food_review_number" value="' + json.food_review_number + '">'  
				        +'<input type="hidden" name="fNo" value="' + json.fNo + '">' 
				        +'<button>삭제</button>'
				        +'</form>'
				        +'</div>'
						+'</div>'
						+'</div>'
						+'<hr>'
						document.getElementById("insertDiv").innerHTML = html; 
						
		},
		error: function(xhr, status, error) {
			console.log('Error:', error);
		}
	})
}


/* window.onload = function (){
	var html ='<div style="border:0px solid red; display: flex;">'
				+'<div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>'
				+'<div class="user-thumbnail">'
				+'<img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">'
				+'</div><br>'
				+'<div class="user-nickname">세이콩</div>'
				+'</div>'
				
				+'<div style="border:0px solid black;  width:70%;"><br>'
				+'<span style="color:silver;">2023-06-23</span>'
				+'<label for="review-content"></label><br>'
				<!-- 리뷰내용들어갈 자리 -->
				+'</div>'
				
				+'<div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>'
				+'<svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">'
				+'<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>'
				+'<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>'
				+'</svg><br>'
				+'<span style="font-size:18px; color:orange; ">별로</span>'
				+'</div>'
				+'</div>'
				+'<br><br><hr>'
	      console.log(html);
} */


</script>
</head>

<!-- 뷰 페이지 상단 이미지 5개 ================================================ -->
<!-- <body> -->
	<div class="header-images">
		<div>
			<c:forEach items="${listAttach}" var="listAttach">
				<img src="<%=request.getContextPath() %>/resources/upload/${listAttach.food_attach_physical_name}" width="250" height="250" alt="맛집 썸네일">  
			</c:forEach>
			<!-- <img src="https://mp-seoul-image-production-s3.mangoplate.com/281547/753280_1550146766591_11966?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 1" width="250" height="250">
			<img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722095256513.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 2" width="250" height="250">
			<img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722097838776.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 3" width="250" height="250">
			<img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722099215636.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 4" width="250" height="250">
			<img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722100253838.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 5" width="250" height="250"> -->
		</div>
	</div>

<!-- 뷰 상세 페이지 ================================================ -->
	<div class="container">
		<div class="restaurant-item">
			<div class="restaurant-item2" style="float: left; width:70%;"> 
				<div>
					<div style="width: 100%;"><br><br>
						
						<h2>
							<span>
								<!-- 제목  <span style="color: black;">미라이</span> -->
								<span style="color: black;">${vo.food_name}</span>
								<span style="color: orange;">&nbsp;4.8</span>
							</span>
							
							<button style="float: right;">★<br>가고싶다 </button>
							<!-- <button style="float: right;">✎<br>리뷰쓰기 </button> -->
							<%-- <button style="float: right;"><a href="<%=request.getContextPath()%>/food/foodReviewWrite.do">✎<br>리뷰쓰기</a></button> --%>
							<button id="open-gallery-button" style="float: right; display:inline-block; cursor:pointer;">✎<br>리뷰쓰기</button>
						</h2>	
							<!-- <div class="view" style="width:1224px; margin:0 auto; padding:30px;  line-height:50px; "> -->
<!-- (모달창) 리뷰 페이지   -->
						<!-- <div> -->
							<div class="gallery-modal" id="gallery-modal">
							    <div class="gallery-content">
							    	<div class="close-button" id="close-button" style="display:inline-block;">&times;</div>
								    <div class="view1" style="width:1224px; padding:20px;">
									    <div style="text-align:left; margin:20px;">
										    <span style="font-weight:bold; font-size:15pt;">리뷰 쓰기 </span>
									    </div>
									    
									    <div style="margin:20px; width:1144px; height:1px; background-color:lightgray;"></div>
									    <div style="margin:20px; text-align:left;">
			    								
									<!-- 	<div> 	<div class="container"> -->
											<p><span style="color:#ff7f00; font-size:20pt;">맛집&nbsp;</span><span style="color:silver;">에 대한 솔직한 맛 리뷰를 써주세요</span></p><br>
										 
								<!-- 		<form action="/submit_review" method="POST" enctype="multipart/form-data"> -->
												
												<div class="review1">
													<div class="form-group">
														<div class="rating-buttons">
															<p style="color:silver;">
																<svg xmlns="http://www.w3.org/2000/svg" style="color:silver;" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
																	<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																	<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75a.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25a.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1 .672-1 1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
																</svg>&nbsp;&nbsp;&nbsp;맛있다&nbsp;&nbsp;&nbsp;
															</p>
															<p style="color:silver;">
																<svg xmlns="http://www.w3.org/2000/svg" style="color:silver;" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
																	<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																	<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
																</svg>&nbsp;&nbsp;&nbsp;괜찮다&nbsp;&nbsp;&nbsp;
															</p>
															<p style="color:silver;">
																<svg xmlns="http://www.w3.org/2000/svg" style="color:silver;" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
																	<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																	<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25a.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
																</svg>&nbsp;&nbsp;&nbsp;별로&nbsp;&nbsp;&nbsp;
															</p>
														</div>
													</div>
													<div class="form-group">
														<input type="hidden" id="fNo" value="${vo.fNo}">
													<%-- 	<input type="hidden" id="uNo" value="${login.uNo}"> --%>
														<textarea id="review" name="review" required placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
													</div>
												</div>
										<!-- </form> -->
											<p style="color:silver; float:right;">0/10000</p><br>
									

											<!-- 리뷰 첨부파일 ======================== -->	
											<div style="text-align: right; width:13%;">
												<div class="form-group1">
													<input type="file" id="fileUpload" name="fileUpload">
												</div>
												<br>
												
												<div> <!-- Add this div with the style property -->
													<span style="color: silver;">0/30</span>
												</div>
											</div>
											<div class="container1" style="text-align: right;">
												<!-- <button class="container1_CancleButton" type="submit">취소 </button> -->
												<button class="container1_CancleButton" type="button" onclick="closeModal()">취소</button>
												<button onclick="insert_foodreview()">리뷰 올리기</button>
											</div>
											
										</div>
									</div>		
								</div>
							</div>
<!-- 리뷰 수정 모달 창  -->
							<div class="gallery-modal" id="gallery-modal1">
							    <div class="gallery-content">
							    	<div class="close-button" id="close-button1" style="display:inline-block;">&times;</div>
								    <div class="view1" style="width:1224px; padding:20px;">
									    <div style="text-align:left; margin:20px;">
										    <span style="font-weight:bold; font-size:15pt;">리뷰 수정  </span>
									    </div>
									    
									    <div style="margin:20px; width:1144px; height:1px; background-color:lightgray;"></div>
									    <div style="margin:20px; text-align:left;">
			    								
									<!-- 	<div> 	<div class="container"> -->
											<p><span style="color:#ff7f00; font-size:20pt;">맛집&nbsp;</span><span style="color:silver;">에 대한 솔직한 맛 리뷰를 써주세요</span></p><br>
										 
								<!-- 		<form action="/submit_review" method="POST" enctype="multipart/form-data"> -->
												
												<div class="review1">
													<div class="form-group">
														<div class="rating-buttons">
															<p style="color:silver;">
																<svg xmlns="http://www.w3.org/2000/svg" style="color:silver;" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
																	<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																	<path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75a.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25a.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1 .672-1 1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
																</svg>&nbsp;&nbsp;&nbsp;맛있다&nbsp;&nbsp;&nbsp;
															</p>
															<p style="color:silver;">
																<svg xmlns="http://www.w3.org/2000/svg" style="color:silver;" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
																	<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																	<path d="M4 10.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7a.5.5 0 0 0-.5.5zm3-4C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zm4 0c0-.828-.448-1.5-1-1.5s-1 .672-1 1.5S9.448 8 10 8s1-.672 1-1.5z"/>
																</svg>&nbsp;&nbsp;&nbsp;괜찮다&nbsp;&nbsp;&nbsp;
															</p>
															<p style="color:silver;">
																<svg xmlns="http://www.w3.org/2000/svg" style="color:silver;" width="35" height="35" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
																	<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
																	<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25a.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
																</svg>&nbsp;&nbsp;&nbsp;별로&nbsp;&nbsp;&nbsp;
															</p>
														</div>
													</div>
													<div class="form-group">
														<input type="hidden" id="fNo" value="${vo.fNo}">
													<%-- 	<input type="hidden" id="uNo" value="${login.uNo}"> --%>
														<textarea id="review2" name="review" required placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
													</div>
												</div>
										<!-- </form> -->
											<p style="color:silver; float:right;">0/10000</p><br>
									

											<!-- 리뷰 첨부파일 ======================== -->	
											<div style="text-align: right; width:13%;">
												<div class="form-group1">
													<input type="file" id="fileUpload" name="fileUpload">
												</div>
												<br>
												
												<div> <!-- Add this div with the style property -->
													<span style="color: silver;">0/30</span>
												</div>
											</div>
											<div class="container1" style="text-align: right;">
												<!-- <button class="container1_CancleButton" type="submit">취소 </button> -->
												<button class="container1_CancleButton" type="button" onclick="closeModal()">취소</button>
												<button id="reviewmodify">리뷰 수정</button>
											</div>
											
										</div>
									</div>		
								</div>
							</div>
						<!-- </div>		 -->	
					</div>
				</div><br>
				
<!--  뷰 페이지  -->
				<p>
					<span style="margin-right: 5px;">👁️</span>536,345 	&nbsp;
					<span style="margin-right: 5px;">✏️</span>132		&nbsp;
					<span style="margin-right: 5px;">⭐</span>10,632	&nbsp;
				</p>
				<hr>
				<br><br>

				<!-- <p><strong>주소</strong> 서울특별시 강남구 논현로153길 24 끌레르빌 1F</p> -->
				<p><strong>주소 </strong>${vo.food_address}</p>
				<!-- <p><strong>지번</strong> 서울시 강남구 신사동 557-25 끌레르빌 1F</p> -->
				<!-- <p><strong>전화번호</strong> 02-540-0934</p> -->
				<p><strong>전화번호 </strong>${vo.food_phone}</p>
				<p><strong>음식 종류 </strong>${vo.food_food_kind}</p>
				<p><strong>가격대 </strong> ${vo.food_avg_price}</p>
				<!-- <p><strong>주차 </strong> 주차공간없음</p> -->
				<p><strong>영업시간 </strong>${vo.food_working_hours}</p>
				<p><strong>휴일 </strong>${vo.food_holiday}</p>
				<p><strong>웹사이트 </strong> <a href="${vo.food_website}">식당 홈페이지로 가기</a></p><br><br>

				<h3>메뉴</h3> 
				<button><a href="<%=request.getContextPath()%>/food/foodMenuWrite.do?fNo=${vo.fNo}">메뉴등록버튼 </a></button>
				<ul>
					<c:forEach items="${list}" var="vo">
						<li>${vo.food_menu_name} - ${vo.food_menu_price}</li>
					</c:forEach>
				</ul>
				<br><br>
				
				<!-- <div class="menu-photos">
					<img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905615639113.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 1">
					<img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905615921726.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 2">
					<img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905616194724.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 3">
					<img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905616451296.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 4">
				</div> -->
				<div style="float: right; color:silver;"> 업데이트날짜 : ${vo.food_write_date}</div>
				<br>
				<hr>
			</div>

			<div class="restaurant-item3" style="float: right; width:5%; border:0px solid silver;">
			</div> 
			<div class="restaurant-item4" style="float: right; width:25%; border:0px solid silver; background-color:#e9e9e9;"> 
				<div id="map" style="width:100%;height:400px;"></div>
				<!-- <img src="../img/map.jpg" alt="지도사진"  style="width: 100%;"> -->
			</div>
		</div>
	</div>
  
  
<!-- 리뷰 페이지 ================================================ -->


	<div class="container">
	  <div class="restaurant-item">
	    <div class="restaurant-item2" style="width:70%; border:0px solid blue;">
	      <div style="border:0px solid black; width:100%;">
	        <h4 style="color: black;">
	          리뷰 (29)
	          <span style="color:silver; float:right;">
	            <span>전체(29)</span>&nbsp;&nbsp;|&nbsp;
	            <span>맛있다(9)</span>&nbsp;&nbsp;|&nbsp;
	            <span>괜찮다(19)</span>&nbsp;&nbsp;|&nbsp;
	            <span>별로(1)</span>&nbsp;&nbsp;
	          </span>
	        </h4>
	      </div><br>
<!-- ⚫️================================================= 첫 번째 댓글 S (html)=============================================================================================-->	
	<div id="testDiv" > 
		<div id="insertDiv"></div>
	</div>
	<c:forEach items="${listReview}" var="listReview" varStatus="status">
	      <div style="border:0px solid red; display: flex;">
	        <div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>
	          <div class="user-thumbnail">
	            <img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">
	          </div><br>
	          <div class="user-nickname">${listReview.uNick}</div>
	        </div>
	
	        <div style="border:0px solid black;  width:70%;"><br>
	          <div style="color:silver;">${listReview.food_review_writedate}</div><br>
	         <!--  <label for="review-content"></label><br> -->
	          <div name="review3"> ${listReview.food_review_content}</div><br>
	          <!-- 합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          (이하 내용 생략)-->
	          
	          
	        </div>
	
	        <div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>
	          	<svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
	            	<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	            	<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
	          	</svg><br> 
	        	<span style="font-size:18px; color:orange; ">별로</span>
	        	<div>
	        	<%-- 
	       			<button id="open-gallery-button" style="float: right; display:inline-block; cursor:pointer;">✎<br>리뷰쓰기</button>
	       			<a href="<%=request.getContextPath()%>/food/foodView.do?food_review_number=${listReview.food_review_number}">수정</a> --%>
	     			<!--🔴 뷰 페이지 수정 버튼  -->
	     			<button name="mobutton" onclick="foodReviewModify(this,${listReview.food_review_number}) " >수정 </button>
	     			
	     			
	     			<form action="foodReviewDelete.do" method="post">
	     				<input type="hidden" name="food_review_number" value="${listReview.food_review_number}"> 
	     				<input type="hidden" name="fNo" value="${listReview.fNo}"> 
	     				<button>삭제</button>
	     			</form>
	      	  	</div>
	        </div>
	      </div><hr> 
	</c:forEach><br><br>


<!-- ================================================= 첫 번째 댓글 E (html) =============================================================================================-->	
<!-- ================================================= 첫 번째 댓글 S =============================================================================================-->	
<!-- 
	      <div style="border:0px solid red; display: flex;">
	        <div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>
	          <div class="user-thumbnail">
	            <img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">
	          </div><br>
	          <div class="user-nickname">세이콩</div>
	        </div>
	
	        <div style="border:0px solid black;  width:70%;"><br>
	          <span style="color:silver;">2023-06-23</span>
	          <label for="review-content"></label><br>
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음. 
	          (이하 내용 생략)
	        </div>
	
	        <div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>
	          <svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
	            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	            <path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
	          </svg><br> 
	        <span style="font-size:18px; color:orange; ">별로</span>
	        </div>
	      </div>
	      <br>
	      <br>
		  <hr> 
================================================= 첫 번째 댓글 E =============================================================================================	

2번째 댓글S 
	      <div style="border:0px solid red; display: flex;">
	        <div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>
	          <div class="user-thumbnail">
	            <img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">
	          </div><br>
	          <div class="user-nickname">세이콩</div>
	        </div>
	
	        <div style="border:0px solid black;  width:70%;"><br>
	          <span style="color:silver;">2023-06-23</span>
	          <label for="review-content"></label><br>
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	          합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
	          (이하 내용 생략)
	        </div>
	
	        <div style="border:0px solid black; width:15%; display: flex; flex-direction: column; align-items: center; justify-content: flex-start;"><br><br>
	          <svg xmlns="http://www.w3.org/2000/svg" style="color:orange" width="50" height="50" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
	            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	            <path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
	          </svg><br> 
	           <span style="font-size:18px; color:orange; ">별로</span>
	        </div>
	      </div>
	      <br>
	      <br> 
		  <hr> 	      
2번째 댓글E -->
	
	    </div>
	  </div>
	</div>
	
<!-- ========================  카카오지도api (8080포트설정하기) 위치변경 하지 말것 (지도 api는 위치 그대로 써야함) ==========================================-->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=471bd87d2c2bfa282198a74a11556a57"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			/* center: new kakao.maps.LatLng(33.450701, 126.570667), */
			center: new kakao.maps.LatLng(37.521202058933774, 127.02618079647772),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치 
		var markerPosition  = new kakao.maps.LatLng(37.521202058933774, 127.02618079647772); 
		
		// 마커를 생성
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드
		// marker.setMap(null);    
	</script>
<!-- =========================================================================================== -->	

<%@ include file="../include/footer.jsp" %>