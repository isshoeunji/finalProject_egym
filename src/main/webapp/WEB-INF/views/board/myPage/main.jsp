<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Title -->
  <title>마이페이지 - main</title>

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
  <!-- CSS Global Icons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-line/css/simple-line-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-etlinefont/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-line-pro/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-hs/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">
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

    <!-- Breadcrumb -->
    <section class="g-my-30">
      <div class="container">
        <ul class="u-list-inline">
          <li class="list-inline-item g-mr-7">
            <a class="u-link-v5 g-color-main g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
            <i class="fa fa-angle-right g-ml-7"></i>
          </li>
          <li class="list-inline-item g-color-primary">
            <span>MyPage</span>
          </li>
        </ul>
      </div>
    </section>
    <!-- End Breadcrumb -->

    <section class="g-mb-100">
      <div class="container">
        <div class="row">
          <!-- Profile Sidebar -->
          <div class="col-lg-3 g-mb-50 g-mb-0--lg">
            <!-- User Image -->
            <div class="u-block-hover g-pos-rel">
              <figure>
                <c:choose>
                  <c:when test="${empty member.profileImage}">
                    <img class="img-fluid  g-width-260 g-height-260" src="${pageContext.request.contextPath}/save/myPage/defaultImg.jpg" alt="Image Description">
                  </c:when>
                  <c:otherwise>
                    <img class="img-fluid  g-width-260 g-height-260" src="${pageContext.request.contextPath}/save/myPage/${member.profileImage}" onerror="this.src='${pageContext.request.contextPath}/save/myPage/notimg.png'" alt="Image Description">
                  </c:otherwise>
                </c:choose>
                           
              </figure>

              <!-- End Figure Caption -->

              <!-- User Info -->
              <span class="g-pos-abs g-top-20 g-left-0">

                </span>
              <!-- End User Info -->
            </div>
            <!-- User Image -->

            <!-- Sidebar Navigation -->
            <div class="list-group list-group-border-0 g-mb-40">
              <!-- 홈 -->
              <a href="${pageContext.request.contextPath}/user/myPage/" class="list-group-item justify-content-between active">
                <span><i class="icon-home g-pos-rel g-top-1 g-mr-8"></i>나의 페이지</span>
                <span class="u-label g-font-size-11 g-bg-white g-color-main g-rounded-20 g-px-10"></span>
              </a>
              <!-- End 홈 -->

              <!-- 나의 게시물 -->
              <a href="${pageContext.request.contextPath}/user/myPage/board" class="list-group-item list-group-item-action justify-content-between">
                <span><i class="icon-layers g-pos-rel g-top-1 g-mr-8"></i>나의 게시물</span>
                <span class="u-label g-font-size-11 g-bg-primary g-rounded-20 g-px-10"></span>
              </a>
              <!-- End 나의 게시물 -->

              <!-- 나의 댓글 -->
              <a href="${pageContext.request.contextPath}/user/myPage/reply" class="list-group-item list-group-item-action justify-content-between">
                <span><i class="icon-bubbles g-pos-rel g-top-1 g-mr-8"></i>나의 댓글</span>
                <span class="u-label g-font-size-11 g-bg-pink g-rounded-20 g-px-8"></span>
              </a>
              <!-- End 나의 댓글 -->
              
              <!-- 정보 수정 -->
              <a href="${pageContext.request.contextPath}/user/myPage/setting" class="list-group-item list-group-item-action justify-content-between">
                <span><i class="icon-settings g-pos-rel g-top-1 g-mr-8"></i>내정보</span>
                <span class="u-label g-font-size-11 g-bg-cyan g-rounded-20 g-px-8"></span>
              </a>
              <!-- End 정보수정 -->
            </div>
            <!-- End Sidebar Navigation -->
          </div>
          <!-- End Profile Sidebar -->
          
		  <!-- Profile Content -->
          <div class="col-lg-9">
            <!-- Overall Statistics -->
            <div class="row g-mb-40">
            
            
            <!-- START 나의 등급 -->
              <c:forEach items="${requestScope.gradeList}" var="grade">
	              <c:choose>
	              	<c:when test="${member.info.memberExp >= grade.levelMin and member.info.memberExp <= grade.levelMax}">		              
		              <div class="col-md-6 g-mb-30 g-mb-0--md">
		                <div class="g-bg-cyan g-color-white g-pa-25">
		                  <header class="d-flex text-uppercase g-mb-40">
		                    <!-- <i class="icon-people align-self-center display-4 g-mr-20"></i> -->
		                    <img class="img-fluid  g-width-80 g-height-80" src="${pageContext.request.contextPath}/save/grade/${grade.levelImg}" alt="Image Description">
		
		                    <div class="g-line-height-1" style="margin-left: 10px; margin-top: 10px">
		                      <h4 class="h5"> 나의 경험치</h4>
		                      <h4 class="h5"> ${grade.levelName} 등급 </h4>
		                      <!-- <div class="js-counter g-font-size-30" data-comma-separated="true">12345</div> -->
		                    </div>
		                  </header>
		
		                  <div class="d-flex justify-content-between text-uppercase g-mb-25">
		                    <div class="g-line-height-1">
		                      <h5 class="h6 g-font-weight-600">현재 경험치</h5>
		                      <div class="js-counter g-font-size-16" data-comma-separated="true">${member.info.memberExp}</div>
		                    </div>
		
		                    <div class="text-right g-line-height-1">
		                      <h5 class="h6 g-font-weight-600">다음 등급까지</h5>
		                      <div class="js-counter g-font-size-16" data-comma-separated="true">${grade.levelMax - member.info.memberExp + 1}</div>
		                    </div>
		                  </div>
		
		                  <h6 class="g-mb-10">다음 등급까지<span class="float-right g-ml-10"><fmt:formatNumber value="${100 - ((member.info.memberExp - grade.levelMin) / (grade.levelMax - grade.levelMin + 1) * 100)}" pattern="0"/>% 남았습니다.</span></h6>
		                  <div class="js-hr-progress-bar progress g-bg-black-opacity-0_1 rounded-0 g-mb-10">
		                    <div class="js-hr-progress-bar-indicator progress-bar g-bg-white u-progress-bar--xs" role="progressbar" style="width: ${(member.info.memberExp - grade.levelMin) / (grade.levelMax - grade.levelMin + 1) * 100}%;" aria-valuenow="${member.info.memberExp}" aria-valuemin="${grade.levelMin}" aria-valuemax="${grade.levelMax}"></div>
		                  </div>
		                  <small class="g-font-size-12"><fmt:formatNumber value="${(member.info.memberExp - grade.levelMin) / (grade.levelMax - grade.levelMin + 1) * 100}" pattern="0"/>% </small>
		                </div>
		              </div>
		            </c:when>		            
	              </c:choose>
              </c:forEach>
              <!-- 나의 등급 End -->
              
			  <!-- START 다짐메세지 -->
              <div class="col-md-6">
                <div class="g-bg-purple g-color-white g-pa-25" style="word-break:break-all;">
                  <header class="d-flex text-uppercase g-mb-40">
                    <i class="icon-layers align-self-center display-4 g-mr-20"></i>

                    <div class="g-line-height-1">
                      <h4 class="h5">&nbsp</h4>
                      <h4 class="h5">다짐 메세지</h4>
                    </div>
                  </header>

                  <div class="d-flex justify-content-between text-uppercase g-mb-25">
                    <div class="g-line-height-1" style="word-break:break-all; ">
                      <c:choose>
                      	<c:when test="${empty member.memberMessage}">
                      		<h5 class="h6 g-font-weight-600">다짐 메세지를 작성해주세요!</h5>
                      	</c:when>
                      	<c:otherwise>
                      		<h5 class="h6 g-font-weight-600">${member.memberMessage}</h5>
                      	</c:otherwise>
                      </c:choose> 
                      <div>&nbsp</div>
                    </div>

                    <div class="text-right g-line-height-1">
                      <h5 class="h6 g-font-weight-600">&nbsp</h5>
                      <div>&nbsp</div>
                      <div>&nbsp</div>
                    </div>
                  </div>

                  <h6 class="g-mb-10">&nbsp<span class="float-right g-ml-10">&nbsp</span></h6>
                  <div class="js-hr-progress-bar progress g-bg-black-opacity-0_1 rounded-0 g-mb-10">
                    <div class="js-hr-progress-bar-indicator progress-bar g-bg-white u-progress-bar--xs" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="0"></div>
                  </div>
                  <small class="g-font-size-12">&nbsp</small>
                </div>
              </div>
              <!-- End 다짐메세지 -->
            </div>
            <!-- End Overall Statistics -->

            <!-- Projects & Activities Panels -->
            <div class="row g-mb-40">
              <div class="col-lg-6 g-mb-40 g-mb-0--lg">
                <!-- member.Info Panel -->
                <div class="card border-0">
                  <!-- Panel Header -->
                  <div class="card-header d-flex align-items-center justify-content-between g-bg-gray-light-v5 border-0 g-mb-15">
                    <h3 class="h6 mb-0">
                        <i class="icon-layers g-pos-rel g-top-1 g-mr-5"></i>활동정보
                      </h3>
                  </div>
                  <!-- End Panel Header -->

                  <!-- Panel Body -->
                  <div class="js-scrollbar card-block u-info-v1-1 g-bg-white-gradient-v1--after g-height-400 g-pa-0">
                    <ul class="list-unstyled">
                      <li class="media g-brd-around g-brd-gray-light-v4 g-brd-left-3 g-brd-blue-left rounded g-pa-20 g-mb-10">
                        <div class="d-flex g-mt-2 g-mr-15">  
                          <img class="g-width-40 g-height-40 rounded-circle" src="${pageContext.request.contextPath}/save/icon/별.png" alt="Image Description">
                        </div>
                        <div class="media-body">
                          <div class="d-flex justify-content-between">
                            <h5 class="h6 g-font-weight-600 g-color-black">출석 횟수 : ${member.info.attendNo}</h5>
                          </div>
                          <fmt:parseDate var="cntday" value="${member.memberJoindate}" pattern="yyyy-MM-dd"/>
                          <fmt:formatDate  var="day" value="${cntday}" type="DATE" pattern="yyyy.MM.dd"/>
                          <p>가입날짜 : ${day}</p>
                        </div>
                      </li>

                      <li class="media g-brd-around g-brd-gray-light-v4 g-brd-left-3 g-brd-pink-left rounded g-pa-20 g-mb-10">
                        <div class="d-flex g-mt-2 g-mr-15">
                          <img class="g-width-40 g-height-40 rounded-circle" src="${pageContext.request.contextPath}/save/icon/list.png" alt="Image Description">
                        </div>
                        <div class="media-body">
                          <div class="d-flex justify-content-between">
                            <h5 class="h6 g-font-weight-600 g-color-black">작성한 게시물 수</h5>
                          </div>
                          <p>지금까지 ${member.info.contentNo}개를 작성했습니다.</p>
                        </div>
                      </li>
                    </ul>
                  </div>
                  <!-- End Panel Body -->
                </div>
                <!-- End memberInfo Panel -->
              </div>

              <div class="col-lg-6">
                <!-- Challenge Panel -->
                <div class="card border-0">
                  <div class="card-header d-flex align-items-center justify-content-between g-bg-gray-light-v5 border-0 g-mb-15">
                    <h3 class="h6 mb-0">
                        <i class="icon-directions g-pos-rel g-top-1 g-mr-5"></i>도전한 30일챌린지 목록
                      </h3>
                  </div>

                  <div class="js-scrollbar card-block  u-info-v1-1 g-bg-white-gradient-v1--after g-height-400 g-pa-0">
                    <ul class="list-unstyled">
                                          
                      <c:choose>
					  <c:when test="${empty requestScope.challengeList}">
				            <p align="center"><b><span style="font-size:9pt;">도전중인 챌린지가 없습니다.</span></b></p>
				      </c:when>
				      <c:otherwise>
				      <c:forEach items="${requestScope.challengeList}" var="challenge">
                    

                      <li class="d-flex justify-content-start g-brd-around g-brd-gray-light-v4 g-pa-20 g-mb-10">
                        <div class="g-mt-2">
                          <img class="g-width-50 g-height-50 rounded-circle" src="${pageContext.request.contextPath}/save/icon/smallsmile.png" alt="Image Description">
                        </div>
                        <div class="align-self-center g-px-10">
                          <h5 class="h6 g-font-weight-600 g-color-black g-mb-3">
                              <a class="g-mr-5" href="${pageContext.request.contextPath}/user/myPage/challenge/${challenge.challengeNo}">
                                <c:if test="${challenge.challengeCategory == 1 }">
                              		30일 아침밥 챙기기
                              	</c:if>
                              	<c:if test="${challenge.challengeCategory == 2 }">
                              		30일 유산소 운동하기
                              	</c:if>
                              	<c:if test="${challenge.challengeCategory == 3 }">
                              		30일 플랭크하기
                              	</c:if>
                              	<c:if test="${challenge.challengeCategory == 4 }">
                              		30일 전신운동하기
                              	</c:if>
                              </a>
                              <fmt:parseDate var="cntday" value="${challenge.challengeDate}" pattern="yyyy-MM-dd"/><br>
                              <fmt:formatDate  var="day" value="${cntday}" type="DATE" pattern="yyyy.MM.dd"/>
                              <small class="g-font-size-12 g-color-blue">${day} 도전시작!</small>
                            </h5>
                          <c:if test="${challenge.challengeState == 0 }">
                          	<p class="m-0">성공까지 <b>${29 - challenge.challengeCnt}일</b> 남았어요!<br> 조금만 더 힘내주세요.</p>
                          </c:if>
                          <c:if test="${challenge.challengeState == 1}">
                          	<p class="m-0">앗.. 다시한번 도전해 주세요!</p>
                          </c:if>
                          <c:if test="${challenge.challengeState == 2}">
                          	<p class="m-0">대단해요! 다른 챌린지도 도전해 보세요.</p>
                          </c:if>
                        </div>
                        <div class="align-self-center ml-auto">
                          <c:if test="${challenge.challengeState == 0}">
                          	<span class="u-label u-label--sm g-bg-blue g-rounded-20 g-px-10">도전중</span>
                          </c:if>
                          <c:if test="${challenge.challengeState == 1}">
                          	<span class="u-label u-label--sm g-bg-blue g-rounded-20 g-px-10">도전실패</span>
                          </c:if>
                          <c:if test="${challenge.challengeState == 2}">
                          	<span class="u-label u-label--sm g-bg-blue g-rounded-20 g-px-10">도전성공</span>
                          </c:if>
                        </div>
                      </li>
                      
                      </c:forEach>
                      </c:otherwise>
           		      </c:choose>
                      
                      
                    </ul>
                  </div>
                </div>
                <!-- End Challenge Panel -->
              </div>
            </div>
            <!-- End Projects & Activities Panels -->

            <!-- Projects & News Feeds Panels -->
            <div class="row g-mb-40">
              <div class="col-lg-6 g-mb-40 g-mb-0--lg">
                
              </div>
            </div>
            <!-- End Projects & News Feeds Panels -->
          </div>
          <!-- End Profile Content -->
        </div>
      </div>
    </section>    
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
  <script src="../../assets/vendor/appear.js"></script>
  <script src="../../assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
  <script src="../../assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

  <!-- JS Unify -->
  <script src="../../assets/js/hs.core.js"></script>
  <script src="../../assets/js/helpers/hs.hamburgers.js"></script>
  <script src="../../assets/js/components/hs.header.js"></script>
  <script src="../../assets/js/components/hs.tabs.js"></script>
  <script src="../../assets/js/components/hs.counter.js"></script>
  <script src="../../assets/js/components/hs.progress-bar.js"></script>
  <script src="../../assets/js/components/hs.rating.js"></script>
  <script src="../../assets/js/components/hs.scrollbar.js"></script>
  <script src="../../assets/js/components/hs.go-to.js"></script>

  <!-- JS Customization -->
  <script src="../../assets/js/custom.js"></script>

  <!-- JS Plugins Init. -->
  <script>
    $(document).on('ready', function () {
        // initialization of go to
        $.HSCore.components.HSGoTo.init('.js-go-to');

        // initialization of tabs
        $.HSCore.components.HSTabs.init('[role="tablist"]');

        // initialization of counters
        var counters = $.HSCore.components.HSCounter.init('[class*="js-counter"]');

        // initialization of rating
        $.HSCore.components.HSRating.init($('.js-rating'), {
          spacing: 2
        });

        // initialization of HSScrollBar component
        $.HSCore.components.HSScrollBar.init( $('.js-scrollbar') );
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

        // initialization of horizontal progress bars
        setTimeout(function () { // important in this case
          var horizontalProgressBars = $.HSCore.components.HSProgressBar.init('.js-hr-progress-bar', {
            direction: 'horizontal',
            indicatorSelector: '.js-hr-progress-bar-indicator'
          });
        }, 1);
      });

      $(window).on('resize', function () {
        setTimeout(function () {
          $.HSCore.components.HSTabs.init('[role="tablist"]');
        }, 200);
      });
  </script>
</body>

</html>
