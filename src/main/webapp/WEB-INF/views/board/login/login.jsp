<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html xmlns:th="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>
<!-- 로그인이 된 사용자는 들어오면 안 된다!! -->

  <sec:authorize access="isAuthenticated()">
     <script>
     location.href="${pageContext.request.contextPath}/main"
     
     </script>
   </sec:authorize>
<!-- Breadcrumbs -->
<div class="g-bg-primary">&nbsp</div>
  <section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
    <div class="container">
      <ul class="u-list-inline">
        <li class="list-inline-item">
          <a class="u-link-v5 g-color-main g-color-primary--hover" href="#">EGYM</a>
          <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
        </li>
        <li class="list-inline-item g-color-primary">
          <span>로그인</span>
        </li>
      </ul>
    </div>
  </section>
  <!-- End Breadcrumbs -->
  <main>
  <!-- Login -->
    <section class="container g-py-150">
      <div class="row justify-content-center">
        <div class="col-sm-8 col-lg-5">
          <div class="g-brd-around g-brd-gray-light-v4 rounded g-py-40 g-px-30">
            <header class="text-center mb-4">
              <h2 class="h2 g-color-black g-font-weight-400">로그인</h2>
            </header>

            <!-- Form -->
              <form id="loginForm" class="g-py-15" method="post">
                <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}" /> <!-- csrf 토큰 값 -->
                <div class="mb-2">
                  <input id="username" name="username" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-brd-primary--hover rounded g-py-15 g-px-15" type="text" placeholder="아이디">
                </div>

                <div class="g-mb-35">
                  <input id="password" name="password" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-brd-primary--hover rounded g-py-15 g-px-15 mb-3" type="password" placeholder="비밀번호">
                  <div class="row justify-content-between">
                    <div class="col align-self-center">
                      <label class="form-check-inline u-check g-color-gray-dark-v4 g-font-size-12 g-pl-25 mb-0">
                        <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" type="checkbox">
                        <div class="u-check-icon-checkbox-v6 g-absolute-centered--y g-left-0">
                          <i class="fa" data-check-icon="&#xf00c"></i>
                        </div>
                        로그인 상태 유지
                      </label>
                    </div>
                    <div class="col align-self-center text-right">
                      <a class="g-font-size-12" href="${pageContext.request.contextPath}/findId">아이디</a>
                      <a class="g-font-size-12" href="#"> / </a>
                      <a class="g-font-size-12" href="${pageContext.request.contextPath}/findPwd">비밀번호 찾기</a>
                    </div>
                  </div>
                </div>

                <div class="mb-4">
                  <button id="loginBtn" class="btn btn-md btn-block u-btn-primary rounded g-py-13" type="button">로그인</button>
                </div>
              </form>
              <!-- End Form -->

            <footer class="text-center">
                <p class="g-color-gray-dark-v5 g-font-size-13 mb-0">아직 계정이 없으신가요? <a class="g-font-weight-600" href="${pageContext.request.contextPath}/signup">회원가입</a>
                </p>
              </footer>
          </div>
        </div>
      </div>
    </section>
    <!-- End Login -->

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

</body>
</html>