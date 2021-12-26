<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Title -->
  <title>커뮤니티 > 전체</title>

  <!-- Required Meta Tags Always Come First -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <!-- Favicon -->
  <link rel="shortcut icon" href="../../favicon.ico">
  <!-- Google Fonts -->
  <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans%3A400%2C300%2C500%2C600%2C700%7CPlayfair+Display%7CNoto Sans KR%7CRaleway%7CSpectral%7CRubik">
  <!-- CSS Global Compulsory -->
  <link rel="stylesheet" href="../../assets/vendor/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../../assets/vendor/icon-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="../../assets/vendor/icon-line-pro/style.css">
  <link rel="stylesheet" href="../../assets/vendor/icon-hs/style.css">
  <link rel="stylesheet" href="../../assets/vendor/animate.css">
  <link rel="stylesheet" href="../../assets/vendor/hs-megamenu/src/hs.megamenu.css">
  <link rel="stylesheet" href="../../assets/vendor/hamburgers/hamburgers.min.css">

  <!-- CSS Unify -->
  <link rel="stylesheet" href="../../assets/css/unify-core.css">
  <link rel="stylesheet" href="../../assets/css/unify-components.css">
  <link rel="stylesheet" href="../../assets/css/unify-globals.css">

  <!-- CSS Customization -->
  <link rel="stylesheet" href="../../assets/css/custom.css">
  <!-- 페이징 css -->
  <style type="text/css">
  	.pagination-container {
		margin: 100px auto;
		text-align: center;
	}	

	.pagination {
		position: relative;
	}
	
	.pagination a {
		position: relative;
		display: inline-block;
		color: #2c3e50;
		text-decoration: none;
		font-size: 1.2rem;
		padding: 8px 16px 10px;
	}
	
	.pagination a:before {
		z-index: -1;
		position: absolute;
		height: 100%;
		width: 100%;
		content: "";
		top: 0;
		left: 0;
		background-color: #2c3e50;
		border-radius: 24px;
		-webkit-transform: scale(0);
		transform: scale(0);
		transition: all 0.2s;
	}
	
	.pagination a:hover, .pagination a .pagination-active {
		color: #fff;
	}
	
	.pagination a:hover:before, .pagination a .pagination-active:before {
		-webkit-transform: scale(1);
		transform: scale(1);
	}
	
	.pagination .pagination-active {
		color: #fff;
	}
	
	.pagination .pagination-active:before {
		-webkit-transform: scale(1);
		transform: scale(1);
	}
	
	.pagination-newer {
		margin-right: 50px;
	}
	
	.pagination-older {
		margin-left: 50px;
	}
  </style>
</head>

<body>
  <main>

    <!-- Breadcrumbs -->
    <section class="g-bg-gray-light-v5 g-py-80">
      <div class="container text-center">
        <h2 class="h2 g-color-black g-font-weight-600">커뮤니티 > 전체</h2>

        <ul class="u-list-inline">
          <li class="list-inline-item g-mr-5">
            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="#">Home</a>
            <i class="g-color-gray-light-v2 g-ml-5">/</i>
          </li>
          <li class="list-inline-item g-mr-5">
            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="#">커뮤니티</a>
            <i class="g-color-gray-light-v2 g-ml-5">/</i>
          </li>
          <li class="list-inline-item g-color-primary">
            <span>전체</span>
          </li>
        </ul>
      </div>
    </section>
    <!-- End Breadcrumbs -->

	<!-- 게시물 리스트 start -->
	<c:choose>
	<c:when test="${empty requestScope.pageList}">
            <p align="center"><b><span style="font-size:9pt;">등록된 게시물이 없습니다.</span></b></p>
    </c:when>
    <c:otherwise>
    
    <!-- Blog Minimal Blocks -->
    <div class="container g-pt-100 g-pb-20">
      <div class="row justify-content-between">
        <div class="col-lg-9 order-lg-2 g-mb-80">
          <div class="g-pl-20--lg">
            <!-- Blog Minimal Blocks -->
            <c:forEach items="${requestScope.pageList.content}" var="board">
            <article class="g-mb-100">
              <div class="g-mb-30">
                <span class="d-block g-color-gray-dark-v4 g-font-weight-700 g-font-size-12 text-uppercase mb-2">1 June 2017</span>
                <h2 class="h4 g-color-black g-font-weight-600 mb-3">
                    <a class="u-link-v5 g-color-black g-color-primary--hover" href="#">${board.boardTitle}</a>
                  </h2>
                <p class="g-color-gray-dark-v4 g-line-height-1_8">Clark Valberg is the founder and CEO of InVision. If you are a designer, you have probably gotten an email from Clark or from InVision at one time or another, but if you’re not familiar with the company.</p>
                <a class="g-font-size-13" href="#">Read more...</a>
              </div>

              <ul class="list-inline g-brd-y g-brd-gray-light-v3 g-font-size-13 g-py-13 mb-0">
                <li class="list-inline-item g-color-gray-dark-v4 mr-2">
                  <span class="d-inline-block g-color-gray-dark-v4">
                      <img class="g-g-width-20 g-height-20 rounded-circle mr-2" src="../../assets/img-temp/100x100/img7.jpg" alt="Image Description">
                      Alex Teseira
                    </span>
                </li>
                <li class="list-inline-item g-color-gray-dark-v4">
                  <a class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5" href="#">
                    <i class="align-middle g-font-size-default mr-1 icon-finance-206 u-line-icon-pro"></i>
                    10 Comments
                  </a>
                </li>
                <li class="list-inline-item g-color-gray-dark-v4">
                  <a class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5" href="#">
                    <i class="align-middle g-font-size-default mr-1 icon-medical-022 u-line-icon-pro"></i>
                    57 Likes
                  </a>
                </li>
              </ul>
            </article>
            </c:forEach>
            </c:otherwise>
            </c:choose>
            <!-- End Blog Minimal Blocks -->
            <!-- 게시물 리스트 End -->

		

           
          </div>
        </div>

        <div class="col-lg-3 order-lg-1 g-brd-right--lg g-brd-gray-light-v4 g-mb-80">
          <div class="g-pr-20--lg">
            <!-- Links -->
            <div class="g-mb-50">
              <h3 class="h5 g-color-black g-font-weight-600 mb-4">Links</h3>
              <ul class="list-unstyled g-font-size-13 mb-0">
                <li>
                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="#"><i class="mr-2 fa fa-angle-right"></i> People</a>
                </li>
                <li>
                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="#"><i class="mr-2 fa fa-angle-right"></i> News Publications</a>
                </li>
                <li>
                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="#"><i class="mr-2 fa fa-angle-right"></i> Marketing &amp; IT</a>
                </li>
                <li>
                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="#"><i class="mr-2 fa fa-angle-right"></i> Business Strategy</a>
                </li>
                <li>
                  <a class="d-block active u-link-v5 g-color-black g-bg-gray-light-v5 g-font-weight-600 g-rounded-50 g-px-20 g-py-8" href="#"><i class="mr-2 fa fa-angle-right"></i> Untold Stories</a>
                </li>
              </ul>
            </div>
            <!-- End Links -->

            <hr class="g-brd-gray-light-v4 g-mt-50 mb-0">

            <div id="stickyblock-start" class="js-sticky-block g-sticky-block--lg g-pt-50" data-start-point="#stickyblock-start" data-end-point="#stickyblock-end">
              <!-- Publications -->
              <div class="g-mb-50">
                <h3 class="h5 g-color-black g-font-weight-600 mb-4">Publications</h3>
                <ul class="list-unstyled g-font-size-13 mb-0">
                  <li>
                    <article class="media g-mb-35">
                      <img class="d-flex g-width-40 g-height-40 rounded-circle mr-3" src="../../assets/img-temp/100x100/img1.jpg" alt="Image Description">
                      <div class="media-body">
                        <h4 class="h6 g-color-black g-font-weight-600">Htmlstream</h4>
                        <p class="g-color-gray-dark-v4">This is where we sit down, grab a cup of coffee and dial in the details.</p>
                        <a class="btn u-btn-outline-primary g-font-size-11 g-rounded-25" href="#">Follow</a>
                      </div>
                    </article>
                  </li>
                  <li>
                    <article class="media g-mb-35">
                      <img class="d-flex g-width-40 g-height-40 rounded-circle mr-3" src="../../assets/img-temp/100x100/img3.jpg" alt="Image Description">
                      <div class="media-body">
                        <h4 class="h6 g-color-black g-font-weight-600">Pixeel</h4>
                        <p class="g-color-gray-dark-v4">This is where we sit down, grab a cup of coffee and dial in the details.</p>
                        <a class="btn u-btn-outline-primary g-font-size-11 g-rounded-25" href="#">Follow</a>
                      </div>
                    </article>
                  </li>
                  <li>
                    <article class="media">
                      <img class="d-flex g-width-40 g-height-40 rounded-circle mr-3" src="../../assets/img-temp/100x100/img2.jpg" alt="Image Description">
                      <div class="media-body">
                        <h4 class="h6 g-color-black g-font-weight-600">WrapBootstrap</h4>
                        <p class="g-color-gray-dark-v4">This is where we sit down, grab a cup of coffee and dial in the details.</p>
                        <a class="btn u-btn-outline-primary g-font-size-11 g-rounded-25" href="#">Follow</a>
                      </div>
                    </article>
                  </li>
                </ul>
              </div>
              <!-- End Publications -->

              <hr class="g-brd-gray-light-v4 g-my-50">

              <!-- Tags -->
              <div class="g-mb-40">
                <h3 class="h5 g-color-black g-font-weight-600 mb-4">Tags</h3>
                <ul class="u-list-inline mb-0">
                  <li class="list-inline-item g-mb-10">
                    <a class="u-tags-v1 g-color-gray-dark-v4 g-color-white--hover g-bg-gray-light-v5 g-bg-primary--hover g-font-size-12 g-rounded-50 g-py-4 g-px-15" href="#">Design</a>
                  </li>
                  <li class="list-inline-item g-mb-10">
                    <a class="u-tags-v1 g-color-gray-dark-v4 g-color-white--hover g-bg-gray-light-v5 g-bg-primary--hover g-font-size-12 g-rounded-50 g-py-4 g-px-15" href="#">Art</a>
                  </li>
                  <li class="list-inline-item g-mb-10">
                    <a class="u-tags-v1 g-color-gray-dark-v4 g-color-white--hover g-bg-gray-light-v5 g-bg-primary--hover g-font-size-12 g-rounded-50 g-py-4 g-px-15" href="#">Graphic</a>
                  </li>
                  <li class="list-inline-item g-mb-10">
                    <a class="u-tags-v1 g-color-gray-dark-v4 g-color-white--hover g-bg-gray-light-v5 g-bg-primary--hover g-font-size-12 g-rounded-50 g-py-4 g-px-15" href="#">Front End Development</a>
                  </li>
                  <li class="list-inline-item g-mb-10">
                    <a class="u-tags-v1 g-color-gray-dark-v4 g-color-white--hover g-bg-gray-light-v5 g-bg-primary--hover g-font-size-12 g-rounded-50 g-py-4 g-px-15" href="#">CSS</a>
                  </li>
                  <li class="list-inline-item g-mb-10">
                    <a class="u-tags-v1 g-color-gray-dark-v4 g-color-white--hover g-bg-gray-light-v5 g-bg-primary--hover g-font-size-12 g-rounded-50 g-py-4 g-px-15" href="#">HTML</a>
                  </li>
                  <li class="list-inline-item g-mb-10">
                    <a class="u-tags-v1 g-color-gray-dark-v4 g-color-white--hover g-bg-gray-light-v5 g-bg-primary--hover g-font-size-12 g-rounded-50 g-py-4 g-px-15" href="#">Sass</a>
                  </li>
                </ul>
              </div>
              <!-- End Tags -->

              <hr class="g-brd-gray-light-v4 g-my-50">

              <!-- Newsletter -->
              <div class="g-mb-50">
                <h3 class="h5 g-color-black g-font-weight-600 mb-4">Newsletter</h3>
                <div class="input-group">
                  <span class="input-group-btn">
                      <button class="btn u-btn-primary g-rounded-left-50 g-py-13 g-px-20">
                        <i class="icon-communication-062 u-line-icon-pro g-pos-rel g-top-1"></i>
                      </button>
                    </span>
                  <input class="form-control g-brd-primary g-placeholder-gray-dark-v5 border-left-0 g-rounded-right-50 g-px-15" type="email" placeholder="Enter your email ...">
                </div>
              </div>
              <!-- End Newsletter -->
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Blog Minimal Blocks -->

    


   	<!-- 페이징 start -->
			${pageList.hasPrevious()}  /  ${pageList.hasNext()}
		<div style="text-align: center">
		
		<!-- 이전, 다음 표시하기 (한블럭당 페이지 개수 제한) -->
		<c:set var="doneLoop" value="false"/>
			\${doneLoop} = ${doneLoop}<p>
				<!--  블럭당  -->
		 <nav class="pagination-container">
			<div class="pagination">
			<c:set var="doneLoop" value="false"/>
				
				  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
				      <a class="pagination-newer" href="${pageContext.request.contextPath}/board/list?nowPage=${startPage-1}">PREV</a>
				  </c:if>
				  
						<span class="pagination-inner"> 
						  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
						  
							    <c:if test="${(i-1)>=pageList.getTotalPages()}">
							       <c:set var="doneLoop" value="true"/>
							    </c:if> 
						    
						  <c:if test="${not doneLoop}" >
						         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/board/list?nowPage=${i}">${i}</a> 
						  </c:if>
						   
						</c:forEach>
						</span> 
						 <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
						     <a class="pagination-older" href="${pageContext.request.contextPath}/board/list?nowPage=${startPage+blockCount}">NEXT</a>
						 </c:if>
		
				</div>
			</nav>  
			\${doneLoop} = ${doneLoop}<p>
			<!-- 페이징 end -->
    <a class="js-go-to u-go-to-v1" href="#" data-type="fixed" data-position='{
     "bottom": 15,
     "right": 15
   }' data-offset-top="400" data-compensation="#js-header" data-show-effect="zoomIn">
      <i class="hs-icon hs-icon-arrow-top"></i>
    </a>
  </main>

  <div class="u-outer-spaces-helper"></div>


  <!-- JS Global Compulsory -->
  <script src="../../assets/vendor/jquery/jquery.min.js"></script>
  <script src="../../assets/vendor/jquery-migrate/jquery-migrate.min.js"></script>
  <script src="../../assets/vendor/popper.js/popper.min.js"></script>
  <script src="../../assets/vendor/bootstrap/bootstrap.min.js"></script>


  <!-- JS Implementing Plugins -->
  <script src="../../assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>

  <!-- JS Unify -->
  <script src="../../assets/js/hs.core.js"></script>
  <script src="../../assets/js/components/hs.header.js"></script>
  <script src="../../assets/js/helpers/hs.hamburgers.js"></script>
  <script src="../../assets/js/components/hs.tabs.js"></script>
  <script src="../../assets/js/components/hs.sticky-block.js"></script>
  <script src="../../assets/js/components/hs.go-to.js"></script>

  <!-- JS Customization -->
  <script src="../../assets/js/custom.js"></script>

  <!-- JS Plugins Init. -->
  <script>
    $(document).on('ready', function () {
        // initialization of tabs
        $.HSCore.components.HSTabs.init('[role="tablist"]');

        // initialization of go to
        $.HSCore.components.HSGoTo.init('.js-go-to');
      });

      $(window).on('load', function () {
        // initialization of header
        $.HSCore.components.HSHeader.init($('#js-header'));
        $.HSCore.helpers.HSHamburgers.init('.hamburger');

        // initialization of HSMegaMenu component
        $('.js-mega-menu').HSMegaMenu({
          event: 'hover',
          pageContainer: $('.container'),
          breakpoint: 991
        });

        // initialization of sticky blocks
        setTimeout(function() {
          $.HSCore.components.HSStickyBlock.init('.js-sticky-block');
        }, 300);
      });

      $(window).on('resize', function () {
        setTimeout(function () {
          $.HSCore.components.HSTabs.init('[role="tablist"]');
        }, 200);
      });
  </script>





</body>

</html>