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
  </style>
<!-- ======================= 스타일E =========================-->
</head>

<!-- ======================= 바디S ========================= -->
<body> 
<h1>아아아아아아dkdkdkdk</h1>
  <div class="header">
      <div style="font-size: 10pt; color:silver;">68,003 클릭 | 2021-12-24</div>
      <div style="font-size: 18pt; color:black;">2023 강남 인기 맛집 TOP 10</div>
      <div style="font-size: 10pt; color:silver;">“맛집하면 강남, 강남하면 맛집!”</div>
  </div>
  <div class="container">
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
        </div>
        <p class="restaurant-address" style="color: silver;">서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
        <p class="restaurant-description">맛집에 대한 설명 내용이 여기에 들어갑니다. 설명 글이 긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더 많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
        <p class="restaurant-address" style="color: silver; text-align:right;"><a href="<%=request.getContextPath()%>/Food/FoodView.do">미라이 더보기></a></p>
      </div>
    </div>
  </div>
  <div class="container">
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
        </div>
        <p class="restaurant-address" style="color: silver;">서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
        <p class="restaurant-description">맛집에 대한 설명 내용이 여기에 들어갑니다. 설명 글이 긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더 많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
        <p class="restaurant-address" style="color: silver; text-align:right;"><a href="<%=request.getContextPath()%>/Food/FoodView.do">미라이 더보기></a></p>
      </div>
    </div>
  </div>
  <div class="container">
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
        </div>
        <p class="restaurant-address" style="color: silver;">서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
        <p class="restaurant-description">맛집에 대한 설명 내용이 여기에 들어갑니다. 설명 글이 긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더 많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
        <p class="restaurant-address" style="color: silver; text-align:right;"><a href="<%=request.getContextPath()%>/Food/FoodView.do">미라이 더보기></a></p>
      </div>
    </div>
  </div>
  <div class="container">
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
        </div>
        <p class="restaurant-address" style="color: silver;">서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
        <p class="restaurant-description">맛집에 대한 설명 내용이 여기에 들어갑니다. 설명 글이 긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더 많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
        <p class="restaurant-address" style="color: silver; text-align:right;"><a href="<%=request.getContextPath()%>/Food/FoodView.do">미라이 더보기></a></p>
      </div>
    </div>
  </div>
  <div class="container">
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
        </div>
        <p class="restaurant-address" style="color: silver;">서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
        <p class="restaurant-description">맛집에 대한 설명 내용이 여기에 들어갑니다. 설명 글이 긴 경우에는 3줄까지만 보이고 더보기를 눌러서 전체 내용을 확인할 수 있습니다. 설명에 대한 더 많은 정보를 보고 싶다면 더보기를 클릭하세요.</p>
        <p class="restaurant-address" style="color: silver; text-align:right;"><a href="<%=request.getContextPath()%>/Food/FoodView.do">미라이 더보기></a></p>
      </div>
    </div>
  </div>

</body>
</html>
