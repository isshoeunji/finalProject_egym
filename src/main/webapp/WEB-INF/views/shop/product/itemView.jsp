<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title -->
    <title>E-commerce Grid Filter No Sidebar Page 1 | Unify - Responsive Website Template</title>

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
    <script type="text/javascript">
    $(function(){
    	$("#addAlert").click(function(){
    		alert("장바구니에 상품을 확인하러 가시겠어요?");
    	});
    	
    });
    
    </script>
    
    
    
  </head>

  <body>
    <main>
      <!-- Header -->
      
      <!-- End Header -->

      <!-- Promo Block -->
      <section class="dzsparallaxer auto-init height-is-based-on-content use-loading mode-scroll loaded dzsprx-readyall" data-options='{direction: "fromtop", animation_duration: 25, direction: "reverse"}'>
        <div class="divimage dzsparallaxer--target w-100 g-bg-pos-top-center g-bg-cover g-bg-black-opacity-0_1--after" style="height: 140%; background-image: url(assets/img-temp/1920x1080/img3.jpg);"></div>

        <div class="container g-color-white g-pt-100 g-pb-40">
          <div class="g-mb-50">
            <span class="d-block g-color-white-opacity-0_8 g-font-weight-300 g-font-size-20">건강하고 맛있는</span>
            <h3 class="g-color-white g-font-size-50 g-font-size-90--md g-line-height-1_2 mb-0">EGYM shop</h3>
            <p class="g-color-white g-font-weight-600 g-font-size-20 text-uppercase"></p>
          </div>

          <div class="d-flex justify-content-end">
            <ul class="u-list-inline g-bg-gray-dark-v1 g-font-weight-300 g-rounded-50 g-py-5 g-px-20">
              <li class="list-inline-item g-mr-5">
                <a class="u-link-v5 g-color-white g-color-primary--hover" href="${pageContext.request.contextPath}/shop/main">이짐샵</a>
                <i class="g-color-white-opacity-0_5 g-ml-5">/</i>
              </li>
              <li class="list-inline-item g-color-primary g-font-weight-400">
                
                <span>건강식품</span>
                
                
              </li>
            </ul>
          </div>
        </div>
      </section>
      <!-- End Promo Block -->

      <!-- Products -->
      <div class="container">
        <!-- Filters -->
        <div class="d-flex justify-content-end align-items-center g-brd-bottom g-brd-gray-light-v4 g-pt-40 g-pb-20">
          <!-- Show -->
          
          <!-- End Show -->

          <!-- Sort By -->
          <div class="g-mr-60">
            <h2 class="h6 align-middle d-inline-block g-font-weight-400 text-uppercase g-pos-rel g-top-1 mb-0"></h2>

            <!-- Secondary Button -->
            
            <c:choose>
            <c:when test="${orderBy==3}">
            <div class="d-inline-block btn-group g-line-height-1_2">
              <button type="button" class="btn btn-secondary dropdown-toggle h6 align-middle g-brd-none g-color-gray-dark-v5 g-color-black--hover g-bg-transparent text-uppercase g-font-weight-300 g-font-size-12 g-pa-0 g-pl-10 g-ma-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                등록일순
              </button>
               
              <div class="dropdown-menu rounded-0">
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=0">높은가격순</a>
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=1">낮은가격순</a>
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=2">인기순</a>

              </div>
            </div>
            </c:when>
            
            <c:when test="${orderBy==0}">
            <div class="d-inline-block btn-group g-line-height-1_2">
              <button type="button" class="btn btn-secondary dropdown-toggle h6 align-middle g-brd-none g-color-gray-dark-v5 g-color-black--hover g-bg-transparent text-uppercase g-font-weight-300 g-font-size-12 g-pa-0 g-pl-10 g-ma-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                높은가격순
              </button>
               
              <div class="dropdown-menu rounded-0">
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=3">등록일순</a>
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=1">낮은가격순</a>
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=2">인기순</a>

              </div>
            </div>
            </c:when>
            
            <c:when test="${orderBy==1}">
            <div class="d-inline-block btn-group g-line-height-1_2">
              <button type="button" class="btn btn-secondary dropdown-toggle h6 align-middle g-brd-none g-color-gray-dark-v5 g-color-black--hover g-bg-transparent text-uppercase g-font-weight-300 g-font-size-12 g-pa-0 g-pl-10 g-ma-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                낮은가격순
              </button>
               
              <div class="dropdown-menu rounded-0">
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=0">높은가격순</a>
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=3">등록일순</a>
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=2">인기순</a>

              </div>
            </div>
            </c:when>
            
            <c:when test="${orderBy==2}">
            <div class="d-inline-block btn-group g-line-height-1_2">
              <button type="button" class="btn btn-secondary dropdown-toggle h6 align-middle g-brd-none g-color-gray-dark-v5 g-color-black--hover g-bg-transparent text-uppercase g-font-weight-300 g-font-size-12 g-pa-0 g-pl-10 g-ma-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                인기순
              </button>
               
              <div class="dropdown-menu rounded-0">
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=0">높은가격순</a>
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=1">낮은가격순</a>
                <a class="dropdown-item g-color-gray-dark-v4 g-font-weight-300" href="${pageContext.request.contextPath}/shop/select/${cateCode}?orderBy=3">등록일순</a>

              </div>
            </div>
            </c:when>
            
            </c:choose>
            
           
            <!-- End Secondary Button -->
          </div>
          <!-- End Sort By -->

          <!-- Sort By -->
          
          <!-- End Sort By -->
        </div>
        <!-- End Filters -->

        <!-- Products -->
        <div class="row g-pt-30 g-mb-50">
        
         <c:choose>
			<c:when test="${empty requestScope.list}">
			  <div class="container text-center g-py-100">
        		<div class="mb-5">
          		<span class="d-block g-color-gray-light-v1 g-font-size-70 g-font-size-90--md mb-4">
            	  <i class="icon-hotel-restaurant-105 u-line-icon-pro"></i>
          		</span>
          		<h2 class="g-mb-30"><b>상품이 아직 없습니다..</b></h2>
          		<p><b>상품이 들어오기까지 조금만 기다려주세요.</b></p>
        		</div>
     		  </div>
			</c:when>
        
        
          <c:otherwise>
			<c:forEach items="${requestScope.list.content}" var="product">
        
          <c:set var="readnumCheck" value="1"/>
            <sec:authorize access="hasRole('ADMIN')">
          		<c:set var="readnumCheck" value="0"/>
           </sec:authorize> 
          
          <div class="col-6 col-lg-3 g-mb-30">
            <!-- Product -->
            <figure class="g-pos-rel g-mb-20 g-width-250">
            <a href="${pageContext.request.contextPath}/shop/select/single/${product.productNo}/${readnumCheck}">
              <img class="img-fluid  g-width-250 g-height-250" src="${pageContext.request.contextPath}/save/${product.productImageList[0].productImageName}" alt="Image Description">
            </a>  
              <figcaption class="w-100 g-bg-primary g-bg-black--hover text-center g-pos-abs g-bottom-0 g-transition-0_2 g-py-5">
                <a class="g-color-white g-font-size-11 text-uppercase g-letter-spacing-1 g-text-underline--none--hover" href="#">New Arrival</a>
              </figcaption>
            </figure>

            <div class="media">
              <!-- Product Info -->
              <div class="d-flex flex-column">
                <h4 class="h6 g-color-black mb-1">
                  <a class="u-link-v5 g-color-black g-color-primary--hover" href="${pageContext.request.contextPath}/shop/select/single/${product.productNo}/${readnumCheck}">
                   ${product.productName}
                  </a>
                </h4>
                <a class="d-inline-block g-color-gray-dark-v5 g-font-size-13" href="#">조회수: ${product.readNum}</a>
                <span class="d-block g-color-black g-font-size-17"><fmt:formatNumber value="${product.price}"/>원</span>
              </div>
              <!-- End Product Info -->

              <!-- Products Icons -->
              <ul class="list-inline media-body text-right">
                <li class="list-inline-item align-middle mx-0">
                  <a class="u-icon-v1 u-icon-size--sm g-color-gray-dark-v5 g-color-primary--hover g-font-size-15 rounded-circle" href="${pageContext.request.contextPath}/shop/addToCart/${product.cateCode}/${product.productNo}"
                     data-toggle="tooltip"
                     data-placement="top"
                     title="Add to Cart"
                     id="addAlert">
                    <i class="icon-finance-100 u-line-icon-pro"></i>
                  </a>
                </li>
               
              </ul>
              <!-- End Products Icons -->
            </div>
            <!-- End Product -->
          </div>
          </c:forEach>
		</c:otherwise>
       </c:choose>
        </div>
        <!-- End Products -->

        <hr class="g-mb-60">




        <!-- Pagination -->
        <nav class="g-mb-100" aria-label="Page Navigation">
        <ul class="list-inline mb-0">
         
          	<c:set var="doneLoop" value="false"/>
            <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/shop/select?nowPage=${startPage-1}" aria-label="Next">
                <span aria-hidden="true">
                  <i class="fa fa-angle-right"></i>
                </span>
                <span class="sr-only">Next</span>
              </a>
            </li>
            
		    </c:if>
          
          
            <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
				  
					    <c:if test="${(i-1)>=list.getTotalPages()}">
					       <c:set var="doneLoop" value="true"/>
					    </c:if> 
				    
				  <c:if test="${not doneLoop}" >
				  
				      <li class="list-inline-item hidden-down">
				     <a class="${i==nowPage?'active u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--active g-color-white g-bg-primary--active g-font-size-12 rounded-circle g-pa-5':'u-pagination-v1__item g-width-30 g-height-30 g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5'}" href="${pageContext.request.contextPath}/shop/select/${cateCode}?nowPage=${i}">${i}</a> 
		            </li>
		         </c:if>
            </c:forEach>
            
            
            <c:if test="${(startPage+blockCount)<=list.getTotalPages()}">
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/shop/select/${cateCode}?nowPage=${startPage+blockCount}" aria-label="Next">
                <span aria-hidden="true">
                  <i class="fa fa-angle-right"></i>
                </span>
                <span class="sr-only">Next</span>
              </a>
            </li>
			</c:if>
			
			
            <!-- <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="#" aria-label="Next">
                <span aria-hidden="true">
                  <i class="fa fa-angle-right"></i>
                </span>
                <span class="sr-only">Next</span>
              </a>
            </li> -->
            
            
            
          </ul>
        </nav>
        <!-- End Pagination -->
        
        
        
        
        
        
      <!-- End Products -->

      <!-- Call to Action -->
      
      <!-- End Call to Action -->

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
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery-ui/ui/widget.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery-ui/ui/widgets/menu.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery-ui/ui/widgets/mouse.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery-ui/ui/widgets/slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/dzsparallaxer/dzsparallaxer.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/dzsparallaxer/dzsscroller/scroller.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/dzsparallaxer/advancedscroller/plugin.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- JS Unify -->
    <script src="${pageContext.request.contextPath}/assets/js/hs.core.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.header.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/helpers/hs.rating.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.go-to.js"></script>

    <!-- JS Customization -->
    <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

    <!-- JS Plugins Init. -->
    <script>
      $(document).on('ready', function () {
        // initialization of header
        $.HSCore.components.HSHeader.init($('#js-header'));
        $.HSCore.helpers.HSHamburgers.init('.hamburger');

        // initialization of HSMegaMenu component
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

        // initialization of HSScrollBar component
        $.HSCore.components.HSScrollBar.init($('.js-scrollbar'));

        // initialization of go to
        $.HSCore.components.HSGoTo.init('.js-go-to');

        // initialization of rating
        $.HSCore.helpers.HSRating.init();

        // initialization of range slider
        $.HSCore.components.HSSlider.init('#rangeSlider1');
      });
    </script>
  </body>
</html>