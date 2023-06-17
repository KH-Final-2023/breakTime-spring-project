<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.kh.breaktime.member.model.vo.Member"%>
<%Member loginUser = (Member) session.getAttribute("loginUser");%>
<!DOCTYPE html>
<html lang="en">
<style>
#bi-bellCount{
  display: none;  
  position: absolute;
  top: -2px;
  right: -5px;
  height: 23px;
  width: 23px;
  background-color:#5f5fd4;
  font-size: 10px;
  list-style: none;
  text-align: center;
  color: #ffffff;
  border-radius: 50%;
  justify-content: center;
  align-items: center;
  }
#badge-numberCount{
	 display: none;  
  position: absolute;
  top: -2px;
  right: -5px;
  height: 23px;
  width: 23px;
  background-color:#5f5fd4;
  font-size: 10px;
  list-style: none;
  text-align: center;
  color: #ffffff;
  border-radius: 50%;
  justify-content: center;
  align-items: center;
}
</style>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title></title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="resources/admin/assets/img/favicon.png" rel="icon">
  <link href="resources/admin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <!--  공통적으로사용할 라이브러리 추가 -->
    <!-- Jquey 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부투스트랩에서 제공하고있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- alertify -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <!-- alertify css -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <!-- Default theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
    <!-- Semantic UI theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/admin/assets/css/style.css?after" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/admin/assets/css/notice.css" rel="stylesheet">
  <!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<script>
  // Get the current URL
  var currentUrl = window.location.href;

  // Select all sidebar menu items
  var sidebarMenuItems = document.querySelectorAll('.sidebar-nav .nav-item');

  // Iterate over each menu item and check if its href matches the current URL
  sidebarMenuItems.forEach(function(item) {
    var link = item.querySelector('.nav-link');
    var href = link.getAttribute('href');
    
    // Add the "active" class to the menu item if its href matches the current URL
    if (currentUrl.indexOf(href) !== -1) {
      item.classList.add('active');
    }
  });
</script>

</head>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="/breaktime" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">BREAKTIME Admin</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown">

<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
  <i class="bi bi-bell"></i>
  <span id="bi-bellCount"></span>
</a><!-- End Notification Icon -->

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<% if(loginUser != null) { %>
		  <span id="bi-bellCount"></span>
		  <script>
		    function businessCount() {
		      $.ajax({
		        url: "<%= request.getContextPath() %>/notice/businessCount",
		        success: function(result) {
		          if (result >= 0) { // 결과가 0 이상일 때만 처리
		            var count = parseInt(result); // 결과를 정수로 변환
		            $('#bi-bellCount').text("+" + count).css('display', 'flex');
		          } else {
		            $('#bi-bellCount').text('').css('display', 'none');
		          }
		        }
		      });
		    }
		
		    setInterval(businessCount, 60000);
		    businessCount();
		  </script>
		<% } %>

			
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have 4 new notifications
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <!-- <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>Lorem Ipsum</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>30 min. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-x-circle text-danger"></i>
              <div>
                <h4>Atque rerum nesciunt</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>1 hr. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-check-circle text-success"></i>
              <div>
                <h4>Sit rerum fuga</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>2 hrs. ago</p>
              </div>
            </li> -->

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-info-circle text-primary"></i>
              <div>
                <h4 id="businessInfoDate"></h4>
                <p id="businessInfoName"></p>
 
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->
			

		<% if (loginUser != null) { %>
<script>
  function selectBusinessInfo() {
    $.ajax({
      url: "<%= request.getContextPath() %>/notice/selectBusinessInfo",
      success: function(result) {
    	  alert("aa");
        var businessInfoList = result;
        var dateHtml = '';
        var nameHtml = '';
        for (var i = 0; i < businessInfoList.length; i++) {
          var businessInfo = businessInfoList[i];
          dateHtml += '<div class="business-info">';
          dateHtml += '<h4>' + businessInfo.enrollDate + '</h4>';
          dateHtml += '</div>';

          nameHtml += '<div class="business-info">';
          nameHtml += '<h4>' + businessInfo.buUserName + '</h4>';
          nameHtml += '</div>';
        }
        $('#businessInfoDate').html(dateHtml); // Update businessInfoDate element
        $('#businessInfoName').html(nameHtml); // Update businessInfoName element
      }
    });
  }

 
  selectBusinessInfo();
</script>
<% } %>
				<li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-chat-left-text"></i>
            <span id="badge-numberCount"></span>
          </a><!-- End Messages Icon -->
			<% if(loginUser != null) { %>          
		<span id="badge-numberCount"></span>
		  <script>
		    function reviewCount() {
		      $.ajax({
		        url: "<%= request.getContextPath() %>/notice/reviewCount",
		        success: function(result) {
		          if (result >= 0) { // 결과가 0 이상일 때만 처리
		            var count = parseInt(result); // 결과를 정수로 변환
		            $('#badge-numberCount').text("+" + count).css('display', 'flex');
		          } else {
		            $('#badge-numberCount').text('').css('display', 'none');
		          }
		        }
		      });
		    }

    setInterval(reviewCount, 60000);
    reviewCount();
  </script>
<% } %>
			
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
            <li class="dropdown-header">
              You have 3 new messages
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Maria Hudson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>4 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Anna Nelson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>6 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>David Muldon</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>8 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="dropdown-footer">
              <a href="#">Show all messages</a>
            </li>

          </ul><!-- End Messages Dropdown Items -->

        </li><!-- End Messages Nav -->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <span class="d-none d-md-block dropdown-toggle ps-2">ADMIN</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>ADMIN</h6>
              <span>관리자 계정</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/member/myPage">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/member/logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " >
          <i class="bi bi-grid"></i>
          <span>관리자 페이지</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed"  href="<%=request.getContextPath()%>/notice/list">
          <i class="bi bi-menu-button-wide"></i><span>공지사항</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/approval/list">
          <i class="bi bi-journal-text"></i><span>사업자 가입 승인</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/manage/list">
          <i class="bi bi-layout-text-window-reverse"></i><span>사업자 정보 관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/report/list">
          <i class="bi bi-bar-chart"></i><span>신고 리뷰 관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
      </li>  
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/notice/chatList">
          <i class="bi bi-bar-chart"></i><span>문의 내역</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
      </li>  
    </ul>
    
    </aside>
    
    

   		

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/quill/quill.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/admin/assets/js/main.js"></script>
</body>

</html>