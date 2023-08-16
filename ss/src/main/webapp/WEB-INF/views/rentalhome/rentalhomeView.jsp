<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/datepicker.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=471bd87d2c2bfa282198a74a11556a57&libraries=services"></script>
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
window.onload = function(){
	var isLogin = sessionStorage.getItem("login");
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${rentalhomeVO.address}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
// 	        var infowindow = new kakao.maps.InfoWindow({
// 	            content: '<div style="width:150px;text-align:center;padding:5px 0;">위치</div>'
// 	        });
// 	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
});    
	
	if( isLogin == true && ${like_dupl > 0}){
		document.getElementById("love_full").style.display="block";
		document.getElementById("love_empty").style.display="none";
	}
 	// 숙소 이미지 모달
	if(document.getElementById("open-gallery-button") != null){
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
		  if(event.target == modal) {
		    modal.style.display = "none";
		    document.body.style.overflow = "auto";
		  }
		});
	}

	// 객실 이미지 모달
// 	 	const openButton_room = document.getElementById("open-gallery-button-room");
		const modal_room = document.getElementById("gallery-modal-room");
		const closeButton_room = document.getElementById("close-button-room");
		
		
 		<%-- openBtn.addEventListener("click", (event) => {
 			document.getElementById("gallery-modal-room").style.display = "block";
 			document.body.style.overflow = "hidden";
 			$.ajax({
					url:"rentalhome_room_attach_ByIdx.do",
					type:"get",
					data:{
						  room_idx:room_idx.value
					},
					success:function(list){
						alert("");
						var html = "";
						for (var i = 0; i < list.length; i++) {
							var room = list[i];
							html = html + '<img src="<%=request.getContextPath()%>/resources/upload/${room.physical_name}" style="margin:2px 0px;width:377px; height:250px; border-radius:5px; display:inline-block;">';
						}
						console.log(html);
					},
					error:function(xhr, status, error){
						console.log("ERROR: ", error);
					}
				});
 		}); --%>
		closeButton_room.addEventListener("click", () => {
		  modal_room.style.display = "none";
		  document.body.style.overflow = "auto";
		});
		window.addEventListener("click", (event) => {
		  if(event.target == modal_room) {
		    modal_room.style.display = "none";
		    document.body.style.overflow = "auto";
		  }
		});
	
	// 리뷰 작성 모달
	if( document.getElementById("open-gallery-button-review") != null){
	 	const openButton_review = document.getElementById("open-gallery-button-review");
		const modal_review = document.getElementById("gallery-modal-review");
		const closeButton_review = document.getElementById("close-button-review");

		openButton_review.addEventListener("click", (event) => {
			modal_review.style.display = "block";
			document.body.style.overflow = "hidden";
		});
		closeButton_review.addEventListener("click", () => {
		  modal_review.style.display = "none";
		  document.body.style.overflow = "auto";
		});
		window.addEventListener("click", (event) => {
		  if(event.target == modal_review) {
			modal_review.style.display = "none";
		    document.body.style.overflow = "auto";
		  }
		});
	}
}
function select_img(index){
	const room_idx = document.getElementsByName("ajax_room_idx")[index];
	
	document.getElementById("gallery-modal-room").style.display = "block";
	document.body.style.overflow = "hidden";
	
	$.ajax({
		url:"rentalhome_room_attach_ByIdx.do",
		type:"get",
		data:{
			  room_idx:room_idx.value
		},
		success:function(list){
			var html = "";
			for (var i = 0; i < list.length; i++) {
				var room = list[i];
				console.log(${room.physical_name});
				html = html + '<img src="<%=request.getContextPath()%>/resources/upload/'+room.physical_name+'" style="margin:2px 2px;width:377px; height:250px; border-radius:5px; display:inline-block;">';
			}
			console.log(html);
			document.getElementById("insert_img").innerHTML = html;
		},
		error:function(xhr, status, error){
			console.log("ERROR: ", error);
		}
	});
}


function insert_review(){
	const contents = document.getElementById("contents").value;
	const service = document.getElementById("service").value;
	const facility = document.getElementById("facility").value;
	const clean = document.getElementById("clean").value;
	const price = document.getElementById("price").value;
	const stay_date = document.getElementById("stay_date").value;
	const room_idx = document.getElementById("room_idx").value;
	$.ajax({
			url:"insert_review.do",
			type:"post",
			data:{
				  contents: contents,
		            service: service,
		            facility: facility,
		            clean: clean,
		            price: price,
		            room_idx: room_idx
			},
			success:function(){
					alert("성공");
			},
			error:function(){
				alert("예외발생");
			}
		});
}

function insert_like(){

	const rentalhome_idx = ${rentalhomeVO.rentalhome_idx};
	const insert_ = document.getElementById("love_empty");			// <img> 
	const delete_ = document.getElementById("love_full");			// <img> 
	const like_count = document.getElementById("like_count"); 		// <span>
	
	$.ajax({
		url: 'insert_like.do', 						// 요청을 보낼 서버의 URL 주소
		method: 'post', 							// HTTP 요청 방식 (GET, POST 등)
		data: { 									// 요청에 포함될 데이터 (옵션)
			rentalhome_idx: rentalhome_idx
		},											
		success: function(data) {
			insert_.style.display="none";
			delete_.style.display="block";
			like_count.innerHTML = data;
			
		},
		error: function(xhr, status, error) {
			console.log('Error:', error);
		}
	});
}
function delete_like(){
	const rentalhome_idx = ${rentalhomeVO.rentalhome_idx};
	const delete_ = document.getElementById("love_full");		// <img> 
	const insert_ = document.getElementById("love_empty");		// <img> 
	const like_count = document.getElementById("like_count"); 	// <span>
	
	$.ajax({
		url: 'delete_like.do', 						// 요청을 보낼 서버의 URL 주소
		method: 'post', 							// HTTP 요청 방식 (GET, POST 등)
		data: { 									// 요청에 포함될 데이터 (옵션)
			rentalhome_idx: rentalhome_idx
		},											
		success: function(data) {
			delete_.style.display="none";
			insert_.style.display="block";
			like_count.innerHTML = data;
			
		},
		error: function(xhr, status, error) {
			console.log('Error:', error);
		}
	});
}

</script>
<style type="text/css">
	a {
		text-decoration:none;
		color:black;
	}
	a:hover {
		color:black;
	}
	.like {
		background-size: contain;
		background-repeat: no-repeat;
		background-position: center;
	}
	.user {
		width: 50px;
		height: 50px;
		background-image: url(../img/love_full.png);
		background-size: contain;
		background-repeat: no-repeat;
		background-position: center;
	}
	.hotel {
		background-image: url(../img/no-pictures.png);
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
	.view{
		border-radius:10px;
		background-color:white;
		box-shadow:1px 1px 1px 1px #ddd;
	}
	.search{
		border:none;
		color:#444444;
	}
	.search:hover{
		border-bottom:2px solid #0863ec;
		border-radius:0px;
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
	  background-color: rgba(0, 0, 0, 0.8);
	  overflow: auto;
	  vertical-align:middle;
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
	.modal-center{
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
	}
    .review-num input[type="radio"] {
       display: none;
    }
 
    .review-num input[type="radio"] + span {
        display: inline-block;
        padding:5px 15px;
        border: 0px;
        border-radius: 5px;
        background-color: #eff0f5;
        text-align: center;
        cursor: pointer;
        font-size:10pt;
    }
 
    .review-num input[type="radio"]:checked + span {
        background-color: #0863ec;
        color: #ffffff;
    }
</style>
<div style="width:1920px; text-align:center; background-color:#dfecfb; padding-bottom:50px;">
	<div class="gallery-modal" id="gallery-modal" style="padding:50px;">
    	<div class="close-button" id="close-button" style="display:inline-block;">&times;</div>
	    <div class="view" id="modal-rentalhome" style="width:1224px; padding:20px; display:inline-block;">
		    <div style="text-align:left; margin:20px;">
			    <span style="font-weight:bold; font-size:15pt;">숙소 제공 이미지</span>
		    </div>
		    <div style="margin:20px; width:1144px; height:1px; background-color:lightgray;"></div>
		    <div style="margin:20px; text-align:left;">
			    <c:forEach items="${attach}" var="attach">
			   		<img src="<%=request.getContextPath()%>/resources/upload/${attach.physical_name}" style="margin:2px 0px;width:377px; height:250px; border-radius:5px; display:inline-block;">
			    </c:forEach>
		    </div>
	    </div>
	</div>	
	<div class="gallery-modal" id="gallery-modal-room"  style="padding:50px;">
    	<div class="close-button" id="close-button-room" style="display:inline-block;">&times;</div>
	    <div class="view" id="modal-room" style="width:1224px; padding:20px; display:inline-block;">
		    <div style="text-align:left; margin:20px;">
			    <span style="font-weight:bold; font-size:15pt;">숙소 제공 객실 이미지</span>
		    </div>
		    <div style="margin:20px; width:1144px; height:1px; background-color:lightgray;"></div>
		    <div id="insert_img" style="margin:20px; text-align:left;"></div>
	    </div>
	</div>	
	<%--
	<div class="gallery-modal" id="gallery-modal-review"  style="padding:50px;">
    	<div class="close-button" id="close-button-review" style="display:inline-block;">&times;</div>
	    <div class="view modal-center" id="modal-review" style="width:1224px;padding:20px; display:inline-block; vertical-align:middle;">
		    <div style="text-align:left; margin:20px;">
			    <span style="font-weight:bold; font-size:15pt;">리뷰 작성</span>
		    </div>
			<!-- 로그인 할 경우 표시 -->
<!-- 		    <input type="hidden" name="room_idx" id="room_idx" value=""> -->
		    <div style="margin:10px; width:1144px; height:1px; background-color:lightgray;"></div>
		    <div style="margin:10px; text-align:center; display:inline-block;">
		    	<div style="text-align:left; width:1000px; margin:10px 30px;">
		    		<span style="font-weight:bold;">${rentalhomeVO.name}</span>
		    	</div>
		    	<div style="text-align:left; width:1000px; margin:10px 30px;">
		    		<span style="font-weight:bold;">투숙일</span><input type="date" id="stay_date" name="stay_date" style="margin:0px 20px; border-radius:3px;">
		    	</div>
		    	<div style="text-align:left; width:1000px; display:inline-block; margin:10px 20px;">
			    	<textarea name="contents" id="contents" style="width:100%; height:200px; resize:none; padding:20px; border-radius:10px;"placeholder="리뷰 내용을 작성해주세요."></textarea>
		    	</div>
		    	<div style="text-align:center; width:1000px; margin:10px; display:inline-block;">
		    		<div style="display:inline-block; width:48%; text-align:left; padding:0px 20px;">
			    		<span style="font-weight:bold;">청결</span>
			    		<div style="text-align:center;padding:5px 0px; margin-bottom:10px;">
			    		<%for(int i = 1; i <= 10; i++){%>
				    		<label class="review-num">
    							<input type="radio" id="clean" name="clean" value="<%=i%>">
    							<span><%=i %></span>
							</label>
			    		<%}%>
			    		</div>
		    		</div>
		    		<div style="display:inline-block; width:48%; text-align:left; padding:0px 20px;">
			    		<span style="font-weight:bold;">시설</span>
			    		<div style="text-align:center;padding:5px 0px; margin-bottom:10px;">
			    		<%for(int i = 1; i <= 10; i++){%>
				    		<label class="review-num">
    							<input type="radio" id="facility" name="facility" value="<%=i%>">
    							<span><%=i %></span>
							</label>
			    		<%}%>
			    		</div>
		    		</div>
		    		<div style="display:inline-block; width:48%; text-align:left; padding:0px 20px;">
			    		<span style="font-weight:bold;">서비스</span>
			    		<div style="text-align:center;padding:5px 0px; margin-bottom:10px;">
			    		<%for(int i = 1; i <= 10; i++){%>
				    		<label class="review-num">
    							<input type="radio" id="service" name="service" value="<%=i%>">
    							<span><%=i %></span>
							</label>
			    		<%}%>
			    		</div>
		    		</div>
		    		<div style="display:inline-block; width:48%; text-align:left; padding:0px 20px;">
			    		<span style="font-weight:bold;">가격</span>
			    		<div style="text-align:center;padding:5px 0px; margin-bottom:10px;">
			    		<%for(int i = 1; i <= 10; i++){%>
				    		<label class="review-num">
    							<input type="radio" id="price" name="price" value="<%=i%>">
    							<span><%=i %></span>
							</label>
			    		<%}%>
			    		</div>
			    	</div>
		    	</div>
		    	<div style="text-align:right; width:1000px; margin:10px; display:inline-block;">
		    		<button onclick="insert_review()" style="background-color:#0863ec; color:white; padding:15px 20px; border-radius:10px; border:0px; font-weight:bold;">리뷰 등록</button>
		    	</div>		    	
		    </div>
   	 	</div>
	</div>	
	 --%>
	<div style="position:sticky; top:0px; background-color:#0863ec;z-index:100; border-radius:0px 0px 50px 50px; margin:0 auto; padding:10px;  line-height:50px;">
		<div style="background-color:white;border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
			<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">여행지</span><br>
			<input type="text" class="search" style="font-weight:bold; font-size:11pt;width:230px;position:absolute; top:23px; left:10px; height:25px; outline:none;">
		</div>
		<div style="background-color:white; border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
				<div class="row justify-content-center">
					<div class="col-md-5">
						<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">체크인</span><br>
						<input type="text" class="search form-control datepicker" style="padding:0px; box-shadow:0 0 0 0; font-size:11pt;width:100px;position:absolute; top:23px; left:10px; height:25px; outline:none;">
				</div>
				<div class="col-md-5">
						<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:140px;">체크아웃</span><br>
						<input type="text"  class="search form-control datepicker" style="padding:0px; box-shadow:0 0 0 0; font-size:11pt; width:100px;position:absolute; top:23px; left:140px; height:25px; outline:none;">
					</div>
				</div>
		</div>
		<div style="background-color:white;border:1px solid lightgray; width:250px; height:50px; display:inline-block; border-radius:5px; text-align:left; padding:0px 10px; position:relative;" >
			<span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">인원 수</span><br>
			<select class="search" style="font-weight:bold; font-size:11pt;width:230px;position:absolute; top:23px; left:10px; height:25px; outline:none; ">
				<option selected ></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select>
		</div>
		<div style="background-color:#0863ec; width:80px; height:50px; display:inline-block; border-radius:5px; text-align:center; cursor:pointer;" >
			<span style="font-weight:bold;color:white; font-size:15pt;">검색</span><br>
		</div>
	</div>
	<div class="view" style="width:1224px; text-align:left;margin:30px auto; padding:10px; position:relative;">
		<div style="width:1000px; margin:0 auto; padding:10px; display:inline-block;"> 
		<div style="width:900px;">
			<span style="font-size:20pt; font-weight:bold;">${rentalhomeVO.name}</span><br>
		</div>
			<span style="color:#545454;">${rentalhomeVO.address}</span><br>
			<div style="width:700px; margin:5px 0px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; word-break:break-all">
				<span style="font-size:10pt; color:#545454;">${rentalhomeVO.info}</span><br>
			</div>
		</div>
				<img id="love_full" onclick="delete_like()" src="../img/love_full.png" class="like" style="display:none; width:50px; height:50px; position:absolute; top:30px; right:210px;">
				<img id="love_empty" onclick="insert_like()" src="../img/love_empty.png" class="like" style="width:50px; height:50px; position:absolute; top:30px; right:210px;">
		<div style="width:100px; text-align:center; position:absolute; top:70px; right:185px;">
			<span id="like_count" style="font-size:25pt; color:#FA5858; font-weight:bold; ">${like_count}</span>
		</div>
		<a href="#room" style="color:white;"><span style="text-align:center; width:160px; height:80px; padding:20px 20px; position:absolute; top:30px; left:1040px; background-color:#0863ec; border-radius:20px; font-size:20pt; font-weight:bold;">객실선택</span></a>
		<div style="width:100%; border-radius:5px; display:inline-block; margin-left:10px;">
			<c:forEach items="${attach}" var="attach" begin="0" end="5" varStatus="status">
				<c:choose>
					<c:when test="${status.last}">
						<div id="open-gallery-button" style="cursor:pointer; display:inline-block; position:relative;">
							<img src="<%=request.getContextPath()%>/resources/upload/${attach.physical_name}" style="filter: brightness(30%); opacity:0.7;width:385px; height:210px; border-radius:5px; margin:4px 2px; display:inline-block; position:relative;">
							<span style="color:white; font-weight:bold; position:absolute; top:95px; right:100px; font-size:15pt;">숙소 이미지 더보기</span>
						</div>
					</c:when>
					<c:otherwise>
						<img src="<%=request.getContextPath()%>/resources/upload/${attach.physical_name}" style="width:385px; height:210px; border-radius:5px; margin:4px 2px; display:inline-block;">
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div style="vertical-align:top; display:inline-block;border:1px solid #ddd; border-radius:5px;text-align:left; width:300px; height:210px; margin:10px 0px 10px 10px; padding:10px 0px;" >
			<div style="width:100px; height:30px; margin:5px 0px 10px 20px;"><span style="font-weight:bold;color:#282828;">리뷰 점수</span></div>
			<div style="text-align:center;">
				<div style="text-align:left;width:120px; height:50px;display:inline-block; margin:5px; position:relative;"><span style="font-weight:bold;">청결</span>&nbsp;&nbsp;8<br>
					<div style="border-radius:10px; background-color:#1c77f6; margin:5px 0px; padding:1px; height:10px; width:80px; position:absolute; top:25px; left:0px; z-index:5;"></div>
					<div style="border-radius:10px; background-color:#d1d1d1; margin:5px 0px; padding:1px; height:10px; width:100px; position:absolute; top:25px; left:0px;"></div>
				</div>
				<div style="text-align:left; width:120px; height:50px;display:inline-block; margin:5px; position:relative;"><span style="font-weight:bold;">가격</span>&nbsp;&nbsp;6<br>
					<div style="border-radius:10px; background-color:#1c77f6; margin:5px 0px; padding:1px; height:10px; width:60px; position:absolute; top:25px; left:0px; z-index:5;"></div>
					<div style="border-radius:10px; background-color:#d1d1d1; margin:5px 0px; padding:1px; height:10px; width:100px; position:absolute; top:25px; left:0px;"></div>
				</div>
				<div style="text-align:left; width:120px; height:50px;display:inline-block; margin:5px; position:relative;"><span style="font-weight:bold;">서비스</span>&nbsp;&nbsp;9<br>
					<div style="border-radius:10px; background-color:#1c77f6; margin:5px 0px; padding:1px; height:10px; width:90px; position:absolute; top:25px; left:0px; z-index:5;"></div>
					<div style="border-radius:10px; background-color:#d1d1d1; margin:5px 0px; padding:1px; height:10px; width:100px; position:absolute; top:25px; left:0px;"></div>
				</div>
				<div style="text-align:left; width:120px; height:50px; display:inline-block; margin:5px; position:relative;"><span style="font-weight:bold;">시설</span>&nbsp;&nbsp;4<br>
					<div style="border-radius:10px; background-color:#1c77f6; margin:5px 0px; padding:1px; height:10px; width:40px; position:absolute; top:25px; left:0px; z-index:5;"></div>
					<div style="border-radius:10px; background-color:#d1d1d1; margin:5px 0px; padding:1px; height:10px; width:100px; position:absolute; top:25px; left:0px;"></div>
				</div>
			</div>
		</div>
		<div style="vertical-align:top; display:inline-block; border:1px solid #ddd; border-radius:5px; text-align:left;width:360px; height:210px;padding:10px 20px; margin:10px 0px 10px 10px;" >
			<div style="width:100px; height:30px; margin:5px 0px;"><span style="font-weight:bold;color:#282828;">호텔 시설</span></div>
				<c:if test="${rentalhomeVO.inPool_yn == 'Y' || rentalhomeVO.outPool_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/pool.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">수영장</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.parking_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/parking.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">주차장</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.pickup_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/pickup.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">픽업</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.wifi_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/wifi.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.beach_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/beach.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">인근해변</span>
					</div>	
				</c:if>
				<c:if test="${rentalhomeVO.bbq_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/bbq.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">바베큐</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.breakfast_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/breakfast.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">조식</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.animal_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/dog.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">반려동물</span>
					</div>
				</c:if>
			</div>
		<div id="map" style="vertical-align:top;display:inline-block; text-align:center;border:1px solid #ddd; border-radius:5px; width:490px; height:210px; margin:10px 0px 10px 10px;" >
		</div>
	</div>
	<div class="view" style="width:1224px; margin:20px auto;position:sticky; top:72px;z-index:100;text-align:center; padding:0px 20px; border-bottom:1px solid #d5d9e0;">
		<div style="width:30%; height:100%; display:inline-block; padding:10px 0px; font-weight:bold;"><a href="#room">객실</a></div>
		<div style="width:30%; height:100%; display:inline-block; padding:10px 0px; font-weight:bold;"><a href="#review">리뷰</a></div>
		<div style="width:30%; height:100%; display:inline-block; padding:10px 0px; font-weight:bold;"><a href="#rentalhome_rule">숙소 규정</a></div>
	</div>
	<div class="view" id="room" style="width:1224px; text-align:left; margin:10px auto;">
		<div>
			<div style="display:inline-block;padding:20px;">
				<span style="font-weight:bold; font-size:15pt;">객실 정보</span>
			</div>
			<div style="display:inline-block; width:1040px; text-align:right;">
				<button onclick="location.href='rentalhomeWrite_room.do?rentalhome_idx=${rentalhomeVO.rentalhome_idx}'"style="background-color:transparent; border:0px; width:150px; height:30px; display:inline-block; font-weight:bold;">객실 등록하기</button>
			</div>
		</div>
		<div style="height:1px; background-color:lightgray;"></div>
		<c:forEach items="${list}" var="list" varStatus="status">
			<div style="width:100%; height:200px; margin:20px 10px;  text-align:center; position:relative; ">
				<c:choose>
					<c:when test="${not empty list.physical_name}">
						<div onclick="select_img(${status.index})" style="display:inline-block; position:absolute; top:0px; left:20px;">
						<input type="hidden" name="ajax_room_idx" value="${list.room_idx}">
							<img src="<%=request.getContextPath()%>/resources/upload/${list.physical_name}" style="cursor:pointer;border-radius:20px; width:240px; height:200px; display:inline-block;">
						</div>
					</c:when>
					<c:otherwise>
						<div class="hotel" style="border-radius:20px; width:240px; height:200px; display:inline-block; position:absolute; top:0px; left:20px;"></div>
					</c:otherwise>
				</c:choose>
				<div style="text-align:left; width:750px; height:150px; margin:20px; padding:10px; display:inline-block; position:absolute; top:0px; left:250px;">
					<div style="margin-bottom:10px;">
						<span style="font-weight:bold; font-size:15pt;">${list.name }</span><br>
					</div>
					<div style="display:inline-block; width:180px; height:30px;">
						<img src="../img/user.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">성인${list.min_person}명 - 성인${list.max_person}명</span>
					</div>
					<div style="display:inline-block; width:150px; height:30px;">
						<img src="../img/bed.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">${list.bed_info}</span>
					</div>
					<c:if test="${list.smoking eq 'N'}">
						<div style="display:inline-block; width:120px; height:30px;">
							<img src="../img/dont-smoke.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">금연객실</span>
						</div>
					</c:if>
					<c:if test="${list.wifi eq 'Y'}">
						<div style="display:inline-block; width:100px; height:30px;">
							<img src="../img/wifi.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
						</div>
					</c:if>
					<br>
					<div style="width:98%; text-align:right; padding-top:20px;">
						<span style="font-size:20pt; color:#666666; text-decoration:line-through;">${list.weekday_price}원</span>
						<span style="font-size:25pt; font-weight:bold; ">15,000원</span>
					</div>
				</div>
				<span onclick="location.href='rentalhomeReserve.do'"style="cursor:pointer; text-align:center; width:160px; height:80px; padding:20px 20px; position:absolute; top:80px; margin:10px; left:1010px; background-color:#0863ec; border-radius:20px; font-size:20pt; color:white; font-weight:bold;">예약</span>
				<button onclick="location.href='rentalhomeModify_room.do?room_idx=${list.room_idx}&rentalhome_idx=${list.rentalhome_idx }'" style="width:150px; border:0px; background-color:transparent; text-align:center; height:20px;  position:absolute; top:0px; margin:10px; left:1035px; font-size:12pt; color:gray; text-decoration:underline;">객실 정보 수정</button>
				<form action="rentalhomeDelete_room.do" method="post">
					<input type="hidden" name="room_idx" value="${list.room_idx}">
					<input type="hidden" name="rentalhome_idx" value="${list.rentalhome_idx}">
					<button style="border:0px; background-color:transparent; text-align:center; width:150px; height:20px;  position:absolute; top:40px; margin:10px; left:1055px; font-size:12pt; color:gray; text-decoration:underline;">객실 삭제</button>
				</form>
			</div>
			<div style="height:1px; background-color:lightgray;"></div>
		</c:forEach>
	</div>
	<div class="view" style="width:1224px; height:520px; text-align:left; padding:10px; margin:10px auto;">
		<div style="padding:10px 0px; margin-bottom:20px;">
			<span style="font-weight:bold; font-size:15pt; padding:10px;">주변숙소</span>&nbsp;<span style="color:gray;">1박 기준 객실 최저가</span>
		</div>
		<div style="text-align:center;"> 
		<%
			for(int i=0; i <4; i++)
			{
		%>
			<div style="display:inline-block;">
				<div class="hotel" style="box-shadow: 2px 0px 1px 0px #d5d9e0; width:270px; height:200px; border-radius:10px 10px 0px 0px; margin:0px 10px;"></div>
				<div style="box-shadow: 1px 1px 1px 1px #d5d9e0; width:270px; height:200px; border-radius:0px 0px 10px 10px; margin:0px 10px; padding:10px;">
					<div style="width:100%; height:150px; text-align:left;">
						<span style="font-weight:bold;">페어필드 바이 메리어트 서울</span><br>
						<span style="font-size:10pt;">대한민국 서울특별시 영등포구 경인로 870</span><br>
						<span style="font-size:10pt;">페어필드 바이 메리어트 서울 (Fairfield by Marriott Seoul)의 숙소 정보
						</span><br>
					</div>
					<div style="text-align:right;">
						<span style="font-size:10pt; color:#666666; text-decoration:line-through;">21,000원</span>
						<span style="font-size:12pt; font-weight:bold; ">15,000원</span>
					</div>
				</div>
			</div>
		<%
			}
		%>
		</div>
	</div>
	<div class="view" id="review" style="width:1224px; text-align:left; padding:20px; margin:10px auto;">
		<span style="font-weight:bold; font-size:15pt;">리뷰</span><span style="font-size:10pt;">(107)</span><br>
		<div style="text-align:center; display:inline-block; width:300px; margin-right:100px;">
		<span style="border-radius:20px; font-size:30pt; font-weight:bold; padding:20px;">7.5/10</span>
		</div>
		<div style="display:inline-block; width:760px;">
			<div style="width:325px; height:50px; margin:0px 20px; display:inline-block; position:relative;">
				<span style="font-weight:bold;">청결</span>&nbsp;&nbsp;8<br>
				<div style="border-radius:10px; background-color:#d1d1d1; margin:10px 0px; height:10px; width:300px; position:absolute; top:24px; left:0px;"></div>
				<div style="border-radius:10px; background-color:#1c77f6; margin:10px 0px; height:10px; width:240px; position:absolute; top:24px; left:0px; z-index:10;"></div>
			</div>
			<div style="width:325px; height:50px; margin:0px 20px; display:inline-block; position:relative;">
				<span style="font-weight:bold;">위치</span>&nbsp;&nbsp;6<br>
				<div style="border-radius:10px; background-color:#d1d1d1; margin:10px 0px; height:10px; width:300px; position:absolute; top:24px; left:0px;"></div>
				<div style="border-radius:10px; background-color:#1c77f6; margin:10px 0px; height:10px; width:180px; position:absolute; top:24px; left:0px; z-index:10;"></div>
			</div>
			<div style="width:325px; height:50px; margin:0px 20px; display:inline-block; position:relative;">
			<span style="font-weight:bold;">서비스</span>&nbsp;&nbsp;9<br>
				<div style="border-radius:10px; background-color:#d1d1d1; margin:10px 0px; height:10px; width:300px; position:absolute; top:24px; left:0px;"></div>
				<div style="border-radius:10px; background-color:#1c77f6; margin:10px 0px; height:10px; width:270px; position:absolute; top:24px; left:0px; z-index:10;"></div>
			</div>
			<div style="width:325px; height:50px; margin:0px 20px; display:inline-block; position:relative;">
			<span style="font-weight:bold;">시설</span>&nbsp;&nbsp;4<br>
				<div style="border-radius:10px; background-color:#d1d1d1; margin:10px 0px; height:10px; width:300px; position:absolute; top:24px; left:0px;"></div>
				<div style="border-radius:10px; background-color:#1c77f6; margin:10px 0px; height:10px; width:120px; position:absolute; top:24px; left:0px; z-index:10;"></div>
			</div>
		</div>
		<div style="border:1px solid #efefef; border-radius:10px; width:1150px; height:200px; margin:30px 15px; padding:20px; position:relative;">
			<div class="user" style="position:absolute;"></div>
			<div style="position:absolute; width:200px; top:20px; left:80px; font-size:15pt; font-weight:bold;">김남도</div>
			<div style="position:absolute; width:200px; top:50px; left:80px; color:#777777;">2023-07-18</div>
			<div style="position:absolute; width:300px; top:100px; color:#444444; font-weight:bold;">페어필드 바이 메리어트 서울</div>
			<div style="position:absolute; width:300px; top:130px; color:#444444;">설무리 방</div>
			<div style="position:absolute; width:300px; top:160px; color:#777777;">투숙일: 2023-07-15</div>
			<div style="position:absolute; width:50px; top:30px; left:200px;">
				<span style="font-size:18pt; font-weight:bold; padding:10px; border-radius:10px; color:#0156df;">8.1/10</span>
			</div>
			<div style="position:absolute; width:750px; top:30px; left:350px;">
			영등포역과 아주 가깝고 바로앞에 버스 정류장도 있어서 위치는 아주 좋아요. 오픈한지 얼마 안되어 그런지 시설은 아주 깨끗하고 깔끔하고 무엇보다 침구류가 너무 좋더라구요. 
			</div>
		</div>
<!-- 		<div style="text-align:right; height:50px; line-height:50px; margin:10px 20px;"> -->
<!-- 			<span id="open-gallery-button-review" style="padding:15px; color:white; background-color:#0863ec; border-radius:10px; font-weight:bold; font-size:11pt; cursor:pointer;">리뷰 작성</span> -->
<!-- 		</div> -->
	</div>
	<div class="view" id="rentalhome_rule" style="width:1224px; text-align:left; padding:20px; margin:10px auto;">
		<span style="font-weight:bold; font-size:15pt;">숙소 규정</span><br>
		<div style="padding:0px 30px;">
			<div style="display:inline-block; width:300px; margin-top:40px;">
				<span style="font-weight:bold;">체크인 & 체크아웃</span>
			</div>
			<div style="display:inline-block; width:200px;">
				체크인 가능시간
			</div>
			<div style="display:inline-block; width:200px;">
				<span style="font-weight:bold;">${rentalhomeVO.checkIn}</span>
			</div>
			<div style="display:inline-block; width:200px;">
				체크아웃 가능시간
			</div>
			<div style="display:inline-block; width:200px;">
				<span style="font-weight:bold;">${rentalhomeVO.checkOut}</span>
			</div>
			<div style="display:inline-block; width:300px;margin-top:30px;">
			<span style="font-weight:bold;">체크인 방법</span>
			</div>
			<div style="display:inline-block; width:800px;">
				${rentalhomeVO.checkIn_info}
			</div>
			<div style="display:inline-block; width:300px; margin-top:30px; margin-bottom:20px">
			<span style="font-weight:bold;">조식</span>
			</div>
			<div style="display:inline-block; width:200px;">
				요금
			</div>
			<div style="display:inline-block; width:500px;">
				<span style="font-weight:bold;">${rentalhomeVO.breakfast_price}원/1인당</span>
			</div>
			<div style="display:inline-block; width:300px;">
			</div>
			<div style="display:inline-block; width:200px;">
				영업시간
			</div>
			<div style="display:inline-block; width:600px;">
				<span style="font-weight:bold;">${rentalhomeVO.breakfast_open}~${rentalhomeVO.breakfast_close} [${rentalhomeVO.breakfast_day}]</span>
			</div>
			<div style="display:inline-block; width:300px; margin-top:40px;">
				<span style="font-weight:bold;">시설</span>
			</div>
			<div style="display:inline-block; width:800px;">
				<c:if test="${rentalhomeVO.inPool_yn == 'Y' || rentalhomeVO.outPool_yn == 'Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/pool.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">수영장</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.parking_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/parking.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">주차장</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.pickup_yn  =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/pickup.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">픽업</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.wifi_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/wifi.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.beach_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/beach.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">인근해변</span>
					</div>	
				</c:if>
				<c:if test="${rentalhomeVO.bbq_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/bbq.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">바베큐</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.breakfast_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/breakfast.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">조식</span>
					</div>
				</c:if>
				<c:if test="${rentalhomeVO.animal_yn =='Y'}">
					<div style="display:inline-block; width:100px; height:30px; margin:10px 0px;">
						<img src="../img/dog.png" style="width:30px; height:30px;"><span style="font-size:10pt; margin-left:5px;">반려동물</span>
					</div>
				</c:if>
			</div>
		</div>
	</div>
		<!-- and login.id eq vo.id -->
<%-- 				<c:if test="${not empty login}"> --%>
					<div style="width:1224px; display:inline-block; text-align:right; margin:20px 0px;">
						<form action="rentalhomeDelete.do" method="post" style="display:inline-block;">
							<input type="hidden" name="rentalhome_idx" value="${rentalhomeVO.rentalhome_idx}">
							<button style="padding:15px; color:white; background-color:#0863ec; border-radius:10px; font-weight:bold; font-size:11pt; border:0px;">숙소 삭제</button>
						</form>
						<span onclick="location.href='rentalhomeModify.do?rentalhome_idx=${rentalhomeVO.rentalhome_idx}'" style="padding:15px; color:white; background-color:#0863ec; border-radius:10px; font-weight:bold; font-size:11pt; cursor:pointer;">숙소 정보 변경</span>
					</div>
<%-- 				</c:if> --%>
</div>
<%@ include file="../include/footer.jsp" %>