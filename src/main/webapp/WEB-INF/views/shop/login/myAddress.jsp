<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title -->
    <title>E-commerce Addresses Page | Unify - Responsive Website Template</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/chosen/chosen.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hamburgers/hamburgers.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">

    <!-- CSS Unify Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e-commerce/assets/css/styles.e-commerce.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
    
    <script type="text/javascript">
    //유효성체크
    function form_check() {
    	
    	  //변수에 담아주기
    	  var memberName = document.getElementById("nameInput");
    	  var memberZip = document.getElementById("zipInput");
    	  var memberAddr = document.getElementById("addrInput2");
    	  var memberDetailAddr = document.getElementById("detailAddrInput");
    	  var memberContact = document.getElementById("contactInput");

    	  var reg_name = /^[가-힣]+$/; //한글만
    	  var reg_num = /^[0-9]*$/; // 숫자만 

          var reg_contact = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
    	  
    	  
    	  if (memberName.value == "" || !reg_name.test(memberName.value) || memberName.value.length >5 ) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    	    alert("이름을 확인하세요.");
    	    customerName.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
    	  };


      	  if (memberDetailAddr.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
        	    alert("상세 주소를 입력하세요.");
        	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
          };
          
          if (memberAddr.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
      	    alert("주소를 입력하세요.");
      	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
          };
          
          if (memberZip.value == "" ) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
      	    alert("우편번호를 입력하세요.");
      	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
      	  };

      	  if (memberContact.value == "" || !reg_contact.test(memberContact.value) ) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
      	    alert("전화번호를 확인하세요.");
      	    memberContact.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
      	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
      	  };
      	  
          

      	  
    	  //입력 값 전송
    	  document.check_form.submit(); //유효성 검사의 포인트 
    	  
    	}      
		
    	//기본배송지 버튼
    	$(document).on("click","#checked",function(){
    		$("#basicCheck_form").attr("action", "${pageContext.request.contextPath}/shop/login/basicCheck/"+$(this).attr("name"));
    		alert("기본배송지로 등록되었습니다.");
	         $("#basicCheck_form").submit(); 
    	  });
    		

    
    </script>
   <!-- 주소찾기 --> 
    <script>
	  function findAddr(){
		new daum.Postcode({
	      oncomplete: function(data) {
	        	
	        console.log(data);
	        	
	        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	        var roadAddr = data.roadAddress; // 도로명 주소 변수
	        var jibunAddr = data.jibunAddress; // 지번 주소 변수
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.getElementById('zipInput').value = data.zonecode;
	        if(roadAddr !== ''){
	          document.getElementById("addrInput2").value = roadAddr;
	          }else if(jibunAddr !== ''){
	            document.getElementById("addrInput2").value = jibunAddr;
	          }
	      }
	    }).open();
	  }
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    
  </head>

  <body>
    <main>
      <!-- Breadcrumbs -->
      <section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
        <div class="container">
          <div class="d-sm-flex text-center">
            <div class="align-self-center">
              <h1 class="h3 mb-0">나의 배송지관리</h1>
            </div>

            <div class="align-self-center ml-auto">
              <ul class="u-list-inline">
        
                <li class="list-inline-item g-mr-5">
                  <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/shop">EGYM SHOP</a>
                  <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
                </li>
                <li class="list-inline-item g-mr-5">
                  <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/shop/user/myPage">마이페이지</a>
                  <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
                </li>
                <li class="list-inline-item g-color-primary">
                  <span>배송지관리</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
      <!-- End Breadcrumbs -->

      <div class="container g-pt-70 g-pb-30">
        <div class="row">
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
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/shop/user/myPage">
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
                  <a class="d-block align-middle active u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover g-color-primary--parent-active g-bg-gray-light-v5--active rounded g-pa-3" href="${pageContext.request.contextPath}/shop/login/myAddress">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-real-estate-048 u-line-icon-pro"></i></span>
                    배송지관리
                  </a>
                </li>
              </ul>
              <!-- End Profile Settings List -->
            </aside>
          </div>
          <!-- End Profile Settings -->

          <!-- Addresses -->
          

           <div class="col-md-6 g-mb-30">
              
          <c:choose>
          <c:when test="${empty requestScope.addrList}">
          
          <p align="center"><b><span style="font-size:9pt;">등록된 배송지 정보가 없습니다.</span></b></p>
          </c:when>
		  <c:otherwise>
		  	<c:forEach items="${requestScope.addrList}" var="addr" varStatus="status">
                <!-- Addresses -->
                <div class="g-brd-around g-brd-gray-light-v4 rounded g-pa-30"><!-- 여기@! -->
                  <div class="g-mb-50">
                    <h3 class="h5 mb-3">주소 ${status.count}
                    <c:if test="${addr.checkBasic==1}">
                     <mark>기본배송지</mark>
                    </c:if>
                    
                    </h3>
                    
                    
                    <span class="d-block g-color-gray-dark-v3 g-font-weight-600 mb-2">받는 분: ${addr.receiver}</span>

                    <!-- Address -->
                    <address class="media">
                   
                        <span class="u-icon-v1 g-color-gray-dark-v4"><i class="icon-real-estate-027 u-line-icon-pro"></i></span>
                      
                        우편번호: ${addr.memberZip}
                        <br>
                        ${addr.memberAddress} ${addr.memberDetailAddress}
                        <br>
                      
                    </address>
                    <!-- End Address -->

                    <!-- Phone -->
                    <div class="media">
                      <div class="d-flex mr-3">
                        <span class="u-icon-v1 g-color-gray-dark-v4"><i class="icon-electronics-005 u-line-icon-pro"></i></span>
                      </div>
                      <div class="media-body g-color-text">
                        ${addr.phone}
                      </div>
                    </div>
                    <!-- End Phone -->
                  </div>

                  <!-- Edit/Delete -->
                  <ul class="d-flex align-items-center list-inline mb-0">
                    <li class="list-inline-item">
                      <a class="u-icon-v1 g-font-size-16 g-text-underline--none--hover" href="${pageContext.request.contextPath}/shop/login/addrEditForm/${addr.addressNo}" title="수정"
                         data-toggle="tooltip"
                         data-placement="top">
                        <i class="icon-finance-023 u-line-icon-pro"></i>
                      </a>
                    </li>
                    <li class="list-inline-item g-width-1 g-height-16 g-bg-gray-light-v2 g-pr-1 ml-2 mr-3"></li>
                    <li class="list-inline-item">
                      <a class="u-icon-v1 g-font-size-16 g-text-underline--none--hover" href="${pageContext.request.contextPath}/shop/login/deleteAddr/${addr.addressNo}" title="삭제"
                         data-toggle="tooltip"
                         data-placement="top">
                        <i class="icon-hotel-restaurant-214 u-line-icon-pro"></i>
                      </a>
                    </li>
                    
                    
                    <c:if test="${addr.checkBasic==0}">
                    <li class="list-inline-item g-width-1 g-height-16 g-bg-gray-light-v2 g-pr-1 ml-2 mr-3"></li>
                    <li class="list-inline-item">
                        <form id="basicCheck_form">
                       		<input type="button"  class="btn u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25" 
                       		id="checked" name="${addr.addressNo}" value="기본배송지로 설정" />  
                       		<input type="hidden" id="sendBasicCheck" name="sendBasicCheck" value="1">
                       	</form>
                     
                    </li>
                  </c:if>
                  </ul>
                  <!-- End Edit/Delete -->
                </div>
                <p>
                <!-- End Addresses -->
                </c:forEach>
				</c:otherwise>
              </c:choose>  
              </div>
 
            </div> 
                      
            

            <!-- Contact Form -->
            <form name="check_form" action="${pageContext.request.contextPath}/shop/login/insertAddr">
            <div class="g-brd-around g-brd-gray-light-v4 rounded g-pa-30 g-mb-30">
              <h3 class="h5 mb-3"><b>배송지 추가</b></h3>

              
                <div class="row">
                  <div class="col-sm-6 form-group g-mb-20">
                    <label class="g-color-text g-font-size-13">받는 분</label>
                    <input name="nameInput" id="nameInput" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="text" placeholder="${memberInfo.memberName}">
                  </div>
                  
                  <div class="col-sm-6 form-group g-mb-20">
                    <label class="g-color-text g-font-size-13">연락처</label>
                    <input name="phoneNumber" id="contactInput" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="text" placeholder="${memberInfo.memberPhone}">
                  </div>

                  <div class="col-sm-6 form-group g-mb-20">
                    <label class="g-color-text g-font-size-13">우편번호</label>
                    <input name="zipInput" id="zipInput" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="text" onclick="findAddr()" placeholder="우편번호찾기" >
                  </div>

                  <div class="col-sm-6 form-group g-mb-20">
                    <label class="g-color-text g-font-size-13">주소</label>
                    <input name="addrInput2" id="addrInput2" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="text">
                  </div>
                  <div class="col-sm-6 form-group g-mb-20">
                    <label class="g-color-text g-font-size-13">상세주소</label>
                    <input name="detailAddrInput" id="detailAddrInput" class="form-control g-brd-gray-light-v4 g-brd-primary--focus g-color-text rounded g-py-13 g-px-15" type="text" >
                  </div>

                  
                
           	</div>
            </div>
            <button class="btn u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25" type="button" onclick="form_check()">주소목록에 추가하기</button>
          	</form>
          
          </div>
          <!-- Addresses -->
        </div>
      </div>

      <!-- Call to Action -->
      <div class="g-bg-primary">
        <div class="container g-py-20">
          <div class="row justify-content-center">
            <div class="col-md-4 mx-auto g-py-20">
              <!-- Media -->
              <div class="media g-px-50--lg">
                <i class="d-flex g-color-white g-font-size-40 g-pos-rel g-top-3 mr-4 icon-real-estate-048 u-line-icon-pro"></i>
                <div class="media-body">
                  <span class="d-block g-color-white g-font-weight-500 g-font-size-17 text-uppercase">무료 배송</span>
                  <span class="d-block g-color-white-opacity-0_8">In 2-3 Days</span>
                </div>
              </div>
              <!-- End Media -->
            </div>

            <div class="col-md-4 mx-auto g-brd-x--md g-brd-white-opacity-0_3 g-py-20">
              <!-- Media -->
              <div class="media g-px-50--lg">
                <i class="d-flex g-color-white g-font-size-40 g-pos-rel g-top-3 mr-4 icon-real-estate-040 u-line-icon-pro"></i>
                <div class="media-body">
                  <span class="d-block g-color-white g-font-weight-500 g-font-size-17 text-uppercase">무료 반품</span>
                  <span class="d-block g-color-white-opacity-0_8">No Questions Asked</span>
                </div>
              </div>
              <!-- End Media -->
            </div>

            <div class="col-md-4 mx-auto g-py-20">
              <!-- Media -->
              <div class="media g-px-50--lg">
                <i class="d-flex g-color-white g-font-size-40 g-pos-rel g-top-3 mr-4 icon-hotel-restaurant-062 u-line-icon-pro"></i>
                <div class="media-body text-left">
                  <span class="d-block g-color-white g-font-weight-500 g-font-size-17 text-uppercase">Free 24</span>
                  <span class="d-block g-color-white-opacity-0_8">Days Storage</span>
                </div>
              </div>
              <!-- End Media -->
            </div>
          </div>
        </div>
      </div>
      <!-- End Call to Action -->

  

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