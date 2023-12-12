<%@page import="com.smhrd.model.ShopVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Shop</title>
<link rel="stylesheet" href="assets/css/shop.css" />
<link rel="stylesheet" as="style" crossorigin
   href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
#pagination {
   margin: auto;
}

#pagination button {
   background-color: white;
   border-radius: 5px;
   border-color: white;
   width: 50px;
   height: 30px;
}

#sort{
   background-color: white;
   border-radius: 5px;
   border-color: white;

}

</style>
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

            <!--검색창 -->
            <form id="searchForm">
               <div class="search">
                  <input type="text" id="searchInput" name="query" value="">
                  <button type="button" onclick="searchShop()">
                     <img
                        src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
                  </button>
               </div>
            </form>

         </div>

         <div id="bottom">
            <div class="subTop">
               <div id="sortRange">
                  <label for="sort">정렬: </label> <select id="sort" name="sort"
                     onchange="sortShopList()">
                     <option>선택하세요</option>
                     <option value="score">평점순</option>
                  </select>
               </div>
            </div>

            <div class="shops">
               <ol id="shop">

                  <c:forEach var="shop" items="${shopList}">

                     <li onclick="navigateToPage(event)" id="${shop.getMemId() }">
                        <div class="left">
                           <img
                              src="data:image/png;base64,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">
                        </div>
                        <div class="right">
                           <div class="shopName">
                              <span> ${shop.getShopName()} </span>
                           </div>
                           <div class="location">
                              <i class="fa fa-location-arrow"></i> <span>${shop.getShop_addr1() }</span>
                           </div>
                           <div class="shopNumber">
                              <i class="fa fa-phone"></i> <span>${shop.getShopTel() }</span>
                           </div>
                           <div class="openingtime">
                              <i class=" fa fa-clock-o"></i>
                              <div>
                                 <!---->
                                 <span>영업중</span>

                              </div>
                              <div>
                                 <span>${shop.getOpenTime()}:00 ~</span>
                              </div>
                              <div>
                                 <span>${shop.getCloseTime()}:00</span>
                              </div>
                           </div>
                        </div>
                     </li>
                  </c:forEach>

               </ol>
            </div>

            <script>
            function searchShop() {
                const input = document.getElementById('searchInput').value.toLowerCase();
                const shops = document.getElementById('shop').getElementsByTagName('li');
                const pagination = document.getElementById('pagination');

                pagination.style.display = 'block';
                for (let i = 0; i < shops.length; i++) {
                    const shopName = shops[i].getElementsByClassName('shopName')[0].innerText.toLowerCase();

                    if (shopName.includes(input)) {
                        shops[i].style.display = 'block';
                    } else {
                        shops[i].style.display = 'none';
                    }
                }

                pagination.style.display = 'none';
            }

    
</script>

            <div id="pagination">
               <button onclick="firstPage()"><<</button>
               <button onclick="prevPage()"><</button>

               <c:forEach var="page" begin="1" end="${totalPages}">
                  <button onclick="gotoPage(${page})">${page}</button>
               </c:forEach>

               <button onclick="nextPage()">></button>
               <button onclick="lastPage()">>></button>
               <span id="currentPage">1</span>
            </div>

            <script>
             const shops = document.getElementById('shop');
             const currentPageElement = document.getElementById('currentPage');
             let currentPage = 1;
             const itemsPerPage = 5;  
             const totalPages = Math.ceil(shops.children.length / itemsPerPage);
             
             function updatePageButtons() {
                 const pagination = document.getElementById('pagination');
                 pagination.innerHTML = '';                 
                 
                 const prevButton = document.createElement('button');
                 prevButton.textContent = '<';
                 prevButton.onclick = function () {
                    prevSetOfPages();
                 };
                 pagination.appendChild(prevButton);

                 const startPage = (Math.ceil(currentPage / 5) - 1) * 5 + 1;
                 const endPage = Math.min(totalPages, startPage + 4);

                 for (let page = startPage; page <= endPage; page++) {
                     const button = document.createElement('button');
                     button.textContent = page;
                     button.onclick = function () {
                         gotoPage(page);
                     };

                     if (page === currentPage) {
                         button.classList.add('active');
                     }

                     pagination.appendChild(button);                 
                 }
             
             const nextButton = document.createElement('button');
              nextButton.textContent = '>';
              nextButton.onclick = function () {
                 nextSetOfPages();
              };
              pagination.appendChild(nextButton);
              }
             
             function showPage(page) {
                 const start = (page) * itemsPerPage;
                 const end = start + itemsPerPage;

                 for (let i = 0; i < shops.children.length; i++) {
                     shops.children[i].style.display = 'none';
                 }
         
                 for (let i = start; i < end; i++) {
                     if (shops.children[i]) {
                         shops.children[i].style.display = 'block';
                     }
                 }
         
                 currentPageElement.textContent = page;
                 updatePageButtons();
             }
         
             function prevSetOfPages() {
                 const startPage = Math.max(1, (Math.ceil(currentPage / 5) - 2) * 5 + 1);
                 const endPage = startPage + 4;
                 currentPage = startPage;
                 showPage(currentPage);
             }

             function nextSetOfPages() {
                 const startPage = (Math.ceil(currentPage / 5) * 5) + 1;
                 const endPage = Math.min(totalPages, startPage + 4);
                 currentPage = startPage;
                 showPage(currentPage);
             }
             
             function gotoPage(selectedPage) {
                 currentPage = parseInt(selectedPage);
                 showPage(currentPage);
             }
             
             function firstPage() {
                 currentPage = 1;
                 showPage(currentPage);
             }

             function lastPage() {
                 currentPage = totalPages;
                 showPage(currentPage);
             }
             
             showPage(currentPage);
         </script>

            <script>
            function navigateToPage(event) {
               const mem_id = event.currentTarget.id;
               
               console.log(mem_id);
               
                window.location.href = 'ShopPage.do?mem_id=' + mem_id;
             }
         
         
            const scrollTopButton = document.getElementById('scrollTopButton');

            function toggleScrollButton() {
               if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                  scrollTopButton.style.display = 'block';
               } else {
                  scrollTopButton.style.display = 'none';
               }
            }
            window.addEventListener('scroll', toggleScrollButton);

            scrollTopButton.addEventListener('click', () => {
               window.scrollTo({ top: 0, behavior: 'smooth' }); // 맨 위로 부드럽게 스크롤
            });

            
         </script>
</body>

</html>