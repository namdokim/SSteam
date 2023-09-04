<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%	
	String LType = request.getParameter("LType");
	if (LType == null) {  LType = "TT"; }
%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 주소 찾기 창 
	window.onload = function()
	{
	   document.getElementById("search_address").addEventListener("click", function(){
	      new daum.Postcode({
	         oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            document.getElementById("food_address").value = data.address; // 주소 넣기
	         }
	      }).open();
	   });
	}
	
    function validateForm() {
    	/* alert("유효성검사  "); */
        var foodName = document.getElementById("food_name").value;
        var foodAddress = document.getElementById("food_address").value;
        var foodPhone = document.getElementById("food_phone").value;
        var foodKind = document.getElementById("food_food_kind").value;
        var foodPrice = document.getElementById("food_avg_price").value;
        var foodWorking = document.getElementById("food_working_hours").value;
        var foodHoliday = document.getElementById("food_holiday").value;
        var foodWebsite = document.getElementById("food_website").value;
        var foodContent = document.getElementById("food_content").value;
        var LType = document.getElementById("LType").value;
        var multiFile = document.getElementById("multiFile");

        // 모든 필수 입력란이 작성되지 않았을 경우 경고 메시지를 보여주고 false를 반환하여 폼 제출을 막습니다.
        if (foodName === "" ) {
            alert("가게이름을 작성해주세요 .");
            return false;
        }
        if (foodAddress === "" ) {
            alert("주소를 작성해주세요 .");
            return false;
        }
        if (foodPhone === "" ) {
            alert("전화번호를 작성해주세요 .");
            return false;
        }
        if (foodKind === "" ) {
            alert("대표음식종류를 작성해주세요 .");
            return false;
        }
        if (foodPrice === "" ) {
            alert("음식평균가격대를 작성해주세요 .");
            return false;
        }
        if (foodWorking === "" ) {
            alert("영업시간을 작성해주세요 .");
            return false;
        }
        if (foodHoliday === "" ) {
            alert("휴일을 작성해주세요 .");
            return false;
        }
        if (foodWebsite === "" ) {
            alert("웹사이트를 작성해주세요 .");
            return false;
        }
        if (foodContent === "" ) {
            alert("맛집설명을 작성해주세요 .");
            return false;
        }
        if (LType === "TT" ) {
            alert("지역 타입을 작성해주세요 .");
            return false;
        }
        
        if (multiFile.files.length === 0) {
            alert('파일을 선택해주세요.');
            return false;
        } else if (multiFile.files.length < 5){
        	alert('이미지를 5개이상 넣어주세요.');
        	return false;
        }
        // 모든 필수 입력란이 작성된 경우 true를 반환하여 폼 제출을 허용합니다.
        return true;
    }
</script>
<!-- CSS ================================================================= -->
	<title>식당 등록 페이지</title>
	<style>
		table { border-collapse: collapse; width: fit-content; margin: 20px auto; }
		th { border: 1px solid black; padding: 8px; text-align: center; background-color: orange; }
		td { border: 1px solid black; padding: 8px; text-align: left; }
		#map { width: 100%; height: 400px; display: none; margin: 20px auto; }
		.form-signin { max-width: 600px; padding: 15px; }
		.form-signin .form-floating:focus-within { z-index: 2; }
		.form-signin input { margin-bottom: 1px; }
	</style>

<!-- 테이블(DB name) ======================================================= -->
	<div class="text-center pt-5" style="height:150%; background-color: #FFFCF5;">
		<div class="form-signin card shadow-sm w-100 m-auto">
			<form action="foodMainWrite.do" method="post" style="text-align: center;" enctype="multipart/form-data" onsubmit="return validateForm()" >
			<input type="hidden" name="uNo" value="${login.uNo}">
				<a class="navbar-brand" href="<%=request.getContextPath()%>/food/foodMain.do" title="Arcalive">
				<svg class="ms-1 mb-4" style="color:#FFA500" xmlns="http://www.w3.org/2000/svg" width="72" height="60" fill="currentColor" class="bi bi-cup-hot" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M.5 6a.5.5 0 0 0-.488.608l1.652 7.434A2.5 2.5 0 0 0 4.104 16h5.792a2.5 2.5 0 0 0 2.44-1.958l.131-.59a3 3 0 0 0 1.3-5.854l.221-.99A.5.5 0 0 0 13.5 6H.5ZM13 12.5a2.01 2.01 0 0 1-.316-.025l.867-3.898A2.001 2.001 0 0 1 13 12.5ZM2.64 13.825 1.123 7h11.754l-1.517 6.825A1.5 1.5 0 0 1 9.896 15H4.104a1.5 1.5 0 0 1-1.464-1.175Z"/>
				  <path d="m4.4.8-.003.004-.014.019a4.167 4.167 0 0 0-.204.31 2.327 2.327 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.31 3.31 0 0 1-.202.388 5.444 5.444 0 0 1-.253.382l-.018.025-.005.008-.002.002A.5.5 0 0 1 3.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 3.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 3 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 4.4.8Zm3 0-.003.004-.014.019a4.167 4.167 0 0 0-.204.31 2.327 2.327 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.31 3.31 0 0 1-.202.388 5.444 5.444 0 0 1-.253.382l-.018.025-.005.008-.002.002A.5.5 0 0 1 6.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 6.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 6 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 7.4.8Zm3 0-.003.004-.014.019a4.077 4.077 0 0 0-.204.31 2.337 2.337 0 0 0-.141.267c-.026.06-.034.092-.037.103v.004a.593.593 0 0 0 .091.248c.075.133.178.272.308.445l.01.012c.118.158.26.347.37.543.112.2.22.455.22.745 0 .188-.065.368-.119.494a3.198 3.198 0 0 1-.202.388 5.385 5.385 0 0 1-.252.382l-.019.025-.005.008-.002.002A.5.5 0 0 1 9.6 4.2l.003-.004.014-.019a4.149 4.149 0 0 0 .204-.31 2.06 2.06 0 0 0 .141-.267c.026-.06.034-.092.037-.103a.593.593 0 0 0-.09-.252A4.334 4.334 0 0 0 9.6 2.8l-.01-.012a5.099 5.099 0 0 1-.37-.543A1.53 1.53 0 0 1 9 1.5c0-.188.065-.368.119-.494.059-.138.134-.274.202-.388a5.446 5.446 0 0 1 .253-.382l.025-.035A.5.5 0 0 1 10.4.8Z"/>
				</svg>
				</a>
	
				<h1 class="h3 mb-3 fw-normal" style="color:#FFA500">식당 등록</h1>
		
				<div class="form-floating">
					<input type="text" class="form-control" id="food_name" placeholder="가게 이름" name="food_name">
					<label for="floatingInput" class="text-muted">가게 이름</label>
				</div>
				
				<div class="form-floating">
					<!-- <input type="text" class="form-control" id="food_address" disabled placeholder="주소" name="food_address"> -->
					<input type="text" class="form-control" id="food_address" placeholder="주소" name="food_address" readonly>
					<label for="floatingPassword" class="text-muted">주소</label>
					<span class="text-muted btn btn-outline-warning py-1 my-1" id="search_address" style="cursor:pointer;">주소 찾기</span>
				</div>
		
				<div class="form-floating">
					<input type="text" class="form-control" id="food_phone" placeholder="전화번호" name="food_phone">
					<label for="floatingInput" class="text-muted">전화번호</label>
				</div>
				
				<div class="form-floating">
					<input type="text" class="form-control" id="food_food_kind" placeholder="대표음식종류" name="food_food_kind">
					<label for="floatingInput" class="text-muted">대표음식종류</label>
				</div>
				
				<div class="form-floating">
					<input type="text" class="form-control" id="food_avg_price" placeholder="음식 평균 가격대" name="food_avg_price">
					<label for="floatingInput" class="text-muted">음식 평균 가격대</label>
				</div>
				
				<div class="form-floating">
					<input type="text" class="form-control" id="food_working_hours" placeholder="영업시간" name="food_working_hours">
					<label for="floatingInput" class="text-muted">영업시간</label>
				</div>
				
				<div class="form-floating">
					<input type="text" class="form-control" id="food_holiday" placeholder="휴일" name="food_holiday">
					<label for="floatingInput" class="text-muted">휴일</label>
				</div>
				
				<div class="form-floating">
					<input type="text" class="form-control" id="food_website" placeholder="웹사이트" name="food_website">
					<label for="floatingInput" class="text-muted">웹사이트</label>
				</div>
				
				<div class="form-floating">
					<%-- <textarea type="text" class="form-control" id="food_content" placeholder="맛집 설명" name="food_content" value="${vo.food_content}" style="resize:none; height:200px;"></textarea> --%>
					<textarea class="form-control" id="food_content" placeholder="맛집 설명" name="food_content" oninput="limitTextarea(this, 200)" style="resize:none; height:200px;"></textarea>
					<div class="text-muted" style="text-align:right;"><span id="charCount">200</span> 자 남음</div>
					<label for="floatingInput" class="text-muted">맛집 설명</label>
					<script>
						function limitTextarea(element, limit) {
						    const text = element.value;
						    if (text.length > limit) {
						        element.value = text.substring(0, limit);
						    }
						    const charCount = limit - text.length;
						    document.getElementById('charCount').textContent = charCount;
						}
					</script>						
				</div>
				<label for="floatingInput" class="text-muted">맛집 지역</label>
				<div class="form-floating">
					<select class="form-select mb-2" id="LType" name="LType">
						<option value="TT" <%= LType.equals("TT") ? "checked" : "" %> >지역을 선택해주세요. </option>
						<option value="GG" <%= LType.equals("GG") ? "checked" : "" %> >서울 / 경기 </option>
						<option value="GW" <%= LType.equals("GW") ? "checked" : "" %> >강원 </option>
						<option value="CB" <%= LType.equals("CB") ? "checked" : "" %> >충북 </option>
						<option value="CN" <%= LType.equals("CN") ? "checked" : "" %> >충남 </option>
						<option value="GB" <%= LType.equals("GB") ? "checked" : "" %> >경북 </option>
						<option value="GN" <%= LType.equals("GN") ? "checked" : "" %> >경남 </option>
						<option value="JB" <%= LType.equals("JB") ? "checked" : "" %> >전북 </option>
						<option value="JN" <%= LType.equals("JN") ? "checked" : "" %> >전남 </option>
						<option value="JJ" <%= LType.equals("JJ") ? "checked" : "" %> >제주 </option>
					</select>
				</div>
				
				<h1 class="h5 mb-3 fw-normal text-muted">파일 업로드</h1>
				<label class="btn" style="background-color:#FFA500; color:white">
					이미지 선택			
					<input type="file" id="multiFile" name="multiFile" multiple style="display: none;">
				</label>
				<div id="preview"></div>
				<br>
				<button class="w-100 btn btn-lg " style="background-color:#FFA500; color:white">
					등록
				</button>
				
			</form>
		</div>
	</div>

	
	<!-- 유효성 검사확인  -->
<%@ include file="../include/footer.jsp" %>  