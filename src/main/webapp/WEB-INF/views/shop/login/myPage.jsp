<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
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
  <head>
    <!-- Title -->
    <title>E-commerce Login &amp; Security Page | Unify - Responsive Website Template</title>


    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">

    <!-- Google Fonts -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto Sans KR:300,400,500,700,900">

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-line/css/simple-line-icons.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-line-pro/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-hs/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hamburgers/hamburgers.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">

    <!-- CSS Unify Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e-commerce/assets/css/styles.e-commerce.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
    
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">


    $(document).on("click","#checked",function(){
		$("#basicCheck_form").attr("action", "${pageContext.request.contextPath}/shop/login/basicCheck/"+$(this).attr("name"));
		alert("기본배송지로 등록되었습니다.");
         $("#basicCheck_form").submit(); 
	  });
    

</script>
<script type="text/javascript">
$(function(){
	//id=memberPwd, newMemberPwd, newMemberPwdConfirm
	$("#memberPwd").blur(function(){
		$("#memberPwd").css("outline", "none");
	});
	$("#newMemberPwd").focus(function(){
		$("#pwdCheck").show();
	});
	$("#newMemberPwd").blur(function(){
		$("#newMemberPwd").css("outline", "none");
	});
	$("#newMemberPwdConfirm").focus(function(){
		$("#memberPwdConfirm").show();
	});
	$("#newMemberPwdConfirm").blur(function(){
		$("#newMemberPwdConfirm").css("outline", "none");
	});
});
</script>
<script type="text/javascript">
$(function(){
	var pwdCheck = false;
	var newPwdCheck = false;
	var newPwdConfirmCheck = false;
	
	$("#newMemberPwd").on("propertychange change keyup paste input", function(){
		
		console.log("keyup 테스트");	
		var newMemberPwd = $("#newMemberPwd").val();
		var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;

		if(newMemberPwd == ""){
			$("#pwdCheck").css("color", "black");
		}else{
			if(regExp.test(newMemberPwd)){
				$("#pwdCheck").css("color", "green");
				newPwdCheck = true;
			}else{
				$("#pwdCheck").css("color", "red");
				newPwdCheck = false;
			}
		}
	});
	
	$("#newMemberPwdConfirm").on("propertychange change keyup paste input", function(){
		var newMemberPwd = $("#newMemberPwd").val();
		var newMemberPwdConfirm = $("#newMemberPwdConfirm").val();

		if(newMemberPwdConfirm == ""){
			$("#pwdConfirmCheckOk").css("display", "none");
			$("#pwdConfirmCheckFail").css("display", "none");
		}else{
			if(newMemberPwd == null || newMemberPwdConfirm != newMemberPwd){
				$("#pwdConfirmCheckOk").css("display", "none");
				$("#pwdConfirmCheckFail").css("display", "inline-block").css("color", "red");
				newPwdConfirmCheck = false;
			}else{
				$("#pwdConfirmCheckFail").css("display", "none");
				$("#pwdConfirmCheckOk").css("display", "inline-block").css("color", "green");
				newPwdConfirmCheck = true;
			}
		}
	});
	
	$("#changePwdBtn").click(function(){
		//비밀번호 공백 확인
		if($("#memberPwd").val() == ""){
			pwdCheck = false;
		}else{
			pwdCheck = true;
		}
		//새 비밀번호 공백 확인
		if($("#newMemberPwd").val() == ""){
			newPwdCheck = false;
		}
		//새 비밀번호 확인 공백 확인
		if($("#newMemberPwdConfirm").val() == ""){
			newPwdConfirmCheck = false;
		}
		
		if(!pwdCheck){
			$("#memberPwd").focus();
		}else if(!newPwdCheck){
			$("#newMemberPwd").focus();
		}else if(!newPwdConfirmCheck){
			$("#newMemberPwdConfirm").focus();
		}else{ //true일 때 전송
			$("#changePwdForm").attr("action", "/shop/login/changePwd");
			$("#changePwdForm").submit();
		}
	});
});
	
</script>
 
    
  </head>

  <body>
    <main>
      <!-- Header -->
      
      <!-- End Header -->

      <!-- Breadcrumbs -->
      <section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
        <div class="container">
          <div class="d-sm-flex text-center">
            <div class="align-self-center">
              <h1 class="h3 mb-0"><b>내 정보</b></h1>
            </div>

            <div class="align-self-center ml-auto">
              <ul class="u-list-inline">
                <li class="list-inline-item g-mr-5">
                  <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/shop/main">EGYM SHOP</a>
                  <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
                </li>
                <li class="list-inline-item g-color-primary">
                  <span>내 정보</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
      <!-- End Breadcrumbs -->

      <div class="container g-pt-70 g-pb-30">
        <div class="row justify-content-center">
          <!-- Profile Settings -->
          <div class="col-lg-3 g-mb-50">
            <aside class="g-brd-around g-brd-gray-light-v4 rounded g-px-20 g-py-30">
              <!-- Profile Picture -->
              <div class="text-center g-pos-rel g-mb-30">
              <%-- <div class="g-width-100 g-height-100 mx-auto mb-3">
                  <img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/save/${member.profileImage}" alt="Image Decor">
                </div> --%>

                <span id="name" class="d-block g-font-weight-500">
                <sec:authorize access="isAuthenticated()">
<%--     				<sec:authentication property="principal" /> <p>
 --%>    			<hidden name="memberId" value='<sec:authentication property="principal.Username"/>'/>	
        			<sec:authentication property="principal.Username" /> 님 환영합니다. <!-- Authentication의 getPrincipal().getName() -> Principal은 Provider에서 Authentication 에 넣어준 VO(생성자 첫 매개변수) -->
    			</sec:authorize>
                </span>

              </div>
              <!-- End Profile Picture -->

              <hr class="g-brd-gray-light-v4 g-my-30">

              <!-- Profile Settings List -->
              <ul class="list-unstyled mb-0">
                <li class="g-pb-3">
                  <a class="d-block align-middle active u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover g-color-primary--parent-active g-bg-gray-light-v5--active rounded g-pa-3" href="${pageContext.request.contextPath}/shop/user/myPage">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-059 u-line-icon-pro"></i></span>
                    내정보
                  </a>
                </li>
                <li class="g-py-3">
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/shop/user/orderList">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-115 u-line-icon-pro"></i></span>
                    주문내역
                  </a>
                </li>
                
                <li class="g-py-3">
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/shop/user/cancleList">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-115 u-line-icon-pro"></i></span>
                    환불내역
                  </a>
                </li>
                <li class="g-py-3">
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/shop/selectCart">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-hotel-restaurant-105 u-line-icon-pro"></i></span>
                    장바구니
                  </a>
                </li>
                <li class="g-py-3">
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/shop/login/myAddress">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-real-estate-048 u-line-icon-pro"></i></span>
                    배송지관리
                  </a>
                </li>
              </ul>
              <!-- End Profile Settings List -->
            </aside>
          </div>
          <!-- End Profile Settings -->

          <!-- Login & Security -->

          <div class="col-lg-9 g-mb-50">
            <!-- Info -->
            <h3 class="h4 g-font-weight-300">개인 정보</h3><p>
            <div class="g-brd-around g-brd-gray-light-v4 rounded g-pa-30 g-mb-30">
              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1">ID:</span>
                  <span name="id" class="d-block">${member.memberId}</span>
                </div>

                
              </div>

              <hr class="g-brd-gray-light-v4 g-my-20">

              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1">이름:</span>
                  <span class="d-block">${member.memberName}</span>
                </div>

                
              </div>

              <hr class="g-brd-gray-light-v4 g-my-20">

              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1">Email:</span>
                  <span class="d-block">${member.memberEmail}</span>
                </div>

                
              </div>

              <hr class="g-brd-gray-light-v4 g-my-20">

              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1">휴대전화:</span>
                  <span class="d-block">${member.memberPhone}</span>
                </div>

              
              </div>

              <hr class="g-brd-gray-light-v4 g-my-20">
              
               <form method="post" action="${pageContext.request.contextPath}/shop/login/myInfoForm" >
			    
              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1"></span>
                </div>

                <div class="col-4 text-right">
                  <button type="submit" class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-13 rounded g-px-18 g-py-7" >수정</button>
                </div>
              
              </div>
              </form>
              
            </div>
            <!-- End Info -->
            <form class="g-py-15" id="changePwdForm" method="post">
			<h3 class="h4 g-font-weight-300">비밀번호 변경</h3><p>
            <div class="g-brd-around g-brd-gray-light-v4 rounded g-pa-30 g-mb-30">
              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1">현재 비밀번호:</span>
                  <input id="memberPwd" name="memberPwd" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="password" placeholder="현재 비밀번호 입력">
                </div>

                
              </div>

              <hr class="g-brd-gray-light-v4 g-my-20">

              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1">새 비밀번호:</span>
                  <input id="newMemberPwd" name="newMemberPwd" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="password" placeholder="새 비밀번호 입력">
                </div>
                
              </div>
			  <span class="g-font-weight-500 g-font-size-13 g-mb-25" id="pwdCheck" style="display:none">※ 8~16자 영문, 숫자, 특수문자 모두 포함하여 입력</span><p>
              <hr class="g-brd-gray-light-v4 g-my-20">

              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1">새 비밀번호 확인</span>
                  <input id="newMemberPwdConfirm" name="newMemberPwdConfirm" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="password" placeholder="새 비밀번호 다시 한번 입력">
                </div>
              </div>
			  <span class="g-font-weight-500 g-font-size-13" id="pwdConfirmCheckOk">※ 비밀번호가 일치합니다.</span>
         	  <span class="g-font-weight-500 g-font-size-13" id="pwdConfirmCheckFail">※ 비밀번호가 일치하지 않습니다.</span>
              <hr class="g-brd-gray-light-v4 g-my-20">
              
               
			    
              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1"></span>
                </div>

                <div class="col-4 text-right">
                  <button type="button" id="changePwdBtn" class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-13 rounded g-px-18 g-py-7" >비밀번호 변경</button>
                </div>
              
              </div>
              </div>
              </form>
              
            </div>
          </div>
          <!-- End Login & Security -->
        </div>
      </div>

	  <!-- Footer  -->
    
    
	  <!-- 맨 위로 가기 -->
      <a class="js-go-to u-go-to-v2" href="#"
         data-type="fixed"
         data-position='{
           "bottom": 15,
           "right": 15
         }'
         data-offset-top="400"
         data-compensation="#js-header"
         data-show-effect="zoomIn">
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
    <script src="${pageContext.request.contextPath}/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- JS Unify -->
    <script src="${pageContext.request.contextPath}/assets/js/hs.core.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.header.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.go-to.js"></script>

    <!-- JS Customization -->
    <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

    <!-- JS Plugins Init. -->
    <script>
      $(document).on('ready', function () {
        // initialization of header
        $.HSCore.components.HSHeader.init($('#js-header'));
        $.HSCore.helpers.HSHamburgers.init('.hamburger');

        // initialization of HSMegaMenu component
        $('.js-mega-menu').HSMegaMenu({
          event: 'hover',
          pageContainer: $('.container'),
          breakpoint: 991
        });

        // initialization of HSDropdown component
        $.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
          afterOpen: function () {
            $(this).find('input[type="search"]').focus();
          }
        });

        // initialization of HSScrollBar component
        $.HSCore.components.HSScrollBar.init($('.js-scrollbar'));

        // initialization of go to
        $.HSCore.components.HSGoTo.init('.js-go-to');
      });
    </script>
    
  </body>
</html>
