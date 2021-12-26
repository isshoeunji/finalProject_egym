<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title -->
    <title>E-commerce Checkout Page | Unify - Responsive Website Template</title>

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
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
      
    //유효성체크
    function form_check() {
    	
    	  //변수에 담아주기
    	  var customerName = document.getElementById("nameInput");
    	  var customerAddr = document.getElementById("addrInput1");
    	  var customerDetailAddr = document.getElementById("detailAddrInput");

    	  var customerContact = document.getElementById("contactInput");

    	  var reg_name = /^[가-힣]+$/; //한글만
    	  var reg_num = /^[0-9]*$/; // 숫자만 

          var reg_contact = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
    	  
    	  
    	  if (customerName.value == "" || !reg_name.test(customerName.value) || customerName.value.length >5 ) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    	    alert("이름을 확인하세요.");
    	    customerName.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
    	  };


      	  if (customerAddr.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
        	    alert("주소를 입력하세요.");
        	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
          };
          
          if (customerDetailAddr.value == "" && !document.getElementById("checkSame").checked) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
      	    alert("상세주소를 입력하세요.");
      	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
      	  };

      	  
      	 	  
      	  
      	  if (customerContact.value == "" || !reg_contact.test(customerContact.value) ) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
      	    alert("전화번호를 확인하세요.");
      	    customerContact.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
      	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
      	  };
      	  
      	  
    	

    	  //입력 값 전송
    	  document.check_form.submit(); //유효성 검사의 포인트 
    	  
    	}       
    
       $(function(){
    	 
    	 $("#checkSame").click(function(){
    		 if($("input:checkbox[id='checkSame']").is(":checked") == true) {
    			 $("#detailAddr").hide();
    			 $("#addrInput2").hide();
    			 
    			 $("#nameInput").val("${customerDTO.customerName}");
    			 $("#nameInput").attr("readonly",true);
    			 $("#emailInput").val("${customerDTO.customerEmail}");
    			 $("#emailInput").attr("readonly",true);
    			 $("#addrInput1").val("${customerDTO.customerAddr}");
    			 $("#addrInput1").attr("readonly",true);
    			 $("#contactInput").val("${customerDTO.customerContact}");
    			 $("#contactInput").attr("readonly",true);
    			 
    			 
    		 }
    		 else{
    			 $("#nameInput").val("");
    			 $("#emailInput").val("");
    			 $("#addrInput1").val("");
    			 $("#addrInput2").val("");
    			 $("#detailAddrInput").val("");
    			 $("#contactInput").val("");
    			 
    			 $("#nameInput").removeAttr("readonly");
    			 $("#emailInput").removeAttr("readonly");
    			 $("#addrInput1").removeAttr("readonly");
    			 $("#contactInput").removeAttr("readonly");
    			 
    			 $("#detailAddr").show();
    			 $("#addrInput2").show();
    		 } 
    	 })
    	 
    	 
    	 
    	 });
    </script>
    
  </head>

  <body>
    <main>
      <!-- Header -->
       
      
      <!-- Breadcrumbs -->
      <section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
        <div class="container">
          <div class="d-sm-flex text-center">
            <div class="align-self-center">
              <h1 class="h3 mb-0"><b>장바구니</b></h1>
            </div>

            <div class="align-self-center ml-auto">
              <ul class="u-list-inline">
                <li class="list-inline-item g-mr-5">
                  <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/html/namdo-market/home-page.jsp">요거 묵어봤는감?</a>
                  <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
                </li>
                <li class="list-inline-item g-color-primary">
                  <span>장바구니</span>
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
          <%-- <div class="col-lg-3 g-mb-50">
            <aside class="g-brd-around g-brd-gray-light-v4 rounded g-px-20 g-py-30">
              <!-- Profile Picture -->
              <div class="text-center g-pos-rel g-mb-30">

                <span id="name" class="d-block g-font-weight-500"></span>

              </div>
              <!-- End Profile Picture -->

              <hr class="g-brd-gray-light-v4 g-my-30">

              <!-- Profile Settings List -->
              <ul class="list-unstyled mb-0">
                <li class="g-pb-3">
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/html/namdo-market/page-login-security-customer.jsp">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-059 u-line-icon-pro"></i></span>
                    내정보
                  </a>
                </li>
                <li class="g-py-3">
                  <a class="d-block align-middle active u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover g-color-primary--parent-active g-bg-gray-light-v5--active rounded g-pa-3" href="#">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-114 u-line-icon-pro"></i></span>
                    장바구니
                  </a>
                </li>
                <li class="g-py-3">
                  <a class="d-block align-middle u-link-v5 g-color-text g-color-primary--hover g-bg-gray-light-v5--hover rounded g-pa-3" href="${pageContext.request.contextPath}/front?key=customer&methodName=selectOrderDetail">
                    <span class="u-icon-v1 g-color-gray-dark-v5 mr-2"><i class="icon-finance-115 u-line-icon-pro"></i></span>
                    주문내역
                  </a>
                </li>
              </ul>
              <!-- End Profile Settings List -->
            </aside>
          </div> --%>
          <!-- End Profile Settings -->
      <!-- Checkout Form -->
      <div class="col-lg-9 g-mb-50">
        <form name="check_form" class="js-validate js-step-form" data-progress-id="#stepFormProgress" data-steps-id="#stepFormSteps" action="${pageContext.request.contextPath}/front">
			      <input type="hidden" name="key" value = "order" /> <!-- Controller를 찾는 정보 -->
			      <input type="hidden" name="methodName" value = "addOrder" />  <!-- 메소드이름 -->
                  
          
          <div class="g-mb-100">
            <!-- Step Titles -->
            <ul id="stepFormProgress" class="js-step-progress row justify-content-center list-inline text-center g-font-size-17 mb-0">
              <li class="col-3 list-inline-item g-mb-20 g-mb-0--sm">
                <span class="d-block u-icon-v2 u-icon-size--sm g-rounded-50x g-brd-primary g-color-primary g-color-white--parent-active g-bg-primary--active g-color-white--checked g-bg-primary--checked mx-auto mb-3">
                  <i class="g-font-style-normal g-font-weight-700 g-hide-check">1</i>
                  <i class="fa fa-check g-show-check"></i>
                </span>
                <h4 class="g-font-size-16 text-uppercase mb-0"><b>장바구니</b></h4>
              </li>

              <li class="col-3 list-inline-item g-mb-20 g-mb-0--sm">
                <span class="d-block u-icon-v2 u-icon-size--sm g-rounded-50x g-brd-gray-light-v2 g-color-gray-dark-v5 g-brd-primary--active g-color-white--parent-active g-bg-primary--active g-color-white--checked g-bg-primary--checked mx-auto mb-3">
                  <i class="g-font-style-normal g-font-weight-700 g-hide-check">2</i>
                  <i class="fa fa-check g-show-check"></i>
                </span>
                <h4 class="g-font-size-16 text-uppercase mb-0"><b>배송지 입력</b></h4>
              </li>

              <li class="col-3 list-inline-item">
                <span class="d-block u-icon-v2 u-icon-size--sm g-rounded-50x g-brd-gray-light-v2 g-color-gray-dark-v5 g-brd-primary--active g-color-white--parent-active g-bg-primary--active g-color-white--checked g-bg-primary--checked mx-auto mb-3">
                  <i class="g-font-style-normal g-font-weight-700 g-hide-check">3</i>
                  <i class="fa fa-check g-show-check"></i>
                </span>
                <h4 class="g-font-size-16 text-uppercase mb-0"><b>결제하기</b></h4>
              </li>
            </ul>
            <!-- End Step Titles -->
          </div>

          <div id="stepFormSteps">
            <!-- Shopping Cart -->
            <div id="step1" class="active">
              <div class="row">
                <div class="col-md-8 g-mb-30">
                  <!-- Products Block -->
                  <div class="g-overflow-x-scroll g-overflow-x-visible--lg">
                    <table class="text-center w-100">
                      <thead class="h6 g-brd-bottom g-brd-gray-light-v3 g-color-black text-uppercase">
                        <tr>
                          <th class="g-font-weight-400 text-left g-pb-20"><b>상품목록</b></th>
                          <th class="g-font-weight-400 text-center g-pb-20"><b>상품 이름</b></th>

                          <th class="g-font-weight-400 g-width-130 g-pb-20"><b>가격</b></th>
                          <th class="g-font-weight-400 g-width-50 g-pb-20"><b>수량</b></th>
                          <th class="g-font-weight-400 g-width-130 g-pb-20"><b>합계</b></th>
                          <th></th>
                        </tr>
                      </thead>

                      <tbody>
                        <!-- Item-->
                        
                        <c:set var="amount" value="${0}"/>
                        <c:set var="count" value="${0}"/>

                        <c:forEach items="${requestScope.list}" var="itemDto">
                        <!-- Item-->
                        <tr class="g-brd-bottom g-brd-gray-light-v3">
                          <td class="text-left g-py-25">
                            <img class="d-inline-block g-width-100 " src="${pageContext.request.contextPath}/save/${itemDto.mainImg}" alt="Image Description">
                            
                          </td>
                          
                          <td class="text-left g-py-25">
                          
                            <div class="d-inline-block col">
                              <h4 class="h6 g-color-black">${itemDto.itemName}</h4>
                              
                            </div>
                          </td>
                          
                          <td class="g-color-gray-dark-v2 g-font-size-13">
                                 <fmt:formatNumber value="${itemDto.itemPrice}"/>원
                          </td>
                          <td class="g-color-gray-dark-v2 g-font-size-13">${itemDto.itemQuantity}</td>

                          <td class="text-right g-color-black">
                            <span class="g-color-gray-dark-v2 g-font-size-13 mr-4">
                            <fmt:formatNumber value="${itemDto.itemPrice*itemDto.itemQuantity}"/>원
                  
                            </span>
                            <c:set var="amount" value="${amount+itemDto.itemPrice*itemDto.itemQuantity}"/>
                            <c:set var="count" value="${count+1}"/>
                            
                            <span class="g-color-gray-dark-v4 g-color-black--hover g-cursor-pointer">
                              <a href="${pageContext.request.contextPath}/front?key=cart&methodName=delete&cartNo=${itemDto.cartNo}">
                                <i class="mt-auto fa fa-trash" ></i>
					          </a>
                            </span>
                          </td>
                        </tr>
                        </c:forEach>
                        <!-- End Item-->

                        
                      </tbody>
                    </table>
                  </div>
                  <!-- End Products Block -->
                </div>

                <div class="col-md-4 g-mb-30">
                  <!-- Summary -->
                  <div class="g-bg-gray-light-v5 g-pa-20 g-pb-50 mb-4">
                    <h4 class="h6 text-uppercase mb-3"><b>총 주문금액</b></h4>
                    
                    <hr class="g-mb-50">
                    
                    <div class="d-flex justify-content-between mb-2">
                      <span class="g-color-black">총 금액 : </span>
                      <span class="g-color-black g-font-weight-300">
                      <fmt:formatNumber value="${amount}"/>원
                      </span>
                    </div>
                  </div>
                  <!-- End Summary -->

                  <button class="btn btn-block u-btn-primary g-font-size-13 text-uppercase g-py-15 mb-4" type="button" data-next-step="#step2"><b>주문하기</b></button>
			<input type="hidden" name="amount" value = "${amount}" />  <!-- 메소드이름 -->
                </div>
              </div>
            </div>
            <!-- End Shopping Cart -->

            <!-- Shipping -->
            <div id="step2">
              <div class="row">
                <div class="col-md-8 g-mb-30">
                  <div class="row">
                   <div class="col-sm-6 g-mb-20"> 
                   <label class="d-block g-color-gray-dark-v2 g-font-size-15">
                    <input type ="checkbox" id="checkSame" > 주문자 정보와 동일
                    </label>
                     
                     </div>
                   </div>
                  <div class="row">
                    <div class="col-sm-6 g-mb-20">
                      <div class="form-group">
                        <label class="d-block g-color-gray-dark-v2 g-font-size-13">성명</label>
                        <input id="nameInput" class="form-control u-form-control g-placeholder-gray-light-v1 rounded-0 g-py-15" name="name" type="text" >
                      </div>
                    </div>

                    
                  </div>

                  <div class="row">
                    <div class="col-sm-6 g-mb-20">
                      <div class="form-group">
                        <label class="d-block g-color-gray-dark-v2 g-font-size-13">주소</label>
                        <input name="addrInput1" id="addrInput1" class="form-control u-form-control g-placeholder-gray-light-v1 rounded-0 g-py-15" name="zip" type="text" placeholder="ex)서울시 강남구" onclick="findAddr()" >
                      </div>
                    </div>

                    <div class="col-sm-6 g-mb-20">
                      <div class="form-group">
                        <label class="d-block g-color-gray-dark-v2 g-font-size-13">&nbsp;</label>
                        <input name="addrInput2" id="addrInput2" class="form-control u-form-control g-placeholder-gray-light-v1 rounded-0 g-py-15" name="address" type="text">
                      </div>
                    </div>
                  </div>

                  <div class="row" id="detailAddr">
                    <div class="col-sm-6 g-mb-20">
                      <div class="form-group">
                        <label class="d-block g-color-gray-dark-v2 g-font-size-13">상세주소</label>
                        <input name="detailAddrInput" id="detailAddrInput" class="form-control u-form-control g-placeholder-gray-light-v1 rounded-0 g-py-15" name="detail_address" type="text" placeholder="ex)101동 101호" >
                      </div>
                    </div>

                  </div>

                  <div class="row">
                    <div class="col-sm-6 g-mb-20">
                      <div class="form-group">
                        <label class="d-block g-color-gray-dark-v2 g-font-size-13">전화번호</label>
                        <input id="contactInput" class="form-control u-form-control g-placeholder-gray-light-v1 rounded-0 g-py-15" name="phoneNumber" type="text" placeholder="+82-10-1234-5678" >
                      </div>
                    </div>
                  </div>

                  <hr class="g-mb-50">

                  <h4 class="h6 text-uppercase mb-5">배송정보</h4>

                  <!-- 배송정보 -->
                  <table>
                    <tbody>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">배송 방법: 택배</td>

                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">배송 지역: 전국지역</td>
                        
                        
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">배송 비용: 무료</td>
                        
                        
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">배송 기간: 3일 ~ 7일</td>
                        
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">배송 안내: 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.</td>
                      </tr>
                      <tr class="g-color-gray-dark-v4 g-font-size-12">
                        <td class="align-top g-width-350 g-py-5">고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.</td>
                      </tr>
                    </tbody>
                  </table>
                  <!-- 배송정보 -->
				  <br>
                  <button class="btn u-btn-primary g-font-size-13 text-uppercase g-px-40 g-py-15" type="button" onclick="form_check()" >결제하기</button>
                </div>

                <div class="col-md-4 g-mb-30">
                  <!-- Order Summary -->
                  <div class="g-bg-gray-light-v5 g-pa-20 g-pb-50 mb-4">
                    <h4 class="h6 text-uppercase mb-3"><b>주문 상세</b></h4>

                    <!-- Accordion -->
                    <div id="accordion-03" class="mb-4" role="tablist" aria-multiselectable="true">
                      <div id="accordion-03-heading-03" class="g-brd-y g-brd-gray-light-v2 py-3" role="tab">
                        <h5 class="g-font-weight-400 g-font-size-default mb-0">
                          <a class="g-color-gray-dark-v4 g-text-underline--none--hover" href="#accordion-03-body-03" data-toggle="collapse" data-parent="#accordion-03" aria-expanded="false" aria-controls="accordion-03-body-03">${count} items in cart
                            <span class="ml-3 fa fa-angle-down"></span></a>
                        </h5>
                      </div>
                      <div id="accordion-03-body-03" class="collapse" role="tabpanel" aria-labelledby="accordion-03-heading-03">
                        <div class="g-py-15">
                          <ul class="list-unstyled mb-3">
                          
                          
                          <c:forEach items="${requestScope.list}" var="itemDto">
                          
                            

                            <li class="d-flex justify-content-start">
                              <img class="g-width-100 g-height-100 mr-3" src="${pageContext.request.contextPath}/save/${itemDto.mainImg}" alt="Image Description">
                              <div class="d-block">
                                <h4 class="h6 g-color-black">${itemDto.itemName}</h4>
                                <ul class="list-unstyled g-color-gray-dark-v4 g-font-size-12 g-line-height-1_4 mb-1">
                                  
                                  <li>수량: ${itemDto.itemQuantity} </li>
                                </ul>
                                <span class="d-block g-color-black g-font-weight-400">
                                <fmt:formatNumber value="${itemDto.itemPrice}"/>원
                                </span>
                              </div>
                            </li>
                            <!-- End Product -->
                            
                            
                           </c:forEach>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <!-- End Accordion -->

                    <div class="d-flex justify-content-between mb-2">
                      <span class="g-color-black">총 금액</span>
                      <span class="g-color-black g-font-weight-300"><fmt:formatNumber value="${amount}"/>원</span>
                    </div>
                  </div>
                  <!-- End Order Summary -->
                </div>
              </div>
            </div>
            <!-- End Shipping -->






            <!-- Payment & Review -->
            <div id="step3">
              <div class="row">
                <div class="col-md-8 g-mb-30">
                  <!-- Payment Methods -->
                  <ul class="list-unstyled mb-5">
                    
                    
                    <li class="g-brd-bottom g-brd-gray-light-v3 pb-3 my-3">
                      <h4 class="h6 text-uppercase mb-3"><b>결제 방식</b></h4>
                      <hr class="g-mb-14">
                      <label class="form-check-inline u-check d-block u-link-v5 g-color-gray-dark-v4 g-color-primary--hover g-pl-30">
                        <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio" checked>
                          <span class="d-block u-check-icon-checkbox-v4 g-absolute-centered--y g-left-0">
                            <i class="fa" data-check-icon="&#xf00c"></i>
                          </span>
                          Pay with Credit Card
                        <img class="g-width-50 ml-2" src="${pageContext.request.contextPath}/html/namdo-market/assets/img-temp/200x55/creditcard.png" alt="Image Description">
                      </label>
                    </li>
                    <li class="my-3">
                      <label class="form-check-inline u-check d-block u-link-v5 g-color-gray-dark-v4 g-color-primary--hover g-pl-30">
                        <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio">
                          <span class="d-block u-check-icon-checkbox-v4 g-absolute-centered--y g-left-0">
                            <i class="fa" data-check-icon="&#xf00c"></i>
                          </span>
                          Pay with Kakao Pay
                        <img class="g-width-70 ml-2" src="${pageContext.request.contextPath}/html/namdo-market/assets/img-temp/200x55/kakaopay.png" alt="Image Description">
                      </label>
                    </li>
                    
                  </ul>
                  <!-- End Payment Methods -->

                  <!-- Alert -->
                  <div class="alert g-brd-around g-brd-gray-dark-v5 rounded-0 g-pa-0 mb-4" role="alert">
                    <div class="media">
                      <div class="d-flex g-brd-right g-brd-gray-dark-v5 g-pa-15">
                        <span class="u-icon-v1 u-icon-size--xs g-color-black">
                          <i class="align-middle icon-media-065 u-line-icon-pro"></i>
                        </span>
                      </div>
                      <div class="media-body g-pa-15">
                        <p class="g-color-black m-0">My billing and shipping address are the correct</p>
                      </div>
                    </div>
                  </div>
                  <!-- End Alert -->

                  <!-- Shipping Details -->
                  <ul class="list-unstyled g-color-gray-dark-v4 g-font-size-15 g-pl-70 mb-5">
                    <li class="g-my-3">Chester Ryan</li>
                    <li class="g-my-3">chester@gmail.com</li>
                    <li class="g-my-3">51 Hailee Park</li>
                    <li class="g-my-3">New York, NY, 10013</li>
                    <li class="g-my-3">AB123</li>
                    <li class="g-my-3">United States</li>
                    <li class="g-my-3">+01 731 878 77</li>
                  </ul>
                  <!-- End Shipping Details -->

				  <hr class="g-mb-50">
				  
				  <!-- Accordion -->
                  <div id="accordion-04" class="g-max-width-300" role="tablist" aria-multiselectable="true">
                    <div id="accordion-04-heading-04" role="tab">
                      <h5 class="h6 text-uppercase mb-0">
                        <a class="g-color-black g-text-underline--none--hover" href="#accordion-04-body-04" data-toggle="collapse" data-parent="#accordion-04" aria-expanded="false" aria-controls="accordion-04-body-04"><b>쿠폰번호 입력</b>
                          <span class="ml-3 fa fa-angle-down"></span></a>
                      </h5>
                    </div>
                    <div id="accordion-04-body-04" class="collapse" role="tabpanel" aria-labelledby="accordion-04-heading-04">
                      <div class="input-group rounded g-pt-15">
                        <input class="form-control g-brd-gray-light-v1 g-brd-right-none g-color-gray-dark-v3 g-placeholder-gray-dark-v3" type="email" placeholder="쿠폰번호를 입력하세요">
                        <span class="input-group-append g-brd-gray-light-v1 g-bg-white">
                          <button class="btn u-btn-primary" type="submit">적용하기</button>
                        </span>
                      </div>
                    </div>
                  </div>
                  <!-- End Accordion -->
                  
                  <hr class="g-mb-50">
                  
                  <div class="g-brd-gray-light-v3 g-pb-30 g-mb-30">
                    <div class="text-right">
                      <button class="btn u-btn-primary g-font-size-13 text-uppercase g-px-40 g-py-15" type="button"><b>결제하기</b></button>
                    </div>
                  </div>

                  
                </div>

                <div class="col-md-4 g-mb-30">
                  <!-- Order Summary -->
                  <div class="g-bg-gray-light-v5 g-pa-20 g-pb-50 mb-4">
                    <div class="g-brd-bottom g-brd-gray-light-v3 g-mb-15">
                      <h4 class="h6 text-uppercase mb-3"><b>주문 상세</b></h4>
                    </div>

                    <div class="d-flex justify-content-between mb-3">
                      <span class="g-color-black">Cart Subtotal</span>
                      <span class="g-color-black g-font-weight-300">$454.00</span>
                    </div>
                    <div class="mb-3">
                      <div class="d-flex justify-content-between mb-1">
                        <span class="g-color-black">Shipping</span>
                        <span class="g-color-black g-font-weight-300">$5.5</span>
                      </div>
                      <p class="g-font-size-13">UK Standard Delivery - 2-3 Working Days</p>
                    </div>
                    <div class="d-flex justify-content-between mb-3">
                      <span class="g-color-black">Order Total</span>
                      <span class="g-color-black g-font-weight-300">$459.5</span>
                    </div>

                    <!-- Accordion -->
                    <div id="accordion-05" class="mb-4" role="tablist" aria-multiselectable="true">
                      <div id="accordion-05-heading-05" class="g-brd-y g-brd-gray-light-v2 py-3" role="tab">
                        <h5 class="g-font-weight-400 g-font-size-default mb-0">
                          <a class="g-color-gray-dark-v4 g-text-underline--none--hover" href="#accordion-05-body-05" data-toggle="collapse" data-parent="#accordion-05" aria-expanded="false" aria-controls="accordion-05-body-05">3 items in cart
                            <span class="ml-3 fa fa-angle-down"></span></a>
                        </h5>
                      </div>
                      <div id="accordion-05-body-05" class="collapse" role="tabpanel" aria-labelledby="accordion-05-heading-05">
                        <div class="g-py-15">
                          <ul class="list-unstyled mb-3">
                            <!-- Product -->
                            <li class="d-flex justify-content-start">
                              <img class="g-width-100 g-height-100 mr-3" src="${pageContext.request.contextPath}/html/namdo-market/assets/img-temp/150x150/img6.jpg" alt="Image Description">
                              <div class="d-block">
                                <h4 class="h6 g-color-black">Sneaker</h4>
                                <ul class="list-unstyled g-color-gray-dark-v4 g-font-size-12 g-line-height-1_4 mb-1">
                                  <li>Color: Black</li>
                                  <li>Size: MD</li>
                                  <li>QTY: 1</li>
                                </ul>
                                <span class="d-block g-color-black g-font-weight-400">$ 87.00</span>
                              </div>
                            </li>
                            <!-- End Product -->

                            <!-- Product -->
                            <li class="d-flex justify-content-start g-brd-top g-brd-gray-light-v3 pt-4 mt-4">
                              <img class="g-width-100 g-height-100 mr-3" src="${pageContext.request.contextPath}/html/namdo-market/assets/img-temp/150x150/img3.jpg" alt="Image Description">
                              <div class="d-block">
                                <h4 class="h6 g-color-black">Chukka Shoes</h4>
                                <ul class="list-unstyled g-color-gray-dark-v4 g-font-size-12 g-line-height-1_4 mb-1">
                                  <li>Color: Black</li>
                                  <li>Size: MD</li>
                                  <li>QTY: 2</li>
                                </ul>
                                <span class="d-block g-color-black g-font-weight-400">$ 160.00</span>
                              </div>
                            </li>
                            <!-- End Product -->

                            <!-- Product -->
                            <li class="d-flex justify-content-start g-brd-top g-brd-gray-light-v3 pt-4 mt-4">
                              <img class="g-width-100 g-height-100 mr-3" src="${pageContext.request.contextPath}/html/namdo-market/assets/img-temp/150x150/img7.jpg" alt="Image Description">
                              <div class="d-block">
                                <h4 class="h6 g-color-black">Desk Clock</h4>
                                <ul class="list-unstyled g-color-gray-dark-v4 g-font-size-12 g-line-height-1_4 mb-1">
                                  <li>Color: Brown Wood</li>
                                  <li>Type: Desk</li>
                                  <li>QTY: 1</li>
                                </ul>
                                <span class="d-block g-color-black g-font-weight-400">$ 47.00</span>
                              </div>
                            </li>
                            <!-- End Product -->
                          </ul>
                        </div>
                      </div>
                    </div>
                    <!-- End Accordion -->
                  </div>
                  <!-- End Order Summary -->

                  <!-- Ship To -->
                  <div class="g-px-20 mb-5">
                    <div class="d-flex justify-content-between g-brd-bottom g-brd-gray-light-v3 g-mb-15">
                      <h4 class="h6 text-uppercase mb-3">Ship to</h4>
                      <span class="g-color-gray-dark-v4 g-color-black--hover g-cursor-pointer">
                        <i class="fa fa-pencil"></i>
                      </span>
                    </div>
                    <ul class="list-unstyled g-color-gray-dark-v4 g-font-size-15">
                      <li class="g-my-3">Chester Ryan</li>
                      <li class="g-my-3">chester@gmail.com</li>
                      <li class="g-my-3">51 Hailee Park</li>
                      <li class="g-my-3">New York, NY, 10013</li>
                      <li class="g-my-3">AB123</li>
                      <li class="g-my-3">United States</li>
                      <li class="g-my-3">+01 731 878 77</li>
                    </ul>
                  </div>
                  <!-- End Ship To -->

                  <!-- Shipping Method -->
                  <div class="g-px-20 mb-5">
                    <div class="d-flex justify-content-between g-brd-bottom g-brd-gray-light-v3 g-mb-15">
                      <h4 class="h6 text-uppercase mb-3">배송정보</h4>
                      <span class="g-color-gray-dark-v4 g-color-black--hover g-cursor-pointer">
                        <i class="fa fa-pencil"></i>
                      </span>
                    </div>
                    <p class="g-color-gray-dark-v4 g-font-size-15">UK Standard Delivery - 2-3 Working Days</p>
                  </div>
                  <!-- End Shipping Method -->
                </div>
              </div>
            </div>
            <!-- End Payment & Review -->
          </div>
        </form>
      </div>
      <!-- End Checkout Form -->
</div>
</div>
      <!-- Footer -->

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
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/chosen/chosen.jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/image-select/src/ImageSelect.jquery.js"></script>

    <!-- JS Unify -->
    <script src="${pageContext.request.contextPath}/assets/js/hs.core.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.header.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.select.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.count-qty.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.step-form.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.validation.js"></script>
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

        // initialization of form validation
        $.HSCore.components.HSValidation.init('.js-validate');

        // initialization of custom select
        $.HSCore.components.HSSelect.init('.js-custom-select');

        // initialization of quantity counter
        $.HSCore.components.HSCountQty.init('.js-quantity');

        // initialization of step form
        $.HSCore.components.HSStepForm.init('.js-step-form');
      });
    </script>
    
    <input id="qty2" class="js-result form-control text-center g-font-size-13 rounded-0 g-pa-0" type="text" value="2" readonly>
    
    <script>
      function upDownAmount(amount){
    	  switch(amount){
    	  case 'up':
    		  document.getElementById('qty2').value += 1;
    		  break;
    	  case 'down':
    		  document.getElementById('qty2').value -= 1;
    	  }
      }
    </script>
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
	        document.getElementById('addrInput1').value = data.zonecode;
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
    
  </body>
</html>
