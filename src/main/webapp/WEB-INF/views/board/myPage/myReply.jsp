<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Title -->
  <title>Unify Profile | | Unify - Responsive Website Template</title>

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
                    <img class="img-fluid  g-width-260 g-height-260" src="${pageContext.request.contextPath}/save/myPage/${member.profileImage}" alt="Image Description">
                  </c:otherwise>
                </c:choose>             
              </figure>
            </div>
            <!-- User Image -->

            <!-- Sidebar Navigation -->
            <div class="list-group list-group-border-0 g-mb-40">
              <!-- 홈 -->
              <a href="${pageContext.request.contextPath}/user/myPage/" class="list-group-item list-group-item-action justify-content-between">
                <span><i class="icon-home g-pos-rel g-top-1 g-mr-8"></i>
                나의 페이지</span>
                <span class="u-label g-font-size-11 g-bg-pink g-rounded-20 g-px-8"></span>
              </a>
              <!-- End 홈 -->

              <!-- 나의 게시물 -->
              <a href="${pageContext.request.contextPath}/user/myPage/board" class="list-group-item list-group-item-action justify-content-between">
                <span><i class="icon-layers g-pos-rel g-top-1 g-mr-8"></i>나의 게시물</span>
                <span class="u-label g-font-size-11 g-bg-primary g-rounded-20 g-px-10"></span>
              </a>
              <!-- End 나의 게시물 -->

              <!-- 나의 댓글 -->
              <a href="${pageContext.request.contextPath}/user/myPage/reply" class="list-group-item justify-content-between active">
                <span><i class="icon-bubbles g-pos-rel g-top-1 g-mr-8"></i>나의 댓글</span>
                <span class="u-label g-font-size-11 g-bg-white g-color-main g-rounded-20 g-px-10"></span>
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
          <!-- Profle Content -->
          <div class="col-lg-9">
            <!-- Comments (Option 1) -->
            <div class="card border-0 g-mb-40">
              <!-- Panel Header -->
              <div class="card-header d-flex align-items-center justify-content-between g-bg-gray-light-v5 border-0 g-mb-15">
                <h3 class="h6 mb-0">
                    <i class="icon-bubbles g-pos-rel g-top-1 g-mr-5"></i>나의 댓글
                </h3>
              </div>
              <!-- End Panel Header -->

              <!-- Panel Body -->
              <div class="card-block g-pa-0"> 
              <c:choose>
              	<c:when test="${empty requestScope.pageReply.content}">
              		<p align="center"><b><span style="font-size:9pt;">등록된 댓글이 없습니다.</span></b></p>
              	</c:when>
              	<c:otherwise>
              		<c:forEach items="${requestScope.pageReply.content}" var="reply">
              		 <div class="media g-brd-around g-brd-gray-light-v4 g-pa-20 g-mb-20">
		                  <div class="media-body">
		                    <div class="d-sm-flex justify-content-sm-between align-items-sm-center g-mb-15 g-mb-10--sm">
		                      <h5 class="h4 g-font-weight-300 g-mr-10 g-mb-5 g-mb-0--sm">${reply.replyContent} </h5>
		                      <div class="text-nowrap g-font-size-12">
		                      <fmt:parseDate var="cntday" value="${reply.replyRegdate}" pattern="yyyy-MM-dd"/>
                          	  <fmt:formatDate  var="day" value="${cntday}" type="DATE" pattern="yyyy.MM.dd"/>
		                        <a href="${pageContext.request.contextPath}/board/detail/${reply.board.boardNo}">${reply.board.boardTitle}</a> / <span>${day}</span> 
		                      </div>
		                    </div>
<!-- 		                    <ul class="list-inline my-0">
		                      <li class="list-inline-item g-mr-20">
		                        <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
		                          <i class="icon-like g-pos-rel g-top-1 g-mr-3"></i> 214
		                        </a>
		                      </li>
		                      <li class="list-inline-item g-mr-20">
		                        <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
		                          <i class="icon-dislike g-pos-rel g-top-1 g-mr-3"></i> 35
		                        </a>
		                      </li>
		                      <li class="list-inline-item g-mr-20">
		                        <a class="g-color-gray-dark-v5 g-text-underline--none--hover" href="#">
		                          <i class="icon-share g-pos-rel g-top-1 g-mr-3"></i> 52
		                        </a>
		                      </li>
		                    </ul> -->
		                  </div>
		                </div>
              		</c:forEach>
              	</c:otherwise>	              	            	              
	            </c:choose>                
              </div> 
              <!-- End Panel Body -->
              
              
 		<!-- Pagination -->
        <nav class="g-mb-100" aria-label="Page Navigation">
        <ul class="list-inline mb-0">
          	<c:set var="doneLoop" value="false"/>
            <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/user/myPage/reply?nowPage=${startPage-1}" aria-label="Next">
                <span aria-hidden="true">
                  <i class="fa fa-angle-right"></i>
                </span>
                <span class="sr-only">Next</span>
              </a>
            </li>
		    </c:if>
            <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
					    <c:if test="${(i-1)>=pageReply.getTotalPages()}">
					       <c:set var="doneLoop" value="true"/>
					    </c:if> 
				  <c:if test="${not doneLoop}" >
				      <li class="list-inline-item hidden-down">
				     <a class="${i==nowPage?'active u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--active g-color-white g-bg-primary--active g-font-size-12 rounded-circle g-pa-5':'u-pagination-v1__item g-width-30 g-height-30 g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5'}" href="${pageContext.request.contextPath}/user/myPage/reply?nowPage=${i}">${i}</a> 
		            </li>
		         </c:if>
            </c:forEach>
            <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/user/myPage/reply?nowPage=${startPage+blockCount}" aria-label="Next">
                <span aria-hidden="true">
                  <i class="fa fa-angle-right"></i>
                </span>
                <span class="sr-only">Next</span>
              </a>
            </li>
			</c:if>
          </ul>
        </nav>
        <!-- End Pagination -->
              
                          
            </div>
          </div>
        </div>
      </div>
    </section>
</body>

</html>
