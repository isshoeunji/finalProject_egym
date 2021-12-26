<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    

<!DOCTYPE html>
<html lang="en">
  <head>
  <!-- Title -->
  <title>E-commerce Help Page | Unify - Responsive Website Template</title>
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
  <script type="text/javascript">
    $(function(){
    	$("#one").click(function(){
    		$("#rating").val('1');
    	});
    	$("#two").click(function(){
    		$("#rating").val('2');
    	});
    	$("#three").click(function(){
    		$("#rating").val('3');
    	});
    	$("#four").click(function(){
    		$("#rating").val('4');
    	});
    	$("#five").click(function(){
    		$("#rating").val('5');
    	});
    });
  </script>
  <script type="text/javascript">
      $(document).ready(function(){
    	  let count = 1;
    	  $("#btnAdd").click(function(){
    		  if (count <= 2) { 
	    		  $(".addFile").append(
	    		  '<input type="file" name="file" id="mainImg" maxlength="60" size="20" accept="image/jpeg, image/png, image/jpg"> \ <button type="button" id="btnRemove" class="btnRemove">삭제</button><br>');
	    	  
	    		  $(".btnRemove").on("click", function(){
	        		  $(this).prev().remove();
	        		  $(this).next().remove();
	        		  $(this).remove();
	        		  count-=1;
	        	  });
	    		  count+=1;
    		  }else{
    			  alert("이미지는 최대 3장");
    		  }
    	  });
      });
   </script>
   <script type="text/javascript">
   function form_check() {
 	  var reviewName = document.getElementById("reviewName");
 	  var reviewContent = document.getElementById("reviewContent");
 	  
	   	if ( reviewName.value == "" ) {
	   	    alert( "리뷰 제목을 입력해주세요." );
	   	    reviewName.focus();
	   		return false;
	       }
	
	   	if ( reviewContent.value == "" ) {
	   	    alert( "리뷰 내용을 입력해주세요." );
	   	    reviewContent.focus();
	   		return false;
	       }
	   	
	   	document.reviewForm.submit();
   }
   </script> 
   </head>
  <body>
  
    <main>
      <!-- Breadcrumbs -->
      <section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
        <div class="container">
          <ul class="u-list-inline">
            <li class="list-inline-item g-mr-5">
              <a class="u-link-v5 g-color-text" href="#">EGYM SHOP</a>
              <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
            </li>
            <li class="list-inline-item g-mr-5">
              <a class="u-link-v5 g-color-text" href="#">고객센터</a>
              <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
            </li>
            <li class="list-inline-item g-color-primary">
              <span>리뷰 등록</span>
            </li>
          </ul>
        </div>
      </section>
      <!-- End Breadcrumbs -->

      <!-- Help -->
      <form id="reviewForm" name="reviewForm" method="post" action="${pageContext.request.contextPath}/shop/review/insert" enctype="multipart/form-data">
      <input type="hidden" name="productNo" value="${productNo}" />
      <input type="hidden" name="memberNo" value="${memberNo}" />
      <input type="hidden" name="userOrderDetailNo" value="${userOrderDetailNo}" />
      <div class="container g-pt-70 g-pb-70">
        <div class="row g-mb-20">
          <h2 class="mb-5">리뷰 등록</h2>
          <div class="col-md-8 g-mb-30">
            <!-- Tab panes -->
            <div id="nav-5-3-primary-ver" class="tab-content g-pt-20 g-pt-0--md">

				<br><br><br>
                <!-- Accordion -->
                <div id="accordion-12-1" class="u-accordion u-accordion-color-primary" role="tablist" aria-multiselectable="true">
                  <div class="g-overflow-x-scroll g-overflow-x-visible--lg">
                          <!-- End Products Block -->
		                  <div class="input-group">
					        <img style="width:100px; margin-bottom: 20px; vertical-align: middle" src="${pageContext.request.contextPath}/save/${product.productImageList[0].productImageName}" alt="Image Description">
		                  <span style="margin-left: 10px; margin-top:50px" class="g-font-weight-700">${product.productName}<br><p style="color: green">&#8361;${product.price}</p></span>
		                  </div>
		                  <div class="form-group">
                        <input id="reviewName" name="reviewName" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-brd-primary--focus rounded-3 g-py-9 g-px-15" type="text" placeholder="제목">
                      </div>                	                  
                      <!-- Item-->
				 	<div class="g-mb-5">
                    <textarea id="reviewContent" name="reviewContent" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-brd-primary--focus g-resize-none rounded-3 g-py-13 g-px-15" rows="9" placeholder="리뷰 작성"></textarea>
                  </div>
                      
                    <!-- Rating -->
                    <div class="row col-md-8 g-mb-10">
                      <h6>별점:</h6>
                    <div class="col-5">
                      
                      <ul class="js-rating u-rating-v1 g-font-size-20 g-color-gray-light-v3 mb-0" data-hover-classes="g-color-primary">
                        <li class="g-line-height-1_4">
                          <i id="one" class="fa fa-star"></i>
                        </li>
                        <li class="g-line-height-1_4">
                          <i id="two" class="fa fa-star"></i>
                        </li>
                        <li class="g-line-height-1_4">
                          <i id="three" class="fa fa-star"></i>
                        </li>
                        <li class="g-line-height-1_4">
                          <i id="four" class="fa fa-star"></i>
                        </li>
                        <li class="g-line-height-1_4">
                          <i id="five" class="fa fa-star"></i>
                        </li>
                      </ul>
                      <input type="hidden" id="rating" name="rating" value="" />
                      </div>
                      </div>
                      <!-- End Rating -->
                      <div class="addFile g-mb-5">
                      <h6>이미지 업로드</h6>
                         <input type="file" name="file" id="reviewImg" maxlength="60" size="20" accept="image/jpeg, image/png, image/jpg"> <br>
						</div>
                    <button type="button" id="btnAdd" class="btn u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25">이미지 추가하기</button>
                    
                    <div class="col-md-8 g-mb-30">
		              
		            </div>
                  </div>
                  <!-- End Products Block -->
                  
                </div>
                <!-- End Accordion -->
               <!-- Contact Form -->
		            
                <div class="text-center">
                  <button class="btn u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25" type="button" onclick="form_check()"><b>등록하기</b></button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn g-color-gray-dark-v5 g-bg-secondary g-font-size-12 text-uppercase g-py-12 g-px-25" type="button" id="cancel"><b>취소하기</b></button>
                </div>
              
              <!-- End Contact Form -->
            </div>
            <!-- End Tab panes -->
          </div>
      </div>
      
      <!-- End Help -->
      </div>
      </form>

      <!-- Call to Action -->

      <!-- End Call to Action -->

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
    <script src="${pageContext.request.contextPath}/assets/vendor/appear.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/chosen/chosen.jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- JS Unify -->
    <script src="${pageContext.request.contextPath}/assets/js/hs.core.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.header.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.go-to.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.tabs.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/helpers/hs.rating.js"></script>

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

        // Tabs
        $.HSCore.components.HSTabs.init('[role="tablist"]');
        
     	// initialization of rating
        $.HSCore.helpers.HSRating.init();
      });

      $(window).on('resize', function () {
        setTimeout(function () {
          $.HSCore.components.HSTabs.init('[role="tablist"]');
        }, 200);
      });
    </script>
    <script>
      $(function(){
    	 $("#cancel").click(function(){
    		 confirm("취소하시겠습니까?") ? location.href="${path}/front" : "취소";
    	 }) 
      });
    </script>
    
  </body>
</html>
