<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Title -->
  <title>챌린지게시물 상세보기</title>

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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-line/css/simple-line-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-hs/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/fancybox/jquery.fancybox.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hamburgers/hamburgers.min.css">

  <!-- CSS Unify -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/unify-core.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/unify-components.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/unify-globals.css">

  <!-- CSS Customization -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
  
  <!-- fullCalendar -->
  <link href='${pageContext.request.contextPath}/fullcalendar/main.css' rel='stylesheet' />
    
    <style type="text/css">
    	.event-image_url{
    		width:24px;
    	}


    </style>
    
    <script src='${pageContext.request.contextPath}/fullcalendar/main.js'></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script> 
    
    <!-- fulllCalendar -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          events: [ 	  
        	  //2021-11-30T07:10:32
        	  <fmt:parseDate var="cntday" value="${requestScope.board.challenge.challengeDate}" pattern="yyyy-MM-dd"/> 
        	  //Tue Nov 30 00:00:00 KST 2021
              <fmt:formatDate  var="day" value="${cntday}" type="DATE" pattern="yyyyMMdd"/>
              <fmt:formatDate  var="regdate" value="${cntday}" type="DATE" pattern="yyyy년MM월dd일"/>
              //2021-11-30
                                                   
        	  <c:forEach var='i' begin="0" end="${requestScope.board.challenge.challengeCnt}" step="1">          	  
              {
              	title: '${i+1}일차 도전',
              	start: '${day+i}',
              	image_url: '${pageContext.request.contextPath}/img/smile.png',
              	backgroundColor: "rgb(255, 255, 255)",
              	textColor : "#000000",
              	borderColor : "rgba(255, 255, 255, 0)",
              },
              </c:forEach>
          ],
          
          eventContent: function(arg) {
            let arrayOfDomNodes = []
            // title event
            let titleEvent = document.createElement('div')
            if(arg.event._def.title) {
              titleEvent.innerHTML = arg.event._def.title
              titleEvent.classList = "fc-event-title fc-sticky"
            }

            // image event
            let imgEventWrap = document.createElement('div')
            if(arg.event.extendedProps.image_url) {
              let imgEvent = '<img src="'+arg.event.extendedProps.image_url+'" >'
              imgEventWrap.classList = "fc-event-img"
              imgEventWrap.innerHTML = imgEvent;
            }

            arrayOfDomNodes = [ titleEvent,imgEventWrap ]

            return { domNodes: arrayOfDomNodes }
          },
        });
        calendar.render();

     });
    </script>
    
    <script type="text/javascript">

	</script>
</head>

<body>
  <main>
    <!-- Breadcrumbs -->
    <section class="g-bg-gray-light-v5 g-py-80">
      <div class="container text-center">
        <h2 class="h2 g-color-black g-font-weight-600">30일 챌린지</h2>

        <ul class="u-list-inline">
          <li class="list-inline-item g-mr-5">
            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
            <i class="g-color-gray-light-v2 g-ml-5">/</i>
          </li>
          <li class="list-inline-item g-mr-5">
            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/challenge/select">30일챌린지</a>
            <i class="g-color-gray-light-v2 g-ml-5">/</i>
          </li>
          <li class="list-inline-item g-color-primary">
          	<c:choose>
          		<c:when test="${requestScope.board.challenge.challengeCategory==1}">
          			<span>30일 아침밥 챙기기</span>
          		</c:when>
          		<c:when test="${requestScope.board.challenge.challengeCategory==2}">
          			<span>30일 유산소 운동하기</span>
          		</c:when>
          		<c:when test="${requestScope.board.challenge.challengeCategory==3}">
          			<span>30일 플랭크 하기</span>
          		</c:when>
          		<c:when test="${requestScope.board.challenge.challengeCategory==4}">
          			<span>30일 전신운동 하기</span>
          		</c:when>
          	</c:choose>
          </li>
        </ul>
      </div>
    </section>
    <!-- End Breadcrumbs -->

    <!-- Blog Single Item Info -->
    <section class="container g-pt-100 g-pb-60">
      <div class="row justify-content-center">
        <div class="col-lg-9">
          <div class="g-mb-60">
            <h2 class="g-color-black g-font-weight-600 text-center g-mb-30">${requestScope.board.boardTitle}</h2>
            <!-- fullCalendar start -->
            <div id='calendar'></div> 
            <!-- fullCalendar end -->
          </div>
          <p>${requestScope.board.boardContent}</p>        
        </div>
      </div>
    </section>
    <!-- End Blog Single Item Info -->

    <!-- Blog Single Item Author -->
    <section class="container">
      <div class="row justify-content-center">
        <div class="col-lg-9">
          <!-- Tags -->
          <div class="g-mb-40">
            <ul class="u-list-inline mb-5">
			  <!-- Start 수정하기 삭제하기 버튼 -->
			  <sec:authorize access="isAuthenticated()">
	          <sec:authentication property="principal" var="user"/>
	          <c:choose>
		          <c:when test="${user.username eq board.member.memberId}">
			          <form name="requestForm" method="post" id="requestForm" class="float-right"> 
			          		<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
				            <input type=hidden name="boardNo" value="${board.boardNo}">
				            <input type=button value="수정하기" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
				            <input type=button value="삭제하기" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
			          </form>
		          </c:when>
				  <c:when test="${user.username eq 'admin'}">
				  	<form name="requestForm" method="post" id="requestForm" class="float-right"> 
			          		<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
				            <input type=hidden name="boardNo" value="${board.boardNo}">
				            <input type=button value="수정하기" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
				            <input type=button value="삭제하기" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
			          </form>
				  </c:when>		          
		          <c:otherwise>
		          		<input type=hidden name="boardNo" value="${board.boardNo}">
				            <input type=hidden value="수정하기" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
				            <input type=hidden value="삭제하기" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
		          </c:otherwise>
	          </c:choose>
	          </sec:authorize>
			  <!-- End 수정하기 삭제하기 버튼 -->
            </ul>
          </div>
          <!-- End Tags -->

          <!-- Social Icons -->
          <div class="text-center">
            <h3 class="h6 g-color-black g-font-weight-600 text-uppercase mb-3"></h3>
            <ul class="list-inline g-mb-60">
              <li class="list-inline-item g-mx-2">
                <a class="u-icon-v1 u-icon-slide-up--hover g-color-gray-dark-v4 g-color-facebook--hover" href="#">

                </a>
              </li>
            </ul>
          </div>
          <!-- End Social Icons -->

          <!-- Author -->
          <div class="g-brd-top g-brd-gray-light-v3 g-pt-60 g-pb-100">
            <div class="row justify-content-between">
              <div class="media">
                <img class="d-flex g-width-100 g-height-100 g-mr-30" src="${pageContext.request.contextPath}/save/myPage/${board.member.profileImage}" onerror="this.src='${pageContext.request.contextPath}/save/myPage/notimg.png'">
                <div class="media-body">
                  <h4 class="h5 g-color-black g-font-weight-600">${board.member.memberNickname}</h4>
                  <p class="g-color-gray-dark-v5 mb-4">${board.member.memberMessage}</p>
                </div>
              </div>
            </div>
          </div>
          <!-- End Author -->
        </div>
      </div>
    </section>
    <!-- End Blog Single Item Author -->

    

    <!-- Blog Single Item Comments -->
<!--     <section class="container g-py-100">
      <div class="row justify-content-center">
        <div class="col-lg-9">
          Blog Single Item Comments
          <div class="g-brd-bottom g-brd-gray-light-v4 g-pb-30 g-mb-50">
            <div class="g-brd-y g-brd-gray-light-v4 g-py-30 mb-5">
              <h3 class="h6 g-color-black g-font-weight-600 text-uppercase mb-0">3 Comments</h3>
            </div>

            <div class="media g-mb-30">
              <img class="d-flex g-width-60 g-height-60 rounded-circle g-mt-3 g-mr-20" src="../../assets/img-temp/100x100/img7.jpg" alt="Image Description">
              <div class="media-body">
                <div class="d-flex align-items-start g-mb-15 g-mb-10--sm">
                  <div class="d-block">
                    <h5 class="h6 g-color-black g-font-weight-600">James Coolman</h5>
                    <span class="d-block g-color-gray-dark-v5 g-font-size-11">June 7, 2017</span>
                  </div>
                  <div class="ml-auto">
                    <a class="u-link-v5 g-color-black g-color-primary--hover g-font-weight-600 g-font-size-12 text-uppercase" href="#">Reply</a>
                  </div>
                </div>

                <p>The time has come to bring those ideas and plans to life. This is where we really begin to visualize your napkin sketches and make them into beautiful pixels. Whether through commerce or just an experience to tell your brand's story, the
                  time has come to start using development languages that fit your projects needs.</p>

                <ul class="list-inline my-0">
                  <li class="list-inline-item g-mr-20">
                    <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
                      <i class="icon-like g-pos-rel g-top-1 g-mr-3"></i> 5
                    </a>
                  </li>
                  <li class="list-inline-item g-mr-20">
                    <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
                      <i class="icon-finance-206 u-line-icon-pro g-pos-rel g-top-1 g-mr-3"></i> 1
                    </a>
                  </li>
                </ul>
              </div>
            </div>

            <div class="media g-brd-top g-brd-gray-light-v4 g-pt-30 g-ml-40 g-mb-30">
              <img class="d-flex g-width-60 g-height-60 rounded-circle g-mt-3 g-mr-15" src="../../assets/img-temp/100x100/img4.jpg" alt="Image Description">
              <div class="media-body">
                <div class="d-flex align-items-start g-mb-15 g-mb-10--sm">
                  <div class="d-block">
                    <h5 class="h6 g-color-black g-font-weight-600">Alberta Watson</h5>
                    <span class="d-block g-color-gray-dark-v5 g-font-size-11">June 7, 2017</span>
                  </div>
                  <div class="ml-auto">
                    <a class="u-link-v5 g-color-black g-color-primary--hover g-font-weight-600 g-font-size-12 text-uppercase" href="#">Reply</a>
                  </div>
                </div>

                <p>Now that your brand is all dressed up and ready to party, it's time to release it to the world. By the way, let's celebrate already.</p>

                <ul class="list-inline my-0">
                  <li class="list-inline-item g-mr-20">
                    <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
                      <i class="icon-like g-pos-rel g-top-1 g-mr-3"></i> 2
                    </a>
                  </li>
                  <li class="list-inline-item g-mr-20">
                    <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
                      <i class="icon-finance-206 u-line-icon-pro g-pos-rel g-top-1 g-mr-3"></i> 0
                    </a>
                  </li>
                </ul>
              </div>
            </div>

            <div class="media g-brd-top g-brd-gray-light-v4 g-pt-30 g-mb-30">
              <img class="d-flex g-width-60 g-height-60 rounded-circle g-mt-3 g-mr-15" src="../../assets/img-temp/100x100/img14.jpg" alt="Image Description">
              <div class="media-body">
                <div class="d-flex align-items-start g-mb-15 g-mb-10--sm">
                  <div class="d-block">
                    <h5 class="h6 g-color-black g-font-weight-600">David Lee</h5>
                    <span class="d-block g-color-gray-dark-v5 g-font-size-11">June 7, 2017</span>
                  </div>
                  <div class="ml-auto">
                    <a class="u-link-v5 g-color-black g-color-primary--hover g-font-weight-600 g-font-size-12 text-uppercase" href="#">Reply</a>
                  </div>
                </div>

                <p>We get it, you're busy and it's important that someone keeps up with marketing and driving people to your brand. We've got you covered.</p>

                <ul class="list-inline my-0">
                  <li class="list-inline-item g-mr-20">
                    <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
                      <i class="icon-like g-pos-rel g-top-1 g-mr-3"></i> 0
                    </a>
                  </li>
                  <li class="list-inline-item g-mr-20">
                    <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
                      <i class="icon-finance-206 u-line-icon-pro g-pos-rel g-top-1 g-mr-3"></i> 0
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          End Blog Single Item Comments

          <h3 class="h6 g-color-black g-font-weight-600 text-uppercase g-mb-30">Add Comment</h3>

          <form>
            <div class="row">
              <div class="col-md-6 form-group g-mb-30">
                <input class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--focus rounded-3 g-py-13 g-px-15" type="text" placeholder="First name">
              </div>

              <div class="col-md-6 form-group g-mb-30">
                <input class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--focus rounded-3 g-py-13 g-px-15" type="email" placeholder="Email">
              </div>
            </div>
          </form>

          <div class="g-mb-30">
            <textarea class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--focus g-resize-none rounded-3 g-py-13 g-px-15" rows="12" placeholder="Your message"></textarea>
          </div>

          <button class="btn u-btn-primary g-font-weight-600 g-font-size-12 text-uppercase g-py-12 g-px-25" type="submit" role="button">Add Comment</button>
        </div>
      </div>
      </div>
    </section> -->
    <!-- End Blog Single Item Comments -->
    
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
  <script src="../../assets/vendor/fancybox/jquery.fancybox.min.js"></script>

  <!-- JS Unify -->
  <script src="../../assets/js/hs.core.js"></script>
  <script src="../../assets/js/components/hs.header.js"></script>
  <script src="../../assets/js/helpers/hs.hamburgers.js"></script>
  <script src="../../assets/js/components/hs.tabs.js"></script>
  <script src="../../assets/js/components/hs.popup.js"></script>
  <script src="../../assets/js/components/hs.go-to.js"></script>

  <!-- JS Customization -->
  <script src="../../assets/js/custom.js"></script>

  <!-- JS Plugins Init. -->
  <script>
    $(document).on('ready', function () {
        // initialization of tabs
        $.HSCore.components.HSTabs.init('[role="tablist"]');

        // initialization of popups
        $.HSCore.components.HSPopup.init('.js-fancybox');

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
  
  
  <script type="text/javascript">
	$(function(){
		   
		   $("input[value=수정하기]").click(function(){	   
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/challenge/updateForm");
			   $("#requestForm").submit();
		   })
		   $("input[value=삭제하기]").click(function(){
			   var pwd = prompt("비밀번호를 입력하세요.");
			   if(pwd){
		           $("#password").val(pwd);
				   $("#requestForm").attr("action", "${pageContext.request.contextPath}/challenge/delete");
				   $("#requestForm").submit();
			   }
		   })  
		})
	</script>

</body>

</html>
