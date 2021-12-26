<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Title -->
  <title>챌린지 boardPage</title>
  <link href="https://fonts.google.com/noto/specimen/Noto+Sans+KR?query=noto" rel="stylesheet">
  <!-- Required Meta Tags Always Come First -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
  <!-- Google Fonts -->
  <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans%3A400%2C300%2C500%2C600%2C700%7CPlayfair+Display%7CNoto Sans KR%7CRaleway%7CSpectral%7CRubik">
  <!-- CSS Global Compulsory -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-line-pro/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-hs/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hamburgers/hamburgers.min.css">

  <!-- CSS Unify -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/unify-core.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/unify-components.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/unify-globals.css">

  <!-- CSS Customization -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
  
</head>

<body>
  <main>  
	<c:choose>
	<c:when test="${challengeCategory == 1}">
		<section class="g-bg-gray-light-v5 g-py-80">
	      <div class="container text-center">
	        <h2 class="h2 g-color-black g-font-weight-600">30일 아침밥 챙기기</h2>
	        <ul class="u-list-inline">
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/challenge/select">30일 챌린지</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-color-primary">
	            <span>30일 아침밥 챙기기</span>
	          </li>
	        </ul>
	      </div>
   	   </section>
	</c:when>
	<c:when test="${challengeCategory == 2}">
		<section class="g-bg-gray-light-v5 g-py-80">
	      <div class="container text-center">
	        <h2 class="h2 g-color-black g-font-weight-600">30일 유산소 운동하기</h2>
	
	        <ul class="u-list-inline">
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/challenge/select">30일 챌린지</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-color-primary">
	            <span>30일 유산소 운동하기</span>
	          </li>
	        </ul>
	      </div>
   	   </section>
	</c:when>
	<c:when test="${challengeCategory == 3}">
		<section class="g-bg-gray-light-v5 g-py-80">
	      <div class="container text-center">
	        <h2 class="h2 g-color-black g-font-weight-600">30일 플랭크하기</h2>
	
	        <ul class="u-list-inline">
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/challenge/select">30일 챌린지</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-color-primary">
	            <span>30일 플랭크하기</span>
	          </li>
	        </ul>
	      </div>
   	   </section>
	</c:when>
	<c:when test="${challengeCategory == 4}">
		<section class="g-bg-gray-light-v5 g-py-80">
	      <div class="container text-center">
	        <h2 class="h2 g-color-black g-font-weight-600">30일 전신운동하기</h2>
	
	        <ul class="u-list-inline">
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/challenge/select">30일 챌린지</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-color-primary">
	            <span>30일 전신운동하기</span>
	          </li>
	        </ul>
	      </div>
   	   </section>
	</c:when>
	
	<c:otherwise>
		<section class="g-bg-gray-light-v5 g-py-80">
		      <div class="container text-center">
		        <h2 class="h2 g-color-black g-font-weight-600">30일 챌린지</h2>
		
		        <ul class="u-list-inline">
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home </a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/challenge/select">30일 챌린지</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-color-primary">
		            <span>전체</span>
		          </li>
		        </ul>
		      </div>
	   	   </section>
	</c:otherwise>
	</c:choose>

    <!-- Blog Minimal Blocks -->
    <div class="container g-pt-100 g-pb-20">
      <div class="row justify-content-between">
        <div class="col-lg-9 order-lg-2 g-mb-80">
          <div class="g-pl-20--lg">
            <!-- Blog Minimal Blocks -->
            <!-- 게시물 리스트 start -->
			<c:choose>
			<c:when test="${empty requestScope.pageList.content}">
		            <p align="center"><b><span style="font-size:9pt;">등록된 게시물이 없습니다.</span></b></p>
		    </c:when>
		    <c:otherwise>
            <c:forEach items="${requestScope.pageList.content}" var="board">
            <article class="g-mb-50">
              <div class="g-mb-30">
                <span class="d-block g-color-gray-dark-v4 g-font-weight-700 g-font-size-12 text-uppercase mb-2">작성일 : ${board.boardRegdate}</span>
                <h2 class="h4 g-color-black g-font-weight-600 mb-3"> 
                    <a class="u-link-v5 g-color-black g-color-primary--hover" href="${pageContext.request.contextPath}/challenge/detail/${board.boardNo}">${board.boardTitle}</a>
                </h2>
              </div>

              <ul class="list-inline g-brd-y g-brd-gray-light-v3 g-font-size-13 g-py-13 mb-0">
                <li class="list-inline-item g-color-gray-dark-v4 mr-2">
                  <span class="d-inline-block g-color-gray-dark-v4">
                      작성자 : ${board.member.memberNickname}
                    </span>
                </li>
 <!--                <li class="list-inline-item g-color-gray-dark-v4">
                  <a class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5" href="#">
                    <i class="align-middle g-font-size-default mr-1 icon-finance-206 u-line-icon-pro"></i>
                    10 Comments
                  </a>
                </li> -->
                <li class="list-inline-item g-color-gray-dark-v4">
                  <a class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5" href="#">
                    <i class="align-middle g-font-size-default mr-1 icon-medical-054 u-line-icon-pro"></i>
                    ${board.boardReadnum} Views
                  </a>
                </li>
              </ul>
            </article>
            </c:forEach>
            </c:otherwise>
            </c:choose>
            <!-- End Blog Minimal Blocks -->
            <!-- 게시물 리스트 End -->
            
            
		 <!-- Pagination -->
        <nav class="g-mb-100" aria-label="Page Navigation">
        <ul class="list-inline mb-0 text-center">
          	<c:set var="doneLoop" value="false"/>
            <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/challenge/select?nowPage=${startPage-1}" aria-label="Next">
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
				     <a class="${i==nowPage?'active u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--active g-color-white g-bg-primary--active g-font-size-12 rounded-circle g-pa-5':'u-pagination-v1__item g-width-30 g-height-30 g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5'}" href="${pageContext.request.contextPath}/challenge/select/${challengeCategory}?nowPage=${i}">${i}</a> 
		            </li>
		         </c:if>
            </c:forEach>
            <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/challenge/select/${challengeCategory}?nowPage=${startPage+blockCount}" aria-label="Next">
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
            <span><a class="btn u-btn-outline-primary g-font-size-11 g-rounded-25" style="float: right;" href="${pageContext.request.contextPath}/challenge/write">글쓰기</a></span>
          </ul>
        </nav>
        <!-- End Pagination -->
		

           
          </div>
        </div>
        

        <div class="col-lg-3 order-lg-1 g-brd-right--lg g-brd-gray-light-v4 g-mb-80">
          <div class="g-pr-20--lg">
          <!-- Start 사이드 메뉴(BMI, 칼로리계산) -->
            <div class="g-mb-50">
              <!-- Strat BMI button -->
              <div class="input-group g-mb-10">
                <span class="input-group-btn">
                  <button class="btn u-btn-primary g-rounded-left-50 g-py-13 g-px-20" onclick="location.href='${pageContext.request.contextPath}/bmiInput'">
                    <i class="icon-sport-086 u-line-icon-pro g-pos-rel g-top-1"></i>
                  </button>
                </span>
                <button class="form-control g-brd-primary g-placeholder-gray-dark-v5 border-left-0 g-rounded-right-50 g-px-15 g-color-primary--hover" onclick="location.href='${pageContext.request.contextPath}/bmiInput'">내 BMI지수 계산하기</button>
              </div><!-- End BMI button -->
              
              <!-- Strat 칼로리 처방 -->
              <div class="input-group">
                <span class="input-group-btn">
                  <button class="btn u-btn-primary g-rounded-left-50 g-py-13 g-px-20" onclick="location.href='${pageContext.request.contextPath}/calPreInput'">
                    <i class="icon-medical-099 u-line-icon-pro g-pos-rel g-top-1"></i>
                  </button>
                </span>
                <button class="form-control g-brd-primary g-placeholder-gray-dark-v5 border-left-0 g-rounded-right-50 g-px-15 g-color-primary--hover" onclick="location.href='${pageContext.request.contextPath}/calPreInput'">칼로리 처방받기</button>
              </div><!-- End 칼로리 처방 -->
            </div><!-- End 사이드 메뉴(BMI, 칼로리계산) -->
                
            <hr class="g-brd-gray-light-v4 g-mt-50 mb-0">
            <!-- Links -->
              <div class="g-mb-50">
		      	<h3 class="h5 g-color-black g-font-weight-600 mb-4 g-pt-50">30일 챌린지</h3>
		        <ul class="list-unstyled g-font-size-13 mb-0">
		        	<li>
		        		<a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/challenge/select/1"><i class="mr-2 fa fa-angle-right"></i>30일 아침밥 챙기기</a>
		            </li>
		            <li>
		            	<a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/challenge/select/2"><i class="mr-2 fa fa-angle-right"></i>30일 유산소 운동하기</a>
		            </li>
		            <li>
		            	<a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/challenge/select/3"><i class="mr-2 fa fa-angle-right"></i>30일 플랭크하기</a>
		            </li>
		            <li>
		            	<a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/challenge/select/4"><i class="mr-2 fa fa-angle-right"></i>30일 전신운동하기</a>
		            </li>
		      	</ul>
              </div>
            <!-- End Links -->

            <hr class="g-brd-gray-light-v4 g-mt-50 mb-0">

          </div>
        </div>
      </div>
    </div>
    <!-- End Blog Minimal Blocks -->

    


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