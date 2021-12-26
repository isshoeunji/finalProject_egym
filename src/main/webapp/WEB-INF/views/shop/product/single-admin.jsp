<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title -->
    <title>E-commerce Single Product Page 1 | Unify - Responsive Website Template</title>

    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">

    <!-- Google Fonts -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto Sans KR:300,400,500,700,900">

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-line/css/simple-line-icons.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-line-pro/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-hs/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/dzsparallaxer/dzsparallaxer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/dzsparallaxer/dzsscroller/scroller.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/dzsparallaxer/advancedscroller/plugin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hamburgers/hamburgers.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">

    <!-- CSS Unify Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e-commerce/assets/css/styles.e-commerce.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
 <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>    
 
  </head>

  <body>
    <main>
      <!-- Header -->
      
      <!-- End Header -->

      <!-- Breadcrumbs -->
      <section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
        <div class="container">
          <ul class="u-list-inline">
            <li class="list-inline-item g-mr-5">
              <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/shop/main">EGYM SHOP</a>
              <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
            </li>
            <li class="list-inline-item g-mr-5">
               <c:if test="${product.cateCode==1}">
              <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/shop/select/${product.cateCode}">닭가슴살</a>
            </c:if> 
            <c:if test="${product.cateCode==2}">
              <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/shop/select/${product.cateCode}">샐러드</a>
            </c:if>
            <c:if test="${product.cateCode==3}">
              <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/shop/select/${product.cateCode}">프로틴</a>
            </c:if>
              <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
            </li>
            <li class="list-inline-item g-color-primary">
              <span>${product.productName}</span>
            </li>
          </ul>
        </div>
      </section>
      <!-- End Breadcrumbs -->

      <!-- Product Description -->
      <div class="container g-py-50">
        <div class="row">
          <div class="col-lg-7">
            <!-- Carousel -->
            <div id="carouselCus1" class="js-carousel g-pt-10 g-mb-10"
                 data-infinite="true"
                 data-fade="true"
                 data-arrows-classes="u-arrow-v1 g-brd-around g-brd-white g-absolute-centered--y g-width-45 g-height-45 g-font-size-14 g-color-white g-color-primary--hover rounded-circle"
                 data-arrow-left-classes="fa fa-angle-left g-left-40"
                 data-arrow-right-classes="fa fa-angle-right g-right-40"
                 data-nav-for="#carouselCus2">
                 
              <c:forEach items="${product.productImageList}" var="image">
              
              <div class="js-slide g-bg-cover g-bg-black-opacity-0_1--after">
                <img class="img-fluid w-100" src="${pageContext.request.contextPath}/save/${image.productImageName}" alt="Image Description">
              </div>
              
              </c:forEach>
               
              
            </div>

            <div id="carouselCus2" class="js-carousel text-center u-carousel-v3 g-mx-minus-5"
                 data-infinite="true"
                 data-center-mode="true"
                 data-slides-show="3"
                 data-is-thumbs="true"
                 data-focus-on-select="false"
                 data-nav-for="#carouselCus1">
                 
             <c:forEach items="${product.productImageList}" var="image">
                 
              <div class="js-slide g-cursor-pointer g-px-5">
                <img class="img-fluid" src="${pageContext.request.contextPath}/save/${image.productImageName}" alt="Image Description">
              </div>

             </c:forEach>
              
              
            </div>
            <!-- End Carousel -->
          </div>

          <div class="col-lg-5">
            <div class="g-px-40--lg g-pt-70">
              <!-- Product Info -->
              <div class="g-mb-30">
                <h1 class="g-font-weight-300 mb-4">${product.productName}</h1>
              </div>
              <!-- End Product Info -->

              <!-- Price -->
              <div class="g-mb-30">
                <h2 class="g-color-gray-dark-v5 g-font-weight-400 g-font-size-12 text-uppercase mb-2">가격</h2>
                <span class="g-color-black g-font-weight-500 g-font-size-30 mr-2"><fmt:formatNumber value="${product.price}"/>원</span>
              </div>
              <!-- End Price -->

              <!-- Accordion -->
              <div id="accordion-01" role="tablist" aria-multiselectable="true">
                <div id="accordion-01-heading-01" class="g-brd-y g-brd-gray-light-v3 py-3" role="tab">
                  <h5 class="g-font-weight-400 g-font-size-default mb-0">
                    <a class="d-block g-color-gray-dark-v5 g-text-underline--none--hover" href="#accordion-01-body-01" data-toggle="collapse" data-parent="#accordion-01" aria-expanded="false" aria-controls="accordion-01-body-01">Details
                      <span class="float-right g-pos-rel g-top-3 mr-1 fa fa-angle-down"></span></a>
                  </h5>
                </div>
                <div id="accordion-01-body-01" class="collapse" role="tabpanel" aria-labelledby="accordion-01-heading-01">
                  <div class="g-py-10">
                    <p class="g-font-size-12 mb-2">SHELL: 100% POLYESTER</p>
                    <p class="g-font-size-12 mb-2">Always check the care label instructions.</p>
                    <p class="g-font-size-12 mb-2">Professional dry clean only. Remove all detachable parts before cleaning. Do not iron.</p>
                    <p class="g-font-size-12 mb-2">(Navy: Avoid contact with light coloured fabrics and upholstery especially whilst damp.)</p>
                  </div>
                </div>
              </div>
              <!-- End Accordion -->

              <!-- Colour -->
              <div class="d-flex justify-content-between align-items-center g-brd-bottom g-brd-gray-light-v3 py-3" role="tab">
                <h5 class="g-color-gray-dark-v5 g-font-weight-400 g-font-size-default mb-0">Colour</h5>

                <!-- Checkbox -->
                <label class="form-check-inline u-check mb-0 ml-auto g-mr-10">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio">
                  <span class="d-block u-check-icon-checkbox-v4 g-brd-transparent g-brd-gray-dark-v4--checked rounded-circle">
                    <i class="d-block g-absolute-centered g-width-12 g-height-12 g-bg-primary rounded-circle"></i>
                  </span>
                </label>
                <label class="form-check-inline u-check mb-0 g-mx-10">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio">
                  <span class="d-block u-check-icon-checkbox-v4 g-brd-transparent g-brd-gray-dark-v4--checked rounded-circle">
                    <i class="d-block g-absolute-centered g-width-12 g-height-12 g-bg-beige rounded-circle"></i>
                  </span>
                </label>
                <label class="form-check-inline u-check mb-0 g-mx-10">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio">
                  <span class="d-block u-check-icon-checkbox-v4 g-brd-transparent g-brd-gray-dark-v4--checked rounded-circle">
                    <i class="d-block g-absolute-centered g-width-12 g-height-12 g-bg-black rounded-circle"></i>
                  </span>
                </label>
                <label class="form-check-inline u-check mb-0 g-ml-10 mr-0">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio">
                  <span class="d-block u-check-icon-checkbox-v4 g-brd-transparent g-brd-gray-dark-v4--checked rounded-circle">
                    <i class="d-block g-absolute-centered g-width-12 g-height-12 g-bg-gray-dark-v4 rounded-circle"></i>
                  </span>
                </label>
                <!-- End Checkbox -->
              </div>
              <!-- End Colour -->

              <!-- Size -->
              <div class="d-flex justify-content-between align-items-center g-brd-bottom g-brd-gray-light-v3 py-3" role="tab">
                <h5 class="g-color-gray-dark-v5 g-font-weight-400 g-font-size-default mb-0">Size</h5>

                <!-- Checkbox -->
                <label class="form-check-inline u-check mb-0 ml-auto g-mr-15">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline2_1" type="radio">
                  <span class="d-block g-font-size-12 g-color-primary--checked">
                    S
                  </span>
                </label>
                <label class="form-check-inline u-check mb-0 g-mx-15">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline2_1" type="radio">
                  <span class="d-block g-font-size-12 g-color-primary--checked">
                    M
                  </span>
                </label>
                <label class="form-check-inline u-check mb-0 g-mx-15">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline2_1" type="radio">
                  <span class="d-block g-font-size-12 g-color-primary--checked">
                    L
                  </span>
                </label>
                <label class="form-check-inline u-check mb-0 g-mx-15">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline2_1" type="radio">
                  <span class="d-block g-font-size-12 g-color-primary--checked">
                    XL
                  </span>
                </label>
                <label class="form-check-inline u-check mb-0 g-ml-15">
                  <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline2_1" type="radio">
                  <span class="d-block g-font-size-12 g-color-primary--checked">
                    XXL
                  </span>
                </label>
                <!-- End Checkbox -->
              </div>
              <!-- End Size -->

              <!-- Quantity 여기랑-->
              <c:set var="productCount" value="1"/>
              <fmt:parseNumber value = "${productCount}" integerOnly = "true" var = "pcount"/>
              <div class="d-flex justify-content-between align-items-center g-brd-bottom g-brd-gray-light-v3 py-3 g-mb-30" role="tab">
                <h5 class="g-color-gray-dark-v5 g-font-weight-400 g-font-size-default mb-0">Quantity</h5>

				
                <div class="js-quantity input-group u-quantity-v1 g-width-80 g-brd-primary--focus">
                  <input name="pcount" class="js-result form-control text-center g-font-size-13 rounded-0" type="text" value="${pcount}" readonly>

                  <div class="input-group-addon d-flex align-items-center g-brd-gray-light-v2 g-width-30 g-bg-white g-font-size-13 rounded-0 g-pa-5">
                        
                        <i name="plusQuantity" class="js-plus g-color-gray g-color-primary--hover fa fa-angle-up"></i>
                    	<i name="minusQuantity" class="js-minus g-color-gray g-color-primary--hover fa fa-angle-down"></i>
                  </div>
                </div>
              </div>
              <!-- End Quantity -->

              <!-- Buttons 여기 하는 중.. -->
              <div class="row g-mx-minus-5 g-mb-20">
                <div class="col g-px-5 g-mb-10">
                 <form  name="requestForm" method="post" id="requestForm" action="${pageContext.request.contextPath}/shop/admin/updateForm"> 
	                 <input type=hidden name="productNo" value="${product.productNo}"><!--상품번호-->
					 <input type=hidden name="quantity" value=""><!-- quatity -->
                  <button type="submit" class="btn btn-block u-btn-primary g-font-size-12 text-uppercase g-py-15 g-px-25" type="button" name="updateProduct">
                    수정하기<i class="align-middle ml-2 icon-finance-100 u-line-icon-pro"></i>
                  </button>
                </form>
                </div>
                
                <div class="col g-px-5 g-mb-10">
                  <button class="btn btn-block u-btn-outline-black g-brd-gray-dark-v5 g-brd-black--hover g-color-gray-dark-v4 g-color-white--hover g-font-size-12 text-uppercase g-py-15 g-px-25" type="button">
                    삭제하기 <i class="align-middle ml-2 icon-medical-022 u-line-icon-pro"></i>
                  </button>
                </div>
              </div>
              <!-- End Buttons -->

              <!-- Nav Tabs -->
              <ul class="nav d-flex justify-content-between g-font-size-12 text-uppercase" role="tablist" data-target="nav-1-1-default-hor-left">
                <li class="nav-item g-brd-bottom g-brd-gray-dark-v4">
                  <a class="nav-link active g-color-primary--parent-active g-pa-0 g-pb-1" data-toggle="tab" href="#nav-1-1-default-hor-left--3" role="tab">Returns</a>
                </li>
                <li class="nav-item g-brd-bottom g-brd-gray-dark-v4">
                  <a class="nav-link g-color-primary--parent-active g-pa-0 g-pb-1" data-toggle="tab" href="#nav-1-1-default-hor-left--1" role="tab">View Size Guide</a>
                </li>
                <li class="nav-item g-brd-bottom g-brd-gray-dark-v4">
                  <a class="nav-link g-color-primary--parent-active g-pa-0 g-pb-1" data-toggle="tab" href="#nav-1-1-default-hor-left--2" role="tab">Delivery</a>
                </li>
              </ul>
              <!-- End Nav Tabs -->

              <!-- Tab Panes -->
              <div id="nav-1-1-default-hor-left" class="tab-content">
                <div class="tab-pane fade show active g-pt-30" id="nav-1-1-default-hor-left--3" role="tabpanel">
                  <p class="g-color-gray-dark-v4 g-font-size-13 mb-0">You can return/exchange your orders in Unify E-commerce. For more information, read our
                    <a href="#">FAQ</a>.</p>
                </div>

                <div class="tab-pane fade g-pt-30" id="nav-1-1-default-hor-left--1" role="tabpanel">
                  <h4 class="g-font-size-15 mb-3">General Clothing Size Guide</h4>

                  <!-- Size -->
                  <table>
                    <tbody>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-150 g-py-5">Unify Size (UK)</td>
                        <td class="align-top g-width-50 g-py-5">S</td>
                        <td class="align-top g-width-50 g-py-5">M</td>
                        <td class="align-top g-width-50 g-py-5">L</td>
                        <td class="align-top g-width-50 g-py-5">XL</td>
                        <td class="align-top g-width-50 g-py-5">XXL</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-150 g-py-5">UK</td>
                        <td class="align-top g-width-50 g-py-5">6</td>
                        <td class="align-top g-width-50 g-py-5">8</td>
                        <td class="align-top g-width-50 g-py-5">10</td>
                        <td class="align-top g-width-50 g-py-5">12</td>
                        <td class="align-top g-width-50 g-py-5">14</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-150 g-py-5">Europe</td>
                        <td class="align-top g-width-50 g-py-5">32</td>
                        <td class="align-top g-width-50 g-py-5">34</td>
                        <td class="align-top g-width-50 g-py-5">36</td>
                        <td class="align-top g-width-50 g-py-5">38</td>
                        <td class="align-top g-width-50 g-py-5">40</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-150 g-py-5">US</td>
                        <td class="align-top g-width-50 g-py-5">2</td>
                        <td class="align-top g-width-50 g-py-5">4</td>
                        <td class="align-top g-width-50 g-py-5">6</td>
                        <td class="align-top g-width-50 g-py-5">8</td>
                        <td class="align-top g-width-50 g-py-5">10</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-150 g-py-5">Australia</td>
                        <td class="align-top g-width-50 g-py-5">6</td>
                        <td class="align-top g-width-50 g-py-5">8</td>
                        <td class="align-top g-width-50 g-py-5">10</td>
                        <td class="align-top g-width-50 g-py-5">12</td>
                        <td class="align-top g-width-50 g-py-5">14</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-150 g-py-5">Japan</td>
                        <td class="align-top g-width-50 g-py-5">7</td>
                        <td class="align-top g-width-50 g-py-5">9</td>
                        <td class="align-top g-width-50 g-py-5">11</td>
                        <td class="align-top g-width-50 g-py-5">13</td>
                        <td class="align-top g-width-50 g-py-5">15</td>
                      </tr>
                    </tbody>
                  </table>
                  <!-- End Size -->
                </div>

                <div class="tab-pane fade g-pt-30" id="nav-1-1-default-hor-left--2" role="tabpanel">
                  <!-- Shipping Mehtod -->
                  <table>
                    <thead class="h6 g-brd-bottom g-brd-gray-light-v3 g-color-gray-dark-v3 g-font-size-13">
                      <tr>
                        <th class="g-width-100 g-font-weight-500 g-pa-0 g-pb-10">Destination</th>
                        <th class="g-width-140 g-font-weight-500 g-pa-0 g-pb-10">Delivery type</th>
                        <th class="g-width-150 g-font-weight-500 g-pa-0 g-pb-10">Delivery time</th>
                        <th class="g-font-weight-500 text-right g-pa-0 g-pb-10">Cost</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-py-10">UK</td>
                        <td class="align-top g-py-10">Standard delivery</td>
                        <td class="align-top g-font-size-11 g-py-10">2-3 Working days</td>
                        <td class="align-top text-right g-py-10">$5.5</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-py-10"></td>
                        <td class="align-top g-py-10">Next day</td>
                        <td class="align-top g-font-size-11 g-py-10">Order before 12pm monday - thursday and receive it the next day</td>
                        <td class="align-top text-right g-py-10">$9.5</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-py-10"></td>
                        <td class="align-top g-py-10">Saturday delivery</td>
                        <td class="align-top g-font-size-11 g-py-10">Saturday delivery for orders placed before 12pm on friday</td>
                        <td class="align-top text-right g-py-10">$12.00</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-py-10">Europe</td>
                        <td class="align-top g-py-10">Standard delivery</td>
                        <td class="align-top g-font-size-11 g-py-10">3-9 Working days</td>
                        <td class="align-top text-right g-py-10">$20.00</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-py-10">America</td>
                        <td class="align-top g-py-10">Standard delivery</td>
                        <td class="align-top g-font-size-11 g-py-10">3-9 Working days</td>
                        <td class="align-top text-right g-py-10">$25.00</td>
                      </tr>
                    </tbody>
                  </table>
                  <!-- End Shipping Mehtod -->
                </div>
              </div>
              <!-- End Tab Panes -->
            </div>
          </div>
        </div>
      </div>
      <!-- End Product Description -->

      <!-- Features -->
      <div class="g-brd-y g-brd-gray-light-v4">
        <div class="container g-py-30">
          <div class="row justify-content-center">
            <div class="col-md-4 mx-auto g-py-15">
              <div class="media g-px-50--lg">
                <i class="d-flex g-color-black g-font-size-30 g-pos-rel g-top-3 mr-4 icon-real-estate-048 u-line-icon-pro"></i>
                <div class="media-body">
                  <span class="d-block g-font-weight-400 g-font-size-default text-uppercase">Free Shipping</span>
                  <span class="d-block g-color-gray-dark-v4">In 2-3 Days</span>
                </div>
              </div>
            </div>

            <div class="col-md-4 mx-auto g-brd-x--md g-brd-gray-light-v3 g-py-15">
              <div class="media g-px-50--lg">
                <i class="d-flex g-color-black g-font-size-30 g-pos-rel g-top-3 mr-4 icon-real-estate-040 u-line-icon-pro"></i>
                <div class="media-body">
                  <span class="d-block g-font-weight-400 g-font-size-default text-uppercase">Free Returns</span>
                  <span class="d-block g-color-gray-dark-v4">No Questions Asked</span>
                </div>
              </div>
            </div>

            <div class="col-md-4 mx-auto g-py-15">
              <div class="media g-px-50--lg">
                <i class="d-flex g-color-black g-font-size-30 g-pos-rel g-top-3 mr-4 icon-hotel-restaurant-062 u-line-icon-pro"></i>
                <div class="media-body text-left">
                  <span class="d-block g-font-weight-400 g-font-size-default text-uppercase">Free 24</span>
                  <span class="d-block g-color-gray-dark-v4">Days Storage</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End Features -->

      <!-- Details -->
      <div id="details" class="container-fluid g-px-0 g-py-1">
        <div class="row no-gutters g-min-height-100vh justify-content-center">
          
         <!--   <div class="col-md-6 g-bg-size-cover g-min-height-300" data-bg-img-src="${pageContext.request.contextPath}/save/치즈뿌링클1.jpg"></div> -->
         <span><b><pre>${product.productContent}</pre></b></span></td>
         
         
        <img class="img-fluid w-60 g-py-50" src="${pageContext.request.contextPath}/save/defaultimg1.png" alt="Image Description">
        <img class="img-fluid w-60" src="${pageContext.request.contextPath}/save/defaultimg2.png" alt="Image Description">
        

        </div>
      </div>
      
      <!-- Review -->
      <div class="container">
        <div class="g-brd-y g-brd-gray-light-v4 g-py-100">
          <div class="row justify-content-center">
            <div class="col-lg-9">
              <h2 class="h4 mb-5">Review</h2>

              <!-- Review -->
              <div class="g-brd-bottom g-brd-gray-light-v4 g-pb-30 g-mb-50">
                <!-- Media -->
                <div class="media g-mb-30">
                  <div class="media-body">
                    <div class="d-flex align-items-start g-mb-15 g-mb-10--sm">
                      <div class="d-block">
                        <h5 class="h6">James Coolman</h5>

                        <!-- Rating -->
                        <ul class="js-rating u-rating-v1 g-font-size-13 g-color-gray-light-v3 mb-0" data-hover-classes="g-color-primary">
                          <li class="g-color-primary g-line-height-1_4">
                            <i class="fa fa-star"></i>
                          </li>
                          <li class="g-color-primary g-line-height-1_4">
                            <i class="fa fa-star"></i>
                          </li>
                          <li class="g-color-primary g-line-height-1_4">
                            <i class="fa fa-star"></i>
                          </li>
                          <li class="g-color-primary g-line-height-1_4">
                            <i class="fa fa-star"></i>
                          </li>
                          <li class="g-color-primary g-line-height-1_4">
                            <i class="fa fa-star"></i>
                          </li>
                        </ul>
                        <!-- End Rating -->

                        <span class="d-block g-color-gray-dark-v5 g-font-size-11">June 7, 2017</span>
                      </div>
                      <div class="ml-auto">
                        <a class="u-link-v5 g-color-black g-color-primary--hover g-font-size-12 text-uppercase" href="#">Reply</a>
                      </div>
                    </div>

                    <p>The time has come to bring those ideas and plans to life. This is where we really begin to visualize your napkin sketches and make them into beautiful pixels. Whether through commerce or just an experience to tell your brand's story, the time has come to start using development languages that fit your projects needs.</p>

                    <ul class="list-inline my-0">
                      <li class="list-inline-item g-mr-20">
                        <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
                          <i class="icon-medical-022 u-line-icon-pro g-pos-rel g-top-1 g-mr-3"></i> 5
                        </a>
                      </li>
                      <li class="list-inline-item g-mr-20">
                        <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
                          <i class="icon-finance-206 u-line-icon-pro g-pos-rel g-top-1 g-mr-3"></i> 1
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <!-- End Review -->

              
              <!-- End Comment Form -->


              
            </div>
          </div>
        </div>
      </div>
      <!-- End Review -->
      
      <!-- End Details -->

      <!-- Craftmanship -->
      <!-- <div class="container-fluid g-px-0">
        <div class="row no-gutters g-min-height-100vh">
          <div class="col-md-6 order-md-2 align-self-center">
            <div class="g-width-60x mx-auto g-px-50--lg g-py-100">
              <span class="d-block g-font-size-12 text-uppercase mb-5">The Craftmanship</span>
              <h2 class="mb-4">Reimagined Blue Color through New Materials</h2>
              <p>We believe in redefining classic silhouettes into modern pieces that function for busy people with busy lives. We want to create clothing that people will love and treasure for years to come – to become that trusty go-to you can't live without.</p>
            </div>
          </div>

          <div class="col-md-6 order-md-1 g-bg-size-cover g-min-height-300" data-bg-img-src="assets/img-temp/900x900/img2.jpg"></div>
        </div>
      </div> -->
      <!-- End Craftmanship -->

      <!-- Caring -->
      <!-- <div class="container-fluid g-px-0">
        <div class="row no-gutters g-min-height-100vh">
          <div class="col-md-6 align-self-center">
            <div class="g-width-60x mx-auto g-px-50--lg g-py-100">
              <span class="d-block g-font-size-12 text-uppercase mb-5">The Care Guide</span>
              <h2 class="mb-4">Get the Best out of Unify</h2>
              <p>Crafted from a water resistant fluid memory fabric to create an elegant draped effect when thrown on, this lightweight shell will take you from season to season and protect you from that unexpected shower.</p>
            </div>
          </div>

          <div class="col-md-6 g-bg-size-cover g-min-height-300" data-bg-img-src="assets/img-temp/900x900/img3.jpg"></div>
        </div>
      </div> -->
      <!-- End Caring -->

      <!-- Products -->
      
      <!-- End Products -->

      <!-- News -->
      <div class="container g-pt-100 g-pb-70">
        

        
      </div>
      <!-- End News -->

      <!-- Footer -->
      
      <!-- End Footer -->

      <a class="js-go-to u-go-to-v2" href="#"
         data-type="fixed"
         data-position='{
           "bottom": 15,
           "right": 15
         }'
         data-offset-top="400"
         data-compensation="#js-header"
         data-show-effect="zoomIn">
        <i class="hs-icon hs-icon-arrow-top"></i>
      </a>
    </main>

    <div class="u-outer-spaces-helper"></div>

    <!-- JS Global Compulsory -->
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery-migrate/jquery-migrate.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/popper.js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/bootstrap.min.js"></script>

    <!-- JS Implementing Plugins -->
    <script src="${pageContext.request.contextPath}/assets/vendor/slick-carousel/slick/slick.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- JS Unify -->
    <script src="${pageContext.request.contextPath}/assets/js/hs.core.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.header.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.countdown.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.carousel.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.tabs.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.count-qty.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.go-to.js"></script>

    <!-- JS Customization -->
    <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

    <!-- JS Plugins Init. -->
    <script>
      $(document).on('ready', function () {
        // initialization of carousel
        $.HSCore.components.HSCarousel.init('.js-carousel');

        // initialization of header
        $.HSCore.components.HSHeader.init($('#js-header'));
        $.HSCore.helpers.HSHamburgers.init('.hamburger');

        // initialization of HSMegaMenu plugin
        $('.js-mega-menu').HSMegaMenu({
          event: 'hover',
          pageContainer: $('.container'),
          breakpoint: 991
        });

        // initialization of HSDropdown component
        $.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
          afterOpen: function () {
            $(this).find('input[type="search"]').focus();
          }
        });

        // initialization of go to
        $.HSCore.components.HSGoTo.init('.js-go-to');

        // initialization of HSScrollBar component
        $.HSCore.components.HSScrollBar.init($('.js-scrollbar'));

        // initialization of quantity counter
        $.HSCore.components.HSCountQty.init('.js-quantity');

        // initialization of tabs
        $.HSCore.components.HSTabs.init('[role="tablist"]');
      });

      $(window).on('resize', function () {
        setTimeout(function () {
          $.HSCore.components.HSTabs.init('[role="tablist"]');
        }, 200);
      });
    </script>
  </body>
</html>