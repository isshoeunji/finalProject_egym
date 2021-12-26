<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>


<!-- Header -->
<header id="js-header" class="u-header u-header--static u-shadow-v19">
       <div class="u-header__section u-header__section--light g-bg-white g-transition-0_3 g-py-10">
         <nav class="js-mega-menu navbar navbar-expand-lg">
           <div class="container">
             <!-- Responsive Toggle Button -->
             <button class="navbar-toggler navbar-toggler-right btn g-line-height-1 g-brd-none g-pa-0 g-pos-abs g-top-3 g-right-0" type="button"
                     aria-label="Toggle navigation"
                     aria-expanded="false"
                     aria-controls="navBar"
                     data-toggle="collapse"
                     data-target="#navBar">
               <span class="hamburger hamburger--slider g-pr-0">
                 <span class="hamburger-box">
                   <span class="hamburger-inner"></span>
                 </span>
               </span>
             </button>
             <!-- End Responsive Toggle Button -->

             <!-- Logo -->
             <a class="navbar-brand" href="${pageContext.request.contextPath}/shop">
               <img src="${pageContext.request.contextPath}/e-commerce/assets/img/logo/logo-shop.png" alt="Image Description">
             </a>
             <!-- End Logo -->
             
             <!-- Navigation -->
             <div id="navBar" class="collapse navbar-collapse align-items-center flex-sm-row g-pt-15 g-pt-0--lg">
               <ul class="navbar-nav ml-auto">
                 <!-- Home - Submenu -->
                 <li class="nav-item g-mx-10--lg g-mx-15--xl">
                   <a class="nav-link text-uppercase g-color-primary g-px-15 g-py-20" href="${pageContext.request.contextPath}/main"><b>EGYM 바로가기</b></a>
                 </li>
                 
                 <!-- Categories - Mega Menu -->
                 <li class="nav-item g-mx-10--lg g-mx-15--xl"
                     data-animation-in="fadeIn"
                     data-animation-out="fadeOut"
                     data-position="right">
                   <a id="mega-menu-label-3" class="nav-link text-uppercase g-color-primary--hover g-px-5 g-py-20" href="${pageContext.request.contextPath}/shop/select/1" aria-haspopup="true" aria-expanded="false">
                     <b>닭가슴살</b>
                   </a>

                   <!-- Mega Menu -->
                   
                   <!-- End Mega Menu -->
                 </li>
                 

                                 
                 
                 <!-- End Categories - Mega Menu -->

                 <!-- Watch - Mega Menu -->
                 <li class="nav-item g-mx-10--lg g-mx-15--xl"
                     data-animation-in="fadeIn"
                     data-animation-out="fadeOut"
                     data-position="right">
                   <a id="mega-menu-label-3" class="nav-link text-uppercase g-color-primary--hover g-px-5 g-py-20" href="${pageContext.request.contextPath}/shop/select/2" aria-haspopup="true" aria-expanded="false">
                     <b>샐러드</b>
                   </a>

                   <!-- Mega Menu -->
                   
                   <!-- End Mega Menu -->
                 </li>
                 <!-- End Watch - Mega Menu -->

                 <!-- Mega Menu Item -->
                 <li class="nav-item g-mx-10--lg g-mx-15--xl"
                     data-animation-in="fadeIn"
                     data-animation-out="fadeOut"
                     data-position="right">
                   <a id="mega-menu-label-3" class="nav-link text-uppercase g-color-primary--hover g-px-5 g-py-20" href="${pageContext.request.contextPath}/shop/select/3" aria-haspopup="true" aria-expanded="false">
                     <b>프로틴</b>
                   </a>

                   <!-- Mega Menu -->
                   
                   <!-- End Mega Menu -->
                 </li>
                 <!-- End Mega Menu Item -->

                 <!-- New Arrivals - Mega Menu -->
                 <!-- <li class="hs-has-mega-menu nav-item g-ml-10--lg g-ml-15--xl"
                     data-animation-in="fadeIn"
                     data-animation-out="fadeOut"
                     data-position="right">
                   <a id="mega-menu-label-5" class="nav-link text-uppercase g-color-primary--hover g-px-5 g-py-20" href="#" aria-haspopup="true" aria-expanded="false">
                     <b>헬스용품</b>
                     <i class="hs-icon hs-icon-arrow-bottom g-font-size-11 g-ml-7"></i>
                   </a>

                   Mega Menu
                   <div class="w-100 hs-mega-menu u-shadow-v11 g-text-transform-none g-brd-top g-brd-primary g-brd-top-2 g-bg-white g-pa-30 g-mt-17" aria-labelledby="mega-menu-label-5">
                     <div class="row">
                       <div class="col-md-4 g-mb-30 g-mb-0--md">
                         Article
                         <article class="g-bg-size-cover g-bg-pos-center g-bg-cover g-bg-bluegray-opacity-0_3--after text-center g-px-40 g-py-80" data-bg-img-src="assets/img-temp/600x400/img1.jpg">
                           <div class="g-pos-rel g-z-index-1">
                             <span class="d-block g-color-white g-font-weight-400 text-uppercase mb-3">Blouse</span>
                             <span class="d-block h2 g-color-white mb-4">Lafayette</span>
                             <a class="btn u-btn-white g-brd-primary--hover g-color-white--hover g-bg-primary--hover g-font-size-11 text-uppercase g-py-10 g-px-20" href="#">Shop Now</a>
                           </div>
                         </article>
                         End Article
                       </div>

                       <div class="col-md-4 g-mb-30 g-mb-0--md">
                         Article
                         <article class="g-bg-size-cover g-bg-pos-center g-bg-cover g-bg-bluegray-opacity-0_3--after text-center g-px-40 g-py-80" data-bg-img-src="assets/img-temp/600x400/img2.jpg">
                           <div class="g-pos-rel g-z-index-1">
                             <span class="d-block g-color-white g-font-weight-400 text-uppercase mb-3">Hamburg Hats</span>
                             <span class="d-block h2 g-color-white mb-4">Beaver</span>
                             <a class="btn u-btn-white g-brd-primary--hover g-color-white--hover g-bg-primary--hover g-font-size-11 text-uppercase g-py-10 g-px-20" href="#">Shop Now</a>
                           </div>
                         </article>
                         End Article
                       </div>

                       <div class="col-md-4 g-mb-30 g-mb-0--md">
                         Article
                         <article class="g-bg-size-cover g-bg-pos-center g-bg-cover g-bg-bluegray-opacity-0_3--after text-center g-px-40 g-py-80" data-bg-img-src="assets/img-temp/600x400/img3.jpg">
                           <div class="g-pos-rel g-z-index-1">
                             <span class="d-block g-color-white g-font-weight-400 text-uppercase mb-3">Glasses</span>
                             <span class="d-block h2 g-color-white mb-4">RayBan</span>
                             <a class="btn u-btn-white g-brd-primary--hover g-color-white--hover g-bg-primary--hover g-font-size-11 text-uppercase g-py-10 g-px-20" href="#">Shop Now</a>
                           </div>
                         </article>
                         End Article
                       </div>
                     </div>
                   </div>
                   End Mega Menu
                 </li> -->
                 <!-- End New Arrivals - Mega Menu -->
                 
                   <!-- Pages - Submenu -->
                   
               
               
                <li class="nav-item hs-has-sub-menu g-mx-10--lg g-mx-15--xl">
                 <sec:authorize access="hasRole('MEMBER')">
                   <a id="nav-link--pages" class="nav-link text-uppercase g-color-primary--hover g-px-5 g-py-20"
                      aria-haspopup="true"
                      aria-expanded="false"
                      aria-controls="nav-submenu--pages"
                      href="${pageContext.request.contextPath}/shop/user/myPage">
                     <b>마이페이지</b>
                   </a>
                 </sec:authorize>
               
               
                   <!-- Submenu -->
                   <ul class="hs-sub-menu list-unstyled u-shadow-v11 g-min-width-220 g-brd-top g-brd-primary g-brd-top-2 g-mt-17" id="nav-submenu--pages"
                       aria-labelledby="nav-link--pages">
                     <!-- Grid Filter -->
                     
                     <!-- Account -->
					 <li class="dropdown-item">
                       <a class="nav-link g-color-gray-dark-v4" href="${pageContext.request.contextPath}/shop/user/myPage">내정보</a>
                     </li>
                     
                     <li class="dropdown-item">
                       <a class="nav-link g-color-gray-dark-v4" href="${pageContext.request.contextPath}/shop/user/orderList">주문내역</a>
                     </li>
                     <li class="dropdown-item">
                       <a class="nav-link g-color-gray-dark-v4" href="${pageContext.request.contextPath}/shop/user/cancleList">환불내역</a>
                     </li>
                     <li class="dropdown-item">
                       <a class="nav-link g-color-gray-dark-v4" href="${pageContext.request.contextPath}/shop/selectCart">장바구니</a>
                     </li>
                     <li class="dropdown-item">
                       <a class="nav-link g-color-gray-dark-v4" href="${pageContext.request.contextPath}/shop/login/myAddress">배송지 관리
                       </a>
                     </li>  
                   </ul>
                   <!-- End Submenu -->
                 </li>
                 
                <sec:authorize access="hasRole('ADMIN')">   
                 <li class="nav-item g-mx-10--lg g-mx-15--xl"
                     data-animation-in="fadeIn"
                     data-animation-out="fadeOut"
                     data-position="right">
                   <a id="mega-menu-label-3" class="nav-link text-uppercase g-color-primary--hover g-px-5 g-py-20" aria-haspopup="true" aria-expanded="false">
                     <b> | </b>
                   </a>

                   <!-- Mega Menu -->
                   
                   <!-- End Mega Menu -->
                 </li> 
                                
                 <li class="nav-item g-mx-10--lg g-mx-15--xl"
                     data-animation-in="fadeIn"
                     data-animation-out="fadeOut"
                     data-position="right">
                   <a id="mega-menu-label-3" class="nav-link text-uppercase g-color-primary--hover g-px-5 g-py-20" href="${pageContext.request.contextPath}/shop/admin/write" aria-haspopup="true" aria-expanded="false">
                     <b>상품등록</b>
                   </a>

                   <!-- Mega Menu -->
                   
                   <!-- End Mega Menu -->
                 </li> 
                 
                 <li class="nav-item g-mx-10--lg g-mx-15--xl"
                     data-animation-in="fadeIn"
                     data-animation-out="fadeOut"
                     data-position="right">
                   <a id="mega-menu-label-3" class="nav-link text-uppercase g-color-primary--hover g-px-5 g-py-20" href="${pageContext.request.contextPath}/shop/admin/orderList/user" aria-haspopup="true" aria-expanded="false">
                     <b>회원주문내역</b>
                   </a>

                   <!-- Mega Menu -->
                   
                   <!-- End Mega Menu -->
                 </li> 
                 
                 
                 <li class="nav-item g-mx-10--lg g-mx-15--xl"
                     data-animation-in="fadeIn"
                     data-animation-out="fadeOut"
                     data-position="right">
                   <a id="mega-menu-label-3" class="nav-link text-uppercase g-color-primary--hover g-px-5 g-py-20" href="${pageContext.request.contextPath}/shop/admin/orderList/nonuser" aria-haspopup="true" aria-expanded="false">
                     <b>비회원주문내역</b>
                   </a>

                   <!-- Mega Menu -->
                   
                   <!-- End Mega Menu -->
                 </li>
                 
                 <li class="nav-item g-mx-10--lg g-mx-15--xl"
                     data-animation-in="fadeIn"
                     data-animation-out="fadeOut"
                     data-position="right">
                   <a id="mega-menu-label-3" class="nav-link text-uppercase g-color-primary--hover g-px-5 g-py-20" href="${pageContext.request.contextPath}/shop/admin/refundList/user" aria-haspopup="true" aria-expanded="false">
                     <b>환불내역</b>
                   </a>

                   <!-- Mega Menu -->
                   
                   <!-- End Mega Menu -->
                 </li> 
                 
                 
               </sec:authorize>
                 <!-- End Pages - Submenu -->
                 
			    <sec:authorize access="isAnonymous()">
                 <li class="nav-item g-ml-10--lg">
                   <a class="nav-link text-uppercase g-color-primary--hover g-pl-25 g-pr-0 g-py-20" href="${pageContext.request.contextPath}/shop/login">로그인</a>
                 </li>
                 
                 <li class="nav-item g-ml-10--lg">
                   <a class="nav-link text-uppercase g-color-primary--hover g-pl-25 g-pr-0 g-py-20" href="${pageContext.request.contextPath}/shop/orderInfo">비회원 주문조회</a>
                 </li>
                </sec:authorize>
                
                <sec:authorize access="hasAnyRole('MEMBER', 'ADMIN')">
                 <li class="nav-item g-ml-10--lg">
                   <a class="nav-link text-uppercase g-color-primary--hover g-pl-25 g-pr-0 g-py-20" href="${pageContext.request.contextPath}/shop/logout">로그아웃</a>
                 </li>
                
                </sec:authorize>
                
                <sec:authorize access="!hasRole('ADMIN')">
                 <!-- 장바구니 : 회원/비회원 모두 사용 가능 -->  
                  <li class="nav-item g-ml-10--lg">       
                 <div class="u-basket d-inline-block g-z-index-3">
                  <div class="g-py-10 g-px-6">
                    <!-- CartController로 이동 -->
                    <a href="${pageContext.request.contextPath}/shop/selectCart" id="basket-bar-invoker" class="u-icon-v1 g-color-primary--hover g-font-size-17 g-text-underline--none--hover" aria-controls="basket-bar" aria-haspopup="true" aria-expanded="false" data-dropdown-event="hover" data-dropdown-target="#basket-bar" data-dropdown-type="css-animation" data-dropdown-duration="300" data-dropdown-hide-on-scroll="false" data-dropdown-animation-in="fadeIn" data-dropdown-animation-out="fadeOut">
                      <i class="icon-hotel-restaurant-105 u-line-icon-pro"></i>
                    </a>
                  </div>
				
                  <%-- <div id="basket-bar" class="u-basket__bar u-dropdown--css-animation g-text-transform-none g-bg-white g-brd-around g-brd-gray-light-v4 u-dropdown--hidden" aria-labelledby="basket-bar-invoker" style="animation-duration: 300ms;">
                    <div class="g-brd-bottom g-brd-gray-light-v4 g-pa-15 g-mb-10">
                      <span class="d-block h6 text-center text-uppercase mb-0">장바구니</span>
                    </div>
                    <div class="js-scrollbar g-height-200 mCustomScrollbar _mCS_1 mCS-autoHide" style="position: relative; overflow: visible;"><div id="mCSB_1" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr">
                      <!-- Product 장바구니에 담긴 상품 정보 필요 : 썸네일, 상품이름, 상품번호, 가격, 수량, 전체금액 -->
                      <!-- 장바구니 상품 반복문 시작 -->
                    <c:choose>
                    
                     <!-- 장바구니에 담은 상품이 없으면 -->
				    <c:when test="${empty requestScope.cartList}">
				       <p align="center"><b><span style="font-size:9pt;">장바구니에 상품이 없습니다.</span></b></p>
				    </c:when>
				    
				     <!-- 장바구니에 상품이 존재하면  -->
				    <c:otherwise> 
                      <c:forEach items="${requestScope.cartList}" var="cart">
                      <div class="u-basket__product g-brd-none g-px-20">
                        <div class="row no-gutters g-pb-5">
                          <div class="col-4 pr-3">
                            <a class="u-basket__product-img" href="#"><!-- 상품에 해당하는 상세페이지로 이동 -->
                              <img class="img-fluid mCS_img_loaded" src="../assets/img-temp/150x150/img1.jpg" alt="Image Description">
                            </a>
                          </div>

                          <div class="col-8">
                            <h6 class="g-font-weight-400 g-font-size-default">
                            <!-- 상품상세보기로 이동 -->
                              <a class="g-color-black g-color-primary--hover g-text-underline--none--hover" href="#">${cartList.productName}</a>
                            </h6>
                            <small class="g-color-primary g-font-size-12">${cart.cartCount} x ${cart.price}${cart.price}</small>
                          </div>
                        </div>
                        <!-- 상품 장바구니에서 삭제 -->
                        <form action="${pageContext.request.contextPath}/shop/deleteCart" method="get">
                          <button type="button" class="u-basket__product-remove" value="${cart.productNo}">×</button>
                       <!--  </form> -->
                      </div>
                      <!-- End Product -->
                      </c:forEach>
                      </c:otherwise>
                      </c:choose>
                      
                      <!-- 장바구니 상품 반복문 끝 -->

                    </div></div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; display: block; height: 91px; max-height: 166px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 50px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div>

                    <div class="clearfix g-px-15">
                      <div class="row align-items-center text-center g-brd-y g-brd-gray-light-v4 g-font-size-default">
                        <div class="col g-brd-right g-brd-gray-light-v4">
                          <strong class="d-block g-py-10 text-uppercase g-color-main g-font-weight-500 g-py-10">Total</strong>
                        </div>
                        <div class="col">
                          <strong class="d-block g-py-10 g-color-main g-font-weight-500 g-py-10"><fmt:formatNumber>${cart.price} </fmt:formatNumber>원</strong>
                        </div>
                      </div>
                    </div>

                    <div class="g-pa-20">
                      <div class="text-center g-mb-15">
                        <a class="text-uppercase g-color-primary g-color-main--hover g-font-weight-400 g-font-size-13 g-text-underline--none--hover" href="${pageContext.request.contextPath}/shop/cart">
                          장바구니로 이동
                          <i class="ml-2 icon-finance-100 u-line-icon-pro"></i>
                        </a>
                      </div>
                      <a class="btn btn-block u-btn-black g-brd-primary--hover g-bg-primary--hover g-font-size-12 text-uppercase rounded g-py-10" href="page-checkout-1.html">바로 구매</a>
                    </div>
                  </div>
                   --%>
                  
                </div>
                 </li>
            </sec:authorize>
                 
                <!-- header의 장바구니 아이콘 끝 -->        
                
               </ul>
             </div>
             <!-- End Navigation -->
           </div>
         </nav>
       </div>
     </header>
     <!-- End Header -->
</body>
</html>