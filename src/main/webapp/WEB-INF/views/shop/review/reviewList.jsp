<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
                  <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/shop">이짐샵</a>
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
          <div class="col-lg-3 g-mb-50">
            <aside class="g-brd-around g-brd-gray-light-v4 rounded g-px-20 g-py-30">
              <!-- Profile Picture -->
              <div class="text-center g-pos-rel g-mb-30">

                <span id="name" class="d-block g-font-weight-500">
                <sec:authorize access="isAuthenticated()">
     			<hidden name="memberId" value='<sec:authentication property="principal.Username"/>'/>	
        			<sec:authentication property="principal.Username"/> 님 환영합니다. <!-- Authentication의 getPrincipal().getName() -> Principal은 Provider에서 Authentication 에 넣어준 VO(생성자 첫 매개변수) -->
    			</sec:authorize>
                </span>

              </div>
              <!-- End Profile Picture -->

              <hr class="g-brd-gray-light-v4 g-my-30">

              <!-- Profile Settings List -->
              <ul class="list-unstyled mb-0">
                <li class="g-pb-3">
                  <a class="d-block align-middle active u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover g-color-primary--parent-active g-bg-gray-light-v5--active rounded g-pa-3" href="${pageContext.request.contextPath}/shop/user/myPage">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-059 u-line-icon-pro"></i></span>
                    내정보
                  </a>
                </li>
                <li class="g-py-3">
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/shop/selectCart">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-114 u-line-icon-pro"></i></span>
                    장바구니
                  </a>
                </li>
                <li class="g-py-3">
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/shop/user/orderList">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-115 u-line-icon-pro"></i></span>
                    주문내역
                  </a>
                </li>
                
                <li class="g-py-3">
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/shop/user/cancleList">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-115 u-line-icon-pro"></i></span>
                    환불내역
                  </a>
                </li>
              </ul>
              <!-- End Profile Settings List -->
            </aside>
          </div>
          <!-- End Profile Settings -->
 
          <!-- Orders -->
          <div class="col-lg-9 g-mb-50">
            

            <!-- Links -->
            <ul class="list-inline g-brd-bottom--sm g-brd-gray-light-v3 mb-5">
              <li class="list-inline-item g-pb-10 g-pr-10 g-mb-20 g-mb-0--sm">
                <a class="g-brd-bottom g-brd-2 g-brd-transparent g-color-main g-color-gray-dark-v4 g-color-primary--hover g-text-underline--none--hover g-px-10 g-pb-13" href="${pageContext.request.contextPath}/shop/user/orderList">주문 목록</a>
              </li>
              <li class="list-inline-item g-pb-10 g-px-10 g-mb-20 g-mb-0--sm">
                <a class="g-brd-bottom g-brd-2 g-brd-primary g-color-main g-color-black g-font-weight-600 g-text-underline--none--hover g-px-10 g-pb-13" href="${pageContext.request.contextPath}/shop/review/reviewList">내가 쓴 리뷰</a>
              </li>
              
            </ul>
            <!-- End Links -->

            <!-- <div class="mb-5">
              <h3 class="h6 d-inline-block">주문 중인 상품 : 2 개</h3>
            </div> -->

            <!-- Order Block -->
            
            <div class="g-brd-around g-brd-gray-light-v4 rounded g-mb-30">
            
            <c:forEach items="${list.content}" var="orderdetail">
            <c:if test="${!empty orderdetail.review}">
             <div class="g-pa-20">
                <div class="row">
                  <div class="col-md-10">
                    <div class="mb-3">
                      <h5 class="h5 mb-1"><a href="${pageContext.request.contextPath}/shop/select/single/${orderdetail.product.productNo}/1">${orderdetail.product.productName}</a></h5>
                    </div>

                    <div class="row">
                      <c:if test="${!empty orderdetail.review.reviewImage}">
                        <div class="col-4 col-sm-3">
                          <img class="img-fluid g-width-150 g-height-150"  src="${pageContext.request.contextPath}/save/${orderdetail.review.reviewImage}" alt="Image Description">
                        </div>
                      </c:if>
                      <div class="col-8 col-sm-9">
                        <h5 class="h6 g-font-weight-400"><b>제목 : ${orderdetail.review.reviewName}</b></h5>
                        <span class="d-block mb-2">${orderdetail.review.reviewContent}</span>
                        <!-- Rating -->
		                <c:choose>
	                      <c:when test="${orderdetail.review.rating==0}">
		                    <ul class="js-rating u-rating-v1 g-font-size-13 g-color-gray-light-v3 mb-0" data-hover-classes="g-color-primary">
		                      <li class="g-line-height-1_4"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li>
		                    </ul>
			              </c:when>
			              <c:when test="${orderdetail.review.rating==1}">
		                    <ul class="js-rating u-rating-v1 g-font-size-13 g-color-gray-light-v3 mb-0" data-hover-classes="g-color-primary">
		                      <li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li>
		                    </ul>
			              </c:when>
			              <c:when test="${orderdetail.review.rating==2}">
		                    <ul class="js-rating u-rating-v1 g-font-size-13 g-color-gray-light-v3 mb-0" data-hover-classes="g-color-primary">
		                      <li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li>
		                    </ul>
			              </c:when>
			              <c:when test="${orderdetail.review.rating==3}">
		                    <ul class="js-rating u-rating-v1 g-font-size-13 g-color-gray-light-v3 mb-0" data-hover-classes="g-color-primary">
		                      <li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li>
		                    </ul>
			              </c:when>
			              <c:when test="${orderdetail.review.rating==4}">
		                    <ul class="js-rating u-rating-v1 g-font-size-13 g-color-gray-light-v3 mb-0" data-hover-classes="g-color-primary">
		                      <li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-line-height-1_4"><i class="fa fa-star"></i></li>
		                    </ul>
			              </c:when>
			              <c:otherwise>
		                    <ul class="js-rating u-rating-v1 g-font-size-13 g-color-gray-light-v3 mb-0" data-hover-classes="g-color-primary">
		                      <li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li><li class="g-color-primary g-line-height-1_4 click"><i class="fa fa-star"></i></li>
		                    </ul>
			              </c:otherwise>
			            </c:choose>
						<!-- End Rating -->
						<fmt:parseDate var="cntday" value="${orderdetail.review.reviewDate}" pattern="yyyy-MM-dd"/>
		                <fmt:formatDate  var="day" value="${cntday}" type="DATE" pattern="yyyy-MM-dd"/>
		                <span class="d-block g-color-gray-dark-v5 g-font-size-12">${day}</span>
						<br>
                        <a class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 rounded g-px-18 g-py-7" href="${pageContext.request.contextPath}/shop/select/single/${orderdetail.product.productNo}/1">상품 보기</a>
                      </div>
                    </div>
                  </div>
                    
                  <div class="col-md-2">
                    <a id="deleteReview" class="btn btn-block g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 text-uppercase g-py-12 g-px-25" href="${pageContext.request.contextPath}/shop/review/deleteReview/${orderdetail.review.reviewNo}/${orderdetail.product.productNo}">
                     삭제하기
                     </a>
                   </div> 
                </div>
              </div>
            </c:if>
            
            </c:forEach>
            
           
               
              <!-- End Order Content -->
            </div>
            <!-- End Order Block -->

            <!-- Order Block -->
         
            <!-- End Order Block -->

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
				  
					    <c:if test="${(i-1)>=pageList.getTotalPages()}">
					       <c:set var="doneLoop" value="true"/>
					    </c:if> 
				    
				  <c:if test="${not doneLoop}" >
				  
				      <li class="list-inline-item hidden-down">
				     <a class="${i==nowPage?'active u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--active g-color-white g-bg-primary--active g-font-size-12 rounded-circle g-pa-5':'u-pagination-v1__item g-width-30 g-height-30 g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5'}" href="${pageContext.request.contextPath}/shop/user/orderList?nowPage=${i}">${i}</a> 
		            </li>
		         </c:if>
            </c:forEach>
            
            
            <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/shop/user/orderList?nowPage=${startPage+blockCount}" aria-label="Next">
                <span aria-hidden="true">
                  <i class="fa fa-angle-right"></i>
                </span>
                <span class="sr-only">Next</span>
              </a>
            </li>
			</c:if>
			
          </ul>
        </nav>    
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
    
  </body>
</html>
