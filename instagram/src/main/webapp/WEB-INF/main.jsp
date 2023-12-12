<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/favicon.png" type="">

<title>Nail</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css" />

<!--owl slider stylesheet -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<!-- nice select  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css"
	integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ=="
	crossorigin="anonymous" />
<!-- font awesome style -->
<link href="assets/css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="assets/css/responsive.css" rel="stylesheet" />
</head>

<body>
	<div class="hero_area">
		<div class="bg-box">
			<div></div>
			<img src="images/bg.jpg" alt="">
			<div></div>
		</div>
		<!-- header section strats -->
		<header class="header_section">
			<div class="container">
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="index.html"> <span> Nail </span>
					</a>

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class=""> </span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<!-- 상단바 글씨 -->
						<ul class="navbar-nav  mx-auto ">
							<li class="nav-item active"><a class="nav-link"
								href="Gomain.do">Home <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item"><a class="nav-link" href="Godesign.do">Design</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="ShopSelectAll.do">Shop</a></li>
						</ul>

						<!-- 상단바 아이콘-->
						<div class="user_option">

							<c:if test="${result==null}">
								<a href="Gosign.do" class="order_online"> Log In </a>
							</c:if>

							<c:if test="${result!=null}">
								<a href="Gomypage.do" class="user_link"> <i class="fa fa-user" aria-hidden="true"></i></a>
								<a href="Logout.do" class="order_online"> Log out </a>
							</c:if>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<!-- header section 끝-->

		<!-- slider section -->
		<!-- 메인 중앙 슬라이드 -->
		<section class="slider_section ">
			<div id="customCarousel1" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="container ">
							<div class="row">
								<div class="col-md-7 col-lg-6 ">
									<div class="detail-box">
										<h3>Design Select</h3>
										<p>Doloremque, itaque aperiam facilis rerum, commodi,
											temporibus sapiente ad mollitia laborum quam quisquam esse
											error unde. Tempora ex doloremque, labore, sunt repellat
											dolore, iste magni quos nihil ducimus libero ipsam.</p>
										<div class="btn-box">
											<a href="Gomain.do" class="btn1"> Design </a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item ">
						<div class="container ">
							<div class="row">
								<div class="col-md-7 col-lg-6 ">
									<div class="detail-box">
										<h3>Shop Select</h3>
										<p>Doloremque, itaque aperiam facilis rerum, commodi,
											temporibus sapiente ad mollitia laborum quam quisquam esse
											error unde. Tempora ex doloremque, labore, sunt repellat
											dolore, iste magni quos nihil ducimus libero ipsam.</p>
										<div class="btn-box">
											<a href="Goshop.do" class="btn1"> Shop </a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="container ">
							<div class="row">
								<div class="col-md-7 col-lg-6 ">
									<div class="detail-box">
										<h3>Join us</h3>
										<p>Doloremque, itaque aperiam facilis rerum, commodi,
											temporibus sapiente ad mollitia laborum quam quisquam esse
											error unde. Tempora ex doloremque, labore, sunt repellat
											dolore, iste magni quos nihil ducimus libero ipsam.</p>
										<div class="btn-box">
											<a href="ShopManagementService.do" class="btn1"> Join Now </a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<ol class="carousel-indicators">
						<li data-target="#customCarousel1" data-slide-to="0"
							class="active"></li>
						<li data-target="#customCarousel1" data-slide-to="1"></li>
						<li data-target="#customCarousel1" data-slide-to="2"></li>
					</ol>
				</div>
			</div>

		</section>
		<!-- slider section 끝-->
	</div>

	<!-- middle section 시작-->
	<div class="middle">
		<div class="coment_unit">
			<div class="coment_left">
				<div>
					<span class="comment_img"> <i class="fa fa-star"></i>
					</span> <span class="comment_title">내 손에 입혀보기 </span>
				</div>
				<span class="comment_detail">손을 찍어서 업로드만 하면 어떤 디자인이든지 내 손톱에
					입혀볼 수 있습니다. </span>
			</div>

			<img src="images/o1.jpg" alt="" class="coment_right">
		</div>
		<div class="coment_unit">
			<div class="coment_left">
				<div>
					<span class="comment_img"> <i class="fa fa-star"></i>
					</span> <span class="comment_title">원하는 가게 디자인 찾기 </span>
				</div>
				<span class="comment_detail">주변에 있는 가게들의 디자인을 거리와 평점순으로 확인이
					가능합니다. </span>
			</div>

			<img src="images/o2.jpg" alt="" class="coment_right">
		</div>
		<div class="coment_unit">
			<div class="coment_left">
				<div>
					<span class="comment_img"> <i class="fa fa-star"></i>
					</span> <span class="comment_title">예약과 리뷰 작성 </span>
				</div>
				<span class="comment_detail">내 손과 어울리는 디자인을 찾았다면 바로 리뷰를 확인하고
					예약을 할 수 있습니다. </span>
			</div>

			<img
				src="data:image/jpeg;base64,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"
				alt="" class="coment_right">
		</div>
	</div>
	<!-- middle section 끝-->

	<!-- footer section -->
	<footer class="footer_section">
		<div class="container">
			<div class="row">
				<div class="footer_contact">
					<div class="contactUs">Contact Us</div>
					<div class="contact_link_box">
						<a href=""> <i class="fa fa-map-marker" aria-hidden="true"></i>
							<span> 광주 남구 송암로 60 광주CGI센터 2층 </span>
						</a> <a href=""> <i class="fa fa-phone" aria-hidden="true"></i> <span>
								Call +01 1234567890 </span>
						</a> <a href=""> <i class="fa fa-envelope" aria-hidden="true"></i>
							<span> demo@gmail.com </span>
						</a>
					</div>
				</div>
				<div class="footer_detail">
					<a href="" class="footer-logo"> Nail </a>
					<p>페이지 설명</p>
					<div class="footer_social">
						<a href=""> <i class="fa fa-facebook" aria-hidden="true"></i>
						</a> <a href=""> <i class="fa fa-twitter" aria-hidden="true"></i>
						</a> <a href=""> <i class="fa fa-linkedin" aria-hidden="true"></i>
						</a> <a href=""> <i class="fa fa-instagram" aria-hidden="true"></i>
						</a> <a href=""> <i class="fa fa-pinterest" aria-hidden="true"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="footer-info">
				<p>
					&copy; <span id="displayYear"></span> All Rights Reserved By <a
						href="https://html.design/">Free Html Templates</a><br> <br>
					&copy; <span id="displayYear"></span> Distributed By <a
						href="https://themewagon.com/" target="_blank">ThemeWagon</a>
				</p>
			</div>
		</div>
	</footer>
	<!-- footer section -->


	<!-- jQery -->
	<script src="assets/js/jquery-3.4.1.min.js"></script>
	<!-- popper js -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous">
		
	</script>
	<!-- bootstrap js -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- owl slider -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
		
	</script>
	<!-- isotope js -->
	<script
		src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
	<!-- nice select -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
	<!-- custom js -->
	<script src="assets/js/custom.js"></script>
	<!-- End Google Map -->

</body>

</html>