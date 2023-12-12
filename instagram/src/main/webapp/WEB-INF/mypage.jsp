<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="assets/css/mypage.css" />
<link href="assets/css/font-awesome.min.css" rel="stylesheet" />
<!-- pretendard 폰트 -->
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>

<body>
	<div class="centered">
		<!-- 상단바 -->
		<div id="topBar">
			<p>Nail</p>
			<div id="menu">
				<a href="Gomain.do">Home</a> 
				<a href="Godesign.do">Design</a> 
				<a href="Goshop.do">Shop</a>
			</div>
				<c:if test="${result==null}">
			   		<a href="Gosign.do"> <i class="fa fa-user" aria-hidden="true"></i></a>
				</c:if>
				<c:if test="${result!=null}">
					<a href="Gomypage.do"> <i class="fa fa-user" aria-hidden="true"></i></a>
				</c:if>
			</div>
		<hr style="width: 95%;">

		<!-- 회원 프로필 -->
		<div class="profile">
			<div class="pro">
				<img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAABxVBMVEX////ha1TSKX362g/52BDcU2PhaVXiblLnhkPniELicFHTK3zoikHmgkbbUWTmg0XlfUnwsCn0wh7jc0/zvSHytiX2yBrkeUvdWGDtoDPvqyzqlTrupTDeXlzrmDjyuCT3zRffY1n0wB/UMHneXV3VNnXsnDbpjj7YQW7WO3LZRmvtozHYQ23aTWf2zBj76t7989v66ODyuQD99PjwrgDcUVbhZ0j77vTleTP88uv//ff1wgDytwDqkSHohyn99draRlnsp5bPAHT33enldzX0w2Ptpnz1xmL+/Oz975/upgzsnBfngyzibjv87ZPgb37zydnfcp7tssrkfHP32M7poMP33N3omJ7548zlgGTyum3zxrPyt0zrpqjbX5H53ZT53WzeW0f988vqm4L98LH864PvtJ3wvMXkf5LfZX/faInmjqbporTzyM3kiJPUKWTYRIDkiq3xvLfkem/hcW7aVJLkjbXsoofojGHrqMfVPYryw6X0y67pnJridG3sq7LvrXHto1TwuIjnjoX1zIv32ajpkFXyuEXto27uqoD30nr414jpk3X3z03jfZ7yxb7cVYH631z2y0j74WL63kH99MD2z6HfxwaWAAAXjklEQVR4nNWd+V8TxxvHw6GiaJFLPFCxVrDaChFyLXKjRkIEIY0gVgJyVA4VrF9twSJnEQ8Ewb/3uzPPM5vdZJPszkwS+vmhLxT3eHdmnmd25nmecTjSrvrw7OTS0vQfz1RdI/r6dWrqy/RM32RvR336H59OqWhLz3t+aFX1K9U11C+//HL16tUXRD9PfZnp9fwXQcOzD3sOqWg/EP3KpEMkjFev/nz1559VzpdTc70d2X5lGwrPPz/tcp0+fYgoFSLqyosrL7/0ebL96hZUP/vuJxfBO42E5oi/xCGqkFeuvHg513uge2z99up5l+unn06j7CFeAV1+0HtQm5LgnT9//qefzBATE8YhXrmsQmYbJl7hdyOXLp0/j4R6xFawN896nj98OLOkamZmevqPqWfXfiHm1BRRZbw8d6AsT/38K5XvUiyiy9V6WuWaDIfNu52nY3Zy+ssUcRsmiO1P+g7KkHS2HQY+HaJqbFw9v0+GrbyjJ9w3PYWUekRV/zsII9K5enjk8OHDekSVrn8p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">
				<div>
					<h2>${result.getMemName()}</h2>
					<span>${result.getMemEmail()}</span>
				</div>
			</div>
		</div>

		<div class="reservation-confirm">
			<span> 예약현황 </span>

			<div class="reservation-list"></div>
		</div>

		<!--회원정보수정, 가게등록 태그-->
		<div class="buttons">
			<button id="editButton">> 회원정보 수정</button>
			

			<c:if test="${result.getMemType()=='c'}">
				<a class="storeButton" href="GoshopReg.do"> > 가게등록</a>
			</c:if>
			<!--등록했으면 가게관리페이지로 이동-->
			<c:if test="${result.getMemType()=='s'}">
				<a class="storeButton" href="ShopManagement.do"> > 가게관리</a>
			</c:if>
		</div>

		<!--회원 정보 수정-->
		<div id="editLayout" class="container">
			<span>회원정보</span>
			<form action="Update.do" method="post">
				<div class="container_unit">
					<div class="form-group">
						<label for="name">이름</label> <input type="text" id="name"
							name="name" value="${result.getMemName()}">
					</div>
					<hr style="width: 90%;">
					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							id="password" name="password" value="${result.getMemPw()}">
					</div>
					<div class="form-group">
						<label for="password">비밀번호 확인</label>
						<div id="passwordCk">
							<input type="text" id="password_check" name="password_check"
								placeholder="다시 한번 입력해주세요.">
							<ul></ul>
						</div>
					</div>
				</div>
				<div class="container_unit">
					<div class="form-group">
						<label for="email">이메일</label> <input type="email" id="email"
							name="email" value="${result.getMemEmail()}">
					</div>
					<hr style="width: 90%;">
					<div class="form-group">
						<label for="phone">전화번호</label> <input type="tel" id="phone"
							name="phone" value="${result.getMemPhone()}">
					</div>
				</div>
				<div class="container_unit">
					<div class="form-group">
						<label for="address">주소</label> <input type="text" id="address"
							name="address1" value="${result.getMemAddr1()}">
					</div>
					<div class="form-group">
						<label for="address_detail">상세 주소</label> <input type="text"
							id="address_detail" name="address2"
							value="${result.getMemAddr2()}">
					</div>
				</div>
				<button type="submit" class="modify-button" name="submit">수정
					완료</button>
			</form>

			<button id="scrollTopButton">위로</button>
		</div>
	</div>

	<script type="text/javascript">
   var memId = "${result.getMemId()}";
    var obj = {
          receive_memId : memId
    };
   
  // DB에 게시물 데이터 요청 후 페이지네이션
  $.ajax({
    // 데이터 요청 주소
    url: "SelectReserv.do",
    // 데이터 타입
    dataType: "json", 
    // 백엔드로 전달할 매개변수
    data: obj,
    // 성공
    success: function (result) {
      console.log("성공");
      console.log("데이터: ", result, "end"); // 객체 전체를 출력해 보기 위해 콤마(,)를 사용하여 분리
      console.log("2222222");

      
     result.forEach(function(item) {
  const reservationList = document.querySelector('.reservation-list'); // 예약 목록이 들어갈 부모 요소 선택
  
  // 새로운 store 클래스 div 생성
  const newStore = document.createElement('div');
  newStore.classList.add('store');
  
  // 예약상태
  const stateSpan = document.createElement('span');
  stateSpan.classList.add('reservation-state');
  
	//"X", "O", "L" 값에 따라 다른 내용 설정
 if (item.APPROVED === "X") {
    stateSpan.textContent = "예약실패";
    stateSpan.style.color = "red";
} else if (item.APPROVED === "O") {
    stateSpan.textContent = "예약승인";
    stateSpan.style.color = "blue";
} else if (item.APPROVED === "L") {
    stateSpan.textContent = "대기 중";
    stateSpan.style.color = "gray";
} else {
    stateSpan.textContent = "알 수 없음";
}
  // 가게이름
  const storeSpan = document.createElement('span');
  storeSpan.classList.add('reservation-store');
  storeSpan.textContent = item.SHOP_NAME;
  // 예약시간
  const timeSpan = document.createElement('span');
  timeSpan.classList.add('reservation-time');
  const timeHeader = document.createElement('h4');
  timeHeader.textContent = '예약시간';
  const timeContent = document.createElement('span');
  timeContent.textContent = item.APPOINTED_AT;
  timeSpan.appendChild(timeHeader);
  timeSpan.appendChild(timeContent);
  // 영업시간
  const hourSpan = document.createElement('span');
  hourSpan.classList.add('opening-hour');
  const hourHeader = document.createElement('h4');
  hourHeader.textContent = '영업시간';
  const hourContent = document.createElement('span');
  hourContent.textContent = item.OPEN_TIME + ' ~ ' + item.CLOSE_TIME;
  hourSpan.appendChild(hourHeader);
  hourSpan.appendChild(hourContent);
  // 주소
  const locSpan = document.createElement('span');
  locSpan.classList.add('reservation-time');
  const locHeader = document.createElement('h4');
  locHeader.textContent = '주소';
  const locContent = document.createElement('span');
  locContent.textContent = item.SHOP_ADDR1 +' ' +item.SHOP_ADDR2;
  locSpan.appendChild(locHeader);
  locSpan.appendChild(locContent);
  // 샵번호
  const phoneSpan = document.createElement('span');
  phoneSpan.classList.add('reservation-time');
  const phoneHeader = document.createElement('h4');
  phoneHeader.textContent = '전화번호';
  const phoneContent = document.createElement('span');
  phoneContent.textContent = item.SHOP_TEL;
  phoneSpan.appendChild(phoneHeader);
  phoneSpan.appendChild(phoneContent);
  
  // 생성한 요소들을 store에 추가
  newStore.appendChild(stateSpan);
  newStore.appendChild(storeSpan);
  newStore.appendChild(timeSpan);
  newStore.appendChild(hourSpan);
  newStore.appendChild(locSpan);
  newStore.appendChild(phoneSpan);
  
  // 부모 요소에 추가
  reservationList.appendChild(newStore);
});
    },
    // 예외
    error: function (xhr, status, error) {
      console.log("Error: ", error); // 에러 로그 출력
      console.log("33333333");
    }
  });

  
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

        const editButton = document.getElementById('editButton');
        const editLayout = document.getElementById('editLayout');

        let isVisible = false;

        editButton.addEventListener('click', () => {
            isVisible = !isVisible;

            if (isVisible) {
                editLayout.style.display = 'block';
                setTimeout(() => {
                    editLayout.style.opacity = '1'; // 나타날 때 부드럽게 나타나도록 함
                }, 100); 
            } else {
                editLayout.style.opacity = '0'; // 사라질 때 투명도를 0으로 설정하여 사라지도록 함
                setTimeout(() => {
                    editLayout.style.display = 'none';
                }, 500); // opacity transition 시간과 동일한 시간 이후에 display 속성을 변경하여 부드러운 효과를 줌
            }
        });
        
        // 비밀번호확인 일치/불일치
        document.addEventListener("DOMContentLoaded", function() {
            const passwordInput = document.getElementById("password");
            const passwordCheckInput = document.getElementById("password_check");
            const passwordCheckMessage = document.querySelector("#passwordCk ul");
            const submitButton = document.querySelector('button[type="submit"]');
            
         // 비밀번호 확인 시 비교하여 메시지 표시
            function validatePassword() {
                const password = passwordInput.value;
                const passwordCheck = passwordCheckInput.value;

                if (password === "" && passwordCheck === "") {
                    passwordCheckMessage.textContent = ""; // 둘 다 비어있을 때는 메시지 삭제
                    submitButton.disabled = true; // 둘 다 비어있으면 버튼 비활성화
                } else if (password === passwordCheck) {
                    passwordCheckMessage.textContent = "비밀번호가 일치합니다.";
                    passwordCheckMessage.style.color = "blue";
                    submitButton.disabled = false; // 비밀번호가 일치하면 버튼 활성화
                } else {
                    passwordCheckMessage.textContent = "비밀번호가 일치하지 않습니다.";
                    passwordCheckMessage.style.color = "red";
                    submitButton.disabled = true; // 비밀번호가 일치하지 않으면 버튼 비활성화
                }
            }
            // 비밀번호 확인 input에서 keyup 이벤트와 blur 이벤트 모두 처리
            passwordCheckInput.addEventListener("keyup", validatePassword);
            passwordCheckInput.addEventListener("blur", validatePassword);

            // 페이지 로드 시 초기 버튼 상태 설정
            validatePassword();
          });
        
        </script>

</body>

</html>