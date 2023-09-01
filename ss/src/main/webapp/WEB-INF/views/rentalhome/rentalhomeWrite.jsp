<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
	  document.getElementById("search_address").addEventListener("click", function(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            document.getElementById("address").value = data.address; // 주소 넣기
	        }
	    }).open();
	  });
}
</script>
<!-- CSS ================================================================= -->
<style>
.form-signin .scrollable-x {
  overflow-x: auto;
  white-space: nowrap;
}

.form-signin {
  max-width: 700px;
  padding: 15px;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input {
  margin-bottom: 1px;


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
    background: url(../img/homeback.jpg) no-repeat center center;
    background-size: cover;
    height:400px
}	
</style>

<div class="masthead text-center pt-5" style="height:200%; font-family: 'TheJamsil5Bold';">
	<div class="form-signin card shadow-sm w-100 m-auto" >
		<form action="rentalhomeWrite.do" method="post" style="text-align: center;" enctype="multipart/form-data">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do" title="Arcalive">
			<svg xmlns="http://www.w3.org/2000/svg" style="color:#0863ec" width="72" height="60" fill="currentColor" class="bi bi-house-add" viewBox="0 0 16 16">
			  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h4a.5.5 0 1 0 0-1h-4a.5.5 0 0 1-.5-.5V7.207l5-5 6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
			  <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 1 0 1 0v-1h1a.5.5 0 1 0 0-1h-1v-1a.5.5 0 0 0-.5-.5Z"/>
			</svg>
			</a>
			<h1 class="h3 mb-3 fw-normal" style="color:#0863ec">숙소 등록하기</h1>
	
			<div class="form-floating">
				<input type="text" class="form-control" placeholder="숙박 시설 이름" id="name" name="name">
				<label for="floatingInput" class="text-muted">숙박 시설 이름</label>
			</div>
			<div class="d-flex">
			<span class=" btn btn-outline-primary py-1 my-1 float-left w-25" id="search_address" style="cursor:pointer;">주소 찾기</span>
			</div>
			<div class="form-floating ">
				<input type="text" class="form-control" id="address" readonly placeholder="주소" name="address">
				<label for="floatingPassword" class="text-muted">주소</label>
			</div>
	
			<div class="form-floating mb-3">
				<textarea class="form-control" placeholder="숙소 소개글"  name="info"  style="height: 200px; resize: none"></textarea>
  				<label for="floatingTextarea2" class="text-muted">숙소 소개글</label>
			</div>
			
			
			
			<div class="mb-2">
				<select name="type" class="form-select" aria-label="Default select example">
					<option selected value="">숙소 종류</option>
					<option value="motel">모텔</option>
					<option value="hotel">호텔</option>
					<option value="resort">리조트</option>
					<option value="pension">펜션</option>
					<option value="guesthouse">게스트 하우스</option>
					<option value="camping">캠핑  & 글램핑</option>
				</select>
			</div>
			<div class="card mb-2">
				<span class="text-muted ">호텔내 시설체크</span>
				<div class="py-md-1 ms-4" style="text-align: left;">
					<input type="checkbox" class="btn-check" name="inPool_yn" value="Y" id="btn-check-outlined1" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined1">내부 수영장</label>
					<input type="checkbox" class="btn-check" name="outPool_yn" value="Y" id="btn-check-outlined2" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined2">야외 수영장</label>
					<input type="checkbox" class="btn-check" name="parking_yn" value="Y" id="btn-check-outlined3" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined3">주차장</label>
					<input type="checkbox" class="btn-check" name="pickup_yn" value="Y" id="btn-check-outlined4" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined4">픽업</label>
					<input type="checkbox" class="btn-check" name="wifi_yn" value="Y" id="btn-check-outlined5" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined5">와이파이</label>
					<input type="checkbox" class="btn-check" name="beach_yn" value="Y" id="btn-check-outlined6" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined6">인근해변</label>
					<input type="checkbox" class="btn-check" name="bbq_yn" value="Y" id="btn-check-outlined7" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined7">바베큐</label>
					<input type="checkbox" class="btn-check" name="breakfast_yn" value="Y" id="btn-check-outlined8" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined8">조식</label>
					<input type="checkbox" class="btn-check" name="animal_yn" value="Y" id="btn-check-outlined9" autocomplete="off">
					<label style="display:inline-block; width:120px;" class="btn btn-outline-primary my-1" for="btn-check-outlined9">반려동물</label>
				</div>
			</div>
			
			<div class="d-flex mt-3">
				<h5 class="text-left ms-2" >체크인</h5>
			</div>
			<div class="card px-3 py-3">
				<div class="row align-items-center">
					<div class="form-floating col">	
						<input type="text" class="form-control ps-3" placeholder="체크 인 시간" name="checkIn">
						<label for="checkIn" class="text-muted ms-3">체크 인 시간</label>
					</div>
						
						-
					
					<div class="form-floating col">	
						<input type="text" class="form-control ps-3" placeholder="체크 아웃 시간" name="checkOut">
						<label for="checkOut" class="text-muted ms-3">체크 아웃 시간</label>
					</div>
				</div>
				
				<div class="form-floating my-2">
					<input type="text" class="form-control" name="checkIn_info" placeholder="체크인 방법">
					<label for="checkIn_info" class="text-muted">체크인 방법</label>
				</div>
			</div>
			<div class="d-flex mt-3">
				<h5 class="text-left ms-2" >조식</h5>
			</div>
			<div class="card px-3 py-3">
				<div class="form-floating mx-1 my-1">
					<input type="text" class="form-control" placeholder="요금 / 1인" name="breakfast_price">
					<label for="floatingInput" class="text-muted">요금 / 1인</label>
				</div>
				
				<div class="d-flex">
					<span class="text-left ms-2 mt-2">영업시간</span>
				</div>
				<div class="d-flex">
					<div class="form-floating col mx-1 my-1">
						<input type="text" class="form-control ps-3" id="breakfast_open" placeholder="open" name="breakfast_open">
						<label for="breakfast_open" class="text-muted ms-1">open</label>
					</div>
					<div class="form-floating col mx-1 my-1">
						<input type="text" class="form-control ps-3" id="breakfast_close" placeholder="close" name="breakfast_close">
						<label for="breakfast_close" class="text-muted ms-1">close</label>
					</div>
				</div>	
				<div class="d-flex">
					<span class="text-left ms-2 mt-2">영업일</span>
				</div>
				<div class="card mb-2 mx-1">
				<div class="d-flex my-3 justify-content-center">
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="월요일">
						<label class="form-check-label" for="flexCheckDefault">
							월요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="화요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							 화요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="수요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							수요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="목요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							목요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="금요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							금요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="토요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							토요일
						</label>
					</div>
					
					<div class="form-check mx-2">
						<input class="form-check-input" type="checkbox" name="breakfast_day" value="일요일">
						<label class="form-check-label ms-0" for="flexCheckDefault">
							일요일
						</label>
					</div>
				</div>
			</div>
			</div>
		
			<div class="d-flex ms-2">
				<h1 class="h5 my-3 fw-normal">파일 업로드</h1>
			</div>	
		
			<div class="card">
				<div class="d-flex">
					<label class="btn btn-primary float-left ms-2 my-2" >
					이미지 선택			
					<input type="file" name="multiFile" multiple required style="display: none;">
					</label>
				</div>	
				<div class="ms-4" id="preview" style="overflow-y: auto; max-height: 230px; text-align: left;"></div>
			</div>	
			<br>
			<button class="w-100 btn btn-lg btn-primary" >
				등록
			</button>
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp" %> 