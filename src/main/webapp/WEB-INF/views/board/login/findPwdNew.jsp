<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<style>
  #pwdCheckOk, #pwdConfirmCheckOk {
    color : green;
    display : none;
  }
  #nameCheckFail, #pwdConfirmCheckFail {
    color : red;
    display : none;
  }
</style>
<script type="text/javascript">
$(function(){
	$("#memberPwd").focus(function(){
		$("#memberPwd").css("outline", "1px solid green");
		$("#pwdCheck").show();
	});
	$("#memberPwd").blur(function(){
		$("#memberPwd").css("outline", "none");
	});
	$("#memberPwdConfirm").focus(function(){
		$("#memberPwdConfirm").css("outline", "1px solid green");
	});
	$("#memberPwdConfirm").blur(function(){
		$("#memberPwdConfirm").css("outline", "none");
	});
})
</script>
<script type="text/javascript">
$(function(){
	var pwdCheck = false;
	var pwdConfirmCheck = false;
	
	$("#memberPwd").on("propertychange change keyup paste input", function(){
		
		console.log("keyup 테스트");	
		var memberPwd = $("#memberPwd").val();
		var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;

		if(memberPwd == ""){
			$("#pwdCheck").css("color", "black");
		}else{
			if(regExp.test(memberPwd)){
				$("#pwdCheck").css("color", "green");
				pwdCheck = true;
			}else{
				$("#pwdCheck").css("color", "red");
				pwdCheck = false;
			}
		}
	});
	
	$("#memberPwdConfirm").on("propertychange change keyup paste input", function(){
		var memberPwd = $("#memberPwd").val();
		var memberPwdConfirm = $("#memberPwdConfirm").val();

		if(memberPwdConfirm == ""){
			$("#pwdConfirmCheckOk").css("display", "none");
			$("#pwdConfirmCheckFail").css("display", "none");
		}else{
			if(memberPwd == null || memberPwdConfirm != memberPwd){
				$("#pwdConfirmCheckOk").css("display", "none");
				$("#pwdConfirmCheckFail").css("display", "inline-block").css("color", "red");
				pwdConfirmCheck = false;
			}else{
				$("#pwdConfirmCheckFail").css("display", "none");
				$("#pwdConfirmCheckOk").css("display", "inline-block").css("color", "green");
				pwdConfirmCheck = true;
			}
		}
	});
	
	$("#changePwdBtn").click(function(){
		//비밀번호 공백 확인
		if($("#memberPwd").val() == ""){
			pwdCheck = false;
		}
		//비밀번호 확인 공백 확인
		if($("#memberPwdConfirm").val() == ""){
			pwdConfirmCheck = false;
		}
		
		if(!pwdCheck){
			$("#memberPwd").focus();
			$("#memberPwd").css("outline", "1px solid red");
		}else if(!pwdConfirmCheck){
			$("#memberPwdConfirm").focus();
			$("#memberPwdConfirm").css("outline", "1px solid red");
		}else{ //true일 때 전송
			$("#changePwdForm").attr("action", "/changePwd");
			$("#changePwdForm").submit();
		}
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
           <h1 class="h3 g-color-black g-font-weight-400 text-capitalize">새 비밀번호 설정</h1>
         </header>

		<hr class="g-brd-gray-light-v3 mb-1">

         
         <!-- Form -->
       <form class="g-py-15" id="changePwdForm" method="post">
         <input type="hidden" name="memberId" value="${memberId}">
         <div class="g-mb-15">
           <label class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-14">새 비밀번호</label>
           <input id="memberPwd" name="memberPwd" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15" type="password" placeholder="새 비밀번호 입력">
         </div>
         <span class="g-font-weight-500 g-font-size-13 g-mb-25" id="pwdCheck" style="display:none">※ 8~16자 영문, 숫자, 특수문자 모두 포함하여 입력</span><p>
         <span class="g-font-weight-500 g-font-size-13 g-mb-25" id="pwdCheckOk">※ 사용 가능한 비밀번호입니다.</span>
       
         <div class="g-mb-15">
           <label class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-14">새 비밀번호 확인</label>
           <input id="memberPwdConfirm" name="memberPwdConfirm" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15" type="password" placeholder="새 비밀번호 다시 한번 입력">
         </div>
         <span class="g-font-weight-500 g-font-size-13" id="pwdConfirmCheckOk">※ 비밀번호가 일치합니다.</span>
         <span class="g-font-weight-500 g-font-size-13" id="pwdConfirmCheckFail">※ 비밀번호가 일치하지 않습니다.</span>
    
         <hr class="g-brd-gray-light-v3 mb-25">
		<button id="changePwdBtn" class="btn btn-block u-btn-primary rounded g-py-13 g-mb-15" type="button">비밀번호 변경</button>
       </form>
       <!-- End Form -->
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