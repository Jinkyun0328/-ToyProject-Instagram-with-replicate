<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Design</title>
<link rel="stylesheet" href="assets/css/shopManagement.css" />
<link href="assets/css/font-awesome.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 카카오맵 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4e8fa4b54164e23551ce19f4755a2ce&libraries=services"></script>

<!-- 풀캘린더 -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.8.0/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<!-- pretendard 폰트 -->
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />



</head>

<body>
	<div class="container">
		<div class="centered">
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
						<form id="file_form">
							<input type="file" id="thumbnailInput" name=input_file accept="image/*" style="display: none;"> 
						</form>
						<img id="thumbnail"
							src="https://png.pngtree.com/png-vector/20190215/ourmid/pngtree-vector-question-mark-icon-png-image_515448.jpg"
							alt="">
						
						<h2>${shopInfo != null ? shopInfo.getShopName() : '가게 정보 없음'}</h2>
						<h2 id="memId" style="display:None"> ${shopInfo != null ?shopInfo.getMemId(): '가게 정보 없음'} </h2>
					</div>

					<div id="menu" class="form">
						<a onclick="showHome()">홈</a> <a onclick="showDesignerList()">스타일리스트</a>
						<a onclick="showAppointmentBox()">예약</a> <a
							onclick="showReviewList()">리뷰</a> <a onclick="showMap()">지도</a>
					</div>
					<div id="designerList" class="form">
					<!--  
						<h2>디자이너</h2>
						<hr class="hrpink">
						
							<div class="designer">
								<div style="height: 40px">
									<span> ${staff.getStaffName()} </span>
									<input class="staffList1" type="hidden" data-value1="${staff.getStaffName()}" data-value2="${staff.getStaffSeq()}">
									<div class="designerButton">
										<button class="addImageButton">이미지 추가</button>
										<button class="deleteButton" id="${staff.getStaffSeq()}">디자이너
											삭제</button>
									</div>
									<div id=nailImgList>
										
									</div>
								</div>
								<div class="imageContainer" style="display: flex; overflow-x: auto;"></div>

								<hr class="hrpink">
							</div>
						
						
						<button id="designerPlus">디자이너 추가</button>
						-->
					</div>

					<div id="appointmentBox" class="form">
						<h2>예약</h2>
						<hr class="hrpink">
						<div id="calendar"></div>

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
					</div>
					<div id="mapbox" class="form">
						<h2>지도</h2>
						<hr class="hrpink">
						<div id="map" style="width: 100%; height: 350px;"></div>


					</div>

				</div>
			</div>
			
			

			<button id="scrollTopButton">위로</button>
		</div>
		<input id="AppointmentList" value='${AppointmentList}' type="hidden">
		<script>
			var shopInfo = null;
			var staffList = null;
			var nailList = null;
		
			// 사진 변환 및 이미지 업로드 및 db 저장
			document.getElementById('thumbnailInput').addEventListener('change', function(e) {
				if (e.target.files[0]) {
					console.log("test");
		            // const input_file = document.querySelector("#file_form");
		            const input_file = document.querySelector("#file_form");
		            
		            // const input_file = $('#file_form')[0];  // jQuery 사용시에는 이렇게 [0]을 붙어줘야한다.
		            let data = new FormData(input_file);
		            data.append("fname", "ShopImg");
		            data.append("iname", shopInfo.shop_seq+shopInfo.shop_name+".png");
	
		            $.ajax({
		                type: "POST",
		                url: 'http://127.0.0.1:9003/GoogleDriveUpload',
		                data: data,
		                contentType: false,
		                processData: false,
		                success: (res) => {
		                    console.log(res);
		                    console.log(shopInfo.mem_id)
		                    // 파일 업로드 성공
		                    // 데이터베이스에 저장하기
		                    $.ajax({
				                type: "get",
				                url: 'updateShopImg.do',
				                data: {data:res, mem_id:shopInfo.mem_id},
				                success: (res) => {
				                    console.log(res);
				                }
		                    });
		                }
		            });
			 	}
			});
			

			
			
			$.ajax({
			    type: "get",
			    url: "getShopInfo.do", // 서블릿 매핑 이름
			    data: {mem_id: $("#memId").text()},
			    dataType : "json",
			    
			    success: function (res) {
			        // 서버에서의 응답에 따른 처리
			        console.log(res);
			        shopInfo = res;
			        
			        console.log(shopInfo.shop_img)
			     	// db에 저장되어 있는 file_id를 사용하여 어쩌고 저쩌고
					// shopInfo.shop_img
					// thumbnail <-- 이 녀석의 src를 변겅
					if(shopInfo.shop_img != null){
						$.ajax({
			                type: "get",
			                
			                // shopInfo.shop_img
			                url: 'http://127.0.0.1:9003/GoogleDriveDownload2',
			                data: {nail_img: shopInfo.shop_img},
			                
			                xhr: function () {
			                    var xhr = new XMLHttpRequest();
			                    xhr.responseType = 'blob';
			                    return xhr;
			                },

			                success: function (res) {
			                    var img = document.getElementById('thumbnail');
			                    var url = window.URL || window.webkitURL;
			                    img.src = url.createObjectURL(res);
			                },
			            });
					}
			        
			     	// id = nailImgList에 해당하는 staff 정보를 가져와서 그 사람의 사진 출력하기
					// 1. 스태프 정보 모두 가져오기
					$.ajax({
					    type: "get",
					    url: "getStaffInfoAll.do", // 서블릿 매핑 이름
					    data: {data: "11111111111"+shopInfo.shop_seq},
					    dataType : "json",
					    
					    success: function (res) {
					        // 서버에서의 응답에 따른 처리
					        console.log(res.length);
					        staffList = res;
					        
					        var cnt = 0;
					        $("#designerList").empty();
					        $("#designerList").append("<h2>디자이너</h2>");
					        $("#designerList").append("<hr class=\"hrpink\">");
					        for(let i = 0; i < staffList.length; i++){
					        	console.log(staffList[i].staff_name);
					        	// nail 정보 모두 가져오기
						        $.ajax({
								    type: "get",
								    url: "getNailInfoAll.do", // 서블릿 매핑 이름
								    data: {data: "111111111111"+staffList[i].staff_seq},
								    dataType : "json",
								    
								    success: function (res) {
								        // 서버에서의 응답에 따른 처리
								        nailList = res;
								        $("#designerList").append("<div class=\"designer\">");
								        $("#designerList").append("<div style=\"height: 40px;\">");
								        $("#designerList").append("<span>"+ staffList[i].staff_name+"</span>");
								        $("#designerList").append("<input class=\"staffList1\" type=\"hidden\" data-value1="+staffList[i].staff_name+" data-value2="+staffList[i].staff_seq+">");
								        $("#designerList").append("<div class=\"designerButton\">");
								        $("#designerList").append("<button class=\"addImageButton\">이미지 추가</button>");
								        $("#designerList").append("<button class=\"deleteButton\" id="+staffList[i].staff_seq+">디자이너 삭제</button>");
								        $("#designerList").append("</div>");
								        $("#designerList").append("</div>");
								        $("#designerList").append("<div class=\"imageContainer\" style=\"display: flex; overflow-x: auto;\">");
								        
								        for(let j = 0; j < nailList.length; j++){
								        	$("#designerList").append("<img id=\"nailartImg_"+nailList[j].nailart_seq+"\" width=\"10%\">");
								        	// ajax를 사용하여 이미지 출력하기
								        	console.log(nailList[j].nailart_img);

								        	$.ajax({
								                type: "get",
								                
								                // shopInfo.shop_img
								                url: 'http://127.0.0.1:9003/GoogleDriveDownload2',
								                data: {nail_img: nailList[j].nailart_img},
								                
								                xhr: function () {
								                    var xhr = new XMLHttpRequest();
								                    xhr.responseType = 'blob';
								                    return xhr;
								                },
					
								                success: function (res1) {
								                	if (res!= null){
								                		var img = document.getElementById('nailartImg_'+nailList[j].nailart_seq);
									                    var url = window.URL || window.webkitURL;
									                    img.src = url.createObjectURL(res1);
								                	}
												},
								            });
								        	
								        	$("#designerList").append("</div>");
								        	
								        }
								        
								        $("#designerList").append("</div>");
								        $("#designerList").append("<hr class=\"hrpink\">");
								        $("#designerList").append("<button id=\"designerPlus\">디자이너 추가</button>");

								    },
								    error: function (error) {
								        // 오류 발생 시 처리
								        console.log("error");
								    }
								});
					        }
					        
					        
					    },
					    error: function (error) {
					        // 오류 발생 시 처리
					        console.log("error");
					    }
					});
			        
			    },
			    error: function (error) {
			        // 오류 발생 시 처리
			        console.log("error");
			    }
			});
		
		

			var designerPlus = document.getElementById("designerPlus");
			var designerList = document.getElementById("designerList");
			var appointmentBox = document.getElementById("appointmentBox");
			var reviewList = document.getElementById("reviewList");
			var mapbox = document.getElementById("mapbox");
			var thumbnail = document.getElementById("thumbnail")
			var thumbnailInput = document.getElementById("thumbnailInput");
			var deleteButtons = document.getElementsByClassName("deleteButton");
			var staffList1 = document.getElementsByClassName("staffList1");
			var AppointmentList = document.getElementById("AppointmentList").value;
			//var AppointmentList = JSON.parse(document.getElementById("AppointmentList").value);
			/*
			console.log(staffList1[0].getAttribute("data-value1"));
			console.log(staffList1[0].getAttribute("data-value2"));
			for(var i = 0; i < staffList1.length; i++){
				console.log(staffList1[i].getAttribute("data-value1"));
				console.log(staffList1[i].getAttribute("data-value2"));
			}
			for(var i = 0; i < AppointmentList.length; i++){
				console.log(AppointmentList[i]);
			}*/
			
			console.log(AppointmentList);
			



			// 정규식을 사용하여 rawData에서 대괄호 제거
			var cleanData = AppointmentList.replace(/\[|\]/g, '');
			console.log(cleanData);
			// 각 배열 요소를 파싱하여 JSON으로 변환
			var dataArray = cleanData.split(', ')

			console.log(dataArray);
			
			var resultArray = [];
			for (var i = 0; i < dataArray.length; i += 3) {
			    resultArray.push(dataArray.slice(i, i + 3));
			}

			console.log(resultArray);
			for(var i = 0; i < resultArray.length; i++){
				for(var j = 0; j <resultArray[i].length; j++){
					console.log(resultArray[i][j]);
				}
			}
			
			
			
			for(var i = 0; i < resultArray.length; i++){
				console.log("시간 : "+ resultArray[i][2][11]);
				console.log("시간 : "+ resultArray[i][2][12]);
				
			}




			
			// 디자이너 추가 코드

			designerPlus.onclick = function () {
			    var designerName = prompt("디자이너 이름을 입력하세요");

			    if (designerName) {
			        // 사용자가 이름을 입력하고 확인을 누르면 AJAX를 이용해 서버로 전송
			        addDesignerToDatabase(designerName);
			    }
			};

			function addDesignerToDatabase(designerName) {
			    // AJAX를 이용한 서버로의 요청
			    $.ajax({
			        type: "POST",
			        url: "AddDesigner.do", // 서블릿 매핑 이름
			        data: {
			            designerName: designerName
			            // 여기에 다른 필요한 데이터도 추가 가능
			        },
			        success: function (response) {
			            // 서버에서의 응답에 따른 처리
			            console.log("디자이너 추가 성공:", response);
			            // 추가적으로 화면 갱신 등을 수행할 수 있음
			        },
			        error: function (error) {
			            // 오류 발생 시 처리
			            console.error("디자이너 추가 실패:", error);
			        }
			    });
			}
			
			// 디자이너 삭제 코드
			for (var i = 0; i < deleteButtons.length; i++) {
   				deleteButtons[i].onclick = function () {
			    var staff_seq = this.id; // 삭제 버튼이 속한 디자이너 div의 id
			    $.ajax({
			        type: "POST",
			        url: "DeleteDesigner.do", // 서블릿 매핑 이름
			        data: {
			        	staff_seq: staff_seq // 디자이너의 고유한 seq를 서버로 전송
			            // 여기에 다른 필요한 데이터도 추가 가능
			        },
			        success: function (response) {
			            // 서버에서의 응답에 따른 처리
			            console.log("디자이너 삭제 성공:", response);
			            // 추가적으로 화면 갱신 등을 수행할 수 있음
			            location.reload(); // 또는 비동기 방식으로 화면을 업데이트하는 함수 호출
			        },
			        error: function (error) {
			            // 오류 발생 시 처리
			            console.error("디자이너 삭제 실패:", error);
			        }
			    });
			};
			}
			
			// 이미지 추가 코드
						
			document.addEventListener('DOMContentLoaded', function () {
			    const designerContainer = document.getElementById('designerList');
			    const designerPlusButton = document.getElementById('designerPlus');
			
			    designerContainer.addEventListener('click', function (event) {
			        const targetButton = event.target;
			
			        // 이미지 추가 버튼 클릭 시
			        if (targetButton.classList.contains('addImageButton')) {
			            const imageContainer = targetButton.closest('.designer').querySelector('.imageContainer');
			
			            // 파일 선택 창 열기
			            const inputFile = document.createElement('input');
			            inputFile.type = 'file';
			            inputFile.name = 'designerImage';
			            inputFile.accept = 'image/*';
			            inputFile.style.display = 'none'; // 파일 선택 창을 감추기
						
			            // 파일 선택 시 미리보기 추가
			            inputFile.addEventListener('change', function () {
			                const previewImage = document.createElement('img');
			                previewImage.src = URL.createObjectURL(inputFile.files[0]);
			                previewImage.style.width = '100px'; // 적절한 크기로 조절
			                imageContainer.appendChild(previewImage);
			
			                // 파일 선택 창 초기화 (동일한 파일을 선택해도 change 이벤트가 발생하도록)
			                inputFile.value = null;
			            });
			
			            // input 엘리먼트 추가
			            imageContainer.appendChild(inputFile);
			
			            // 파일 선택 창 열기
			            inputFile.click();
			        }
			    });
			});


			
			
			

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


			/////////////////////////////////////////스케쥴표//////////////////////////////////////////////////

			document.addEventListener('DOMContentLoaded', function () {
				var calendarEl = document.getElementById('calendar');
				
				
				var resources = [];
				// 스태프 이름이랑 staff_seq 가져옴
				for(var i = 0; i < staffList1.length; i++){
					var designerId = staffList1[i].getAttribute("data-value2");
			        var designerName = staffList1[i].getAttribute("data-value1");
			        resources.push({ id: designerId, title: designerName });
				}
				var events = [];
				for(var i = 0; i < resultArray.length; i++){
					var startTime = resultArray[i][2];
					var hour = parseInt(startTime.slice(11, 13), 10);

					// 시간을 23 이하이면 1을 더하고, 24이면 0으로 만듭니다.
					hour = hour <= 23 ? hour + 1 : 0;
					
					// 수정된 시간을 문자열에 반영합니다.
					var modifiedEndTime = startTime.slice(0, 11) + (hour < 10 ? '0' : '') + hour + startTime.slice(13);

					// 이제 modifiedEndTime을 사용하여 이벤트 객체를 생성합니다.
					console.log("과연..." + modifiedEndTime);
					var event = {
					    "resourceId": resultArray[i][0],
					    "title": resultArray[i][1],
					    "start": startTime,
					    "end": modifiedEndTime
					};
					events.push(event);
				}
				
					
					
				
				var calendar = new FullCalendar.Calendar(calendarEl, {
					timeZone: 'UTC',
					initialView: 'resourceTimelineDay',
					aspectRatio: 1.5,
					headerToolbar: {
						left: 'prev,next',
						center: 'title',
						right: 'resourceTimelineDay,resourceTimelineWeek,resourceTimelineMonth'
					},

					editable: true,
					resourceAreaHeaderContent: '디자이너',
					schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
					resources: resources,
					events: events,
					// businessHours: {
					//     startTime: '10:00',
					//     endTime: '18:00'
					// },
					slotMinTime: '10:00',
					slotMaxTime: '18:00',
					locale: 'ko',
					
					eventClick: function (info) {
				        var event = info.event;
				        var confirmation = confirm("예약을 취소하시겠습니까?");

			            if (confirmation) {
			                // 여기에 예약 취소 요청을 서버로 보내는 로직을 추가
			                // event.id 또는 event.extendedProps 등을 활용하여 서버에 전송
							$.ajax({
						        type: "POST",
						        url: "DeleteAppointment.do", // 서블릿 매핑 이름
						        data: {
						            mem_id : event.title,
						            appointed_at : event.start.toISOString()
						            // 여기에 다른 필요한 데이터도 추가 가능
						        },
						        success: function (response) {
						            // 서버에서의 응답에 따른 처리
						            console.log("예약 삭제 성공:", response);
						            // 추가적으로 화면 갱신 등을 수행할 수 있음
						        },
						        error: function (error) {
						            // 오류 발생 시 처리
						            console.error("예약 삭제 실패:", error);
						        }
						    });
			                // 예약을 취소한 경우
			                alert("예약이 취소되었습니다.");

			                // FullCalendar에서 해당 이벤트를 제거 (옵션)
			                event.remove();
			            } else {
			                // 사용자가 예약 취소를 취소한 경우 또는 창을 닫은 경우
			                alert("예약이 취소되지 않았습니다.");
			            }
					}
					
				});

				calendar.render();
			});
			/////////////////////////////////////////스케쥴표//////////////////////////////////////////////////


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