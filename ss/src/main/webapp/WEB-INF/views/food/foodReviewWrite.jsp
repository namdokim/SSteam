<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>맛집 리뷰 글쓰기</title>

<!-- ====================================== -->  
  <style>

    body {
      font-family: Arial, sans-serif;
    }
    .container {
      width: 80%;
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
     /* border: 1px solid #ddd; */
     /* background-color: #f9f9f9; */
	}
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
</head>

<!-- =================================== -->
<body>

	<div class="container">
		<p><span style="color:#ff7f00; font-size:20pt;">맛집&nbsp;</span><span style="color:silver;">에 대한 솔직한 맛 리뷰를 써주세요</span></p><br>
	 
<!-- ----------------------------------- -->		
		<form action="/submit_review" method="POST" enctype="multipart/form-data">
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
					<textarea id="review" name="review" required placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
				</div>
				
			</div>
		</form>
<!-- ----------------------------------- -->	
		<p style="color:silver; float:right;">0/10000</p>
		<br>
		
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
			<button class="container1_CancleButton" type="submit">취소 </button>
			<button class="container1_SubmitButton" type="submit">리뷰 올리기</button>
		</div>
<!-- ----------------------------------- -->	
	</div>
  
<!-- SCRIPT ============================= -->
<script>

	const ratingInput = document.getElementById("rating");
	const ratingValueSpan = document.getElementById("ratingValue");

	function setRating(rating) 
	{
		ratingInput.value = rating;
		ratingValueSpan.innerText = rating;
	}

</script>
<!-- =================================== -->
</body>
</html>
<%@ include file="../include/footer.jsp" %>
