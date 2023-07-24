<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 리스트</title>
<!-- ======================= 스타일S =========================-->
<style>
  /* CSS 스타일 */
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    line-height: 1.5; /* 글자 위아래 간격을 1.5배로 설정 */
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
    display: flex; /* flex 컨테이너로 설정 */
  }
  .sidebar {
    flex: 0 0 250px;
    margin-right: 90px;
    margin-left: -80px;
    background-color: #f5f5f5;
    padding: 20px;
  }
  .sidebar form {
    display: flex;
    flex-direction: column;
    align-items: flex-start; /* 체크박스를 일렬로 정렬하기 위해 수정 */
    gap: 10px;
    font-size: 24px;
    text-align: center;
  }

  .sidebar form label input[type="checkbox"] {
    transform: scale(2);
    transform-origin: left center;
    margin-right: 10px;
  }

  .sidebar h3 {
    color: #0080ff; /* 파란색 글씨 */
  }

  .restaurant-list {
    display: flex;
    flex-wrap: wrap;
    margin: -20px;
    flex: 1 1 auto; /* 맛집 리스트 영역이 남은 공간을 모두 차지하도록 설정 */
  }
  .restaurant-item {
    border: none; /* 회색 선 제거 */
    margin-bottom: 20px;
    padding: 20px;
    display: flex;
    border-bottom: 1px solid #ddd; /* 바닥선만 추가 */
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
  }
  .restaurant-title span.mirai {
    font-family: "미라이", sans-serif;
    color: #ff7f00;
    font-size: 30px;
    margin-left: 10px;
  }
  .restaurant-rating {
    font-size: 16px;
    margin-bottom: 10px;
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
    display: flex;
    align-items: center;
    margin-bottom: 10px;
  }
  .user-thumbnail {
    width: 40px;
    height: 40px;
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
    font-size: 14px;
    font-weight: bold;
  }
  /* 검색 버튼 스타일 수정 */
  .sidebar form button[type="submit"] {
    background-color: #0080ff; /* 파란색 배경 */
    color: white; /* 글자 색상 */
    border: none; /* 테두리 제거 */
    border-radius: 10px; /* 둥근 모서리 */
    padding: 20px 80px; /* 크기 조정 */
    margin: 0 auto; /* 가운데 정렬 */
    font-size: 24px;
  }
  /* 오렌지색 정사각형 모양의 버튼 스타일 */
  .restaurant-favorite-btn {
    width: 60px;
    height: 60px;
    background-color: #ff7f00;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 25px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    margin-left: 10px;
  }
  center-align {
  display: flex;
  align-items: center;
  justify-content: center;
  
  flex-wrap: wrap;
  margin-top: 10px;
  }
  .restaurant-favorite-btn.active {
   color: #ffd503;/* New background color when active */
  }
</style>
<!-- ======================= 스타일E =========================-->
<!-- ======================= 스크립트S =========================-->
<script>
  // JavaScript 코드
  // checkbox가 선택되면 기존에 선택된 다른 checkbox를 해제하는 함수
  function handleCheckboxSelection(checkbox) {
    const checkboxes = document.getElementsByName("region");
    checkboxes.forEach((cb) => {
      if (cb !== checkbox) {
        cb.checked = false;
      }
    });
  }
  // 하트버튼 클릭시 색 변함 
  function handleFavoriteButtonClick(button) {
    button.classList.toggle("active");
  }
  // 아코디언 (평점.좋아요 등 )
</script>
<!-- ======================= 스크립트E =========================-->
</head>

<!-- ======================= 바디S ========================= -->
<body> 
  <div class="header">
      <div style="font-size: 10pt; color:silver;">68,003 클릭 | 2023-09-07</div>
      <div style="font-size: 18pt; color:black;"> 지역별 맛집 TOP 5</div>
      <div style="font-size: 10pt; color:silver;">“맛있는 여행으로 즐거운 추억을 만들어보세요!”</div>
  </div>
	<div class="container">
	<!-- HTML 코드 -->
	<div class="sidebar"><br>
	  <h3>여행지역 맛집 검색</h3>
	  <div style="font-size: 10pt; color:black;"> ※ 지역을 중복으로 선택할 수 없습니다</div>
	  <form id="searchForm"><br>
	    <label><input type="checkbox" name="region" value="서울특별시" onclick="handleCheckboxSelection(this)" >&nbsp;&nbsp;서울특별시</label>
	    <label><input type="checkbox" name="region" value="경기도" onclick="handleCheckboxSelection(this)" >&nbsp;&nbsp;경기도</label>
	    <label><input type="checkbox" name="region" value="충청남도" onclick="handleCheckboxSelection(this)" >&nbsp;&nbsp;충청남도</label>
	    <label><input type="checkbox" name="region" value="충청북도" onclick="handleCheckboxSelection(this)" >&nbsp;&nbsp;충청북도</label>
	    <label><input type="checkbox" name="region" value="전라북도" onclick="handleCheckboxSelection(this)" >&nbsp;&nbsp;전라북도</label>
	    <label><input type="checkbox" name="region" value="전라남도" onclick="handleCheckboxSelection(this)" >&nbsp;&nbsp;전라남도</label>
	    <label><input type="checkbox" name="region" value="경상북도" onclick="handleCheckboxSelection(this)" >&nbsp;&nbsp;경상북도</label>
	    <label><input type="checkbox" name="region" value="경상남도" onclick="handleCheckboxSelection(this)" >&nbsp;&nbsp;경상남도</label>
	    <label><input type="checkbox" name="region" value="강원도" onclick="handleCheckboxSelection(this)" >&nbsp;&nbsp;강원도</label>
	    <label><input type="checkbox" name="region" value="제주특별자치도" onclick="handleCheckboxSelection(this)" >&nbsp;&nbsp;제주특별자치도</label><br><br>
	    <button type="submit">검색</button>
	  </form>
	</div>



    <div class="restaurant-list">
      <div class="restaurant-item">
        <div class="restaurant-thumbnail">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/281547/1042666_1639388842888_38322?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일">
        </div>
        <div class="restaurant-info">
          <h2 class="restaurant-title"><span>1. 미라이</span><span class="mirai">4.8</span></h2>
          <div class="user-info">
            <div class="user-thumbnail">
              <img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">
            </div>
            <div class="user-nickname">세이콩</div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="center-align">
           		<button class="restaurant-favorite-btn" onclick="handleFavoriteButtonClick(this)">❤</button>
				<span style="font-size: 14px; color: #e8055c;">
				&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;좋아요</span>
            </div>
          </div>
          <p class="restaurant-address" style="color: silver;">서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
          <p class="restaurant-description">맛집에 대한 설명 내용이 여기에 들어갑니다. 설명 글이 긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더 많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
          <p class="restaurant-address" style="color: silver; text-align:right;"><a href="<%=request.getContextPath()%>/Food/FoodView.do">미라이 더보기></a></p>
        </div>
      </div>
      <div class="restaurant-item">
        <div class="restaurant-thumbnail">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/1454700_1627451561695024.jpg?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일">
        </div>
        <div class="restaurant-info">
          <h2 class="restaurant-title"><span>2. 시라카와 </span><span class="mirai">4.8</span></h2>
          <div class="user-info">
            <div class="user-thumbnail">
              <img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">
            </div>
            <div class="user-nickname">세이콩</div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="center-align">
           		<button class="restaurant-favorite-btn" onclick="handleFavoriteButtonClick(this)">❤</button>
				<span style="font-size: 14px; color: #e8055c;">
				&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;좋아요</span>
            </div>
          </div>
          <p class="restaurant-address" style="color: silver;">서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
          <p class="restaurant-description">맛집에 대한 설명 내용이 여기에 들어갑니다. 설명 글이 긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더 많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
          <p class="restaurant-address" style="color: silver; text-align:right;"><a href="<%=request.getContextPath()%>/Food/FoodView.do">미라이 더보기></a></p>
        </div>
      </div>
      <div class="restaurant-item">
        <div class="restaurant-thumbnail">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/664762_1632805595320748.jpg?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일">
        </div>
        <div class="restaurant-info">
          <h2 class="restaurant-title"><span>3. 세이류 </span><span class="mirai">4.8</span></h2>
          <div class="user-info">
            <div class="user-thumbnail">
              <img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">
            </div>
            <div class="user-nickname">세이콩</div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="center-align">
           		<button class="restaurant-favorite-btn" onclick="handleFavoriteButtonClick(this)">❤</button>
				<span style="font-size: 14px; color: #e8055c;">
				&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;좋아요</span>
            </div>
          </div>
          <p class="restaurant-address" style="color: silver;">서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
          <p class="restaurant-description">맛집에 대한 설명 내용이 여기에 들어갑니다. 설명 글이 긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더 많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
          <p class="restaurant-address" style="color: silver; text-align:right;"><a href="<%=request.getContextPath()%>/Food/FoodView.do">미라이 더보기></a></p>
        </div>
      </div>
      <div class="restaurant-item">
        <div class="restaurant-thumbnail">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/384189/23436_1636808261903_12169?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일">
        </div>
        <div class="restaurant-info">
          <h2 class="restaurant-title"><span>4. 스니카나에 </span><span class="mirai">4.7</span></h2>
          <div class="user-info">
            <div class="user-thumbnail">
              <img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">
            </div>
            <div class="user-nickname">세이콩</div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="center-align">
           		<button class="restaurant-favorite-btn" onclick="handleFavoriteButtonClick(this)">❤</button>
				<span style="font-size: 14px; color: #e8055c;">
				&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;좋아요</span>
            </div>
          </div>
          <p class="restaurant-address" style="color: silver;">서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
          <p class="restaurant-description">맛집에 대한 설명 내용이 여기에 들어갑니다. 설명 글이 긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더 많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
          <p class="restaurant-address" style="color: silver; text-align:right;"><a href="<%=request.getContextPath()%>/Food/FoodView.do">미라이 더보기></a></p>
        </div>
      </div>
      <div class="restaurant-item">
        <div class="restaurant-thumbnail">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/406312/1763517_1635134765363_16478?fit=around|738:738&crop=738:738;*,*&output-format=jpg&output-quality=80" alt="맛집 썸네일">
        </div>
        <div class="restaurant-info">
          <h2 class="restaurant-title"><span>5. 작은피자집 </span><span class="mirai">4.7</span></h2>
          <div class="user-info">
            <div class="user-thumbnail">
              <img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">
            </div>
            <div class="user-nickname">세이콩</div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="restaurant-favorite-btn" onclick="handleFavoriteButtonClick(this)">❤</button>
          </div>
          <p class="restaurant-address" style="color: silver;">서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
          <p class="restaurant-description">맛집에 대한 설명 내용이 여기에 들어갑니다. 설명 글이 긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더 많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
          <p class="restaurant-address" style="color: silver; text-align:right;"><a href="<%=request.getContextPath()%>/Food/FoodView.do">미라이 더보기></a></p>
        </div>
      </div>
    </div>
  </div>

</body>
</html>
<%@ include file="../include/footer.jsp" %>