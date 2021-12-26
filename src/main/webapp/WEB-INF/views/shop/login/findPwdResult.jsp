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
<!-- Login -->
  <section class="container g-py-150">
    <div class="row justify-content-center">
      <div class="col-sm-8 col-lg-5">
        <div class="g-brd-around g-brd-gray-light-v4 rounded g-py-40 g-px-30">
          <header class="text-center mb-1">
            <h2 class="h2 g-color-black g-font-weight-400">비밀번호가 변경되었습니다.</h2><br>
            <h5 class="h5 g-color-black g-font-weight-200">새로운 비밀번호로 다시 로그인해주세요.</h5>
          </header>
          <hr class="g-brd-gray-light-v3 mb-3">
          <div class="g-py-15">
            <a class="btn btn-md btn-block u-btn-primary rounded g-py-13" href="${pageContext.request.contextPath}/shop/login" >로그인</a>
         <a class="btn btn-md btn-block u-btn-outline-primary rounded g-py-13" href="${pageContext.request.contextPath}/shop/main">메인으로 돌아가기</a>
          </div>
          
        </div>
      </div>
    </div>
  </section>
  <!-- End Login -->
</main>
</body>
</html>