<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main>
<!-- Login -->
  <section class="container g-py-150">
    <div class="row justify-content-center">
      <div class="col-sm-8 col-lg-5">
        <div class="g-brd-around g-brd-gray-light-v4 rounded g-py-40 g-px-30">
          <div class="text-center">
            <h4 class="h4 g-color-black g-font-weight-300">회원님의 아이디는</h4>
            <h1 class="h1 g-color-primary g-font-weight-300">${id} <span class="h4 g-color-black g-font-weight-300">입니다.</span></h1>
          </div>
          <hr class="g-brd-gray-light-v3 mb-3">
          <div class="g-py-15">
            <a class="btn btn-md btn-block u-btn-primary rounded g-py-13" href="${pageContext.request.contextPath}/login" >로그인</a>
         <a class="btn btn-md btn-block u-btn-outline-primary rounded g-py-13" href="${pageContext.request.contextPath}/main">메인으로 돌아가기</a>
          </div>
          
        </div>
      </div>
    </div>
  </section>
  <!-- End Login -->
</main>
</body>
</html>