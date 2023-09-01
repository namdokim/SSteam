<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="album py-3 bg-body-tertiary ">
		<div class="container">
			<div style="text-align:left; margin:20px;">
				<span style="font-weight:bold; font-size:20pt;">주간 베스트 숙박 </span>
			</div>
		<div class="tab-content card my-2">
			<div id="myCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item d-flex active">
						<c:forEach items="${list}" var="list" begin="1" end="3" >
							<div class="col">
								<div class="card shadow-sm">
									<div class="flex-shrink-0 avatar me-3 pt-2">
						                	<img src="<%=request.getContextPath() %>/resources/upload/${list.physical_name}" style="cursor: pointer; width: 200px; height: 180px;" onclick="location.href='<%=request.getContextPath() %>/rentalhome/rentalhomeView.do?rentalhome_idx=${list.rentalhome_idx}'">
						            	</div>
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
						</c:forEach>
					</div>	
				    <div class="carousel-item d-flex">
				    <!-- 두 번째 세트의 이미지 -->
			    		<c:forEach items="${attach}" var="event" begin="4" end="6">
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
						</c:forEach>				
					</div>
				    <div class="carousel-item  d-flex">
				      <!-- 세 번째 세트의 이미지 -->
						<c:forEach items="${attach}" var="event" begin="7" end="9">
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
						</c:forEach>				
				    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev" onclick="prevCarousel()">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">이전</span>					
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next" onclick="nextCarousel()">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">다음</span>
			  </button>
			</div>
		</div>
		
			<div id="myCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<div class="carousel-inner">
						<div class="carousel-item d-flex active">
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
				
							<div class="col">
								<div class="card shadow-sm">
									<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
									<div class="card-body">
										<p class="card-text">언능언능 하세요</p>
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
						
						
						 <!-- 두 번째 세트의 이미지 -->
						<div class="carousel-item d-flex ">
							<div class="col">
								<div class="card shadow-sm">
									<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
									<div class="card-body">
										<p class="card-text">안뇽안뇽 하세요</p>
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
						
						
						 <!-- 세 번째 세트의 이미지 -->
						<div class="carousel-item d-flex ">
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
				<button class="carousel-control-prev justify-content-start px-1" type="button" data-bs-target="#myCarousel" data-bs-slide="prev" onclick="prevCarousel()">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">이전</span>					
				  </button>
				  <button class="carousel-control-next justify-content-end px-1" type="button" data-bs-target="#myCarousel" data-bs-slide="next" onclick="nextCarousel()">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">다음</span>
				</button>
			</div>
		</div>
	</div>
	