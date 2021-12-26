<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#height").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$("#weight").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$("button").on("click", function() {
		let gender = document.querySelector("#gender");
		let year = document.querySelector("#select_year");
		let month = document.querySelector("#select_month");
		let day = document.querySelector("#select_day");
		let height = document.querySelector("#height");
		let weight = document.querySelector("#weight");
	
		let validateItems = [gender, year, month, day, height, weight];
		
		let state=true;
		$.each(validateItems, function(index, item){
			if(item.value ===null || item.value ==="" || item.value ==="-"){
				alert(item.parentNode.querySelector("label").innerHTML+"를 입력해주세요");
				item.focus();
				state=false;
				return false; 
			}
		});
		if(state)$("#bmiSubmit").submit();//전
	});
});
</script>
</head>
<body>
	<!-- Signup -->
    <section class="container g-pt-100 g-pb-20">
      <div class="row justify-content-center">
        <div class="col-lg-5 flex-lg-unordered g-mb-80">
          <div class="g-brd-around g-bg-white rounded g-px-30 g-py-50 mb-4">
            <header class="text-center mb-4">
              <h1 class="h3 g-color-black g-font-weight-700 text-capitalize">나의 BMI 지수 확인</h1>
            </header>
			
			<hr class="g-brd-gray-light-v3 mb-1">
			
			<p align="right" class="g-color-gray-dark-v2 g-font-weight-500">별표(*)는 필수항목입니다.</p>
            
            <!-- Form -->
            <form class="g-py-15" id="bmiSubmit" action="${pageContext.request.contextPath}/bmiOutput" method="post">
            
	          <div class="form-group g-mb-20">
	            <label class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-14">* 성별</label>
	              <select id="gender" name="gender" class="js-custom-select u-select-v1 g-brd-gray-light-v3 g-color-gray-dark-v5 rounded g-py-12" style="width: 100%;" data-placeholder="Gender" data-open-icon="fa fa-angle-down" data-close-icon="fa fa-angle-up">
	                <option value="-">선택</option>
	                <option value="남성">남성</option>
	                <option value="여성">여성</option>
	              </select>
	          </div>
              
              <label class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-14">* 연령</label>
              <div class="row">
     			  
     			  <div class="col-sm-6 g-mb-20"><!-- 년 -->
                    <select id="select_year" name="year" onchange="javascript:lastday();" class="js-custom-select u-select-v1 g-brd-gray-light-v3 g-color-gray-dark-v5 rounded g-py-12" style="width: 100%;" data-open-icon="fa fa-angle-down" data-close-icon="fa fa-angle-up"></select>
                  </div>
                  <div class="col g-mb-20"><!-- 월 -->
                    <select id="select_month" name="month" onchange="javascript:lastday();" class="js-custom-select u-select-v1 g-brd-gray-light-v3 g-color-gray-dark-v5 rounded g-py-12" style="width: 100%;" data-open-icon="fa fa-angle-down" data-close-icon="fa fa-angle-up"></select>
                  </div>
                  <div class="col g-mb-20"><!-- 일 -->
                    <select id="select_day" name="day" class="js-custom-select u-select-v1 g-brd-gray-light-v3 g-color-gray-dark-v5 rounded g-py-12" style="width: 100%;" data-placeholder="Month" data-open-icon="fa fa-angle-down" data-close-icon="fa fa-angle-up"></select>
                  </div>
              </div>
              
              <div class="g-mb-20">
                <label class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-14">* 키</label>
                <input id="height" name="height" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15" type="text" placeholder="키 입력">
              </div>
				
			  <div class="g-mb-20">
			    <label class="g-color-gray-dark-v2 g-font-weight-600 g-font-size-14">* 몸무게</label>
                <input id="weight" name="weight" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 rounded g-py-15 g-px-15" type="text" placeholder="몸무게 입력">
              </div>
              <input type="hidden" name="targetWeight" value="0">
              <input type="hidden" name="targetWeightDate" value="0">
              <input type="hidden" name="activity" value="0">
              
			  <hr class="g-brd-gray-light-v3 mb-3">

              <button class="btn btn-block u-btn-primary rounded g-py-13" type="button">확인</button>
              
            </form><!-- End Form -->
          </div>

          <div class="text-left">
            <p class="g-color-gray-dark-v5 mb-0">
            	비만도 측정(BMI) 이란?<br>
				나이, 신장(cm)과 체중(kg)만으로 비만을 판정하는 비만 지수
            </p>
          </div>
        </div>

      </div>
    </section><!-- End Signup -->

    <script>
    var start_year="1970";// 시작할 년도 
    var today = new Date(); 
    var today_year= today.getFullYear(); 
    var index=0; 
    for(var y=today_year; y>=start_year; y--){ //start_year ~ 현재 년도 
    	document.getElementById('select_year').options[index] = new Option(y, y); 
    	index++; 
    } 
    index=0; 
    for(var m=1; m<=12; m++){ 
    	document.getElementById('select_month').options[index] = new Option(m, m); index++; 
    } 

    lastday();

      function lastday(){
    	  var Year=document.getElementById('select_year').value;
    	  var Month=document.getElementById('select_month').value;
    	  var day=new Date(new Date(Year,Month,1)-86400000).getDate();
    	  /* = new Date(new Date(Year,Month,0)).getDate(); */
    	  var dayindex_len=document.getElementById('select_day').length;
    	  if(day>dayindex_len){ 
    		  for(var i=(dayindex_len+1); i<=day; i++){ 
    		  	document.getElementById('select_day').options[i-1] = new Option(i, i);
    		  } 
    	  } else if(day<dayindex_len){ 
    		  for(var i=dayindex_len; i>=day; i--){ 
    			  document.getElementById('select_day').options[i]=null; 
    		  } 
    	  }
      }
    </script>
</body>
</html>