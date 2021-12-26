<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title -->
    <title>E-commerce Checkout Page | Unify - Responsive Website Template</title>

<!-- Google Fonts -->
    
    
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
 
 <script type="text/javascript">
 
     
 	var IMP = window.IMP;
 	function form_check() {
 	
	  //변수에 담아주기
	  var customerName = document.getElementById("nameInput");
	  var customerAddr = document.getElementById("addrInput1");
	  var customerDetailAddr = document.getElementById("detailAddrInput");

	  var customerContact = document.getElementById("contactInput");
	  var customerEmail = document.getElementById("emailInput");

	  
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

  	  if (customerEmail.value == "" ) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    	    alert("이메일을 입력하세요.");
    	    customerEmail.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
    	  };
 	 	  
 	  
 	  if (customerContact.value == "" || !reg_contact.test(customerContact.value) ) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
 	    alert("전화번호를 확인하세요.");
 	    customerContact.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
 	    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
 	  }; 
 	  
 	  
	

	  //입력 값 전송
	  //document.check_form.submit(); //유효성 검사의 포인트 
	  requestPay();
	}
 	
 	
 	function requestPay() {
 	      var customerName = document.getElementById("nameInput").value;
 		  var customerDetailAddr = document.getElementById("detailAddrInput").value;
 		  var customerContact = document.getElementById("contactInput").value;
 		  var customerEmail = document.getElementById("emailInput").value;
 		  var orderAddr = document.getElementById("addrInput2").value + " " + customerDetailAddr;

 		  IMP.init("imp57256984");
 	      var itemName ="";
 	      var size = ${cartList.size()};
 	      if(size==1) itemName="${cartList[0].product.productName}";
 	      else itemName="${cartList[0].product.productName}"+"외 "+ ${cartList.size()-1} +"개"  
 	      IMP.request_pay({ // param
 	           pg: "html5_inicis",
 	           pay_method: "card",
 	           merchant_uid: 'merchant_' + new Date().getTime(),
 	           name: itemName,
 	           amount: 100,
 	           buyer_email: customerEmail,
 	           buyer_name: customerName,
 	           buyer_tel: customerContact,
 	           buyer_addr: orderAddr,
 	           buyer_postcode: "01181"
 	        }, function (rsp) { // callback
 	           if (rsp.success) {
 	           	$.ajax({
 	                   url:"${pageContext.request.contextPath}/shop/pay",
 	                   type:"post",
 	                   dataType:"text",
 	                   //dataType:"json",
 	                   data:{
 	                  	 addr: orderAddr,
 	                  	 contact: customerContact,
 	                  	 name: customerName,
 	                  	 imp_uid : rsp.imp_uid
 	                  	 },
 	                   success:function(result) {
 	                	   location.href="${pageContext.request.contextPath}/shop/paysuccess?orderNo="+result;
 	                   	},
 	                   	error:function(err){
 	                           alert(arr+"발생");
 	                    }
 	              }) //아작스 끝
 	             
 	           } else {
 	         	  var msg = '결제에 실패하였습니다.';
 	  		      msg += '에러내용 : ' + rsp.error_msg;
 	           }
 	         
 	        })
 	     };
 	
 	
 
   $(function(){
	   
	   $("#checkSame").click(function(){
  		 if($("input:checkbox[id='checkSame']").is(":checked") == true) {
  			 //$("#detailAddr").hide();
  			 //$("#addrInput2").hide();
  			 
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
		   
		   
		   
			
		   
	   
   })
   		//기본배송지로 입력
    	$(document).on("click","#checked",function(){
    		$("#nameInput").attr("value", "${addr.receiver}");
    		$("#emailInput").attr("value", "${addr.member.memberEmail}");
    		$("#contactInput").attr("value", "${addr.phone}");
    		$("#addrInput1").attr("value", "${addr.memberZip}");
    		$("#addrInput2").attr("value", "${addr.memberAddress}");
    		$("#detailAddrInput").attr("value", "${addr.memberDetailAddress}");
    		
    		
    	  });
   
 </script>
    
  </head>

  <body>
    <main>

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
                  <a class="u-link-v5 g-color-text" href="${pageContext.request.contextPath}/shop">EGYM SHOP</a>
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

      <!-- Checkout Form -->
      <div class="container g-pt-100 g-pb-70">
        <form  method="post" name="check_form"  class="js-validate js-step-form" data-progress-id="#stepFormProgress" data-steps-id="#stepFormSteps" action="${pageContext.request.contextPath}/shop/updateCart">
          <div class="g-mb-100">
            <!-- Step Titles -->
            <ul id="stepFormProgress" class="js-step-progress row justify-content-center list-inline text-center g-font-size-17 mb-0">
              <li class="col-3 list-inline-item g-mb-20 g-mb-0--sm">
                <span class="d-block u-icon-v2 u-icon-size--sm g-rounded-50x g-brd-primary g-color-primary g-color-white--parent-active g-bg-primary--active g-color-white--checked g-bg-primary--checked mx-auto mb-3">
                  <i class="g-font-style-normal g-font-weight-700 g-hide-check">1</i>
                  <i class="fa fa-check g-show-check"></i>
                </span>
                <h4 class="g-font-size-16 text-uppercase mb-0">장바구니</h4>
              </li>

              <li class="col-3 list-inline-item g-mb-20 g-mb-0--sm">
                <span class="d-block u-icon-v2 u-icon-size--sm g-rounded-50x g-brd-gray-light-v2 g-color-gray-dark-v5 g-brd-primary--active g-color-white--parent-active g-bg-primary--active g-color-white--checked g-bg-primary--checked mx-auto mb-3">
                  <i class="g-font-style-normal g-font-weight-700 g-hide-check">2</i>
                  <i class="fa fa-check g-show-check"></i>
                </span>
                <h4 class="g-font-size-16 text-uppercase mb-0">배송지입력</h4>
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
                  <c:set  var="cartidx" value="-1"/>
                <c:choose>
				    <c:when test="${not empty requestScope.cartList}">
                  <div class="g-overflow-x-scroll g-overflow-x-visible--lg">
                    <table class="text-center w-100">
                              <thead class="h6 g-brd-bottom g-brd-gray-light-v3 g-color-black text-uppercase">
                        <tr>
                          <th class="g-font-weight-400 text-left g-pb-20">상품</th>
                          <th class="g-font-weight-400 g-width-130 g-pb-20">가격</th>
                          <th class="g-font-weight-400 g-width-50 g-pb-20">수량</th>
                          <th class="g-font-weight-400 g-width-130 g-pb-20">합계</th>
                          <th></th>
                        </tr>
                      </thead>
                     <c:set var="amount" value="${0}"/> 
 					<c:forEach items="${requestScope.cartList}" var="cart">
 					  <c:set var="cartidx" value="${cartidx+1}"></c:set>
                      <tbody name="productList">
                        <tr class="g-brd-bottom g-brd-gray-light-v3">
                          <td class="text-left g-py-25">
				    
				           <a href="${pageContext.request.contextPath}/shop/select/single/${cart.product.productNo}">
                            <img class="d-inline-block g-width-100 mr-4" src="${pageContext.request.contextPath}/save/${cart.product.productImageList[0].productImageName}" alt="Image Description">
                            </a>
                            <div class="d-inline-block align-middle">
                              <h4 class="h6 g-color-black">${cart.product.productName}</h4>
                              <ul class="list-unstyled g-color-gray-dark-v4 g-font-size-12 g-line-height-1_6 mb-0">
                                <fmt:parseDate value="${cart.product.productDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                                <li>등록일: <fmt:formatDate pattern="yyyy.MM.dd" value="${parsedDateTime}"/> </li>
                              </ul>
                            </div>
                          </td>
                          <td class="g-color-gray-dark-v2 g-font-size-13"><span name="price"><fmt:formatNumber>${cart.product.price}</fmt:formatNumber> 원</span></td>
                          <td>
                            
             				 <fmt:parseNumber value = "${cart.cartCount}" integerOnly ="true" var = "pcount"/>
                              <input type="hidden" name="list[${cartidx}].cartNo" value="${cart.cartNo}"/>
                               <input name="list[${cartidx}].cartCount" id="pcount" class="js-result form-control text-center g-font-size-13 rounded-0 g-pa-0" type="number" value="${pcount}" min='1' max='50' >
                            
                          </td>
                          <td class="text-right g-color-black">
                            <c:set var="amount" value="${amount+cart.product.price*pcount}"/>
                            <span class="g-color-gray-dark-v4 g-color-black--hover g-cursor-pointer">
                              <span class="g-color-gray-dark-v2 g-font-size-13 mr-4" name="sum"><fmt:formatNumber value="${cart.product.price*pcount}"/> 원</span>  
                              <a href="${pageContext.request.contextPath}/shop/deleteCart/${cart.cartNo}">
                                <i class="mt-auto fa fa-trash" name="deleteProductFromCart"></i>
                              </a>
                            </span>
                          </td>                
                        </c:forEach>
                        
						 </tr>
						  <!-- End Item-->
                       
                      </tbody>
                    </table>
                  <br>
                  <br>
                  <br>
                  </div>
                  </c:when>
                        </c:choose>
                  <!-- End Products Block -->
                  
                  
                  
                <div class="g-overflow-x-scroll g-overflow-x-visible--lg">
                 <table class="text-center w-100">
                 
                       
                  <c:choose>
				    
				    <c:when test="${not empty requestScope.soldoutList}">
                     
                       <thead class="h6 g-brd-bottom g-brd-gray-light-v3 g-color-black text-uppercase">
                        <tr>
                          <th class="g-font-weight-400 text-left g-pb-20">품절된 상품</th>
                          <th class="g-font-weight-400 g-width-130 g-pb-20">가격</th>
                          <th class="g-font-weight-400 g-width-50 g-pb-20">수량</th>
                          <th class="g-font-weight-400 g-width-130 g-pb-20">합계</th>
                          <th></th>
                        </tr>
                      </thead>
 					<c:forEach items="${requestScope.soldoutList}" var="cart">
 				    <c:set var="cartidx" value="${cartidx+1}"></c:set>
 					
                      <tbody name="productList">
                        <tr class="g-brd-bottom g-brd-gray-light-v3">
                          <td class="text-left g-py-25">
				    
				           <a href="${pageContext.request.contextPath}/shop/select/single/${cart.product.productNo}">
                            <img class="d-inline-block g-width-100 mr-4" src="${pageContext.request.contextPath}/save/${cart.product.productImageList[0].productImageName}" alt="Image Description">
                            </a>
                            <div class="d-inline-block align-middle">
                              <h4 class="h6 g-color-black">${cart.product.productName}(품절)</h4>
                              <ul class="list-unstyled g-color-gray-dark-v4 g-font-size-12 g-line-height-1_6 mb-0">
                                <fmt:parseDate value="${cart.product.productDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                                <li>등록일: <fmt:formatDate pattern="yyyy.MM.dd" value="${parsedDateTime}"/> </li>
                              </ul>
                            </div>
                          </td>
                          <td class="g-color-gray-dark-v2 g-font-size-13"><span name="price"><fmt:formatNumber>${cart.product.price}</fmt:formatNumber> 원</span></td>
                          <td>
             				 <fmt:parseNumber value = "${cart.cartCount}" integerOnly = "true" var = "pcount"/>
             				   <input type="hidden" name="list[${cartidx}].cartNo" value="${cart.cartNo}"/>
                               <input name="list[${cartidx}].cartCount" id="pcount" class="js-result form-control text-center g-font-size-13 rounded-0 g-pa-0" type="number" value="${pcount}" min='1' max='50' width="100%">
                          </td>
                          <td class="text-right g-color-black">
                            <span class="g-color-gray-dark-v4 g-color-black--hover g-cursor-pointer">
                              <span class="g-color-gray-dark-v2 g-font-size-13 mr-4" name="sum"><fmt:formatNumber value="${cart.product.price*pcount}"/> 원</span>  
                              <a href="${pageContext.request.contextPath}/shop/deleteCart/${cart.cartNo}">
                              <i class="mt-auto fa fa-trash" name="deleteProductFromCart"></i>
                              </a>
                            </span>
                          </td>                
                        </c:forEach>
                        </c:when>
                        </c:choose>
                       
                       
                      </tbody>
                    </table>
                  </div>
                  
                </div>
               
                 <div class="col-md-4 g-mb-30">
                 
                  <!-- End Summary -->
					
				 <c:if test="${not empty requestScope.cartList || requestScope.cartList.size()!=0}">
	                 <input type=hidden name="productNo" value="${product.productNo}"><!--상품번호-->
					 <input type=hidden name="quantity" value=""><!-- quantity -->	
                  <button name="cartInfo" class="btn btn-block u-btn-outline-black g-brd-gray-light-v1 g-bg-black--hover g-font-size-13 text-uppercase g-py-15 mb-4" type="button" data-next-step="#step2">주문하기</button>
                  </c:if>
                  
                 <button id="updateCart" class="btn btn-block u-btn-primary g-font-size-13 text-uppercase g-py-15 mb-4" >장바구니 수정하기</button>
					
                
                </div> 
              </div>
            </div>
            <!-- End Shopping Cart -->


		<!-- 배송지 입력 -->
            <div id="step2">
              <div class="row">
                <div class="col-md-8 g-mb-30">
                
                <div class="row">
                   <div class="col-sm-6 g-mb-20"> 
                   <label class="d-block g-color-gray-dark-v2 g-font-size-15">
                   
                   <sec:authorize access="hasRole('MEMBER')">
                   <form name="basicCheck">
	                   <input type="button" class="btn u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25" 
	                       		id="checked" name="checked" value="기본배송지로 입력하기" />  
                   </form>
                 </sec:authorize>
                   
              
                    </label>
                     
                     </div>
                </div>
                
                  <div class="row">
                    <div class="col-sm-6 g-mb-20">
                      <div class="form-group">
                      <!-- required data-msg="This field is mandatory" --> 
                        <label class="d-block g-color-gray-dark-v2 g-font-size-13">주문자명</label>
                        <input id="nameInput" class="form-control u-form-control g-placeholder-gray-light-v1 rounded-0 g-py-15" name="firstName" type="text" placeholder="Alexander" data-error-class="u-has-error-v1" data-success-class="u-has-success-v1">
                      </div>
                    </div>

					<div class="col-sm-6 g-mb-20">
                      <div class="form-group">
                        <label class="d-block g-color-gray-dark-v2 g-font-size-13">메일주소</label>
                        <input id="emailInput" class="form-control u-form-control g-placeholder-gray-light-v1 rounded-0 g-py-15" name="email" type="email" placeholder="alex@gmail.com"  data-error-class="u-has-error-v1" data-success-class="u-has-success-v1">
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
                    
                    <div class="col-sm-6 g-mb-20">
                      <div class="form-group">
                        <label class="d-block g-color-gray-dark-v2 g-font-size-13">전화번호</label>
                        <input id="contactInput" class="form-control u-form-control g-placeholder-gray-light-v1 rounded-0 g-py-15" name="phoneNumber" type="text" placeholder="+82-10-1234-5678" >
                      </div>
                    </div>

                  </div>


                  <hr class="g-mb-50">

                </div>

                <div class="col-md-4 g-mb-30">
                  <!-- Order Summary -->
                  <div class="g-bg-gray-light-v5 g-pa-20 g-pb-50 mb-4">
                    <h4 class="h6 text-uppercase mb-3">주문 요약</h4>

                    <!-- Accordion -->
                    <div id="accordion-03" class="mb-4" role="tablist" aria-multiselectable="true">
                      <div id="accordion-03-heading-03" class="g-brd-y g-brd-gray-light-v2 py-3" role="tab">
                        <h5 class="g-font-weight-400 g-font-size-default mb-0">
                          <a class="g-color-gray-dark-v4 g-text-underline--none--hover" href="#accordion-03-body-03" data-toggle="collapse" data-parent="#accordion-03" aria-expanded="false" aria-controls="accordion-03-body-03">${cartList.size()} items in cart
                            <span class="ml-3 fa fa-angle-down"></span></a>
                        </h5>
                      </div>
                      <div id="accordion-03-body-03" class="collapse" role="tabpanel" aria-labelledby="accordion-03-heading-03">
                        <div class="g-py-15">
                          <ul class="list-unstyled mb-3">
							<!-- Product -->
							
							<c:forEach items="${requestScope.cartList}" var="cart">
							
							
                            <li class="d-flex justify-content-start g-brd-top g-brd-gray-light-v3 pt-4 mt-4">
                              <img class="g-width-100 g-height-100 mr-3" src="${pageContext.request.contextPath}/save/${cart.product.productImageList[0].productImageName}" alt="Image Description">
                              <div class="d-block">
                                <h4 class="h6 g-color-black">${cart.product.productName}</h4>
                                <ul class="list-unstyled g-color-gray-dark-v4 g-font-size-12 g-line-height-1_4 mb-1">
                                  
                                  <li>수량: ${cart.cartCount}</li>
                                </ul>
                                <span class="d-block g-color-black g-font-weight-400"><fmt:formatNumber value="${cart.product.price*cart.cartCount}"/>원
                              </div>
                            </li>
                            
                            </c:forEach>
                            <!-- End Product -->
                          </ul>
                        </div>
                      </div>
                    </div>
                    <!-- End Accordion -->

                   
                    <div class="d-flex justify-content-between">
                      <span class="g-color-black">결제 금액</span>
                      <span class="g-color-black g-font-weight-300"><fmt:formatNumber value="${amount}"/>원</span>
                    </div>
                 
                  </div>
                  <button class="btn u-btn-primary g-font-size-13 text-uppercase g-px-40 g-py-15" type="button" onclick="form_check()" >결제하기</button>
                 <button class="btn u-btn-primary g-font-size-13 text-uppercase g-px-40 g-py-15" type="button" data-next-step="#step1">다시 돌아가기</button>
                  <!-- End Order Summary -->
                </div>
                 
                
              </div>
            </div>
            <!-- End Shipping -->
            
            

            <!-- Payment & Review -->
            <!-- <div id="step3">
              <div class="row">
                <div class="col-md-8 g-mb-30">
                  Payment Methods
                  <ul class="list-unstyled mb-5">
                    <li class="g-brd-bottom g-brd-gray-light-v3 pb-3 my-3">
                      <label class="form-check-inline u-check d-block u-link-v5 g-color-gray-dark-v4 g-color-primary--hover g-pl-30">
                        <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio">
                          <span class="d-block u-check-icon-checkbox-v4 g-absolute-centered--y g-left-0">
                            <i class="fa" data-check-icon="&#xf00c"></i>
                          </span>
                          Pay with
                        <img class="g-width-70 ml-2" src="assets/img-temp/200x55/img1.jpg" alt="Image Description">
                      </label>
                    </li>
                    <li class="my-3">
                      <label class="form-check-inline u-check d-block u-link-v5 g-color-gray-dark-v4 g-color-primary--hover g-pl-30">
                        <input class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0" name="radInline1_1" type="radio" checked>
                          <span class="d-block u-check-icon-checkbox-v4 g-absolute-centered--y g-left-0">
                            <i class="fa" data-check-icon="&#xf00c"></i>
                          </span>
                          Pay with Credit Card
                        <img class="g-width-50 ml-2" src="assets/img-temp/200x55/img2.jpg" alt="Image Description">
                      </label>
                    </li>
                  </ul>
                  End Payment Methods

                  Alert
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
                  End Alert

                  Shipping Details
                  <ul class="list-unstyled g-color-gray-dark-v4 g-font-size-15 g-pl-70 mb-5">
                    <li class="g-my-3">Chester Ryan</li>
                    <li class="g-my-3">chester@gmail.com</li>
                    <li class="g-my-3">51 Hailee Park</li>
                    <li class="g-my-3">New York, NY, 10013</li>
                    <li class="g-my-3">AB123</li>
                    <li class="g-my-3">United States</li>
                    <li class="g-my-3">+01 731 878 77</li>
                  </ul>
                  End Shipping Details

                  <div class="g-brd-bottom g-brd-gray-light-v3 g-pb-30 g-mb-30">
                    <div class="text-right">
                      <button class="btn u-btn-primary g-font-size-13 text-uppercase g-px-40 g-py-15" type="button">Make Payment</button>
                    </div>
                  </div>

                  Accordion
                  <div id="accordion-04" class="g-max-width-300" role="tablist" aria-multiselectable="true">
                    <div id="accordion-04-heading-04" role="tab">
                      <h5 class="h6 text-uppercase mb-0">
                        <a class="g-color-black g-text-underline--none--hover" href="#accordion-04-body-04" data-toggle="collapse" data-parent="#accordion-04" aria-expanded="false" aria-controls="accordion-04-body-04">Apply discount code
                          <span class="ml-3 fa fa-angle-down"></span></a>
                      </h5>
                    </div>
                    <div id="accordion-04-body-04" class="collapse" role="tabpanel" aria-labelledby="accordion-04-heading-04">
                      <div class="input-group rounded g-pt-15">
                        <input class="form-control g-brd-gray-light-v1 g-brd-right-none g-color-gray-dark-v3 g-placeholder-gray-dark-v3" type="email" placeholder="Enter discount code">
                        <span class="input-group-append g-brd-gray-light-v1 g-bg-white">
                          <button class="btn u-btn-primary" type="submit">Apply</button>
                        </span>
                      </div>
                    </div>
                  </div>
                  End Accordion
                </div>

                <div class="col-md-4 g-mb-30">
                  Order Summary
                  <div class="g-bg-gray-light-v5 g-pa-20 g-pb-50 mb-4">
                    <div class="g-brd-bottom g-brd-gray-light-v3 g-mb-15">
                      <h4 class="h6 text-uppercase mb-3">Order summary</h4>
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

                    Accordion
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
                            Product
                            <li class="d-flex justify-content-start">
                              <img class="g-width-100 g-height-100 mr-3" src="assets/img-temp/150x150/img6.jpg" alt="Image Description">
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
                            End Product

                            Product
                            <li class="d-flex justify-content-start g-brd-top g-brd-gray-light-v3 pt-4 mt-4">
                              <img class="g-width-100 g-height-100 mr-3" src="assets/img-temp/150x150/img3.jpg" alt="Image Description">
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
                            End Product

                            Product
                            <li class="d-flex justify-content-start g-brd-top g-brd-gray-light-v3 pt-4 mt-4">
                              <img class="g-width-100 g-height-100 mr-3" src="assets/img-temp/150x150/img7.jpg" alt="Image Description">
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
                            End Product
                          </ul>
                        </div>
                      </div>
                    </div>
                    End Accordion
                  </div>
                  End Order Summary

                  Ship To
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
                  End Ship To

                  Shipping Method
                  <div class="g-px-20 mb-5">
                    <div class="d-flex justify-content-between g-brd-bottom g-brd-gray-light-v3 g-mb-15">
                      <h4 class="h6 text-uppercase mb-3">Shipping Method</h4>
                      <span class="g-color-gray-dark-v4 g-color-black--hover g-cursor-pointer">
                        <i class="fa fa-pencil"></i>
                      </span>
                    </div>
                    <p class="g-color-gray-dark-v4 g-font-size-15">UK Standard Delivery - 2-3 Working Days</p>
                  </div>
                  End Shipping Method
                </div>
              </div>
            </div> -->
            <!-- End Payment & Review -->
          </div>
        </form>
      </div>
      <!-- End Checkout Form -->

      <!-- Call to Action -->
      <div class="g-bg-primary">
        <div class="container g-py-20">
          <div class="row justify-content-center">
            <div class="col-md-4 mx-auto g-py-20">
              <!-- Media -->
              <div class="media g-px-50--lg">
                <i class="d-flex g-color-white g-font-size-40 g-pos-rel g-top-3 mr-4 icon-real-estate-048 u-line-icon-pro"></i>
                <div class="media-body">
                  <span class="d-block g-color-white g-font-weight-500 g-font-size-17 text-uppercase">Free Shipping</span>
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
                  <span class="d-block g-color-white g-font-weight-500 g-font-size-17 text-uppercase">Free Returns</span>
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

     <!-- footer -->

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
