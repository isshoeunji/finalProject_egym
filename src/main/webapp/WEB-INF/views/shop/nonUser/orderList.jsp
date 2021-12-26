<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title -->
    
  </head>

  <body>
    <main>
      <!-- Header -->
	  
      <!-- Breadcrumbs -->
      <section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
        <div class="container">
          <div class="d-sm-flex text-center">
            <div class="align-self-center">
              <h1 class="h3 mb-0"><b>주문 내역</b></h1>
            </div>

            <div class="align-self-center ml-auto">
              <ul class="u-list-inline">
                <li class="list-inline-item g-mr-5">
                  <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/shop">EGYM SHOP</a>
                  <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
                </li>
                <li class="list-inline-item g-color-primary">
                  <span>주문 내역</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
      <!-- End Breadcrumbs -->

      <div class="container g-pt-70 g-pb-30">
        <div class="row justify-content-center">
          <!-- Profile Settings -->
          
          <!-- End Profile Settings -->
 
          <!-- Orders -->
          <div class="col-lg-9 g-mb-50">
            

            <!-- Links -->
            <ul class="list-inline g-brd-bottom--sm g-brd-gray-light-v3 mb-5">
              <li class="list-inline-item g-pb-10 g-pr-10 g-mb-20 g-mb-0--sm">
                <a class="g-brd-bottom g-brd-2 g-brd-primary g-color-main g-color-black g-font-weight-600 g-text-underline--none--hover g-px-10 g-pb-13" href="page-orders-1.html">주문 목록</a>
              </li>
            </ul>
            <!-- End Links -->

            <!-- <div class="mb-5">
              <h3 class="h6 d-inline-block">주문 중인 상품 : 2 개</h3>
            </div> -->

            <!-- Order Block -->
            
            <div class="g-brd-around g-brd-gray-light-v4 rounded g-mb-30">
            
            
            
            
            <c:forEach items="${orderDetail}" var="orderdetail">
            
            <div class="g-pa-20">
                <div class="row">
                  <div class="col-md-8">
                    <div class="mb-4">
                      <h3 class="h5 mb-1">주문시각 : ${order.orderDate}</h3>
                    </div>

                    <div class="row">
                      <div class="col-4 col-sm-3 g-mb-30">
                        <img class="img-fluid g-width-120 g-height-120"  src="${pageContext.request.contextPath}/save/${orderdetail.product.productImageList[0].productImageName}" alt="Image Description">
                      </div>

                      <div class="col-8 col-sm-9 g-mb-30">
                        <h4 class="h6 g-font-weight-400"><a href="${pageContext.request.contextPath}/shop/select/single/${orderdetail.product.productNo}/1">${orderdetail.product.productName}</a></h4>
                        <span class="d-block mb-2">가격 : ${orderdetail.product.price}</span>
                        <span class="d-block mb-2">수량 : ${orderdetail.productCount}</span>
                        <a class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 rounded g-px-18 g-py-7" href="${pageContext.request.contextPath}/shop/select/single/${orderdetail.product.productNo}/1">상품 보기</a>
                      </div>
                    </div>
                  </div>
                    
              <c:choose>      
                <c:when test="${orderdetail.orderStatus==0}">
                  <div class="col-md-4">
                    <a class="btn btn-block g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 text-uppercase g-py-12 g-px-25" href="#">
                     배송준비중
                     </a>
                     
                    
                  </div>
                     
                  </c:when>
                  
                
                <c:when test="${orderdetail.orderStatus==1}">
                  <div class="col-md-4">
                    <a class="btn btn-block g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 text-uppercase g-py-12 g-px-25" href="#">
                     배송중
                     </a>
                  </div>
                     
                  </c:when>
                
                  
                 <c:when test="${orderdetail.orderStatus==2}">
                  <div class="col-md-4">
                    <a class="btn btn-block g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 text-uppercase g-py-12 g-px-25" href="#">
                     배송완료
                     </a>
                    <a class="btn btn-block g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 text-uppercase g-py-12 g-px-25" href="#">
                     리뷰작성
                     </a>  
                     
                  </div>
                     
                  </c:when> 
                  
                </c:choose>
                    
                    
                </div>
              </div>

            </c:forEach>
               
              <!-- End Order Content -->
            </div>
            <!-- End Order Block -->

            <!-- Order Block -->
         
            <!-- End Order Block -->

            <!-- Pagination -->
            
            <!-- End Pagination -->
          </div>
          <!-- Orders -->
        </div>
      </div>



      <!-- Footer -->

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
    <script src="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/chosen/chosen.jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/image-select/src/ImageSelect.jquery.js"></script>

    <!-- JS Unify -->
    <script src="${pageContext.request.contextPath}/assets/js/hs.core.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.header.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.select.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.count-qty.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.step-form.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.validation.js"></script>
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
      });
    </script>
    <script type="text/javascript">
        document.getElementById("name").innerHTML = "<b>${sessionScope.customerDTO.customerName} 님</b>"
    </script>
  </body>
</html>
