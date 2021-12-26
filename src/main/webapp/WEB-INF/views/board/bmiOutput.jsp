<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
</script>

<head>
  <!-- Page Style -->
  <style type="text/css">
    @media print {
        * { -webkit-print-color-adjust: exact; }

        .u-header,
        .footer,
        footer,
        .breadcrumbs,
        .btn {
          display: none;
        }

        .row > [class*="col-"] {
          float: left;
        }

        .col-md-3,
        .col-md-6 {
          width: 33%;
        }

        .col-lg-2 {
          width: 24%;
        }

        .g-bg-primary {
          color: #000 !important;
        }

        .g-font-size-default {
          font-size: 11px !important;
        }

        .h4,
        .h5 {
          font-size: 14px !important;
        }

        .g-pa-15 {
          padding: 10px !important;
        }

        .py-4 {
          padding-top: 10px !important;
          padding-bottom: 10px !important;
        }

        .g-py-15 {
          padding-top: 5px !important;
          padding-bottom: 5px !important;
        }

        .g-pt-100 {
          padding-top: 30px !important;
        }

        .g-pb-30 {
          padding-bottom: 0 !important;
        }

        .g-mb-30,
        .g-mb-40 {
          margin-bottom: 20px !important;
        }

        .my-2 {
          margin-top: 0;
          margin-bottom: 0;
        }

        table tr th {
          font-size: 13px !important;
        }
      }
  </style>
</head>

<body>
  <main>
    <!-- Table Striped Rows -->
    <section class="container g-pb-70">
      <div class="table-responsive">
        <table class="table table-striped">
          <thead class="g-color-white g-bg-primary text-center text-uppercase">
            <tr>
              <th class="g-brd-top-none g-font-weight-700 g-py-15 g-font-size-25" colspan="2">나의 BMI 지수 확인</th>
            </tr>
          </thead>

          <tbody class="text-center">
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15">성별</td>
              <td class="g-max-width-300 text-left g-py-15">
                <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">${cal.gender}</h4>
              </td>
            </tr>
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15">연령</td>
              <td class="g-max-width-300 text-left g-py-15">
                <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">${cal.year}년 ${cal.month}월 ${cal.day}일</h4>
              </td>
            </tr>
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15">키</td>
              <td class="g-max-width-300 text-left g-py-15">
                <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">${cal.height}cm</h4>
              </td>
            </tr>
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15">몸무게</td>
              <td class="g-max-width-300 text-left g-py-15">
                <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">${cal.weight}kg</h4>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Subtotal -->
      <div class="g-bg-gray-light-v5 mb-2">
            <ul class=" list-inline g-font-weight-600 text-uppercase py-4 g-pr-50 mb-0">
              <li class="text-left my-1">
                <h4 class="d-inline-block h6 g-font-weight-600 g-min-width-110 mb-0">비만도(BMI) 검사 결과</h4>
              </li>
              <li class="text-center my-1">
				<div class="container"> 
				  <div class="progress" style="height: 20px">
					<div class="progress-bar" style="width:${100/35*cal.bmi}%; height: 20px">			  
					  <div class="progress-text" style="height: 20px" text-center>${cal.bmi}</div>	
					</div>				  
				  </div> 
				</div>
              </li>
            </ul>
      </div><!-- End Subtotal -->

      <!-- Total -->
      <div class="row justify-content-between">
        <div class="col-md-7 align-self-center g-mb-30">
          <div class="g-bg-gray-light-v5 g-color-gray-dark-v4 g-font-weight-600 text-center text-uppercase py-4 g-pr-50 mb-3" style="width: 80%">
            <h4 class="d-inline-block h6 text-left g-font-weight-600 g-min-width-110 mb-0">당신의 비만도(BMI) 지수는 <span style="color:#FF0033">${cal.bmi}</span>로 <span style="color:#FF0033">“${cal.group}”</span> 입니다.</h4>
          </div>
        </div>
        <div class="col-md-4 align-self-center g-hidden-sm-down g-mb-30">
            <button class="btn btn-md u-btn-primary g-font-size-default rounded-0 g-py-10" type="button" onclick="location.href='${pageContext.request.contextPath}/main'">메인으로</button>
        </div>
      </div><!-- End Total -->
    </section><!-- End Table Striped Rows -->
   
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
  <script src="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>

  <!-- JS Unify -->
  <script src="${pageContext.request.contextPath}/assets/js/hs.core.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/components/hs.header.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/helpers/hs.hamburgers.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/components/hs.tabs.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/components/hs.go-to.js"></script>

  <!-- JS Customization -->
  <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

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