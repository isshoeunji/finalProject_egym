<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="g-bg-primary">&nbsp</div>
  <main>
  <!-- Icon Blocks -->
    <section>
      <div class="container g-pt-100 g-pb-130" style="">
        <!-- Icon Blocks -->
        <div class="row no-gutters">
          <div class="col-sm-6 col-lg-3">
            <div class="g-pr-40 g-mt-20">
              <div class="g-mb-30">
                <h3 class="h3 g-color-black g-font-weight-500 g-line-height-1_2 mb-4">비밀번호 찾기</h3>
              </div>
            </div>
          </div>
		  
          <div class="col-lg-9">
            <form method="post" action="${pageContext.request.contextPath}/findPwdByPhonePage">
                <!-- Icon Blocks -->
                <input type="hidden" name="memberId" value="${memberId}">
                <div onclick="javascript:document.forms[0].submit();" class="u-shadow-v21--hover g-brd-around g-brd-gray-light-v3 g-brd-left-none g-brd-transparent--hover g-bg-white--hover g-transition-0_3 g-cursor-pointer g-px-30 g-pt-30 g-pb-50 g-ml-minus-1">
                  <div class="mb-4">
                    <span class="u-icon-v3 u-shadow-v19 g-bg-white g-color-primary rounded-circle mb-4">
                        <i class="icon-education-087 u-line-icon-pro"></i>
                      </span>
                    <h3 class="h5 g-color-black g-font-weight-600 mb-3">휴대폰 인증</h3>
                    <p>회원정보에 등록한 휴대폰으로 인증합니다.</p>
                  </div>
                </div>
                <!-- End Icon Blocks -->
              </form>
              <form method="post" action="${pageContext.request.contextPath}/findPwdByEmailPage">
                <!-- Icon Blocks -->
                <input type="hidden" name="memberId" value="${memberId}">
                <div onclick="javascript:document.forms[1].submit();" class="mb-4  u-shadow-v21--hover g-brd-around g-brd-gray-light-v3 g-brd-left-none g-brd-transparent--hover g-bg-white--hover g-transition-0_3 g-cursor-pointer g-px-30 g-pt-30 g-pb-50 g-ml-minus-1">
                  <div class="mb-4">
                    <span class="u-icon-v3 u-shadow-v19 g-bg-white g-color-primary rounded-circle mb-4">
                        <i class="icon-education-035 u-line-icon-pro"></i>
                      </span>
                    <h3 class="h5 g-color-black g-font-weight-600 mb-3">이메일 인증</h3>
                    <p>회원정보에 등록한 이메일로 인증합니다.</p>
                  </div>
                </div>
              </form>
                <!-- End Icon Blocks -->
            </div>
          
          </div>
          <p style="float:right" class="g-color-gray-dark-v5 g-font-size-13 mb-0">아이디를 찾으시나요? <a class="g-font-weight-600" href="${pageContext.request.contextPath}/findId">아이디 찾기</a>
        </div>
        <!-- End Icon Blocks -->
		
	
    </section>
    <!-- End Icon Blocks -->
  
    <!-- <section class="g-py-150">
      <div class="container">
        <header class="text-center mb-4">
          <h2 class="h2 g-color-black g-font-weight-400">아이디 찾기</h2>
        </header>

        <div class="row g-mb-30 row justify-content-center">
          <div class="col-lg-4 g-mb-40 g-mb-0--lg">
            <ul class="list-unstyled mb-0">
              <li class="media u-shadow-v11 rounded g-pa-20 g-mb-10">
                <div class="d-flex align-self-center g-mt-3 g-mr-15">
                  <img class="g-width-40 g-height-40" src="../../assets/img-temp/logos/img6.png" alt="Image Description">
                </div>
                <div class="media-body">
                  <a class="d-block u-link-v5 g-color-main g-color-primary--hover g-font-weight-600 g-mb-3" href="">휴대폰 인증</a>
                  <span class="g-font-size-13 g-color-gray-dark-v4 g-mr-15">
                      회원정보에 등록한 휴대폰으로 인증
                    </span>
                </div>
              </li>
              <!-- <li class="media u-shadow-v11 rounded g-pa-20 g-mb-10">
                <div class="d-flex align-self-center g-mt-3 g-mr-15">
                  <img class="g-width-40 g-height-40" src="../../assets/img-temp/logos/img5.png" alt="Image Description">
                </div>
                <div class="media-body align-self-center">
                  <a class="d-block u-link-v5 g-color-main g-font-weight-600" href="">회원 정보에 등록한 휴대폰 인증</a>
                  
                </div>
                <div class="d-flex align-self-center g-mt-3 g-mr-15">
                  <i class="fa fa-angle-right"></i>
                </div>
              </li> -->

              <!-- <li class="media u-shadow-v11 rounded g-pa-20 g-mb-10">
                <div class="d-flex align-self-center g-mt-3 g-mr-15">
                  <img class="g-width-40 g-height-40" src="../../assets/img-temp/logos/img6.png" alt="Image Description">
                </div>
                <div class="media-body">
                  <a class="d-block u-link-v5 g-color-main g-color-primary--hover g-font-weight-600 g-mb-3" href="">이메일 인증</a>
                  <span class="g-font-size-13 g-color-gray-dark-v4 g-mr-15">
                      회원정보에 등록한 이메일로 인증
                    </span>
                </div>
              </li>
            </ul>
          </div>

        </div>

        <div class="text-center">
          <a class="btn btn-xl u-btn-outline-primary text-uppercase g-font-weight-600 g-font-size-12" href="#">View More Jobs</a>
        </div>
      </div>
    </section> -->
    <!-- End Popular Jobs -->

    <!-- Copyright Footer -->
    <footer class="g-bg-gray-dark-v1 g-color-white-opacity-0_8 g-py-20">
      <div class="container">
        <div class="row">
          <div class="col-md-8 text-center text-md-left g-mb-10 g-mb-0--md">
            <div class="d-lg-flex">
              <small class="d-block g-font-size-default g-mr-10 g-mb-10 g-mb-0--md">2020 &copy; All Rights Reserved.</small>
              <ul class="u-list-inline">
                <li class="list-inline-item">
                  <a class="g-color-white-opacity-0_8 g-color-white--hover" href="#">Privacy Policy</a>
                </li>
                <li class="list-inline-item">
                  <span>|</span>
                </li>
                <li class="list-inline-item">
                  <a class="g-color-white-opacity-0_8 g-color-white--hover" href="#">Terms of Use</a>
                </li>
                <li class="list-inline-item">
                  <span>|</span>
                </li>
                <li class="list-inline-item">
                  <a class="g-color-white-opacity-0_8 g-color-white--hover" href="#">License</a>
                </li>
                <li class="list-inline-item">
                  <span>|</span>
                </li>
                <li class="list-inline-item">
                  <a class="g-color-white-opacity-0_8 g-color-white--hover" href="#">Support</a>
                </li>
              </ul>
            </div>
          </div>

          <div class="col-md-4 align-self-center">
            <ul class="list-inline text-center text-md-right mb-0">
              <li class="list-inline-item g-mx-10" data-toggle="tooltip" data-placement="top" title="Facebook">
                <a href="#" class="g-color-white-opacity-0_5 g-color-white--hover">
                  <i class="fa fa-facebook"></i>
                </a>
              </li>
              <li class="list-inline-item g-mx-10" data-toggle="tooltip" data-placement="top" title="Skype">
                <a href="#" class="g-color-white-opacity-0_5 g-color-white--hover">
                  <i class="fa fa-skype"></i>
                </a>
              </li>
              <li class="list-inline-item g-mx-10" data-toggle="tooltip" data-placement="top" title="Linkedin">
                <a href="#" class="g-color-white-opacity-0_5 g-color-white--hover">
                  <i class="fa fa-linkedin"></i>
                </a>
              </li>
              <li class="list-inline-item g-mx-10" data-toggle="tooltip" data-placement="top" title="Pinterest">
                <a href="#" class="g-color-white-opacity-0_5 g-color-white--hover">
                  <i class="fa fa-pinterest"></i>
                </a>
              </li>
              <li class="list-inline-item g-mx-10" data-toggle="tooltip" data-placement="top" title="Twitter">
                <a href="#" class="g-color-white-opacity-0_5 g-color-white--hover">
                  <i class="fa fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item g-mx-10" data-toggle="tooltip" data-placement="top" title="Dribbble">
                <a href="#" class="g-color-white-opacity-0_5 g-color-white--hover">
                  <i class="fa fa-dribbble"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
    <!-- End Copyright Footer -->
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
      });

      $(window).on('resize', function () {
        setTimeout(function () {
          $.HSCore.components.HSTabs.init('[role="tablist"]');
        }, 200);
      });
  </script>

</body>
</html>