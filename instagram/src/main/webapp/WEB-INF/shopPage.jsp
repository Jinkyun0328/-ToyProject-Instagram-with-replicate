<%@page import="com.smhrd.model.ShopDAO"%>
<%@page import="com.smhrd.model.ShopVO"%>
<%@ page import="java.util.List" %>
<%@ page import="com.smhrd.model.NailartVO" %>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Design</title>
<link rel="stylesheet" href="assets/css/shopPage.css" />
<link href="assets/css/font-awesome.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 리뷰페이지 별모양 링크-->
<style type="text/css">
@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

@import
	url("https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Open+Sans:wght@400;600;700&display=swap")
	;

.rate {
	display: inline-block;
	border: 0;
	margin-right: 15px;
}

.rate>input {
	display: none;
}

.rate>label {
	float: right;
	color: #ddd
}

.rate>label:before {
	display: inline-block;
	font-size: 1.1rem;
	padding: .3rem .2rem;
	margin: 0;
	cursor: pointer;
	font-family: FontAwesome;
	content: "\f005 ";
}

/* Zero stars rating */
.rate>label:last-child:before {
	content: "\f006 ";
	/* empty star outline */
}

.rate .half:before {
	content: "\f089 ";
	position: absolute;
	padding-right: 0;
}

.rate input:checked ~label, .rate label:hover, .rate label:hover ~label
	{
	color: #f73c32 !important;
}

.rate input:checked+.rate label:hover, .rate input input:checked ~label:hover,
	.rate input:checked ~.rate label:hover ~label, .rate label:hover ~input:checked
	 ~label {
	color: #f73c32 !important;
}

.left-align {
	text-align: left;
}

/* 여기까지가 별점 */
.container table_layout {
	width: 100%;
	/* 테이블 폭을 100%로 설정하여 부모 컨테이너에 맞춤 */
	/* border-collapse: collapse;*/
}

.review_tr {
	text-align: left;
}

#sig1 {
	background-color: darksalmon;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
	/*background-color: #4CAF50;*/
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.re_td {
	width: 50%;
}

.no_outline_btn {
	background-color: white;
	border: none;
	align-items: flex-end;
}

#star1 {
	height: 30px;
	align-items: center;
}

#pitc {
	width: 150px;
	height: 200px;
}

#revi {
	width: 230px;
	height: 200px;
}

/* 사진첨부 부분*/
.real-upload {
	display: none;
}

.upload {
	align-items: center;
	width: 78px;
	height: 36px;
	background-color: #F3B5BC;
}

/* 이미지 출력*/
li {
	list-style: none;
}

img {
	width: 150px;
	height: 200px;
}

.real-upload {
	display: none;
}

.upload {
	width: 100px;
	height: 30px;
	background-color: white;
	margin-left: 0px;
}

.image-preview {
	width: 150px;
	height: 200px;
	background-color: antiquewhite;
	display: flex;
	padding-inline-start: 0px;
	margin-left: 0px;
}

.image-preview img {
	width: 100%;
	padding-inline-start: 0px;
}



</style>


<!-- 카카오맵 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4e8fa4b54164e23551ce19f4755a2ce&libraries=services"></script>

<!-- pretendard 폰트 -->
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />

<!-- 모달창 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


</head>

<body>
	<%
	// 파라미터에서 가게 ID 추출
	String mem_id = request.getParameter("mem_id");
	//System.out.println(storeName); //--> shopName이름을 가진 녀석의 밸류값

	// 가게 ID를 사용하여 데이터베이스에서 가게 정보 조회
	ShopVO vo = new ShopVO();
	vo.setMemId(mem_id);
	ShopDAO shopDAO = new ShopDAO();
	ShopVO shopInfo = shopDAO.getShopInfo(vo);

	if (shopInfo != null) {
		session.setAttribute("shopInfo", shopInfo);
		System.out.println("가게 정보 가져오기 성공");
		System.out.println(shopInfo.getShopName());
	} else {
		System.out.println("가게 정보 가져오기 실패");

	}
	
	
	 
	%>

	<div id="top">
		<!-- 상단바 -->
		<div id="topBar">
			<p>Nail</p>
			<div id="menu">
				<a href="Gomain.do">Home</a> 
				<a href="Godesign.do">Design</a> 
				<a href="ShopSelectAll.do">Shop</a>
			</div>
			<c:if test="${result==null}">
				<a href="Gosign.do"> <i class="fa fa-user" aria-hidden="true"></i></a>
			</c:if>
			<c:if test="${result!=null}">
				<a href="Gomypage.do"> <i class="fa fa-user" aria-hidden="true"></i></a>
			</c:if>
		</div>
		<hr class="hrwhite">

		<div>
			<div id="thumbnailBox" class="form">
				<input type="file" id="thumbnailInput" accept="image/*"
					style="display: none;"> <img id="thumbnail"
					src="https://png.pngtree.com/png-vector/20190215/ourmid/pngtree-vector-question-mark-icon-png-image_515448.jpg"
					alt="">
				<h2>${shopInfo != null ? shopInfo.getShopName() : '가게 정보 없음'}</h2>
			</div>

			<div id="menu" class="form">
				<a onclick="showHome()">홈</a> <a onclick="showDesignerList()">스타일리스트</a>
				<a onclick="showAppointmentBox()">예약</a> <a
					onclick="showReviewList()">리뷰</a> <a onclick="showMap()">지도</a>
			</div>
			<div id="designerList" class="form">
				<h2>디자이너</h2>
				<hr class="hrpink">
				<c:forEach var="staff" items="${staffList}">
					<div class="designer">
						<div style="height: 40px">
							<span> ${staff.getStaffName()} </span>
							
						</div>
						
						<div class="showNailInfoAll"
							id="nailInfoContainer_${staff.getStaffSeq()}" style="display: flex; overflow-x: auto;">
							<input type="hidden" value="${staff.getStaffSeq()}">
							
						</div>
						<hr class="hrpink">
					</div>
				</c:forEach>
				
			</div>
			<div id="appointmentBox" class="form">
				<h2>예약</h2>
				<hr class="hrpink">
				<div id="appointment">

					<!-- 모달창 -->
					<div class="appointment_content">
						<div style="position: relative; margin-bottom: 7px;">
							<label style="font-size: 20px">디자이너 선택:</label> <select
								id="designerSelect">
								<option value="선택하세요">선택하세요</option>
								<c:forEach var="staff" items="${staffList}">
									<option value="${staff.getStaffSeq()}">${staff.getStaffName()}</option>
								</c:forEach>
							</select>
						</div>
						<div id="calendar-container"></div>
						<br> <label>오전</label> <br>
						<div class="time-buttons">
							<button onclick="selectTime('09:00')" data-time="09:00">09시</button>
							<button onclick="selectTime('10:00')" data-time="10:00">10시</button>
							<button onclick="selectTime('11:00')" data-time="11:00">11시</button>
							<button onclick="selectTime('12:00')" data-time="12:00">12시</button>
						</div>
						<br> <label>오후</label> <br>
						<div class="time-buttons">
							<button onclick="selectTime('13:00')" data-time="13:00">01시</button>
							<button onclick="selectTime('14:00')" data-time="14:00">02시</button>
							<button onclick="selectTime('15:00')" data-time="15:00">03시</button>
							<button onclick="selectTime('16:00')" data-time="16:00">04시</button>
							<br> <br>
							<button onclick="selectTime('17:00')" data-time="17:00">05시</button>
						</div>
						<br>
						<button type="button" onclick="submitReservation()">예약
							신청하기</button>
					</div>


					<!-- 모달창 끝 -->
				</div>


				<script defer
					src='https://static.cloudflareinsights.com/beacon.min.js'
					data-cf-beacon='{"token": "dc4641f860664c6e824b093274f50291"}'></script>
			</div>
			<div id="reviewList" class="form">
				<h2>리뷰</h2>
				<hr class="hrpink">
				<div class="form review">
					서비스 너무 최고였어요!
					<button class="reviewCommentbtn">답글 달기</button>
				</div>



				<!-- 23.11.30~12.01 리뷰폼 -->
				<div class='table_layout'>
					<form action="Review" method="post" enctype="multipart/form-data">
						<table border="0">
							<tr class='review_tr'>
								<td class='re_td' colspan="2">
									<button class='no_outline_btn'>디자이너 선택</button> <select>
										<option>김씨</option>
										<option>이씨</option>
										<option>정씨</option>
								</select>
									<button class='no_outline_btn'>네일이름</button> <select>
										<option>김씨</option>
										<option>이씨</option>
										<option>정씨</option>
								</select>
								</td>
							</tr>
							<tr class='review_tr'>
								<td>
									<button class='no_outline_btn' id='star1'>별점</button>
								</td>

								<td class="left-align">
									<fieldset class="rate"
										style="position: relative; width: 142px; border: 0px;">

										<input type="radio" id="rating10" name="rating" value="10">
										<label for="rating10" title="5점"></label> <input type="radio"
											id="rating9" name="rating" value="9"> <label
											class="half" for="rating9" title="4.5점"></label> <input
											type="radio" id="rating8" name="rating" value="8"> <label
											for="rating8" title="4점"></label> <input type="radio"
											id="rating7" name="rating" value="7"> <label
											class="half" for="rating7" title="3.5점"></label> <input
											type="radio" id="rating6" name="rating" value="6"> <label
											for="rating6" title="3점"></label> <input type="radio"
											id="rating5" name="rating" value="5"> <label
											class="half" for="rating5" title="2.5점"></label> <input
											type="radio" id="rating4" name="rating" value="4"> <label
											for="rating4" title="2점"></label> <input type="radio"
											id="rating3" name="rating" value="3"> <label
											class="half" for="rating3" title="1.5점"></label> <input
											type="radio" id="rating2" name="rating" value="2"> <label
											for="rating2" title="1점"></label> <input type="radio"
											id="rating1" name="rating" value="1"> <label
											class="half" for="rating1" title="0.5점"></label>

									</fieldset>
								</td>

							</tr>
							<tr class='review_tr'>
								<td>
									<button class='upload' style="width: 78px">사진첨부</button>
								</td>
								<td>
									<button class='no_outline_btn'>리뷰작성</button>
								</td>

							</tr>
							<tr>
								<td><input type="file" class="real-upload" accept="image/*"
									required multiple>
									<ul class="image-preview" style="padding: 0px;"></ul> <script>
                                     function getImageFiles(e) {
                                          const uploadFiles = [];
                                          const files = e.currentTarget.files;
                                          const imagePreview = document.querySelector('.image-preview');
                                          const docFrag = new DocumentFragment();

                                      if ([...files].length >= 7) {
                                         alert('이미지는 최대 6개 까지 업로드가 가능합니다.');
                                           return;
                                       }

                                       // 파일 타입 검사
                                       [...files].forEach(file => {
                                      if (!file.type.match("image/.*")) {
                                           alert('이미지 파일만 업로드가 가능합니다.');
                                           return
                                      }

                                         // 파일 갯수 검사
                                         if ([...files].length < 7) {
                                           uploadFiles.push(file);
                                           const reader = new FileReader();
                                           reader.onload = (e) => {
                                          const preview = createElement(e, file);
                                          imagePreview.appendChild(preview);
                                           };
                                           reader.readAsDataURL(file);
                                         }
                                        });
                                     }

                                     function createElement(e, file) {
                                    	 
                                          const li = document.createElement('li');
                                          const img = document.createElement('img');
                                          img.setAttribute('src', e.target.result);   
                                          img.setAttribute('data-file', file.name);
                                          li.appendChild(img);

                                          return li;
                                     }

                                        const realUpload = document.querySelector('.real-upload');
                                           const upload = document.querySelector('.upload');
   
                                        upload.addEventListener('click', () => realUpload.click());

                                           realUpload.addEventListener('change', getImageFiles);
                                      </script></td>
								<td><input type="text" name="review" id="revi"></td>
							</tr>

							<tr align="center">
								<td colspan="2"><input id="sig1" type="submit" value="등록하기">
								</td>
							</tr>
						</table>
					</form>










				</div>
			</div>

			<div id="mapbox" class="form">
				<h2>지도</h2>
				<hr class="hrpink">
				<div id="map" style="width: 100%; height: 350px;"></div>
			</div>




			<button id="scrollTopButton">위로</button>
		</div>
		<input id="mem_id" type="hidden" value="${result.getMemId()}"></input>
		<script>
			var designerList = document.getElementById("designerList");
			var appointmentBox = document.getElementById("appointmentBox");
			var reviewList = document.getElementById("reviewList");
			var mapbox = document.getElementById("mapbox");
			var thumbnail = document.getElementById("thumbnail")
			var thumbnailInput = document.getElementById("thumbnailInput");
			var mem_id = document.getElementById("mem_id").value;
			
			// 썸네일 사진 업로드

			thumbnail.onclick = function () {
				thumbnailInput.click();
			};

			// 파일 업로드 이벤트 처리
			thumbnailInput.addEventListener("change", function (event) {
				var file = event.target.files[0];

				if (file) {
					// 선택된 파일이 있으면 이미지 변경
					var reader = new FileReader();

					reader.onload = function (e) {
						thumbnail.src = e.target.result;
					};

					reader.readAsDataURL(file);

					// 파일 입력란을 비워서 동일한 파일을 다시 업로드할 수 있게 합니다.
					event.target.value = null;
				}
			});






			function deleteDesigner(designerId) {
				var designerDiv = document.getElementById(designerId);
				designerDiv.parentNode.removeChild(designerDiv);
			}

			function showHome() {
				designerList.style.display = "block";
				appointmentBox.style.display = "block";
				reviewList.style.display = "block";
				mapbox.style.display = "block";
			}

			function showDesignerList() {
				designerList.style.display = "block";
				appointmentBox.style.display = "none";
				reviewList.style.display = "none";
				mapbox.style.display = "none";
			}

			function showAppointmentBox() {
				designerList.style.display = "none";
				appointmentBox.style.display = "block";
				reviewList.style.display = "none";
				mapbox.style.display = "none";
			}

			function showReviewList() {
				designerList.style.display = "none";
				appointmentBox.style.display = "none";
				reviewList.style.display = "block";
				mapbox.style.display = "none";
			}

			function showMap() {
				designerList.style.display = "none";
				appointmentBox.style.display = "none";
				reviewList.style.display = "none";
				mapbox.style.display = "block";
			}
			
			
			////////////////네일아트 이미지 보여주는 함수////////////////////
			
			$(document).ready(function(){
				
				var seq_element = $('.showNailInfoAll>input');
				for(let i = 0; i < seq_element.length; i++){
					console.log(seq_element[i].value)
					showNailInfoAll(seq_element[i].value);
				}
				
				
				//showNailInfoAll()
			})
			
			function showNailInfoAll(staff_seq) {
			    console.log("들어왔나?");
			    $.ajax({
			        type: "get",
			        url: "GetNailInfoAll2.do", 
			        data: {
			            data: staff_seq
			        },
			        dataType: 'json',
			        success: function (response) {
			            //console.log(response[0].nailart_seq);
			        	console.log('이미지 추가 전');
			        	for (var i = 0; i < response.length; i++) {
			        	    var nailart_img = response[i].nailart_img;
			        	    var nailart_seq = response[i].nailart_seq;
			        	    var google = "https://drive.google.com/uc?export=view&id="
			        	    console.log('이미지 경로:', 'images/' + nailart_img);
			        	 // 이미지에 대한 정보를 부여하는 부분 추가
		                    var imageElement = $('<img>', {
		                        src:  google + nailart_img,
		                        alt: 'Nail Image',
		                        nailart_img: nailart_img, // 이미지에 속성 추가
		                        nailart_seq: nailart_seq,
		                        css: {
		                            margin: '10px',
		                            'max-width': '100%',
		                            cursor: 'pointer'
		                        }
		                    });

		                    // 이미지를 부모 컨테이너에 추가
		                    $('#nailInfoContainer_' + staff_seq.replace(".", "\\.")).append(imageElement);

			        	}
			        	console.log('이미지 추가 후');
			        },
			        error: function (error) {
			            console.error("데이터 가져오기 실패:", error);
			            console.log("에러 상세 정보:", error.responseText); // 추가
			        }
			    });
			}
			
			var selectedNailImg =''
			var selectedNailSeq =''
			$(document).on('click', '.showNailInfoAll img', function() {
		        // 클릭된 이미지의 정보를 가져와서 변수에 저장
		        selectedNailImg = $(this).attr('nailart_img');
		        selectedNailSeq = $(this).attr('nailart_seq');
		        alert("디자인을 선택하셨습니다.");
		        console.log(selectedNailImg);
		        console.log(selectedNailSeq);
				
		    });
	
			
			
			
			////////////////네일아트 이미지 보여주는 함수////////////////////


			/////////////////////////////////////////예약창//////////////////////////////////////////////////
			var time = ''
			var designer =''
			function selectTime(time) {
				// 기존에 선택된 버튼이 있다면 클래스 제거
			    var selectedButton = document.querySelector('.time-buttons button.selected');
			    if (selectedButton) {
			        selectedButton.classList.remove('selected');
			    }


			    // 선택된 버튼에 클래스 추가
			    var selectedTimeButton = document.querySelector('.time-buttons button[data-time="' + time + '"]');
			    if (selectedTimeButton) {
			        selectedTimeButton.classList.add('selected');
			    }
				this.time = time;
			    
			}
			function submitReservation() {
			    var designerSelect = document.getElementById('designerSelect');
			    var staff_seq = designerSelect.value;
			    var designerName = designerSelect.options[designerSelect.selectedIndex].text;
			    var date = document.getElementById('calendar-container').value;
				
			    if (staff_seq =='선택하세요' || date ==undefined || time =='' || selectedNailImg ==''){
			    	alert("모두 골라주세요");
			    }else{
			    	console.log(mem_id);
			    	console.log(time);
			    	console.log(staff_seq);
			    	console.log(date);
			    	console.log(designerName);
			    	console.log(selectedNailImg);
			    	console.log(selectedNailSeq);
			    	if (confirm("디자이너 : " + designerName + "이(가) 맞습니까?") == true){    //확인
			    		alert("예약 완료");
			    	
			    		$.ajax({
					        type: "POST",
					        url: "Appointment.do", // 서블릿 매핑 이름
					        data: {
					        	mem_id : mem_id,
					        	staff_seq : staff_seq,
					        	selectedNailImg : selectedNailImg,
					        	selectedNailSeq : selectedNailSeq,
					        	date : date,
					        	time : time
					        },
					        dataType: 'json',
					        success: function (response) {
					            // 서버에서의 응답에 따른 처리
					            console.log("예약 성공:", response);
					            // 추가적으로 화면 갱신 등을 수행할 수 있음
					        },
					        error: function (error) {
					            // 오류 발생 시 처리
					            console.error("예약 실패:", error);
					        }
					    });

			    	}else{   //취소
			    	      return;
			    	  }
			    	
			    }
			    
			    
			}
			
			flatpickrInstance = flatpickr("#calendar-container", {
            dateFormat: "Y-m-d",
            inline: true,
       		 });
			
			
			/////////////////////////////////////////예약창//////////////////////////////////////////////////


			// 지도 시작/////////////////////////

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level: 3 // 지도의 확대 레벨
				};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 위도와 경도 정보
        	var latitude = ${shopInfo.getLat()};
        	var longitude = ${shopInfo.getLng()};

			// 위도와 경도로 LatLng 객체 생성
			var coords = new kakao.maps.LatLng(latitude, longitude);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position: coords
			});

			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				content: '<div style="width:150px;text-align:center;padding:6px 0;">${shopInfo.getShopName()}</div>'
			});
			infowindow.open(map, marker);

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);

			// 지도 끝///////////////


			// JavaScript로 스크롤 버튼을 누르면 맨 위로 스크롤하는 기능을 추가합니다.
			const scrollTopButton = document.getElementById('scrollTopButton');

			// 버튼을 숨기거나 보이기 위한 함수
			function toggleScrollButton() {
				if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
					scrollTopButton.style.display = 'block';
				} else {
					scrollTopButton.style.display = 'none';
				}
			}

			// 스크롤 이벤트 시 버튼을 보이거나 숨깁니다.
			window.addEventListener('scroll', toggleScrollButton);

			// 버튼 클릭 시 맨 위로 스크롤
			scrollTopButton.addEventListener('click', () => {
				window.scrollTo({ top: 0, behavior: 'smooth' }); // 맨 위로 부드럽게 스크롤
			});

			

		</script>
</body>

</html>