<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#memberId").focus(function(){
		$("#memberId").css("outline", "1px solid green");
	});
	$("#memberId").blur(function(){
		$("#memberId").css("outline", "none");
	});
});
</script>
<script type="text/javascript">
$(function(){
	$("#findPwdBtn").click(function(){
		//이름 공백 확인
		if($("#memberId").val() == ""){
			$("#memberId").focus();
			$("#memberId").css("outline", "1px solid red");
		}else{
			$("#findPwdForm").attr("action", "/shop/findPwdInputId");
			$("#findPwdForm").submit();
		}
		
		return false;
	});
	
});
</script>
</head>
<body>
<div class="g-bg-primary">&nbsp</div>
<!-- Signup -->
 <section class="container g-pt-100 g-pb-20">
   <div class="row justify-content-center">
     <div class="col-lg-5 flex-lg-unordered g-mb-80">
       <div class="g-brd-around g-bg-white rounded g-px-30 g-py-50 mb-4">
         <header class="text-center mb-4">
           <h1 class="h3 g-color-black g-font-weight-400 text-capitalize">비밀번호 찾기</h1>
         </header>
         
         <p class="text-center g-color-gray-dark-v2 g-font-weight-500">비밀번호 찾기를 위한 아이디를 입력해주세요.</p>

		<hr class="g-brd-gray-light-v3 mb-10">

         
        <!-- Form -->
        <form class="g-py-15" id="findPwdForm" method="post">
          <div class="row">
            <div class="col g-mb-20">
              <input id="memberId" name="memberId" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15" type="text" placeholder="아이디 입력" autocomplete="off">
            </div>
          </div>
          
 		  <hr class="g-brd-gray-light-v3 mb-3">
         
          <button id="findPwdBtn" class="btn btn-block u-btn-primary rounded g-py-13" type="button">다음단계</button>
        </form>
        <!-- End Form -->
        
        <p style="float:right" class="g-color-gray-dark-v5 g-font-size-13 mb-0">아이디를 찾으시나요? <a class="g-font-weight-600" href="${pageContext.request.contextPath}/shop/findId">아이디 찾기</a>
      </div>
    </div>

  </div>
</section>
<!-- End Signup -->

<!-- Call to Action -->
<section class="g-bg-primary">
  <div class="container g-pt-25 g-pb-10">
    <div class="row justify-content-between align-items-center">
      <div class="col-sm-6 col-md-8 g-mb-15">
        <h3 class="h4 g-color-white g-font-weight-300 text-uppercase mb-0">Subscribe to our weekly <span class="g-font-weight-600">Newsletter</span></h3>
      </div>

      <div class="col-sm-6 col-md-4 g-mb-15">
        <div class="input-group rounded-0">
          <input class="form-control g-brd-white g-color-white g-placeholder-white g-bg-transparent rounded-0 g-px-15 g-py-13" type="email" placeholder="Enter your email ...">
          <span class="input-group-addon u-input-group-addon g-width-45 g-brd-white g-color-white">
              <i class="icon-communication-062 u-line-icon-pro"></i>
            </span>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- End Call to Action -->
</body>
</html>