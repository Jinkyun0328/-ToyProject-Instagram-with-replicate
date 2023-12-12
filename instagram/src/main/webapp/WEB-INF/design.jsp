<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Design</title>
<link rel="stylesheet" href="assets/css/design.css" />
<link href="assets/css/font-awesome.min.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
#fileInput {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

#selectImg img {
	width: 80%
}
</style>

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
				<hr style="width: 95%;">
				<!--손 사진 업로드 -->
				<div id="handImg">
					<img id="handImg1" src="images/hand.jpeg">
				</div>
				<!--버튼 2개 -->

				<div class="buttons">
					<label for="fileInput" class="btn-hover label-color-1"> <!-- correction label font 변경하기 -->
						<label for="file">Select</label>
						<form id="file_form">
							<input type="file" id="fileInput" name="fileInput">
						</form>
					</label>
				</div>

				<div id="tip">
					<p>📌손 사진을 업로드 해주세요</p>
					<p>📌네일샵과 디자이너를 선택해주세요</p>
					<p>📌네일 사진을 클릭하면</p>
					<p>📌5초 뒤 결과가 출력됩니다.</p>
				</div>

				<div>
					<select name="shop_select" id="shop_select">
						<!-- ajax를 사용하여 사용자가 선택할 수 있도록 
			            <option value="">Java</option>
			            <option value="">HTML</option>
			            <option value="">DB</option>
			            -->
					</select> <select name="staff_select" id="staff_select">
						<!-- shop 정보는 성민샵에서 이미 가지고 있다.
						성민샵의 번호를 조건으로 staff_name을 가져온다.
			            <option value="">Java</option>
			            <option value="">HTML</option>
			            <option value="">DB</option>
			             -->
					</select>
				</div>
			</div>


			<!--디자인 목록 -->
			<div id="bottom">
				<div class="design-list">
					<table width="100%" border="1"
						style="table-layout: fixed">
						<tr id="selectImg">
							<td><img src="images/nail1.png"></td>
							<td><img src="images/nail1.png"></td>
							<td><img src="images/nail1.png"></td>
							<td><img src="images/nail1.png"></td>
							<td><img src="images/nail1.png"></td>
						</tr>
					</table>
				</div>
				<div id="selectImgNum" style="text-align:center; width:100%; margin-top:5px">
					<button id="prev_btn"> << </button>
					<button class="selectImgNum">1</button>
					<button class="selectImgNum">2</button>
					<button class="selectImgNum">3</button>
					<button class="selectImgNum">4</button>
					<button class="selectImgNum">5</button>
					<button id="next_btn"> >> </button>
				</div>
				
				<button id="scrollTopButton">위로</button>
			</div>

			<script>
				let max_page = 1;
		
				// 디자인 이미지 출력하기
				// 1. ajax를 사용해서 성민샵의 shop_seq에 등록되어 있는 staff_seq와 staff_name 가져오기
				// 이것은 아무런 이벤트 없이 성민샵에 들어오면 바로 발동
				// 오류가 나도 무시하기. 출력 잘 됨
				// console.log(memId);
				
				function wait(sec) {
				    let start = Date.now(), now = start;
				    while (now - start < sec * 1000) {
				        now = Date.now();
				    }
				}

				$.ajax({
	                type: "get",
	                url: 'getShopInfoAll.do',
	                data: {data: "data"},
	                dataType : "json",
	                success: (res) => {
	                	console.log(res.length)
	                	$("#shop_select option").remove();
	                	for(let i = 0; i<res.length; i++){
	                		// console.log(res[i].shop_name);
	                		$("#shop_select").append("<option id=shop_select"+res[i].shop_seq+">"+res[i].shop_name+"</option>");
	
	                	}
	                	
	                	//$("#shop_select option:eq(0)").remove();
	                	
	                	
	                },
	                error : function(){
	                	console.log("error");
	                }	
	            });
				
				
				// 2. shop을 선택했을 때의 이벤트
				$("#shop_select").on("change", function(){
				    //selected value
				    // console.log($(this).val());
				    
				    // 성민샵의 id가 출력.
				    // 이것을 사용해서 ajax로 데이터 전송
				    console.log($("option:selected", this).attr("id"));

				    // selected option element
				    // 객체가 출력
				    // console.log($("option:selected", this));
				    
				    // 아래 두 개는 정확하게 이름이 출력된다.
				    // console.log($("option:selected", this).text());
				    // console.log($(this).find("option:selected").text());
				    
				    // ajax에서 $("option:selected", this).attr("id")을 전송하여 staff_info를 가져온다.
				    // shop_select21이 전송되는 것으로 서버에서 store_select를 제거한 21로 staff_info에서 값을 가져온다.
				    
				    $.ajax({
		                type: "get",
		                url: 'getStaffInfoAll.do',
		                data: {data: $("option:selected", this).attr("id")},
		                // 이게 써야 실행될 때가 있고 안 써야 실행될 때가 있음. 왜 인지 모름 위에 똑같은 코드에서는 써야 실행됨 ㅂㄷㅂㄷ
		                dataType : "json",
		                success: (res) => {
		                	console.log("success");
		                	console.log(res.length);
		                	$("#staff_select option").remove();
		                	for(let i = 0; i<res.length; i++){
		                		// console.log(res[i].shop_name);
		                		$("#staff_select").append("<option id=staff_select"+res[i].staff_seq+">"+res[i].staff_name+"</option>");
		                	}
		                },
		                error : function(){
		                	console.log("error");
		                }	
		            });
				});
				
				// 화면에 이미지를 출력하는 함수
				// ajax 내부에서 호출되어 res와 몇 번째 버튼의 데이터를 출력할지 결정
				function printNailImg(res, idx) {
					idx = parseInt(idx);
					if(idx < res.length){
						var sendObj = {nail_img: res[idx].nailart_img};
						
						$.ajax({
			                type: 'get',
			                url: 'http://127.0.0.1:9003//GoogleDriveDownload2',

			                data: sendObj,

			                xhr: function () {
			                    var xhr = new XMLHttpRequest();
			                    xhr.responseType = 'blob';
			                    return xhr;
			                },

			                success: function (res1) {
			                    var img = document.getElementById('selectImg'+idx);
			                    var url = window.URL || window.webkitURL;
			                    img.src = url.createObjectURL(res1);
			                    img.alt = res[idx].nailart_img;
			                },

			                // 4. 실패했을 때 
			                error: function () {
								console.log("error");
			                }
			            })
	
					}else{

					}
				}

				// 화면에 이미지를 출력하는 함수
				// ajax 내부에서 호출되어 res와 몇 번째 버튼의 데이터를 출력할지 결정
				function printNailImg2(res, btn) {
					var num = parseInt(btn)-1;
					// 이미지 비우기
					$("#selectImg").empty();
					$("#selectImg").append("<tr>")
                	for(let i = 0; i<5; i++){
						if(num*5+i < res.length){
							// <td><img src="images/nail1.png"></td>
							
							$("#selectImg").append("<td><img id=selectImg"  +res[num*5+i].nailart_seq+  "></td>");
							// 결과물 출력하는 사진처럼 이미지 받아와서 바로 출력시키기
							// 그럼 여기서 ajax를 써야하나? 반복문으로? 속도 감당 가능해?????
							
							if(i > 0){
								sleep(1000)
							}
							var sendObj = {nail_img: res[num*5+i].nailart_img};
							
							$.ajax({
				                type: 'get',
				                url: 'http://127.0.0.1:9003//GoogleDriveDownload2',
	
				                data: sendObj,
	
				                xhr: function () {
				                    var xhr = new XMLHttpRequest();
				                   xhr.responseType = 'blob';
				                    return xhr;
				                },
	
				                
				                success: function (res1) {
				                    var img = document.getElementById('selectImg'+res[num*5+i]);
				                    var url = window.URL || window.webkitURL;
				                    img.src = url.createObjectURL(res1);
				                },
	
				                // 4. 실패했을 때 
				                error: function () {
									console.log("error");
				                }
				            })
							
									
									
						}else{
							$("#selectImg").append("<td></td>");
						}
                	}
					$("#selectImg").append("</tr>")
				}
				
				// ajax를 사용하여 데이터를 가져오는 함수
				function getNailInfoAll(btn){
					//console.log($("option:selected", "#staff_select").attr("id"));
					//console.log(num);
					num = 5*parseInt(btn-1);
					console.log(num);
				    $.ajax({
		                type: "get",
		                url: 'getNailInfoAll.do',
		                data: {data: $("option:selected", "#staff_select").attr("id")},
		                dataType : "json",
		                success: (res) => {
		                	// 그럼 개수를 지정해야하나?
		                	// res.length로 개수지정 가능
		                	max_page = parseInt((parseInt(res.length)+4)/5);
		                	console.log(res.length);
		                	console.log(max_page);
		                	
		                	                	
		                	$("#selectImg").empty()
							$("#selectImg").append("<td><img id=selectImg" +(num+0) + "></td>");
		                	$("#selectImg").append("<td><img id=selectImg" +(num+1) + "></td>");
		                	$("#selectImg").append("<td><img id=selectImg" +(num+2) + "></td>");
		                	$("#selectImg").append("<td><img id=selectImg" +(num+3) + "></td>");
		                	$("#selectImg").append("<td><img id=selectImg" +(num+4) + "></td>");
		                	
		                	// 이미지 출력
		                	printNailImg(res, num+0);
		                	printNailImg(res, num+1);
		                  	printNailImg(res, num+2);
		                	printNailImg(res, num+3);
		                	printNailImg(res, num+4);
		                	
		                	// 이미지 이벤트 부여
		                	imgClickEvent();
		                	
							// 버튼 내부 값 변경
							
							
							// 
		               
		                },
		                error : function(){
		                	console.log("error");
		                }	
		            });
				}
				
				// 3. staff을 선택했을 때의 이벤트
				// staff에 등록된 네일아트 이미지 출력
				$("#staff_select").on("change", function(){
					getNailInfoAll(1);
				});
				
				// 버튼이 클릭되었을 때
				$(".selectImgNum").on("click", function(){
					if($("option:selected", "#staff_select").attr("id") == null){
						console.log("가게가 선택되지 않음");
					}else{
						getNailInfoAll($(this).text());
						
						if($(this).text() <= 2){
							var page = parseInt($(this).text());
							$("#selectImgNum").children('button:eq(1)').text('1');
							$("#selectImgNum").children('button:eq(2)').text('2');
							$("#selectImgNum").children('button:eq(3)').text('3');
							$("#selectImgNum").children('button:eq(4)').text('4');
							$("#selectImgNum").children('button:eq(5)').text('5');
						}
						
						if($(this).text() >= 3 && $(this).text() <= max_page){
							var page = parseInt($(this).text());
							$("#selectImgNum").children('button:eq(1)').text(page-2);
							$("#selectImgNum").children('button:eq(2)').text(page-1);
							$("#selectImgNum").children('button:eq(3)').text(page);
							$("#selectImgNum").children('button:eq(4)').text(page+1);
							$("#selectImgNum").children('button:eq(5)').text(page+2);
						}
					}
				})
				
				$("#prev_btn").on("click", function(){
					if($("option:selected", "#staff_select").attr("id") == null){
						console.log("가게가 선택되지 않음");
					}else{
						getNailInfoAll(1);
						
						var page = parseInt('1');
						
						$("#selectImgNum").children('button:eq(1)').text('1');
						$("#selectImgNum").children('button:eq(2)').text('2');
						$("#selectImgNum").children('button:eq(3)').text('3');
						$("#selectImgNum").children('button:eq(4)').text('4');
						$("#selectImgNum").children('button:eq(5)').text('5');
					}
				})
				
				$("#next_btn").on("click", function(){
					if($("option:selected", "#staff_select").attr("id") == null){
						console.log("가게가 선택되지 않음");
					}else{
						getNailInfoAll(parseInt(max_page));
						
						var page = parseInt(max_page);
						
						$("#selectImgNum").children('button:eq(1)').text(page-2);
						$("#selectImgNum").children('button:eq(2)').text(page-1);
						$("#selectImgNum").children('button:eq(3)').text(page);
						$("#selectImgNum").children('button:eq(4)').text(page+1);
						$("#selectImgNum").children('button:eq(5)').text(page+2);
					}
				})
				
			</script>

			<script>
				// flask 집어넣기
				// 1. img를 클릭했을 때 즉 이벤트가 발생했을 때 id를 가져와야 한다.
				// 새롭게 추가되는 태그에 대해서는 추가한 뒤에 이벤트를 걸어주어야 한다.
				// 따라서 함수 형태로 만든 다음에 이미지가 추가된 뒤에 이벤트를 호출한다.
				
				function imgClickEvent() {
					$("#selectImg img").on("click", function(){
						var src = $(this).attr("alt");
						console.log("src");
						console.log(src);
						
						console.log(src);
						var sendObj = {nail_img: src};
						$.ajax({
			                type: 'get',
			                url: 'http://127.0.0.1:9003/nailArtService',

			                data: sendObj,

			                xhr: function () {
			                    var xhr = new XMLHttpRequest();
			                    xhr.responseType = 'blob';
			                    return xhr;
			                },

			                
			                success: function (res) {
			                    var img = document.getElementById('handImg1');
			                    var url = window.URL || window.webkitURL;
			                    img.src = url.createObjectURL(res);
			                },

			                // 4. 실패했을 때 
			                error: function () {
								console.log("error");
			                }
			            })
			        
					});
				}
			</script>








			<script>
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

				function handleImageChange(event) {
					const file = event.target.files[0];
					const reader = new FileReader();

					reader.onload = function (e) {
						const imgSrc = e.target.result;
						const handImg = document.getElementById('handImg');
						handImg.innerHTML = `<img src="${imgSrc}" alt="Uploaded Image">`;
					};

					reader.readAsDataURL(file);
				}
			</script>

			<script>
				document.getElementById('fileInput').addEventListener('change', function(e) {
					if (e.target.files[0]) {
			            const input_file = document.querySelector("#file_form");
				         
			            // const input_file = $('#file_form')[0];  // jQuery 사용시에는 이렇게 [0]을 붙어줘야한다.
			            let data = new FormData(input_file);

			            $.ajax({
			                type: "POST",
			                url: 'http://127.0.0.1:9003/saveInputfile',
			                data: data,
			                contentType: false,
			                processData: false,
			                success: (res) => {
			                    console.log(res);
			                }
			            });
				 	}
				});

				
			</script>

			<script type="text/javascript">
			    // 이미지 미리보기
			    // 이미지 미리보는 img 태그는? handImg1
			    var sel_file;
			 
			    $(document).ready(function() {
			        $("#fileInput").on("change", handleImgFileSelect);
			        console.log("test1");
			    });
			 
			    function handleImgFileSelect(e) {
			        var files = e.target.files;
			        var filesArr = Array.prototype.slice.call(files);
			 
			        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
			 
			        filesArr.forEach(function(f) {
			            if (!f.type.match(reg)) {
			                alert("확장자는 이미지 확장자만 가능합니다.");
			                return;
			            }
			 
			            sel_file = f;
			 
			            var reader = new FileReader();
			            reader.onload = function(e) {
			                $("#handImg1").attr("src", e.target.result);
			            }
			            reader.readAsDataURL(f);
			        });
			    }
			</script>
</body>

</html>