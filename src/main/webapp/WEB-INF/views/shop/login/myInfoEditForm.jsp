<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
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
    
<script type="text/javascript">


	function form_check_myInfo(){
	  //이름, 이메일, 휴대전화
  	  var newName = document.getElementById("newName"); 
  	  var newEmail = document.getElementById("email");
  	  var newPhone = document.getElementById("phone");
  	  var pwd = document.getElementById("pwd");

  	  var reg_name = /^[가-힣]+$/; //한글만
  	  var reg_num = /^[0-9]*$/; // 숫자만 

      var reg_contact = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
      var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
  	  
  	   
 	      if (newName.value == "" || !reg_name.test(newName.value) || newName.value.length >5 ) {
	  	    alert("이름을 확인하세요.");
	  	    return false;
	  	  }


    	  if (newEmail.value == "" ) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
      	    alert("이메일 주소를 입력하세요.");
      	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
          }
         
          if (!reg_email.test(newEmail.value)) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
        	    alert("이메일 형식이 올바르지 않습니다.");
        	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
          }


    	  if (newPhone.value == "" || !reg_contact.test(newPhone.value) ) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    	    alert("전화번호를 확인하세요.");
    	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
    	  }
    	  
    	  if (pwd.value == "" ) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
      	    alert("비밀번호를 입력해주세요.");
      	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
      	  }
    	  
        

    	  
  	  //입력 값 전송
  	  document.check_form_myInfo.submit();
		
	}
    

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
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/shop/selectCart">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-114 u-line-icon-pro"></i></span>
                    장바구니
                  </a>
                </li>
                <li class="g-py-3">
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/shop/user/orderList">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-115 u-line-icon-pro"></i></span>
                    주문내역
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
            <center><b>${error}</b></center><p>
            <div class="g-brd-around g-brd-gray-light-v4 rounded g-pa-30 g-mb-30">
              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1">ID:</span>
                  <span name="id" class="d-block"><sec:authentication property="principal.Username"/></span>
                </div>

                
              </div>

              <hr class="g-brd-gray-light-v4 g-my-20">

			  <form name="check_form_myInfo" method="post" action="${pageContext.request.contextPath}/shop/login/updateMyInfo" >
              <div class="row">
               
                <div class="col-8">
                
                  <span class="d-block g-color-text g-font-size-13 mb-1">이름:</span>
                  <span class="d-block">
                 
                  <input id="newName" name="newName" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="text" value="${member.memberName}">
                  </span>
                </div>

                
              </div>

              <hr class="g-brd-gray-light-v4 g-my-20">

              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1">Email:</span>
                  <span class="d-block"><input id="email" name="email" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="text" value="${member.memberEmail}"></span>
                </div>

                
              </div>

              <hr class="g-brd-gray-light-v4 g-my-20">

              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1">휴대전화:</span>
                  <span class="d-block"><input id="phone" name="phone" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="text" value="${member.memberPhone}"></span>
                </div>

              
              </div>

              <hr class="g-brd-gray-light-v4 g-my-20">
              
              
			    
              <div class="row">
                <div class="col-8">
                  <span class="d-block g-color-text g-font-size-13 mb-1"></span>
                  <input name="pwd" id="pwd" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="password" placeholder="비밀번호를 입력해주세요."/>
                  
                  </span>
                </div>
                
                

                <div class="col-4 text-right">
                  <button name="form_check" type="button" class="btn g-brd-around g-brd-gray-light-v3 g-color-gray-dark-v3 g-bg-gray-light-v5 g-bg-gray-light-v4--hover g-font-size-13 rounded g-px-18 g-py-7" style="margin-top: 10px" onclick="form_check_myInfo()">수정하기</button>
                </div>
              
              </div>
              </form>
              
            </div>
            <!-- End Info -->

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
