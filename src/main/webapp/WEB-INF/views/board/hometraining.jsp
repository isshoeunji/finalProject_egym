<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Title -->
  <title>Unify Search Results | | Unify - Responsive Website Template</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <!-- Required Meta Tags Always Come First -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <!-- Favicon -->
  <link rel="shortcut icon" href="../../favicon.ico">
  <!-- Google Fonts -->
  <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans%3A400%2C300%2C500%2C600%2C700%7CPlayfair+Display%7CNoto Sans KR%7CRaleway%7CSpectral%7CRubik">
  <!-- CSS Global Compulsory -->
  <link rel="stylesheet" href="../../assets/vendor/bootstrap/bootstrap.min.css">
  <!-- CSS Global Icons -->
  <link rel="stylesheet" href="../../assets/vendor/icon-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="../../assets/vendor/icon-line/css/simple-line-icons.css">
  <link rel="stylesheet" href="../../assets/vendor/icon-etlinefont/style.css">
  <link rel="stylesheet" href="../../assets/vendor/icon-line-pro/style.css">
  <link rel="stylesheet" href="../../assets/vendor/icon-hs/style.css">
  <link rel="stylesheet" href="../../assets/vendor/animate.css">
  <link rel="stylesheet" href="../../assets/vendor/dzsparallaxer/dzsparallaxer.css">
  <link rel="stylesheet" href="../../assets/vendor/dzsparallaxer/dzsscroller/scroller.css">
  <link rel="stylesheet" href="../../assets/vendor/dzsparallaxer/advancedscroller/plugin.css">
  <link rel="stylesheet" href="../../assets/vendor/hs-megamenu/src/hs.megamenu.css">
  <link rel="stylesheet" href="../../assets/vendor/hamburgers/hamburgers.min.css">

  <!-- CSS Unify -->
  <link rel="stylesheet" href="../../assets/css/unify-core.css">
  <link rel="stylesheet" href="../../assets/css/unify-components.css">
  <link rel="stylesheet" href="../../assets/css/unify-globals.css">

  <!-- CSS Customization -->
  <link rel="stylesheet" href="../../assets/css/custom.css">
</head>

<body>
  <main>



    
    	<!-- Page Title -->
    	<c:choose>
    	<c:when test="${boardKind==6}">
    	<section class="g-bg-gray-light-v5 g-py-30">
		      <div class="container text-center">
		        <h4 class="h4 g-color-black g-font-weight-600">홈트레이닝 > 전체</h4>
		        <ul class="u-list-inline">
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-mr-5">
		            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/6">홈트레이닝</a>
		            <i class="g-color-gray-light-v2 g-ml-5">/</i>
		          </li>
		          <li class="list-inline-item g-color-primary">
		            <span>전체</span>
		          </li>
		        </ul>
		      </div>
	   	  </section>
	   	  </c:when>
	   	  <c:when test="${tagrelNo==21}">
	    	<section class="g-bg-gray-light-v5 g-py-30">
			      <div class="container text-center">
			        <h4 class="h4 g-color-black g-font-weight-600">홈트레이닝 > 전신</h4>
			        <ul class="u-list-inline">
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/6">홈트레이닝</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-color-primary">
			            <span>전신</span>
			          </li>
			        </ul>
			      </div>
		   	  </section>
	   	  </c:when>
	   	  <c:when test="${tagrelNo==22}">
	    	<section class="g-bg-gray-light-v5 g-py-30">
			      <div class="container text-center">
			        <h4 class="h4 g-color-black g-font-weight-600">홈트레이닝 > 복부</h4>
			        <ul class="u-list-inline">
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/6">홈트레이닝</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-color-primary">
			            <span>복부</span>
			          </li>
			        </ul>
			      </div>
		   	  </section>
	   	  </c:when>
	   	  <c:when test="${tagrelNo==23}">
	    	<section class="g-bg-gray-light-v5 g-py-30">
			      <div class="container text-center">
			        <h4 class="h4 g-color-black g-font-weight-600">홈트레이닝 > 상체</h4>
			        <ul class="u-list-inline">
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/6">홈트레이닝</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-color-primary">
			            <span>상체</span>
			          </li>
			        </ul>
			      </div>
		   	  </section>
	   	  </c:when>
	   	  <c:when test="${tagrelNo==24}">
	    	<section class="g-bg-gray-light-v5 g-py-30">
			      <div class="container text-center">
			        <h4 class="h4 g-color-black g-font-weight-600">홈트레이닝 > 하체</h4>
			        <ul class="u-list-inline">
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/6">홈트레이닝</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-color-primary">
			            <span>하체</span>
			          </li>
			        </ul>
			      </div>
		   	  </section>
	   	  </c:when>
	   	  <c:when test="${tagrelNo==25}">
	    	<section class="g-bg-gray-light-v5 g-py-30">
			      <div class="container text-center">
			        <h4 class="h4 g-color-black g-font-weight-600">홈트레이닝 > 스트레칭</h4>
			        <ul class="u-list-inline">
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/6">홈트레이닝</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-color-primary">
			            <span>스트레칭</span>
			          </li>
			        </ul>
			      </div>
		   	  </section>
	   	  </c:when>
	   	  <c:when test="${tagrelNo==26}">
	    	<section class="g-bg-gray-light-v5 g-py-30">
			      <div class="container text-center">
			        <h4 class="h4 g-color-black g-font-weight-600">홈트레이닝 > 댄스</h4>
			        <ul class="u-list-inline">
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/6">홈트레이닝</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-color-primary">
			            <span>댄스</span>
			          </li>
			        </ul>
			      </div>
		   	  </section>
	   	  </c:when>
	   	  <c:when test="${tagrelNo==27}">
	    	<section class="g-bg-gray-light-v5 g-py-30">
			      <div class="container text-center">
			        <h4 class="h4 g-color-black g-font-weight-600">홈트레이닝 > 요가</h4>
			        <ul class="u-list-inline">
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/main">Home</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-mr-5">
			            <a class="u-link-v5 g-color-gray-dark-v5 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/6">홈트레이닝</a>
			            <i class="g-color-gray-light-v2 g-ml-5">/</i>
			          </li>
			          <li class="list-inline-item g-color-primary">
			            <span>요가</span>
			          </li>
			        </ul>
			      </div>
		   	  </section>
	   	  </c:when>
	   	  </c:choose>
    	<!-- Page Title -->

    <section class="g-pt-50 g-pb-90">
      <div class="container">
        <div class="row">
          <!-- Sidebar -->
          <div class="col-lg-3 g-pr-40--lg g-mb-50 g-mb-0--lg">
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
		              <h3 class="h5 g-color-black g-font-weight-600 mb-4 g-pt-50">홈트레이닝</h3>
		              <ul class="list-unstyled g-font-size-13 mb-0">
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/21"><i class="mr-2 fa fa-angle-right"></i>전신</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/22"><i class="mr-2 fa fa-angle-right"></i>복부</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/23"><i class="mr-2 fa fa-angle-right"></i>상체</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/24"><i class="mr-2 fa fa-angle-right"></i>하체</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/25"><i class="mr-2 fa fa-angle-right"></i>스트레칭</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/26"><i class="mr-2 fa fa-angle-right"></i>댄스</a>
		                </li>
		                <li>
		                  <a class="d-block u-link-v5 g-color-gray-dark-v4 rounded g-px-20 g-py-8" href="${pageContext.request.contextPath}/board/selectByTag/27"><i class="mr-2 fa fa-angle-right"></i>요가</a>
		                </li>
		                <!-- <li>
		                  <a class="d-block active u-link-v5 g-color-black g-bg-gray-light-v5 g-font-weight-600 g-rounded-50 g-px-20 g-py-8" href="#"><i class="mr-2 fa fa-angle-right"></i> Untold Stories</a>
		                </li> -->
		              </ul>
            		</div>
            <!-- End Links -->

            
          </div>
          <!-- End Sidebar -->

          <!-- Search Results -->
          <div class="col-lg-9">
            <!-- Search Info -->
            <div class="d-md-flex justify-content-between g-mb-30">
              <ul class="list-inline">
                <li class="list-inline-item g-mr-30">
                  <a class="u-link-v5 g-color-gray-dark-v1 g-color-primary--hover" href="${pageContext.request.contextPath}/board/select/6">
                    <i class="icon-grid g-pos-rel g-top-1 g-mr-5"></i> 홈트레이닝 > 
                  </a>
                </li>
                <li class="list-inline-item">
                <c:choose>
                	<c:when test="${tagrelNo==21}">
						<a class="u-link-v5 g-color-gray-dark-v5 g-color-gray-dark-v5--hover" href="${pageContext.request.contextPath}/board/selectByTag/21">전신</a>                	
                	</c:when>
                	<c:when test="${tagrelNo==22}">
						<a class="u-link-v5 g-color-gray-dark-v5 g-color-gray-dark-v5--hover" href="${pageContext.request.contextPath}/board/selectByTag/22">복부</a>                	
                	</c:when>
                	<c:when test="${tagrelNo==23}">
						<a class="u-link-v5 g-color-gray-dark-v5 g-color-gray-dark-v5--hover" href="${pageContext.request.contextPath}/board/selectByTag/23">상체</a>                	
                	</c:when>
                	<c:when test="${tagrelNo==24}">
						<a class="u-link-v5 g-color-gray-dark-v5 g-color-gray-dark-v5--hover" href="${pageContext.request.contextPath}/board/selectByTag/24">하체</a>                	
                	</c:when>
                	<c:when test="${tagrelNo==25}">
						<a class="u-link-v5 g-color-gray-dark-v5 g-color-gray-dark-v5--hover" href="${pageContext.request.contextPath}/board/selectByTag/25">스트레칭</a>                	
                	</c:when>
                	<c:when test="${tagrelNo==26}">
						<a class="u-link-v5 g-color-gray-dark-v5 g-color-gray-dark-v5--hover" href="${pageContext.request.contextPath}/board/selectByTag/26">댄스</a>                	
                	</c:when>
                	<c:when test="${tagrelNo==27}">
						<a class="u-link-v5 g-color-gray-dark-v5 g-color-gray-dark-v5--hover" href="${pageContext.request.contextPath}/board/selectByTag/27">요가</a>                	
                	</c:when>
                	<c:otherwise>
                		<a class="u-link-v5 g-color-gray-dark-v5 g-color-gray-dark-v5--hover" href="${pageContext.request.contextPath}/board/select/6">전체</a>
                	</c:otherwise>
                </c:choose>
                </li>
              </ul>
            </div>
            <!-- End Search Info -->
			
			<!-- Start 게시물 리스트 -->
            <div class="row">
            <c:choose>
            <c:when test="${empty requestScope.pageList}">
            	<p align="center"><b><span style="font-size:9pt;">등록된 게시물이 없습니다.</span></b></p>
            </c:when>
            
            <c:otherwise>
            <c:forEach items="${requestScope.pageList.content}" var="board">
              <div class="col-lg-6 g-mb-30">
                <!-- Search Result -->
                <!-- Start article -->
                <article class="g-pa-25 u-shadow-v11 rounded">
                <!-- Start 썸네일 -->
                <img class="col-lg-17" src="${board.thumbnail}"  alt="${board.boardTitle}" />
                
                <!-- End 썸네일 -->
                  <h5 class="h5 g-mb-15">
                      <a class="u-link-v5 g-color-gray-dark-v1 g-color-primary--hover" href="${pageContext.request.contextPath}/board/detail/${board.boardNo}"><br>${board.boardTitle}</a>
                    </h5>

                  <!-- Search Info -->
                  <ul class="list-inline d-flex justify-content-between">
                  	<!-- 작성자 -->
                    <li class="list-inline-item g-mr-10">
                      <i class="icon-education-200 g-pos-rel g-top-1 g-color-gray-dark-v5 g-mr-5"></i>${board.memberNickname}
                    </li>
                    <!-- End 작성자 -->
                    
                     <!-- 댓글 수 -->
                    <li class="list-inline-item">
                      <i class="icon-finance-206 g-pos-rel g-top-1 g-color-gray-dark-v5 g-mr-5"></i> ${fn:length(board.replyList)}
                    </li>
                    <!-- End 댓글 수 -->
                    
                    <!-- 조회수  -->
                    <li class="list-inline-item">
                      <i class="icon-eye g-pos-rel g-top-1 g-color-gray-dark-v5 g-mr-5"></i> ${board.boardReadnum}
                    </li>
                    <!-- End 조회수 -->
                  </ul>
                  <!-- End Search Info -->
                </article>
                <!-- End article -->
                <!-- End Search Result -->
              </div>
              </c:forEach>
              </c:otherwise>
              </c:choose>
              <!-- End 게시물 리스트 -->
            </div>

            
            </div>

            <hr class="g-brd-gray-light-v4 g-mt-10 g-mb-40">

            <!-- Pagination -->
        <nav class="g-mb-100" aria-label="Page Navigation">
        <ul class="list-inline mb-0 text-center">
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
            <!-- 관리자만 글쓰기 버튼 보이게 -->
            <sec:authorize access="hasRole('ADMIN')">
            <span><a class="btn u-btn-outline-primary g-font-size-11 g-rounded-25" style="float: right;" href="${pageContext.request.contextPath}/board/writeHometraining">글쓰기</a></span>
            </sec:authorize>
          </ul>
        </nav>
        <!-- End Pagination -->


            
          </div>
          <!-- End Search Results -->
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
  <script src="../../assets/vendor/dzsparallaxer/dzsparallaxer.js"></script>
  <script src="../../assets/vendor/dzsparallaxer/dzsscroller/scroller.js"></script>
  <script src="../../assets/vendor/dzsparallaxer/advancedscroller/plugin.js"></script>

  <!-- JS Unify -->
  <script src="../../assets/js/hs.core.js"></script>
  <script src="../../assets/js/helpers/hs.hamburgers.js"></script>
  <script src="../../assets/js/components/hs.header.js"></script>
  <script src="../../assets/js/components/hs.tabs.js"></script>
  <script src="../../assets/js/helpers/hs.focus-state.js"></script>
  <script src="../../assets/js/components/hs.rating.js"></script>
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

        // initialization of rating
        $.HSCore.components.HSRating.init($('.js-rating'), {
          spacing: 2
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
      });
  </script>


</body>

</html>
