<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>shopReg</title>
    <link rel="stylesheet" href="assets/css/shopReg.css" />
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
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
            <a href="login.html">
                <i class="fa fa-user" aria-hidden="true"></i>
            </a>
        </div>
        <hr style="width: 95%;">


        <div class="reservation-confirm">
            <div class="container">
                <span>가게 등록</span>
                <form action="ShopReg.do" method="post">
                    <div class="container_unit">
                        <div class="form-group">
                            <label for="name">가게 이름</label>
                            <input type="text" id="name" name="shop_name" placeholder="가게이름">
                        </div>
                        <hr style="width: 90%;">
                        <div class="form-group">
                            <label for="phone">가게 <br>전화번호</label>
                            <input type="tel" id="phone" name="shop_tel" placeholder="가게 전화번호">
                        </div>
                    </div>
                    <div class="container_unit">
                        <div class="form-group">
                            <label for="address">가게 주소</label>
                            <input type="text" id="address" name="shop_addr1" placeholder="가게 주소">
                        </div>
                        <hr style="width: 90%;">
                        <div class="form-group">
                            <label for="address_detail">상세 주소</label>
                            <input type="text" id="address_detail" name="shop_addr2" placeholder="가게 상세주소">
                        </div>
                    </div>
                    <div class="container_unit">
                        <div class="form-group">
                            <label for="latitude">위도</label>
                            <input type="text" id="latitude" name="lat" placeholder="가게 위도">
                        </div>
                        <hr style="width: 90%;">
                        <div class="form-group">
                            <label for="longitude">경도</label>
                            <input type="text" id="longitude" name="lng" placeholder="가게 경도">
                        </div>
                    </div>
                    <div class="container_unit">
                        <div class="form-group" id="time-start">
                            <label for="start">오픈 시간</label>
                            <input type="time" value="10:00" id="start" name="open_time">
                        </div>
                        <hr style="width: 90%;">
                        <div class="form-group" id="time-end">
                            <label for="end">종료 시간</label>
                            <input type="time" value="17:00" id="end" name="close_time">
                        </div>
                    </div>
                    <button type="submit" class="modify-button" name="submit">등록하기</button>
                </form>

                <button id="scrollTopButton">위로</button>
            </div>
        </div>

        <button id="scrollTopButton">위로</button>
    </div>
    </div>

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

</body>