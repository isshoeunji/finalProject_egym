<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  <main>
    <!-- Promo Block -->
    <section class="g-pos-rel">
      <div class="dzsparallaxer auto-init height-is-based-on-content use-loading mode-scroll" data-options='{direction: "reverse", settings_mode_oneelement_max_offset: "150"}'>
        <div class="divimage dzsparallaxer--target w-100 g-bg-cover g-bg-pos-top-center g-bg-img-hero g-bg-bluegray-opacity-0_2--after" style="height: 130%; background-image: url(${pageContext.request.contextPath}/assets/img-temp/1920x700/main1.jpg);"></div>

        <div class="container g-bg-cover__inner g-py-140 my-30" >
          <div class="row align-items-center">
            <div class="col-lg-6 g-mb-30 g-mb-0--lg">
              <h2 class="h1 g-mb-30 text-underline" style="color: green; font-weight: 700;">
                  <span><b>오늘과 다른</b></span><br>
                  <span><b>내일의 나를 위하여</b></span>
                </h2>
              <h3 class="h4 g-color-white">
                  <span class="g-bg-black-opacity-0_6 g-px-5">지금 바로 EGYM과 함께</span><br>
                  <span class="g-bg-black-opacity-0_6 g-px-5">시작하세요</span>
                </h3>
            </div>
            <div class="col-lg-6">
              <!-- Vimeo Example -->
              <div class="embed-responsive embed-responsive-16by9">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/WdT4wzneh24" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
              </div>
              <!-- End Vimeo Example -->
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Promo Block -->

    <!-- 메인 아이콘 -->
    <section class="g-py-200">
      <div class="container">
        <div class="row no-gutters">
          
          <div class="col-lg-4 g-px-40 g-mb-50 g-mb-0--lg">
            <!-- 칼로리처방 받기 -->
            <div class="text-center" onclick="location.href='${pageContext.request.contextPath}/calPreInput'" style="cursor:pointer;">
              <span class="d-inline-block u-icon-v3 u-icon-size--xl g-bg-primary g-color-white rounded-circle g-mb-30">
                  <i class="icon-communication-081 u-line-icon-pro"></i>
                </span>
              <h3 class="h5 g-color-gray-dark-v2 g-font-weight-600 text-uppercase mb-3">칼로리처방 받기</h3>
              <p class="mb-0">칼로리를 알고 다이어트 하자!!</p>
            </div><!-- 칼로리처방 받기 -->
          </div>

          <div class="col-lg-4 g-brd-left--lg g-brd-gray-light-v4 g-px-40 g-mb-50 g-mb-0--lg">
            <!-- 나의 BMI 지수는? -->
            <div class="text-center" onclick="location.href='${pageContext.request.contextPath}/bmiInput'" style="cursor:pointer;">
              <span class="d-inline-block u-icon-v3 u-icon-size--xl g-bg-primary g-color-white rounded-circle g-mb-30">
                  <i class="icon-finance-086 u-line-icon-pro"></i>
                </span>
              <h3 class="h5 g-color-gray-dark-v2 g-font-weight-600 text-uppercase mb-3">나의 BMI 지수는?</h3>
              <p class="mb-0">나는 얼마나 날씬할까?</p>
            </div>
            <!-- End 나의 BMI 지수는? -->
          </div>

          <div class="col-lg-4 g-brd-left--lg g-brd-gray-light-v4 g-px-40">
            <!-- 커뮤니티 바로가기 -->
            <div class="text-center" onclick="location.href='${pageContext.request.contextPath}/board/select/0'" style="cursor:pointer;">
              <span class="d-inline-block u-icon-v3 u-icon-size--xl g-bg-primary g-color-white rounded-circle g-mb-30">
                  <i class="icon-communication-057 u-line-icon-pro"></i>
                </span>
              <h3 class="h5 g-color-gray-dark-v2 g-font-weight-600 text-uppercase mb-3">커뮤니티 바로가기</h3>
              <p class="mb-0">좋은 정보는 공유하자</p>
            </div>
            <!-- End 커뮤니티 바로가기 -->
          </div>
        </div>
      </div>
    </section>
    <!-- End 메인 아이콘 -->

    <a class="js-go-to u-go-to-v1" href="#" data-type="fixed" data-position='{
     "bottom": 15,
     "right": 15
   }' data-offset-top="400" data-compensation="#js-header" data-show-effect="zoomIn">
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
  <script src="${pageContext.request.contextPath}/assets/vendor/dzsparallaxer/dzsparallaxer.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/dzsparallaxer/dzsscroller/scroller.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/dzsparallaxer/advancedscroller/plugin.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/fancybox/jquery.fancybox.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/typedjs/typed.min.js"></script>

  <!-- JS Unify -->
  <script src="${pageContext.request.contextPath}/assets/js/hs.core.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/components/hs.carousel.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/components/hs.header.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/helpers/hs.hamburgers.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/components/hs.tabs.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/components/hs.popup.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/components/text-animation/hs.text-slideshow.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/components/hs.go-to.js"></script>

  <!-- JS Customization -->
  <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

  <!-- JS Plugins Init. -->
  <script>
    $(document).on('ready', function () {
        // initialization of carousel
        $.HSCore.components.HSCarousel.init('.js-carousel');

        // initialization of tabs
        $.HSCore.components.HSTabs.init('[role="tablist"]');

        // initialization of popups
        $.HSCore.components.HSPopup.init('.js-fancybox');

        // initialization of go to
        $.HSCore.components.HSGoTo.init('.js-go-to');

        // initialization of text animation (typing)
        $(".u-text-animation.u-text-animation--typing").typed({
          strings: [
            "an awesome template",
            "perfect template",
            "just like a boss"
          ],
          typeSpeed: 60,
          loop: true,
          backDelay: 1500
        });
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
      });

      $(window).on('resize', function () {
        setTimeout(function () {
          $.HSCore.components.HSTabs.init('[role="tablist"]');
        }, 200);
      });
  </script>

</body>

</html>