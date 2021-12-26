<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
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
  <title>내 정보 수정</title>

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
  
  <script type="text/javascript">
    function form_check() {
    	  var name = document.getElementById("memberName");
    	  var nickname = document.getElementById("memberNickname");    	
    	  var email = document.getElementById("memberEmail");
    	  var message = document.getElementById("memberMessage");
    	  
	    	if ( name.value == "" ) {
	    	    alert( "이름을 입력해주세요." );
	    	    name.focus();
	    		return false;
	        }
	    	if ( nickname.value == "" ) {
	            alert( "닉네임을 입력해주세요." );
	            nickname.focus();
	            return false;
	        }
	    	if ( email.value =="") {
	            alert( "이메일을 입력해주세요." );
	            email.focus();
	            return false;
	        }
	    	document.profileUpdate_Form.submit(); //유효성 검사의 포인트 
    }
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
			$("#changePwdForm").attr("action", "/user/myPage/changePwd");
			$("#changePwdForm").submit();
		}
	});
});
	
	
</script>

  
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
                <span class="u-label g-font-size-11 g-bg-cyan g-rounded-20 g-px-8"></span>
              </a>
              <!-- End 홈 -->

              <!-- 나의 게시물 -->
              <a href="${pageContext.request.contextPath}/user/myPage/board" class="list-group-item list-group-item-action justify-content-between">
                <span><i class="icon-layers g-pos-rel g-top-1 g-mr-8"></i>나의 게시물</span>
                <span class="u-label g-font-size-11 g-bg-primary g-rounded-20 g-px-10"></span>
              </a>
              <!-- End 나의 게시물 -->

              <!-- 나의 댓글 -->
              <a href="${pageContext.request.contextPath}/user/myPage/reply" class="list-group-item list-group-item-action justify-content-between">
                <span><i class="icon-bubbles g-pos-rel g-top-1 g-mr-8"></i>나의 댓글</span>
                <span class="u-label g-font-size-11 g-bg-pink g-rounded-20 g-px-8"></span>
              </a>
              <!-- End 나의 댓글 -->
              
              <!-- 정보 수정 -->
              
              
              <a href="${pageContext.request.contextPath}/user/myPage/setting" class="list-group-item justify-content-between active">
                <span><i class="icon-settings g-pos-rel g-top-1 g-mr-8"></i>내정보</span>
                <span class="u-label g-font-size-11 g-bg-white g-color-main g-rounded-20 g-px-10"></span>
              </a>              
            </div>
            <!-- End Sidebar Navigation -->
          </div>
          <!-- End Profile Sidebar -->
          <!-- Profle Content -->
          <div class="col-lg-9">
            <!-- Nav tabs -->
            <ul class="nav nav-justified u-nav-v1-1 u-nav-primary g-brd-bottom--md g-brd-bottom-2 g-brd-primary g-mb-20" role="tablist" data-target="nav-1-1-default-hor-left-underline" data-tabs-mobile-type="slide-up-down" data-btn-classes="btn btn-md btn-block rounded-0 u-btn-outline-primary g-mb-20">
              <li class="nav-item">
                <a class="nav-link g-py-10 active" data-toggle="tab" href="#nav-1-1-default-hor-left-underline--1" role="tab">정보 수정</a>
              </li>
              <li class="nav-item">
                <a class="nav-link g-py-10" data-toggle="tab" href="#nav-1-1-default-hor-left-underline--2" role="tab">비밀번호 설정</a>
              </li>
              <li class="nav-item">
                <a class="nav-link g-py-10" data-toggle="tab" href="" role="tab"></a>
              </li>
              <li class="nav-item">
                <a class="nav-link g-py-10" data-toggle="tab" href="" role="tab"></a>
              </li>
            </ul>
            <!-- End Nav tabs -->

            <!-- Tab panes -->
            <div id="nav-1-1-default-hor-left-underline" class="tab-content">
              <!-- Edit Profile -->
              <div class="tab-pane fade show active" id="nav-1-1-default-hor-left-underline--1" role="tabpanel" data-parent="#nav-1-1-default-hor-left-underline">
                <h2 class="h4 g-font-weight-300">개인정보</h2>
                <p>이름, 닉네임, 성별, 이메일, 생년월일, 다짐메세지를 수정할 수 있습니다. </p>
                
                <form name="profileUpdate_Form" method="post" action="${pageContext.request.contextPath}/user/myPage/update" enctype="multipart/form-data">
                <input type="hidden" name="memberId" value="${member.memberId}"/>
                <ul class="list-unstyled g-mb-30">
                  <!-- ID -->
                  <li class="d-flex align-items-center justify-content-between g-brd-bottom g-brd-gray-light-v4 g-py-15">
                    <div class="g-pr-10">
                      <strong class="d-block d-md-inline-block g-color-gray-dark-v2 g-width-200 g-pr-10">아이디</strong>
                      <span class="align-top">${requestScope.member.memberId}</span>
                    </div>
                    
                  </li>
                  <!-- End ID -->

                  <!-- Your NAME -->
                  <li class="d-flex align-items-center justify-content-between g-brd-bottom g-brd-gray-light-v4 g-py-15">
                    <div class="g-pr-10">
                      <strong class="d-block d-md-inline-block g-color-gray-dark-v2 g-width-200 g-pr-10">이름</strong>
                      <input class="align-top" id="memberName" name="memberName" value="${requestScope.member.memberName}"></span>
                    </div>
                    
                  </li>
                  <!-- End Your NAME -->

                  <!-- NickName -->
                  <li class="d-flex align-items-center justify-content-between g-brd-bottom g-brd-gray-light-v4 g-py-15">
                    <div class="g-pr-10">
                      <strong class="d-block d-md-inline-block g-color-gray-dark-v2 g-width-200 g-pr-10">닉네임</strong>
                      <input class="align-top" id="memberNickname" name="memberNickname" value="${requestScope.member.memberNickname}"></span>
                    </div>
                    
                  </li>
                  <!-- End NickName -->

                  <!-- Gender -->
                  <li class="d-flex align-items-center justify-content-between g-brd-bottom g-brd-gray-light-v4 g-py-15">
                    <div class="g-pr-10">
                      <strong class="d-block d-md-inline-block g-color-gray-dark-v2 g-width-200 g-pr-10">성별</strong>
                      <c:choose>
                        <c:when test="${requestScope.member.memberGender==1}">
                      	  <span class="align-top" id="memberGender" name="memberGender">남</span>
                        </c:when>
                        <c:otherwise>
                          <span class="align-top" id="memberGender" name="memberGender">여</span>
                        </c:otherwise>
                      </c:choose>
                    </div>
                    
                  </li>
                  <!-- End Gender -->

                  <!-- Email Address -->
                  <li class="d-flex align-items-center justify-content-between g-brd-bottom g-brd-gray-light-v4 g-py-15">
                    <div class="g-pr-10">
                      <strong class="d-block d-md-inline-block g-color-gray-dark-v2 g-width-200 g-pr-10">이메일</strong>
                      <input class="align-top" id="memberEmail" name="memberEmail" value="${requestScope.member.memberEmail}"></span>
                    </div>
                    
                  </li>
                  <!-- End Email Address -->

                  <!-- 생년월일 -->
                  <li class="d-flex align-items-center justify-content-between g-brd-bottom g-brd-gray-light-v4 g-py-15">
                    <div class="g-pr-10">
                      <strong class="d-block d-md-inline-block g-color-gray-dark-v2 g-width-200 g-pr-10">생년월일</strong>
                      <input class="align-top" id="memberBirth" name="memberBirth" value="${requestScope.member.memberBirth}"></span>
                    </div>
                    
                  </li>
                  <!-- End Linked Account -->

                  <!-- 가입일 -->
                  <li class="d-flex align-items-center justify-content-between g-brd-bottom g-brd-gray-light-v4 g-py-15">
                  <fmt:parseDate var="cntday" value="${member.memberJoindate}" pattern="yyyy-MM-dd"/>
                  <fmt:formatDate  var="day" value="${cntday}" type="DATE" pattern="yyyy년 MM월 dd일"/>
                    <div class="g-pr-10">
                      <strong class="d-block d-md-inline-block g-color-gray-dark-v2 g-width-200 g-pr-10">가입일</strong>
                      <span class="align-top">${day}</span>
                    </div>
                    
                  </li>
                  <!-- End 가입일 -->

                  <!-- 다짐메세지  -->
                  <li class="d-flex align-items-center justify-content-between g-brd-bottom g-brd-gray-light-v4 g-py-15">
                    <div class="g-pr-10">
                      <strong class="d-block d-md-inline-block g-color-gray-dark-v2 g-width-200 g-pr-10">다짐메세지</strong>
                      <input class="align-top" id="memberMessage" name="memberMessage" value="${requestScope.member.memberMessage}"></span>
                    </div>
                    
                  </li>
                  <!-- End 다짐메세지 -->

                  <!-- 프로필 이미지 -->
                  <li class="d-flex align-items-center justify-content-between g-brd-bottom g-brd-gray-light-v4 g-py-15">
                    <div class="g-pr-10">
                      <strong class="d-block d-md-inline-block g-color-gray-dark-v2 g-width-200 g-pr-10">프로필이미지 변경</strong>
                      <span class="align-top"><input type="file" name="file" id="mainImg" value="${pageContext.request.contextPath}/save/저염1.jpg" maxlength="60" size="20" accept="image/jpeg, image/png, image/jpg"> </span>

                    </div>
                    
                  </li>
                  <!-- End 프로필이미지 -->

                </ul>

                <div class="text-sm-right">
                  <input type="reset" class="btn u-btn-darkgray rounded-0 g-py-12 g-px-25 g-mr-10" ></a>
                  <button id="check" type="button" onclick="form_check()" class="btn u-btn-primary rounded-0 g-py-12 g-px-25" >수정하기</a>
                  </button>
                </form>
                </div>
              </div>
              <!-- End 정보수정 -->

              <!-- Security Settings -->
              <div class="tab-pane fade" id="nav-1-1-default-hor-left-underline--2" role="tabpanel" data-parent="#nav-1-1-default-hor-left-underline">
                <h2 class="h4 g-font-weight-300">비밀번호 설정</h2>
                <p class="g-mb-25">비밀번호를 변경할 수 있습니다. </p>

                <form class="g-py-15" id="changePwdForm" method="post">
                  <!-- Current Password -->
                  <div class="form-group row g-mb-25">
                    <label class="col-sm-3 col-form-label g-color-gray-dark-v2 g-font-weight-700 text-sm-right g-mb-10">현재 비밀번호</label>
                    <div class="col-sm-9">
                      <div class="input-group g-brd-primary--focus">
                        <input id="memberPwd" name="memberPwd" class="form-control form-control-md border-right-0 rounded-0 g-py-13 pr-0" type="password" placeholder="현재 비밀번호 입력">
                        <div class="input-group-append">
                          <span class="input-group-text g-bg-white g-color-gray-light-v1 rounded-0"><i class="icon-lock"></i></span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- End Current Password -->

                  <!-- New Password -->
                  <div class="form-group row g-mb-25">
                    <label class="col-sm-3 col-form-label g-color-gray-dark-v2 g-font-weight-700 text-sm-right g-mb-10">새로운 비밀번호</label>
                    <div class="col-sm-9">
                      <div class="input-group g-brd-primary--focus">
                        <input id="newMemberPwd" name="newMemberPwd" class="form-control form-control-md border-right-0 rounded-0 g-py-13 pr-0" type="password" placeholder="새 비밀번호 입력">
                        <div class="input-group-append">
                          <span class="input-group-text g-bg-white g-color-gray-light-v1 rounded-0"><i class="icon-lock"></i></span>
                        </div>
                      </div>
                      <span class="g-font-weight-500 g-font-size-13 g-mb-25" id="pwdCheck" style="display:none">※ 8~16자 영문, 숫자, 특수문자 모두 포함하여 입력</span><p>
                    </div>
                  </div>
                  <!-- End New Password -->

                  <!-- Verify Password -->
                  <div class="form-group row g-mb-25">
                    <label class="col-sm-3 col-form-label g-color-gray-dark-v2 g-font-weight-700 text-sm-right g-mb-10">새로운 비밀번호 확인</label>
                    <div class="col-sm-9">
                      <div class="input-group g-brd-primary--focus">
                        <input id="newMemberPwdConfirm" name="newMemberPwdConfirm" class="form-control form-control-md border-right-0 rounded-0 g-py-13 pr-0" type="password" placeholder="새 비밀번호 다시 한번 입력">
                        <div class="input-group-append">
                          <span class="input-group-text g-bg-white g-color-gray-light-v1 rounded-0"><i class="icon-lock"></i></span>
                        </div>
                      </div>
                      <span class="g-font-weight-500 g-font-size-13" id="pwdConfirmCheckOk">※ 비밀번호가 일치합니다.</span>
         			  <span class="g-font-weight-500 g-font-size-13" id="pwdConfirmCheckFail">※ 비밀번호가 일치하지 않습니다.</span>
                    </div>
                  </div>
                  <!-- End Verify Password -->
                  
                  <div class="text-sm-right">
                    <button id="changePwdBtn" class="btn u-btn-primary rounded-0 g-py-12 g-px-25" type="button">비밀번호 변경</button>
                  </div>
                </form>
              </div>
              <!-- End Security Settings -->

            </div>
            <!-- End Tab panes -->
          </div>
          <!-- End Profle Content -->
        </div>
      </div>
    </section>

  <div class="u-outer-spaces-helper"></div>


  <!-- JS Global Compulsory -->
  <script src="../../assets/vendor/jquery/jquery.min.js"></script>
  <script src="../../assets/vendor/jquery-migrate/jquery-migrate.min.js"></script>
  <script src="../../assets/vendor/popper.js/popper.min.js"></script>
  <script src="../../assets/vendor/bootstrap/bootstrap.min.js"></script>


  <!-- JS Implementing Plugins -->
  <script src="../../assets/vendor/appear.js"></script>
  <script src="../../assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
  <script src="../../assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="../../assets/vendor/jquery.maskedinput/src/jquery.maskedinput.js"></script>
  <script src="../../assets/vendor/chosen/chosen.jquery.js"></script>

  <!-- JS Unify -->
  <script src="../../assets/js/hs.core.js"></script>
  <script src="../../assets/js/helpers/hs.hamburgers.js"></script>
  <script src="../../assets/js/components/hs.header.js"></script>
  <script src="../../assets/js/components/hs.tabs.js"></script>
  <script src="../../assets/js/components/hs.progress-bar.js"></script>
  <script src="../../assets/js/components/hs.scrollbar.js"></script>
  <script src="../../assets/js/helpers/hs.not-empty-state.js"></script>
  <script src="../../assets/js/helpers/hs.focus-state.js"></script>
  <script src="../../assets/js/components/hs.masked-input.js"></script>
  <script src="../../assets/js/components/hs.select.js"></script>
  <script src="../../assets/js/components/hs.go-to.js"></script>

  <!-- JS Customization -->
  <script src="../../assets/js/custom.js"></script>

  <!-- JS Plugins Init. -->
  <script>
    $(document).on('ready', function () {
        $.HSCore.helpers.HSFocusState.init();
        $.HSCore.helpers.HSNotEmptyState.init();

        // initialization of go to
        $.HSCore.components.HSGoTo.init('.js-go-to');

        // initialization of tabs
        $.HSCore.components.HSTabs.init('[role="tablist"]');

        // initialization of input masking
        $.HSCore.components.HSMaskedInput.init('[data-mask]');

        // initialization of custom select
        $.HSCore.components.HSSelect.init('.js-custom-select');

        // initialization of HSScrollBar component
        $.HSCore.components.HSScrollBar.init( $('.js-scrollbar') );
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

        // initialization of horizontal progress bars
        setTimeout(function () { // important in this case
          var horizontalProgressBars = $.HSCore.components.HSProgressBar.init('.js-hr-progress-bar', {
            direction: 'horizontal',
            indicatorSelector: '.js-hr-progress-bar-indicator'
          });
        }, 1);
      });

      $(window).on('resize', function () {
        setTimeout(function () {
          $.HSCore.components.HSTabs.init('[role="tablist"]');
        }, 200);
      });
  </script>
</body>

</html>
