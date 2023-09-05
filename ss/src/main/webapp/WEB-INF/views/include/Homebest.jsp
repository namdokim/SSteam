<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
    $('.owl-carousel').owlCarousel({
      items: 3, // Number of items to display
      loop: true, // Enable loop
      margin: 10, // Spacing between items
      nav: true, // Enable navigation buttons
      responsive:{
        0:{
            items:1 // Number of items to display on smaller screens
        },
        768:{
            items:2 // Number of items to display on medium screens
        },
        992:{
            items:3 // Number of items to display on larger screens
        }
      },
      autoplay: true, // Enable auto play
      autoplayTimeout: 4000 // Time between auto scrolls in milliseconds (5 seconds in this example)
    });
  });
</script>

<div class="album py-3 bg-body-tertiary ">
		<div class="container">
			<div style="text-align:left; margin:20px;">
				<span style="font-weight:bold; font-size:20pt;">인기있는 베스트 숙소 TOP 10</span><span class="text-muted" style="font-size:10pt; padding:0px 20px;"> 유저들의 즐겨찾기 기준으로 정했습니다.</span>
			</div>
			<div class="owl-carousel owl-theme">
				<c:forEach items="${rentalhome_list}" var="list">
					<div class="item" >
						<div class="col">
							<div class="card shadow-sm">
								<a class="bd-placeholder-img card-img-top" href="<%=request.getContextPath()%>/rentalhome/rentalhomeView.do?rentalhome_idx=${list.rentalhome_idx}" >
									<img class="d-block w-100 " src="<%=request.getContextPath() %>/resources/upload/${list.physical_name}" width="100%" height="225px" role="img" aria-label="Placeholder: Thumbnail"  alt="...">
								</a>
								<div class="card-body" style="height:200px; position:relative;">							
									<span class="card-text" style="font-weight:bold; font-size:15pt;">${list.name}</span>
									
									<div class="text-muted">${list.address}</div>
									<div class="text-muted mt-2">
										<c:if test="${list.all_avg != 0.0}">
											<span class="py-1" style="font-size: 10pt; padding: 2px 7px; border-radius: 0px 5px 5px 10px; font-weight: bold; background-color: #333fff; color: white;">${list.all_avg}<span style="color: #e2e2e2;">/5</span></span> 이용자 리뷰 ${list.review_count}
										</c:if>
									</div>
									<div style="text-align:right;">
										<c:if test="${not empty list.room_name }">
											<div style="position:absolute; bottom:5px; right:15px;">
												<p class="restaurant-description">${list.room_name }</p>
												<c:if test="${not empty list.discount_reason}">
													<small class="text-body-secondary" style="background-color:#333fff; color:white; font-size:12pt; border-radius:20px 10px 0px 15px; padding:10px 15px;">
														${list.discount_reason} ${list.discount_money}
														<c:if test="${list.discount_type eq 'rate'}">%</c:if>
														<c:if test="${list.discount_type eq 'fix'}">원</c:if>
													</small><br>
												</c:if>
												<div class="mt-2">
													<span class="text-muted" style="text-decoration:line-through; ">
														${list.weekday_price}원
													</span>
													<span style="font-weight:bold; font-size:18pt;">
														${list.weekday_discount_price}원
													</span>
												</div>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	