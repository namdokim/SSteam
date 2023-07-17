<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>숙박 메인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

	 <script>
    $(document).ready(function() {
      $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayHighlight: true
      });
    });
  </script>
	<style type="text/css">
		a {
			text-decoration: none;
			color: black;
		}
	</style>
</head>

<body>
	<div class="py-2 text-bg-dark offset-2" style="margin-right: 18rem;">
		<div class="container">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small container text-center">
					<li>
						<a href="#" class="nav-link text-secondary">
							<input type="search" name="keyword" class="form-control" placeholder="찾기" value="" style="width: 250px;">
						</a>
					</li>
					<li>
						 <div class="row justify-content-center">
					      <div class="col-md-5">
					        <input type="text" class="form-control datepicker" placeholder="Check-in">
					      </div>
					       ~
					      <div class="col-md-5">
					        <input type="text" class="form-control datepicker" placeholder="Check-out">
					      </div>
					    </div>
					</li>
					<li class="d-flex align-items-center">
						<div class="accordion" id="accordionExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
										인원수 설정
									</button>
								</h2>
								<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<!-- 내용 추가 -->
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="d-flex align-items-center">
						<input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
						<label class="btn btn-primary btn-lg" for="btn-check">검색</label>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="container-fluid offset-2">
		<div class="row">
		<!-- 사이드바 부문 ======================================================================= -->
		
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
				<a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
					<svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
					<span class="fs-4">Sidebar</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item">
						<a href="#" class="nav-link active" aria-current="page">
							<svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
							Home
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark">
							<svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
							Dashboard
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark">
							<svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
							Orders
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark">
							<svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
							Products
						</a>
					</li>
					<li>
						<a href="#" class="nav-link link-dark">
							<svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
							Customers
						</a>
					</li>
				</ul>
				<hr>
				<div class="dropdown">
					<a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
						<strong>mdo</strong>
					</a>
					<ul class="dropdown-menu text-small shadow">
						<li><a class="dropdown-item" href="#">New project...</a></li>
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Profile</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Sign out</a></li>
					</ul>
				</div>
			</div>
			<!-- 사이드바 부문 ======================================================================= -->
			
			
			<!-- 메인 부문 ======================================================================= -->
			<div class="tab-content container-fluid  col-md-9" >
				<div style="border:1px solid black; width:900px; height:50px; display:inline-block; vertical-align:top; margin:10px 0px 10px 0px; padding:10px;">
					<div style="border:1px solid black; width:250px; height:100%; display:inline-block; vertical-align:top;">
						가격
					</div>
					<div style="border:1px solid black; width:250px; height:100%; display:inline-block; vertical-align:top;">
						리뷰
					</div>
					<div style="border:1px solid black; width:250px; height:100%; display:inline-block; vertical-align:top;">
						좋아요
					</div>
				</div>
				<%
				//for(int i=0; i<5; i++){
				%>
				
				<div id="tab-1" class="tab-pane fade show p-0 active" style="margin-right: 18rem;">
				    <div class="job-item p-4 mb-4">
				        <div class="row g-4">
				            <div class="col-sm-12 col-md-8 d-flex align-items-center">
				                <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-1.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Software Engineer</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-2.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Marketing Manager</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-3.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Product Designer</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-4.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Creative Director</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-5.jpg" alt="" style="width: 80px; height: 80px;">
				                <div class="text-start ps-4">
				                    <h5 class="mb-3">Wordpress Developer</h5>
				                    <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                    <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                    <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				                </div>
				            </div>
				            <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				                <div class="d-flex mb-3">
				                    <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                    <a class="btn btn-primary" href="">Apply Now</a>
				                </div>
				                <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				            </div>
				        </div>
				    </div>
				    <a class="btn btn-primary py-3 px-5" href="">Browse More Jobs</a>
				</div>
				<div id="tab-2" class="tab-pane fade show p-0">
				    <div class="job-item p-4 mb-4">
				        <div class="row g-4">
				            <div class="col-sm-12 col-md-8 d-flex align-items-center">
				                <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-1.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Software Engineer</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-2.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Marketing Manager</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-3.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Product Designer</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-4.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Creative Director</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-5.jpg" alt="" style="width: 80px; height: 80px;">
				                <div class="text-start ps-4">
				                    <h5 class="mb-3">Wordpress Developer</h5>
				                    <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                    <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                    <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				                </div>
				            </div>
				            <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				                <div class="d-flex mb-3">
				                    <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                    <a class="btn btn-primary" href="">Apply Now</a>
				                </div>
				                <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				            </div>
				        </div>
				    </div>
				    <a class="btn btn-primary py-3 px-5" href="">Browse More Jobs</a>
				</div>
				<div id="tab-3" class="tab-pane fade show p-0">
				    <div class="job-item p-4 mb-4">
				        <div class="row g-4">
				            <div class="col-sm-12 col-md-8 d-flex align-items-center">
				                <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-1.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Software Engineer</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-2.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Marketing Manager</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-3.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Product Designer</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-4.jpg" alt="" style="width: 80px; height: 80px;">
				            <div class="text-start ps-4">
				                <h5 class="mb-3">Creative Director</h5>
				                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				            </div>
				        </div>
				        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				            <div class="d-flex mb-3">
				                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                <a class="btn btn-primary" href="">Apply Now</a>
				            </div>
				            <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				        </div>
				    </div>
				</div>
				<div class="job-item p-4 mb-4">
				    <div class="row g-4">
				        <div class="col-sm-12 col-md-8 d-flex align-items-center">
				            <img class="flex-shrink-0 img-fluid border rounded" src="img/com-logo-5.jpg" alt="" style="width: 80px; height: 80px;">
				                    <div class="text-start ps-4">
				                        <h5 class="mb-3">Wordpress Developer</h5>
				                        <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
				                        <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
				                        <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
				                    </div>
				                </div>
				                <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
				                    <div class="d-flex mb-3">
				                        <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
				                        <a class="btn btn-primary" href="">Apply Now</a>
				                    </div>
				                    <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
				                </div>
				            </div>
				        </div>
				        <a class="btn btn-primary py-3 px-5" href="">Browse More Jobs</a>
				    </div>
				</div>
				<!-- 메인 부문 ======================================================================= -->
				

		</div>
	</div>
</body>

</html>
<%@ include file="../include/footer.jsp" %>