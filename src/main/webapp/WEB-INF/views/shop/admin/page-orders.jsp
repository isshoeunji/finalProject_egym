<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title -->
    <title>E-commerce Orders Page | Unify - Responsive Website Template</title>

    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>    
<script type="text/javascript">
	//검색어로 검색하기
    $(function(){
    	$(document).on("click","#selectButton", function(){
    		var keyword=$('#keyword').val();
    		if(keyword=="" || keyword==null){
    			alert("검색어를 입력해주세요.");
    			$("#selectForm").focus();
    		}else{
    			$("#selectForm").attr("action", "${pageContext.request.contextPath}/shop/admin/selectOrderlist/"+$("#keyword").val());
    			$("#selectForm").submit();
    		}
			
		});
		
	});


</script>
    
  </head>

  <body>
    <main>
      

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
                  <span>관리자 주문내역</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
      <!-- End Breadcrumbs -->

      <div class="container g-pt-70 g-pb-30">
        <div class="row">
          <!-- Profile Settings -->
          
          <!-- End Profile Settings -->


          <!-- Products -->
          <div class="col-lg-9 g-mb-50">

			
            <!-- Links -->
            <ul class="list-inline g-brd-bottom--sm g-brd-gray-light-v3 mb-5">
              <li class="list-inline-item g-pb-10 g-pr-10 g-mb-20 g-mb-0--sm">
                <a class="g-brd-bottom g-brd-2 g-brd-primary g-color-main g-color-black g-font-weight-600 g-text-underline--none--hover g-px-10 g-pb-13" href="page-orders-1.html">판매 목록</a>
              </li>
            </ul>
            
            <!-- End Links -->
			<c:choose>
				<c:when test="${empty requestScope.list} && ${empty requestScope.selectOrder}">
					<div id="accordion-12-1-heading-01" class="u-accordion__header g-color-gray-dark-v4 g-font-weight-500 g-font-size-16 g-pa-0" role="tab">
                         주문 내역이 없습니다.
            		</div>
				</c:when>



		<c:otherwise>
		<div class="mb-5">
			<c:choose>
			<c:when test="${not empty requestScope.list}">
             <h3 class="h6 d-inline-block">주문 내역 개수 : ${listSize} 개</h3>
             </c:when>
            <c:otherwise>
            <h3 class="h6 d-inline-block">해당 내역 개수 : ${selectOrder.content.size()} 개</h3>
            </c:otherwise>
            </c:choose>
              
              <!-- Search Form -->
                <form id="selectForm" class="input-group g-pos-rel">
                  <span class="g-pos-abs g-top-0 g-left-0 g-z-index-3 g-px-13 g-py-10">
                    <i class="g-color-gray-dark-v4 g-font-size-12 icon-education-045 u-line-icon-pro"></i>
                  </span>
                  <input id="keyword" class="form-control u-form-control g-brd-around g-brd-gray-light-v3 g-brd-primary--focus g-font-size-13 g-rounded-left-5 g-pl-35 g-pa-0" type="text" placeholder="주문자 명을 입력해주세요.">
                  <div class="input-group-append g-brd-none g-py-0">
                    <button id="selectButton" class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 rounded g-px-18 g-py-7" type="button">검색하기</button>
                  </div>
                </form>
                <!-- End Search Form -->
        </div>
            	
            	<!-- Product Block -->
       	<div class="g-brd-around g-brd-gray-light-v4 rounded g-mb-30">
               <c:choose>
               <c:when test="${not empty requestScope.selectOrder}">
               		<c:forEach items="${requestScope.selectOrder.content}" var="selectOrder">
               	
               		<header class="g-bg-gray-light-v5 g-pa-20">
                		<div class="row">
                  		
                  		

                  		<div class="col-sm-3 col-md-2 g-mb-20 g-mb-0--sm">
                    		<h4 class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">주문번호</h4>
                    		<span id="select1" class="g-color-black g-font-weight-300 g-font-size-13">
                              ${selectOrder.userOrderNo}
                    		</span>
                  		</div>
                  		
                  		
                  		<div class="col-sm-3 col-md-2 g-mb-20 g-mb-0--sm">
                    		<h4 class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">주문 일자</h4>
                    		<span id="select2" class="g-color-black g-font-weight-300 g-font-size-13">${selectOrder.orderDate}</span>
                  		</div>

						<div class="col-sm-3 col-md-2 g-mb-20 g-mb-0--sm">
                    		<h4 class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">주문자 명</h4>
                    		<span id="select3" class="g-color-black g-font-weight-300 g-font-size-13">${selectOrder.receiverName}</span>
                  		</div>
                  		
                  		<div class="col-sm-3 col-md-2 g-mb-20 g-mb-0--sm">
                    		<h4 class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">연락처</h4>
                    		<span id="select4" class="g-color-black g-font-weight-300 g-font-size-13">${selectOrder.receiverPhone}</span>
                  		</div>
						
                  		<div class="col-sm-3 col-md-4 ml-auto text-sm-right">
                    		<h4 id="select5" class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">배송지 : ${selectOrder.orderAddr} </h4>
                  		</div>
                		</div>
              		</header>

              		<!-- Product Content -->
              		<div class="g-pa-20">
               		 <div class="row">
                 		 <div class="col-md-8">
           
	
		                    <div class="row">
		                      
		                      
		                      <div class="col-8 col-sm-9 g-mb-30">
		                        
		                        </span>
		                        <a class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 rounded g-px-18 g-py-7" href="${pageContext.request.contextPath}/shop/admin/orderDetail/user/${order.userOrderNo}">주문 상세 내역 보기</a>
		                      </div>
		                    </div>
	                  </div>
	
	                </div>
	              </div>
	              <!-- End Product Content -->
            </c:forEach> 
            </c:when>
               		
               		
               		
               		<c:otherwise>
               		<c:forEach items="${requestScope.list.content}" var="order">
               		<header class="g-bg-gray-light-v5 g-pa-20">
                		<div class="row">
                  		
                  		

                  		<div class="col-sm-3 col-md-2 g-mb-20 g-mb-0--sm">
                    		<h4 class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">주문번호</h4>
                    		<span id="select1" class="g-color-black g-font-weight-300 g-font-size-13">
                              ${order.userOrderNo}
                    		</span>
                  		</div>
                  		
                  		
                  		<div class="col-sm-3 col-md-2 g-mb-20 g-mb-0--sm">
                    		<h4 class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">주문 일자</h4>
                    		<span id="select2" class="g-color-black g-font-weight-300 g-font-size-13">${order.orderDate}</span>
                  		</div>

						<div class="col-sm-3 col-md-2 g-mb-20 g-mb-0--sm">
                    		<h4 class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">주문자 명</h4>
                    		<span id="select3" class="g-color-black g-font-weight-300 g-font-size-13">${order.receiverName}</span>
                  		</div>
                  		
                  		<div class="col-sm-3 col-md-2 g-mb-20 g-mb-0--sm">
                    		<h4 class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">연락처</h4>
                    		<span id="select4" class="g-color-black g-font-weight-300 g-font-size-13">${order.receiverPhone}</span>
                  		</div>
						
                  		<div class="col-sm-3 col-md-4 ml-auto text-sm-right">
                    		<h4 id="select5" class="g-color-gray-dark-v4 g-font-weight-400 g-font-size-12 text-uppercase g-mb-2">배송지 : ${order.orderAddr} </h4>
                  		</div>
                		</div>
              		</header>

              		<!-- Product Content -->
              		<div class="g-pa-20">
               		 <div class="row">
                 		 <div class="col-md-8">
           
	
		                    <div class="row">
		                      
		                      
		                      <div class="col-8 col-sm-9 g-mb-30">
		                        
		                        </span>
		                        <a class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-12 rounded g-px-18 g-py-7" href="${pageContext.request.contextPath}/shop/admin/orderDetail/user/${order.userOrderNo}">주문 상세 내역 보기</a>
		                      </div>
		                    </div>
	                  </div>
	
	                </div>
	              </div>
	              <!-- End Product Content -->
            </c:forEach> 
               		
               		
               		</c:otherwise>
            	</c:choose>
            	
              		
            </c:otherwise>
			</c:choose>
			</div>
			<!-- End Product Block -->
			
			</div> 
			</div>
            


        <c:choose>
              <c:when test="${not empty requestScope.selectOrder}">
              
              
              
          <nav class="g-mb-100" aria-label="Page Navigation">
        	<ul class="list-inline mb-0">
         
          	<c:set var="doneLoop" value="false"/>
            <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/shop/admin/selectOrderlist/${keyword}?nowPage=${startPage-1}" aria-label="Next">
                <span aria-hidden="true">
                  <i class="fa fa-angle-left"></i>
                </span>
                <span class="sr-only">Next</span>
              </a>
            </li>
            
		    </c:if>
          
          
            <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
				  
					    <c:if test="${(i-1)>=selectOrder.getTotalPages()}">
					       <c:set var="doneLoop" value="true"/>
					    </c:if> 
				    
				  <c:if test="${not doneLoop}" >
				  
				      <li class="list-inline-item hidden-down">
				     <a class="${i==nowPage?'active u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--active g-color-white g-bg-primary--active g-font-size-12 rounded-circle g-pa-5':'u-pagination-v1__item g-width-30 g-height-30 g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5'}" href="${pageContext.request.contextPath}/shop/admin/selectOrderlist/${keyword}?nowPage=${i}">${i}</a> 
		            </li>
		         </c:if>
            </c:forEach>
            
            
            <c:if test="${(startPage+blockCount)<=list.getTotalPages()}">
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/shop/admin/selectOrderlist/${keyword}?nowPage=${startPage+blockCount}" aria-label="Next">
                <span aria-hidden="true">
                  <i class="fa fa-angle-right"></i>
                </span>
                <span class="sr-only">Next</span>
              </a>
            </li>
			</c:if>
			
          </ul>     
              
              </c:when>


			<c:otherwise>
			  <nav class="g-mb-100" aria-label="Page Navigation">
        	<ul class="list-inline mb-0">
         
          	<c:set var="doneLoop" value="false"/>
            <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/shop/admin/orderList/user?nowPage=${startPage-1}" aria-label="Next">
                <span aria-hidden="true">
                  <i class="fa fa-angle-left"></i>
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
				     <a class="${i==nowPage?'active u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--active g-color-white g-bg-primary--active g-font-size-12 rounded-circle g-pa-5':'u-pagination-v1__item g-width-30 g-height-30 g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5'}" href="${pageContext.request.contextPath}/shop/admin/orderList/user?nowPage=${i}">${i}</a> 
		            </li>
		         </c:if>
            </c:forEach>
            
            
            <c:if test="${(startPage+blockCount)<=list.getTotalPages()}">
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/shop/admin/orderList/user?nowPage=${startPage+blockCount}" aria-label="Next">
                <span aria-hidden="true">
                  <i class="fa fa-angle-right"></i>
                </span>
                <span class="sr-only">Next</span>
              </a>
            </li>
			</c:if>
			
          </ul>
        </nav>   
			</c:otherwise>
			</c:choose>
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
