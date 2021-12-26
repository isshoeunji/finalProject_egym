<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
  	<!-- Start 해당 카테고리 게시판 이름 -->
	<c:choose>
	<c:when test="${boardKind==0}">
		<section class="g-bg-gray-light-v5 g-py-30">
		      <div class="container text-center">
		        <h4 class="h4 g-color-black g-font-weight-600">커뮤니티 > 전체</h4>
		        <ul class="u-list-inline">
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/0">커뮤니티</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-color-primary">
		            <span>전체</span>
		          </li>
		        </ul>
		      </div>
	   	   </section>
	</c:when>
	<c:when test="${boardKind==1}">
		<section class="g-bg-gray-light-v5 g-py-30">
	      <div class="container text-center">
	        <h4 class="h4 g-color-black g-font-weight-600">커뮤니티 > 일기</h4>
	        <ul class="u-list-inline">
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/0">커뮤니티</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-color-primary">
	            <span>일기</span>
	          </li>
	        </ul>
	      </div>
   	   </section>
	</c:when>
	<c:when test="${boardKind==3}">
		<section class="g-bg-gray-light-v5 g-py-30">
	      <div class="container text-center">
	        <h4 class="h4 g-color-black g-font-weight-600">커뮤니티 > 자유게시판</h4>
	        <ul class="u-list-inline">
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/0">커뮤니티</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-color-primary">
	            <span>자유게시판</span>
	          </li>
	        </ul>
	      </div>
   	   </section>
	</c:when>
	<c:when test="${boardKind==4}">
		<section class="g-bg-gray-light-v5 g-py-30">
	      <div class="container text-center">
	        <h4 class="h4 g-color-black g-font-weight-600">커뮤니티 > 지역게시판</h4>
	        <ul class="u-list-inline">
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-mr-5">
	            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/0">커뮤니티</a>
	            <i class="g-color-gray-light-v2 g-ml-5">/</i>
	          </li>
	          <li class="list-inline-item g-color-primary">
	            <span>지역게시판</span>
	          </li>
	        </ul>
	      </div>
   	   </section>
	</c:when>
	</c:choose>
	<!-- End 해당 카테고리 게시판 이름 -->
	
	<!-- Start 지역게시판 > 해당 지역카테고리 게시판 이름 
			2:서울 3:경기인천 4:강원도 5:충청도 6:전라도 7:경상도 8:제주도
	-->
	<c:choose>
		<c:when test="${tagrelNo==2}">
			<section class="g-bg-gray-light-v5 g-py-30">
		      <div class="container text-center">
		        <h3 class="h4 g-color-black g-font-weight-600">지역게시판 > 서울</h3>
		        <ul class="u-list-inline">
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/0">커뮤니티</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/4">지역게시판</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-color-primary">
		            <span>서울</span>
		          </li>
		        </ul>
		      </div>
	   	   </section>
		</c:when>
		<c:when test="${tagrelNo==3}">
			<section class="g-bg-gray-light-v5 g-py-30">
		      <div class="container text-center">
		        <h3 class="h4 g-color-black g-font-weight-600">지역게시판 > 경기·인천</h3>
		        <ul class="u-list-inline">
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/0">커뮤니티</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/4">지역게시판</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-color-primary">
		            <span>경기·인천</span>
		          </li>
		        </ul>
		      </div>
	   	   </section>
		</c:when>
		<c:when test="${tagrelNo==4}">
			<section class="g-bg-gray-light-v5 g-py-30">
		      <div class="container text-center">
		        <h3 class="h4 g-color-black g-font-weight-600">지역게시판 > 강원도</h3>
		        <ul class="u-list-inline">
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/0">커뮤니티</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/4">지역게시판</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-color-primary">
		            <span>강원도</span>
		          </li>
		        </ul>
		      </div>
	   	   </section>
		</c:when>
		<c:when test="${tagrelNo==5}">
			<section class="g-bg-gray-light-v5 g-py-30">
		      <div class="container text-center">
		        <h3 class="h4 g-color-black g-font-weight-600">지역게시판 > 충청도</h3>
		        <ul class="u-list-inline">
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/0">커뮤니티</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/4">지역게시판</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-color-primary">
		            <span>충청도</span>
		          </li>
		        </ul>
		      </div>
	   	   </section>
		</c:when>
		<c:when test="${tagrelNo==6}">
			<section class="g-bg-gray-light-v5 g-py-30">
		      <div class="container text-center">
		        <h3 class="h4 g-color-black g-font-weight-600">지역게시판 > 전라도</h3>
		        <ul class="u-list-inline">
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/0">커뮤니티</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/4">지역게시판</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-color-primary">
		            <span>전라도</span>
		          </li>
		        </ul>
		      </div>
	   	   </section>
		</c:when>
		<c:when test="${tagrelNo==7}">
			<section class="g-bg-gray-light-v5 g-py-30">
		      <div class="container text-center">
		        <h3 class="h4 g-color-black g-font-weight-600">지역게시판 > 경상도</h3>
		        <ul class="u-list-inline">
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/0">커뮤니티</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/4">지역게시판</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-color-primary">
		            <span>경상도</span>
		          </li>
		        </ul>
		      </div>
	   	   </section>
		</c:when>
		<c:when test="${tagrelNo==8}">
			<section class="g-bg-gray-light-v5 g-py-30">
		      <div class="container text-center">
		        <h3 class="h4 g-color-black g-font-weight-600">지역게시판 > 제주도</h3>
		        <ul class="u-list-inline">
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/0">커뮤니티</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/4">지역게시판</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-color-primary">
		            <span>제주도</span>
		          </li>
		        </ul>
		      </div>
	   	   </section>
		</c:when>
	</c:choose>
	<!-- End 지역게시판 > 해당 지역카테고리 게시판 이름 -->
	
	
	<!-- 게시물 리스트 start -->
	<c:choose>
	<c:when test="${empty requestScope.pageList}">
            <p align="center"><b><span style="font-size:9pt;">등록된 게시물이 없습니다.</span></b></p>
    </c:when>
    <c:otherwise>
    
    <!-- Blog Minimal Blocks -->
    <div class="container g-pt-50 g-pb-20">
      <div class="row justify-content-between">
        <div class="col-lg-9 order-lg-2 g-mb-80">
          <div class="g-pl-20--lg">
            <!-- Blog Minimal Blocks -->
            <c:forEach items="${requestScope.pageList.content}" var="board">
            <article class="g-mb-50">
              <div class="g-mb-30">
                <span class="d-block g-color-gray-dark-v4 g-font-weight-700 g-font-size-12 text-uppercase mb-2">${board.boardRegdate}</span>
                <h2 class="h4 g-color-black g-font-weight-600 mb-3"> 
                    <a class="u-link-v5 g-color-black g-color-primary--hover" href="${pageContext.request.contextPath}/board/detail/${board.boardNo}">${board.boardTitle}</a>
                  </h2>
              </div>

              <ul class="list-inline g-brd-y g-brd-gray-light-v3 g-font-size-13 g-py-13 mb-0">
                <li class="list-inline-item g-color-gray-dark-v4 mr-2">
                  <span class="d-inline-block g-color-gray-dark-v4">
                      <img class="g-g-width-20 g-height-20 rounded-circle mr-2" src="${pageContext.request.contextPath}/assets/img-temp/100x100/img7.jpg" alt="Image Description">
                      ${board.memberNickname}
                    </span>
                </li>
                <li class="list-inline-item g-color-gray-dark-v4">
                  <a class="d-inline-block g-color-gray-dark-v4 g-color-white--hover g-bg-gray-dark-v2--hover rounded g-transition-0_3 g-text-underline--none--hover g-px-15 g-py-5" href="#">
                    <i class="align-middle g-font-size-default mr-1 icon-finance-206 u-line-icon-pro"></i>
                     ${fn:length(board.replyList)} Comments
                  </a>
                </li>
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
        <ul class="list-inline mb-0">
          	<c:set var="doneLoop" value="false"/>
            <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/board/select?nowPage=${startPage-1}" aria-label="Next">
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
				     <a class="${i==nowPage?'active u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--active g-color-white g-bg-primary--active g-font-size-12 rounded-circle g-pa-5':'u-pagination-v1__item g-width-30 g-height-30 g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5'}" href="${pageContext.request.contextPath}/board/select/${boardKind}?nowPage=${i}">${i}</a> 
		            </li>
		         </c:if>
            </c:forEach>
            <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
            <li class="list-inline-item">
              <a class="u-pagination-v1__item g-width-30 g-height-30 g-brd-gray-light-v3 g-brd-primary--hover g-color-gray-dark-v5 g-color-primary--hover g-font-size-12 rounded-circle g-pa-5 g-ml-15" href="${pageContext.request.contextPath}/board/select/${boardKind}?nowPage=${startPage+blockCount}" aria-label="Next">
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
            <sec:authorize access="hasAnyRole('MEMBER', 'ADMIN')">
            <span><a class="btn u-btn-outline-primary g-font-size-11 g-rounded-25" style="float: right;" href="${pageContext.request.contextPath}/board/write">글쓰기</a></span>
            </sec:authorize>
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
            <c:choose>
            	<c:when test="${boardKind==4}">
            		<div class="g-mb-50">
		              <h3 class="h5 g-color-black g-font-weight-600 mb-4 g-pt-50">지역게시판</h3>
		              <ul class="list-unstyled g-font-size-13 mb-0">
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/2"><i class="mr-2 fa fa-angle-right"></i>서울</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/3"><i class="mr-2 fa fa-angle-right"></i>경기·인천</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/4"><i class="mr-2 fa fa-angle-right"></i>강원도</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/5"><i class="mr-2 fa fa-angle-right"></i>충청도</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/6"><i class="mr-2 fa fa-angle-right"></i>전라도</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/7"><i class="mr-2 fa fa-angle-right"></i>경상도</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/8"><i class="mr-2 fa fa-angle-right"></i>제주도</a>
		                </li>
		                <!-- <li>
		                  <a class="d-block active u-link-v5 g-color-black g-bg-gray-light-v5 g-font-weight-600 g-rounded-50 g-px-20 g-py-8" href="#"><i class="mr-2 fa fa-angle-right"></i> Untold Stories</a>
		                </li> -->
		              </ul>
            		</div>
            	</c:when>
            	<c:otherwise>
            		<div class="g-mb-50">
		              <h3 class="h5 g-color-black g-font-weight-600 mb-4 g-pt-50">커뮤니티</h3>
		              <ul class="list-unstyled g-font-size-13 mb-0">
		              	<li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/select/0"><i class="mr-2 fa fa-angle-right"></i>전체</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/select/3"><i class="mr-2 fa fa-angle-right"></i>자유게시판</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/select/4"><i class="mr-2 fa fa-angle-right"></i>지역게시판</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/select/1"><i class="mr-2 fa fa-angle-right"></i>일기게시판</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="#"><i class="mr-2 fa fa-angle-right"></i>질문게시판</a>
		                </li>
		                <!-- <li>
		                  <a class="d-block active u-link-v5 g-color-black g-bg-gray-light-v5 g-font-weight-600 g-rounded-50 g-px-20 g-py-8" href="#"><i class="mr-2 fa fa-angle-right"></i> Untold Stories</a>
		                </li> -->
		              </ul>
            		</div>
            	</c:otherwise>
            </c:choose>
            <!-- End Links -->

            <!-- <hr class="g-brd-gray-light-v4 g-mt-50 mb-0"> -->

            <div id="stickyblock-start" class="js-sticky-block g-sticky-block--lg g-pt-50" data-start-point="#stickyblock-start" data-end-point="#stickyblock-end">
              <!-- Publications -->
              <!-- <div class="g-mb-50">
                <h3 class="h5 g-color-black g-font-weight-600 mb-4">Publications</h3>
                <ul class="list-unstyled g-font-size-13 mb-0">
                  <li>
                    <article class="media g-mb-35">
                      <img class="d-flex g-width-40 g-height-40 rounded-circle mr-3" src="${pageContext.request.contextPath}/assets/img-temp/100x100/img1.jpg" alt="Image Description">
                      <div class="media-body">
                        <h4 class="h6 g-color-black g-font-weight-600">Htmlstream</h4>
                        <p class="g-color-gray-dark-v4">This is where we sit down, grab a cup of coffee and dial in the details.</p>
                        <a class="btn u-btn-outline-primary g-font-size-11 g-rounded-25" href="#">Follow</a>
                      </div>
                    </article>
                  </li>
                  <li>
                    <article class="media g-mb-35">
                      <img class="d-flex g-width-40 g-height-40 rounded-circle mr-3" src="${pageContext.request.contextPath}/assets/img-temp/100x100/img3.jpg" alt="Image Description">
                      <div class="media-body">
                        <h4 class="h6 g-color-black g-font-weight-600">Pixeel</h4>
                        <p class="g-color-gray-dark-v4">This is where we sit down, grab a cup of coffee and dial in the details.</p>
                        <a class="btn u-btn-outline-primary g-font-size-11 g-rounded-25" href="#">Follow</a>
                      </div>
                    </article>
                  </li>
                  <li>
                    <article class="media">
                      <img class="d-flex g-width-40 g-height-40 rounded-circle mr-3" src="${pageContext.request.contextPath}/assets/img-temp/100x100/img2.jpg" alt="Image Description">
                      <div class="media-body">
                        <h4 class="h6 g-color-black g-font-weight-600">WrapBootstrap</h4>
                        <p class="g-color-gray-dark-v4">This is where we sit down, grab a cup of coffee and dial in the details.</p>
                        <a class="btn u-btn-outline-primary g-font-size-11 g-rounded-25" href="#">Follow</a>
                      </div>
                    </article>
                  </li>
                </ul>
              </div> -->
              <!-- End Publications -->

              <!-- <hr class="g-brd-gray-light-v4 g-my-50"> -->

              <!-- Tags -->
              <!-- <div class="g-mb-40">
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
              </div> -->
              <!-- End Tags -->

              <!-- <hr class="g-brd-gray-light-v4 g-my-50"> -->
              
            </div>
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
  <script src="${pageContext.request.contextPath}/assets/js/components/hs.sticky-block.js"></script>
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