<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Title -->
  <title>Blog Single Item 1 | | Unify - Responsive Website Template</title>

  <!-- Required Meta Tags Always Come First -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <!-- Favicon -->
  
</head>


<body>
  <main>
    <!-- Start BoardKind 게시판 카테고리 -->
    <c:choose>
    	<c:when test="${requestScope.board.boardKind==1}">
	    	<section class="g-bg-gray-light-v5 g-py-40">
		      <div class="container text-center">
		        <h2 class="h3 g-color-black g-font-weight-600">일기게시판</h3>
		      </div>
	   	   </section>
    	</c:when>
    	<c:when test="${requestScope.board.boardKind==3}">
	    	<section class="g-bg-gray-light-v5 g-py-40">
		      <div class="container text-center">
		        <h2 class="h3 g-color-black g-font-weight-600">자유게시판</h3>
		      </div>
	   	   </section>
    	</c:when>
    	<c:when test="${requestScope.board.boardKind==4}">
	    	<section class="g-bg-gray-light-v5 g-py-40">
		      <div class="container text-center">
		        <h2 class="h3 g-color-black g-font-weight-600">지역게시판</h3>
		      </div>
	   	   </section>
    	</c:when>
    </c:choose>
    <!-- End BoardKind 게시판 카테고리 -->
    
    <!-- Blog Single Item Info -->
    <article class="container g-pt-40 g-pb-60">
      <div class="row justify-content-center">
        <div class="col-lg-9">
          <div class="g-mb-60">
            <h4 class="g-color-black g-font-weight-600 text-left">${requestScope.board.boardTitle}</h4>
            <ul class="u-list-inline mb-5">
	            <a class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5" href="#">
	                    <i class="align-middle g-font-size-default mr-1 icon-education-200 u-line-icon-pro"></i>
	                    ${requestScope.board.memberNickname}
	            </a>
            </ul>
            
  			  <!-- Start 수정하기 삭제하기 버튼 -->
			  <sec:authorize access="isAuthenticated()">
	          <sec:authentication property="principal" var="user"/>
	          <c:choose>
		          <c:when test="${user.username eq board.memberId}">
			          <form name="requestForm" method="post" id="requestForm" class="float-right"> 
			          		<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
				            <input type=hidden name="boardNo" value="${board.boardNo}">
				            <input type=hidden name="boardKind" value="${board.boardKind}">
				            <input type=button value="수정하기" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
				            <input type=button value="삭제하기" style="background: none; border: none;" class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5">
			          </form>
		          </c:when>
				  <c:when test="${user.username eq 'admin'}">
				  	<form name="requestForm" method="post" id="requestForm" class="float-right"> 
			          		<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
				            <input type=hidden name="boardNo" value="${board.boardNo}">
				            <input type=hidden name="boardKind" value="${board.boardKind}">
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
			  
			  
            <!-- Start 작성자, 조회수, 날짜 -->
          <div class="g-mb-40">
            <ul class="u-list-inline mb-5 float-right">
              
              <a class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5" href="#">
                    <i class="align-middle g-font-size-default mr-1 icon-communication-128 u-line-icon-pro"></i>
                    ${board.boardRegdate}
              </a>
              <a class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5" href="#">
                    <i class="align-middle g-font-size-default mr-1 icon-medical-054 u-line-icon-pro"></i>
                    ${board.boardReadnum} Views
              </a>
            </ul>
          </div>
          <!-- End 작성자, 조회수, 날자 -->

          
			
          <!--  Start 글내용 -->
        	<hr>
            <div class="d-inline-block float-left g-color-black g-font-size-14 text-center g-pa-7 g-mt-40 mr-2">${requestScope.board.boardContent}</div>
          <!--  End 글내용 -->
          </div>


        </div>
      </div>

    <!-- End Blog Single Item Info -->
    

    <!-- Start 댓글 리스트 -->
    <section class="container g-py-20">
      <div class="row justify-content-center">
        <div class="col-lg-9">
          <div class="g-brd-bottom g-brd-gray-light-v4 g-mb-50">
            <div class="g-brd-y g-py-30 ">
              <h3 class="h6 g-color-black g-font-weight-600 text-uppercase mb-0">${fn:length(board.replyList)} Comments</h3>
            </div>

			<!--  댓글 내용 Start -->
			<c:forEach items="${board.replyList}" var="reply">
            <div class="media g-brd-top g-brd-gray-light-v4 g-pt-30 g-mb-30">
              <img class="d-flex g-width-100 g-height-100 g-mr-30" src="${pageContext.request.contextPath}/save/myPage/${reply.member.profileImage}" onerror="this.src='${pageContext.request.contextPath}/save/myPage/notimg.png'">
              <div class="media-body">
                <div class="d-flex align-items-start g-mb-15 g-mb-10--sm">
                  <div class="d-block">
                    <h5 class="h6 g-color-black g-font-weight-600">${reply.memberNickname}</h5>
                    <fmt:parseDate var="cntday" value="${reply.replyRegdate}" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate  var="day" value="${cntday}" type="DATE" pattern="yyyy.MM.dd"/>
                    <span class="d-block g-color-gray-dark-v5 g-font-size-11">${day}</span>
                  </div>
				
                  <sec:authorize access="isAuthenticated()">
                  	<sec:authentication property="principal" var="user"/>
	                  <c:choose>
		                  <c:when test="${user.username eq reply.memberId}">
		                  <div class="ml-auto">
		                    <a class="u-link-v5 g-color-black g-color-primary--hover g-font-weight-600 g-font-size-12 text-uppercase" href="${pageContext.request.contextPath}/reply/delete/${reply.replyNo}/${board.boardNo}">삭제</a>
		                  </div>
		                  </c:when>
		                  <c:when test="${user.username eq 'admin'}">
		                  <div class="ml-auto">
		                    <a class="u-link-v5 g-color-black g-color-primary--hover g-font-weight-600 g-font-size-12 text-uppercase" href="${pageContext.request.contextPath}/reply/delete/${reply.replyNo}/${board.boardNo}">삭제</a>
		                  </div>
		                  </c:when>
		                  <c:otherwise>
		                  
		                  </c:otherwise>
	                  </c:choose>
                  </sec:authorize>
                </div>
                

                <p>${reply.replyContent}</p>

                <ul class="list-inline my-0">
                  <li class="list-inline-item g-mr-20">
                    <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
                      <!-- <i class="icon-like g-pos-rel g-top-1 g-mr-3"></i> 0 -->
                    </a>
                  </li>
                  <li class="list-inline-item g-mr-20">
                    <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
                      <!-- <i class="icon-finance-206 u-line-icon-pro g-pos-rel g-top-1 g-mr-3"></i> 0 -->
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            </c:forEach>
            <!-- 댓글 내용 End -->
          </div>

		  <!-- Start 댓글 입력 폼 -->
		  <sec:authorize access="hasAnyRole('MEMBER', 'ADMIN')">
          <h3 class="h6 g-color-black g-font-weight-600 text-uppercase g-mb-30">댓글 쓰기</h3>
		  <form name="replyWriteForm" method="post" action="${pageContext.request.contextPath}/reply/insert" enctype="multipart/form-data">
		  	  <input type="hidden" name="boardNo" value="${board.boardNo}" />
	          <div class="g-mb-30">
	            <textarea name="replyContent" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-primary--focus g-resize-none rounded-3 g-py-13 g-px-15" rows="4" placeholder="댓글 내용을 입력하세요."></textarea>
	          </div>
	          <button class="btn u-btn-primary g-font-weight-600 g-font-size-12 text-uppercase g-py-12 g-px-25" type="submit">댓글 등록하기</button>
          </form>
          </sec:authorize>
          <!-- End 댓글 입력 폼 -->
       
    </section>
    <!-- End 댓글 리스트 -->
    </article>
    
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
			   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/board/updateForm");
			   $("#requestForm").submit();
		   })
		   
		   
		   $("input[value=삭제하기]").click(function(){
			   var pwd = prompt("비밀번호를 입력하세요.");
			   if(pwd){
		           $("#password").val(pwd);
				   $("#requestForm").attr("action", "${pageContext.request.contextPath}/board/delete");
				   $("#requestForm").submit();
			   }
		   })
	   
	})
</script>

</body>

</html>
