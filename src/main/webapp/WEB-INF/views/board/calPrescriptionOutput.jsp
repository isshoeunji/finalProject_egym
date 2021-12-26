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
              <th class="g-brd-top-none g-font-weight-700 g-py-15 g-font-size-25" colspan="2">칼로리 처방 받기</th>
            </tr>
          </thead>
          <tbody class="text-center">
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15">총 감량기간</td>
              <td class="g-max-width-300 text-left g-py-15">
                <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">${cal.targetWeightDate} 개월</h4>
              </td>
            </tr>
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15">현재 체중</td>
              <td class="g-max-width-300 text-left g-py-15">
                <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">${cal.height} kg</h4>
              </td>
            </tr>
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15">목표 체중</td>
              <td class="g-max-width-300 text-left g-py-15">
                <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">${cal.targetWeight} kg</h4>
              </td>
            </tr>
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15">표준 체중</td>
              <td class="g-max-width-300 text-left g-py-15">
                <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">${cal.standardWeight} kg</h4>
              </td>
            </tr>
          </tbody>
        </table>
        <table class="table table-striped">
          <thead class="g-color-white g-bg-primary text-center text-uppercase">
            <tr>
              <td class="g-brd-top-none g-font-weight-700 g-py-15 g-font-size-25 text-cneter" colspan="2">하루 소비 칼로리는 <span style="color:#FF0033">${cal.total}</span>kcal</td>
            </tr>
          </thead>
            <tbody class="text-center">
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15" colspan="2">
			    <div class="container"> 
				  <div class="progress" style="height: 30px">
					<div class="progress-bar" style="width:${100/(cal.bmr+cal.amr+cal.efd)*cal.bmr}%; height: 30px; background-color:#66FF66">			  
					  <div class="progress-text text-center" style="height: 30px">${cal.bmr}</div>	
					</div>				  
					<div class="progress-bar" style="width:${100/(cal.bmr+cal.amr+cal.efd)*cal.amr}%; height: 30px; background-color:#FFCC33">			  
					  <div class="progress-text" style="height: 30px">${cal.amr}</div>	
					</div>				  
					<div class="progress-bar" style="width:${100/(cal.bmr+cal.amr+cal.efd)*cal.efd}%; height: 30px; background-color:#FF9900">			  
					  <div class="progress-text text-center" style="height: 30px">${cal.efd}</div>	
					</div>				  
				  </div> 
				</div>
			  </td>
            </tr>
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15 text-center" colspan="2">
                <div class="container"> 
				  <div class="progress" style="height: 30px">
					<div class="progress-bar" style="width:18%; height: 20px; background-color:#00ff0000"></div>			  
					<div class="progress-bar" style="width:21%; height: 20px; background-color:#66FF66">			  
					  <div class="progress-text" style="height: 20px">기초대사량</div>	
					</div>				  
					<div class="progress-bar" style="width:21%; height: 20px; background-color:#FFCC33">			  
					  <div class="progress-text" style="height: 20px">활동대사량</div>	
					</div>				  
					<div class="progress-bar" style="width:21%; height: 20px; background-color:#FF9900">			  
					  <div class="progress-text" style="height: 20px">소화에 필요한 에너지</div>	
					</div>				  
					<div class="progress-bar" style="width:19%; height: 20px; background-color:#00ff0000"></div>			  
				  </div>
				  <ul class="text-left ">
				    <li>하루 소비 칼로리는 일상생활을 하는데 기본적으로 소비되는 칼로리입니다.</li>
					<li>칼로리 처방 시, 선택하는 활동량에 따라 달라질 수 있습니다.</li>
				  </ul>
				</div>
              </td>
            </tr>
          </tbody>
         </table>
         <table class="table table-striped">
          <thead class="g-color-white g-bg-primary text-center text-uppercase">
            <tr>
              <td class="g-brd-top-none g-font-weight-700 g-py-15 g-font-size-25 text-cneter" colspan="2">처방 칼로리</td>
            </tr>
          </thead>
            <tbody class="text-center">
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15">하루 동안 섭취해야 할 음식 칼로리</td>
              <td class="g-max-width-300 text-left g-py-15">
                <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">${cal.dailyEatCal } Kcal</h4>
              </td>
            </tr>
            <tr>
              <td class="g-width-150 g-color-gray-dark-v4 g-font-weight-600 g-py-15">하루 동안 운동으로 소모해야 할 칼로리</td>
			  <td class="g-max-width-300 text-left g-py-15">
                <h4 class="g-color-gray-dark-v4 g-font-weight-700 g-font-size-16">${cal.dailyWeightTraining } Kcal</h4>
              </td>
            </tr>
            
          </tbody>
         </table>
      </div>

      <!-- Total -->
      <div class="row justify-content-between">
        <div class="col-md-7 align-self-center g-mb-30">
          <div class="g-bg-gray-light-v5 g-color-black g-font-weight-600 text-center text-uppercase py-4 mb-3" style="width: 100%">
            <ul class="text-left g-color-gray-dark-v4 g-font-weight-600 g-py-15 ">
              <li>일일 음식 섭취 칼로리가 1000kcal 이하일 때는 감량 목표를 하향 조절해 주세요.</li>
              <li>1000kcal 이하의 음식 섭취는 영양 불균형 및 요요 현상의 원인이 될 수 있어요.</li>
            </ul>
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