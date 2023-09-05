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
<hr class="featurette-divider">
<div class="album py-3 bg-body-tertiary ">
		<div class="container">
			<div style="text-align:left; margin:20px;">
				<span style="font-weight:bold; font-size:20pt;">주간 베스트 축제 </span>
			</div>
			<div class="owl-carousel owl-theme">
			    <div class="item" >
				    <div class="col">
						<div class="card shadow-sm">
							<a class="bd-placeholder-img card-img-top" href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do" >
								<img class="d-block w-100 " src="./img/houses.jpg" width="100%" height="225px" role="img" aria-label="Placeholder: Thumbnail"  alt="...">
							</a>
							<div class="card-body">
							
							<h4 class="card-text">제목입니다</h4>
							<div class="text-muted"> 장소를 쓴다 가나다라</div>
							<p class="restaurant-description">내용을 쓴다 가나다라마바사 아자차카 ㄴㅁ앰ㄴ어ㅣㅁㅇ넌ㅁ이ㅏㅁㅇㄴ;ㅣㅓㄴㅁㅇ;ㅣㅁㄴ어;ㅁㄴ이;ㅁㅇ니ㅓㅁㅇㄴ</p>
						
							<small class="text-body-secondary">9 mins</small>
							</div>
						</div>
					</div>
				</div>
			    <div class="item" >
				    <div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-body-secondary">9 mins</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
				    <div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-body-secondary">9 mins</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item" >
				    <div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-body-secondary">9 mins</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	