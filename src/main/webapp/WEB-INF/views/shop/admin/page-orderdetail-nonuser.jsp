<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title -->
<script type="text/javascript">
      $(document).ready(function(){
    	  
    	  $("#changeStatus").click(function(){
    		  
    		  if(confirm("배송 상태를 변경하시겠습니까?")) {
    			  location.href = "${pageContext.request.contextPath}/shop/admin/changeStatus/nonuser?orderDetailNo="+$(this).attr("name");
    		  }else{
    		  }
    		  
    	  });
      });
    </script>
  </head>

  <body>
    <main>
      <!-- Header -->
	  

      <!-- Breadcrumbs -->
      <section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
        <div class="container">
          <div class="d-sm-flex text-center">
            <div class="align-self-center">
              <h1 class="h3 mb-0"><b>판매 정보</b></h1>
            </div>

            <div class="align-self-center ml-auto">
              <ul class="u-list-inline">
                <li class="list-inline-item g-mr-5">
                  <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/shop/main">이짐샵</a>
                  <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
                </li>
                <li class="list-inline-item g-color-primary">
                  <span>판매 정보</span>
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


          <!-- Products -->
          <div class="col-lg-9 g-mb-50">

			
            <!-- Links -->
            <ul class="list-inline g-brd-bottom--sm g-brd-gray-light-v3 mb-5">
              <li class="list-inline-item g-pb-10 g-pr-10 g-mb-20 g-mb-0--sm">
                <a class="g-brd-bottom g-brd-2 g-brd-primary g-color-main g-color-black g-font-weight-600 g-text-underline--none--hover g-px-10 g-pb-13" href="#">판매 목록</a>
              </li>
            </ul>
            
            <!-- End Links -->
			<c:choose>
				<c:when test="${empty requestScope.list}">
					<div id="accordion-12-1-heading-01" class="u-accordion__header g-color-gray-dark-v4 g-font-weight-500 g-font-size-16 g-pa-0" role="tab">
                         판매된 내역이 없습니다.
            		</div>
				</c:when>

				<c:otherwise>
				
				<div class="mb-5">
              		<h3 class="h6 d-inline-block">주문 상세 내역 : ${list.size()}개</h3>
            	</div>
            
            
            <div class="g-brd-around g-brd-gray-light-v4 rounded g-mb-30">
				<form>
				
				<c:forEach items="${requestScope.list}" var="orderdetail">
				<div class="g-pa-20">
                <div class="row">
                  <div class="col-md-8">
                    

                    <div class="row">
                      <div class="col-4 col-sm-3 g-mb-30">
                        <img class="img-fluid g-width-120 g-height-120"  src="${pageContext.request.contextPath}/save/${orderdetail.product.productImageList[0].productImageName}" alt="Image Description">
                      </div>

                      <div class="col-8 col-sm-9 g-mb-30">
                        <h4 class="h6 g-font-weight-400"><a href="${pageContext.request.contextPath}/shop/select/single/${orderdetail.product.productNo}/0">${orderdetail.product.productName}</a></h4>
                        <span class="d-block mb-2">가격 : ${orderdetail.product.price}</span>
                        <span class="d-block mb-2">수량 : ${orderdetail.productCount}</span>
                        <span class="d-block mb-2">재고량 : ${orderdetail.product.stock}</span>
                        <span class="d-block mb-2">주문상세번호 : ${orderdetail.nonuserOrderDetailNo}</span>
                        
                        <a class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 rounded g-px-18 g-py-7" href="${pageContext.request.contextPath}/shop/select/single/${orderdetail.product.productNo}/0">상품 보기</a>
                      </div>
                    </div>
                  </div>
                 
                  
                <!-- <div class="col-md-4">
                <select id="cateCode" name="cateCode" class="js-custom-select u-select-v1 h-50 g-brd-gray-light-v3 g-color-gray-dark-v5 rounded mr-3" style="width:15%;">
	                      <option value="0">카테고리</option>
	                      <option value="1">닭가슴살</option>
	                      <option value="2">샐러드</option>
	                      <option value="3">프로틴</option>
		          </select> 
                </div> -->
                    
              <c:choose>      
              
                
              
                <c:when test="${orderdetail.orderStatus==0}">
                  <div class="col-md-4">
                    <a id="changeStatus" name="${orderdetail.nonuserOrderDetailNo}" class="btn btn-block g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 text-uppercase g-py-12 g-px-25">
                     배송준비중
                     </a>
                     
                    
                    
                  </div>
                     
                  </c:when>
                  
                
                <c:when test="${orderdetail.orderStatus==1}">
                  <div class="col-md-4">
                    <a id="changeStatus" name="${orderdetail.nonuserOrderDetailNo}" class="btn btn-block g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 text-uppercase g-py-12 g-px-25" value="123">
                     배송중
                     </a>
                     
                    
                     
                  </div>
                     
                  </c:when>
                
                  
                 <c:when test="${orderdetail.orderStatus==2}">
                  <div class="col-md-4">
                    <a class="btn btn-block g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 text-uppercase g-py-12 g-px-25" href="#">
                     배송완료
                     </a>
                    
                     
                  </div>
                     
                  </c:when> 
                  
                </c:choose>
                    
                    
                </div>
              </div>
            </c:forEach>
            </form>
            </c:otherwise>
			</c:choose>
			</div>
			<!-- End Product Block -->
			
			</div> 
			</div>
            


            <!-- Pagination -->
            
            <!-- End Pagination -->
          </div>
          <!-- Orders -->
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
    <script src="${pageContext.request.contextPath}/html/assets/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/jquery-migrate/jquery-migrate.min.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/popper.js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/bootstrap/bootstrap.min.js"></script>

    <!-- JS Implementing Plugins -->
    <script src="${pageContext.request.contextPath}/html/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- JS Unify -->
    <script src="${pageContext.request.contextPath}/html/assets/js/hs.core.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.header.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/html/assets/js/components/hs.go-to.js"></script>

    <!-- JS Customization -->
    <script src="${pageContext.request.contextPath}/html/assets/js/custom.js"></script>

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
        document.getElementById("name").innerHTML = "<b>${sessionScope.sellerDTO.sellerName} 님</b>"
    </script>
  </body>
</html>
