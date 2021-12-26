<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    

<!DOCTYPE html>
<html lang="en">
  <head>
  
  
    <!-- Title -->
    <title>게시글 수정하기</title>

    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/jquery-ui/themes/base/jquery-ui.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/chosen/chosen.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/icon-hs/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hamburgers/hamburgers.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.min.css">
	
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js" defer></script>
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/summernote/summernote-lite.css">
  <!--  -->
  
  
    <!-- CSS Unify Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e-commerce/assets/css/styles.e-commerce.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/custom.css">
    
     <script type="text/javascript">
    
	     $(document).ready(function(){
	    	 $('#summernote').summernote({
	    			 tabsize: 1,
			  			height:400
	    	 }
	    			 );
	    });
      
	  
    </script>
    
    <script type="text/javascript">
    
    
	    function form_check() {
	    	  var boardName = document.getElementById("boardTitle");
	    	  var categoryNo = $("#boardKind option:selected");    	
	    	  var itemDescription = document.getElementById("summernote");
	    	  var boardPassword = document.getElementById("password");

	    	  
		    	if ( boardName.value == "" ) {
		    	    alert( "글제목을 입력해주세요." );
		    	    boardName.focus();
		    		return false;
		        }
	
		    	if ( categoryNo.val() == "0" ) {
		            alert( "카테고리를 선택해주세요." );
		            categoryNo.focus();
		            return false;
		        }

		    	if ( itemDescription.value == "" ) {
		            alert( "글 내용을 입력해주세요." );
		            itemDescription.focus();
		            return false;
		        }
		    	
		    	if ( boardPassword.value == "" ) {
		            alert( "비밀번호를 입력해주세요." );
		            boardPassword.focus();
		            return false;
		        }
		    	
		    	document.getElementById("boardContent").value = $('#summernote').summernote('code');
		    	document.dietTipUpdateForm.submit(); //유효성 검사의 포인트

	    }
    </script>
  </head>

  <body>

  
    <main>
      <!-- Header -->


      <!-- Breadcrumbs -->
      <section class="g-brd-bottom g-brd-gray-light-v4 g-py-30">
        <div class="container">
          <ul class="u-list-inline">
            <li class="list-inline-item g-mr-5">
              <a class="u-link-v5 g-color-text" href="#">커뮤니티</a>
              <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
            </li>
            <li class="list-inline-item g-mr-5">
              <a class="u-link-v5 g-color-text" href="#">${board.boardKind}</a>
              <i class="g-color-gray-light-v2 g-ml-5 fa fa-angle-right"></i>
            </li>
            <li class="list-inline-item g-color-primary">
              <span>게시글 수정하기</span>
            </li>
          </ul>
        </div>
      </section>
      <!-- End Breadcrumbs -->

      <!-- Help -->
      <form name="dietTipUpdateForm" method="post" action="${pageContext.request.contextPath}/board/update" enctype="multipart/form-data">
	  <input type="hidden" name="boardNo" value="${board.boardNo}"/>
      <div class="container g-pt-70 g-pb-70">
        <div class="row g-mb-20">
          <h2 class="mb-5">수정하기</h2>
          <div class="col-md-8 g-mb-30">
            <!-- Tab panes -->
            <div id="nav-5-3-primary-ver" class="tab-content g-pt-20 g-pt-0--md">

				<br><br><br>
                <!-- Accordion -->
                <div id="accordion-12-1" class="u-accordion u-accordion-color-primary" role="tablist" aria-multiselectable="true">
                  <div class="g-overflow-x-scroll g-overflow-x-visible--lg">
                    
                    <table class="text-left w-100">
                      <thead class="h6 g-brd-bottom g-brd-gray-light-v3 g-color-black text-uppercase">
                        <tr>
                        <th>
                          <!-- End Products Block -->
		                  <div class="input-group mb-1">
		                    <input id="boardTitle" name="boardTitle" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-rounded-left-3 g-rounded-right-3 mr-3"  style="width:70%;" type="text" value="${board.boardTitle}">
		                    <select id="boardKind" name="boardKind" class="js-custom-select u-select-v1 h-50 g-brd-gray-light-v3 g-color-gray-dark-v5 rounded mr-3" style="width:15%;">
		                      <option value="">다이어트꿀팁</option>
		                      <option value="7" ${board.boardKind == '7' ? 'selected="selected"' : '' }>칼럼</option>
		                      <option value="8" ${board.boardKind == '8' ? 'selected="selected"' : '' }>운동</option>
		                      <option value="9" ${board.boardKind == '9' ? 'selected="selected"' : '' }>식단</option>
		                      <option value="10" ${board.boardKind == '10' ? 'selected="selected"' : '' }>성공후기</option>
		                    </select>
		                    <div>
		                    	<span class="g-color-text" style="display: inline-block;">썸네일 url : </span>
		                    	<input id="thumbnail" name="thumbnail" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-rounded-left-3 g-rounded-right-3 mr-3"  style="width:370px; display: inline-block;" type="text" value="${board.thumbnail}">
		                    </div>
		                  </div>
                        <br>
                        </th>
                        </tr>
                      </thead>

                      <tbody>
                        <!-- Item-->
                        
                        <tr class="g-brd-bottom g-brd-gray-light-v3">
                        <td>
                          <div id="summernote" >
                          ${board.boardContent}
                          </div>
                          </td> 
                        </tr>
                        <input type="hidden" id="boardContent" name="boardContent" value=""/>
                        <!-- End Item-->
                        

                      </tbody>
                    </table>
                    <input id="password" name="password" class="form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v3 g-rounded-left-3 g-rounded-right-3 mr-3"  style="width:30%;" type="password" placeholder="비밀번호">
                    
                  </div>
                  <!-- End Products Block -->

                  
                </div>
                <!-- End Accordion -->
               <!-- Contact Form -->
		            
		                <div class="text-center">
		                  <button id="check" class="btn u-btn-primary g-font-size-12 text-uppercase g-py-12 g-px-25" type="button"  onclick="form_check()"><b>등록하기</b></button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn g-color-gray-dark-v5 g-bg-secondary g-font-size-12 text-uppercase g-py-12 g-px-25" type="button" id="cancel"><b>취소하기</b></button>
		                </div>
		              
		              <!-- End Contact Form -->
            </div>
            <!-- End Tab panes -->
          </div>
      </div>
      
      <!-- End Help -->
      </div>
      </form>

      <!-- Call to Action -->

      <!-- End Call to Action -->

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
    <script src="${pageContext.request.contextPath}/assets/vendor/appear.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/chosen/chosen.jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- JS Unify -->
    <script src="${pageContext.request.contextPath}/assets/js/hs.core.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.header.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/helpers/hs.hamburgers.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.go-to.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/components/hs.tabs.js"></script>

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

        // Tabs
        $.HSCore.components.HSTabs.init('[role="tablist"]');
      });

      $(window).on('resize', function () {
        setTimeout(function () {
          $.HSCore.components.HSTabs.init('[role="tablist"]');
        }, 200);
      });
    </script>
    <script>
      $(function(){
    	 $("#cancel").click(function(){
    		 confirm("취소하시겠습니까?") ? location.href="${path}/front" : "취소";
    	 }) 
      });
    </script>
    
  </body>
</html>
