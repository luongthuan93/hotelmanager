<%-- 
    Document   : home
    Created on : Jun 20, 2019, 7:47:58 PM
    Author     : ThuanPhan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta name="description" content="Responsive Admin Template">
	<meta name="author" content="SmartUniversity">
	<title>LUXSTAY HOTEL- ADMIN DASHBOARD</title>
	<!-- icons -->
        <link href="<c:url value="/resources-management/assets/plugins/simple-line-icons/simple-line-icons.min.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"></c:url>" rel="stylesheet" type="text/css">
	<!--bootstrap -->
	<link href="<c:url value="/resources-management/assets/plugins/bootstrap/css/bootstrap.min.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/plugins/summernote/summernote.css"></c:url>" rel="stylesheet">
        <!-- data tables -->
	<link href="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css"></c:url>" rel="stylesheet" type="text/css">
	<!-- chartjs -->
	<link href="<c:url value="/resources-management/assets/js/pages/chart/chartjs/Chart.css"></c:url>" rel="stylesheet" type="text/css">
	<!-- Material Design Lite CSS -->
	<link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/material/material.min.css"></c:url>">
	<link rel="stylesheet" href="<c:url value="/resources-management/assets/css/material_style.css"></c:url>">
	<!-- animation -->
	<link href="<c:url value="/resources-management/assets/css/pages/animate_page.css"></c:url>" rel="stylesheet">
	<!-- Template Styles -->
	<link href="<c:url value="/resources-management/assets/css/plugins.min.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/css/style.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/css/responsive.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/css/theme-color.css"></c:url>" rel="stylesheet" type="text/css">
	<!-- favicon -->
	<link rel="shortcut icon" href="<c:url value="/resources-management/assets/img/favicon.ico"></c:url>">
        <!-- chart js -->	
	<script src="<c:url value="/resources-management/assets/js/pages/chart/chartjs/Chart.js"></c:url>"></script>
</head>
<!-- END HEAD -->

<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
	<div class="page-wrapper">
		<!-- start header -->
                <jsp:include page="../include-management/body_header.jsp"></jsp:include>
		<!-- end header -->
		<!-- start page container -->
		<div class="page-container">
			<!-- start sidebar menu -->
			<jsp:include page="../include-management/body_menu.jsp"></jsp:include>
			<!-- end sidebar menu -->
			<!-- start page content -->
			<div class="page-content-wrapper">
				<div class="page-content">
					<div class="page-bar">
						<div class="page-title-breadcrumb">
							<div class=" pull-left">
								<div class="page-title">Dashboard</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="${pageContext.request.contextPath}/admin/home">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active">Dashboard</li>
							</ol>
						</div>
					</div>
					<!-- start widget -->
					<div class="state-overview">
						<div class="row">
							<div class="col-xl-3 col-md-6 col-12">
								<div class="info-box bg-blue">
									<span class="info-box-icon push-bottom"><i class="material-icons">card_giftcard</i></span>
									<div class="info-box-content">
										<span class="info-box-text">Promotion</span>
										<span class="info-box-number">${promotions.size()}</span>
										<div class="progress">
											<div class="progress-bar" style="width:${roomtypeinPromotion.size()*100/roomTypes.size()}%"></div>
										</div>
										<span class="progress-description">
											${promotionsOfMonth.size()} promotions for ${roomtypeinPromotion.size()} RoomTypes in this month
										</span>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- /.info-box -->
							</div>
							<!-- /.col -->
							<div class="col-xl-3 col-md-6 col-12">
								<div class="info-box bg-orange">
									<span class="info-box-icon push-bottom"><i class="material-icons">bookmark_border</i></span>
									<div class="info-box-content">
										<span class="info-box-text">Total Booking</span>
										<span class="info-box-number">${bookings.size()}</span>
										<div class="progress">
											<div class="progress-bar width-100"></div>
										</div>
										<span class="progress-description">
											${bookingsofMonth.size()} New bookings in this month
										</span>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- /.info-box -->
							</div>
							<!-- /.col -->
							<div class="col-xl-3 col-md-6 col-12">
								<div class="info-box bg-purple">
									<span class="info-box-icon push-bottom"><i class="material-icons">vpn_key</i></span>
									<div class="info-box-content">
										<span class="info-box-text">Room</span>
										<span class="info-box-number">${rooms.size()}</span>
										<div class="progress">
											<div class="progress-bar" style="width:${(roomsUsed.size())*100/rooms.size()}%"></div>
										</div>
										<span class="progress-description">
											${roomsUsed.size()} rooms available today
										</span>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- /.info-box -->
							</div>
							<!-- /.col -->
							<div class="col-xl-3 col-md-6 col-12">
								<div class="info-box bg-success">
									<span class="info-box-icon push-bottom"><i class="material-icons">monetization_on</i></span>
									<div class="info-box-content">
										<span class="info-box-text">Total Earning</span>
										<span class="info-box-number">${revenue}</span><span>$</span>
										<div class="progress">
											<div class="progress-bar" style="width:${(revenue-refund)*100/revenue}%"></div>
										</div>
										<span class="progress-description">
											with ${refund}$ refund
										</span>
									</div>
									<!-- /.info-box-content -->
								</div>
								<!-- /.info-box -->
							</div>
							<!-- /.col -->
						</div>
					</div>
					<!-- end widget -->
					<!-- chart start -->
					<div class="row">
						<div class="col-md-12">
							<div class="card card-box">
								<div class="card-head">
									<header>Hotel Business</header>
									<div class="tools">
										<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
										<a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
										<a class="t-close btn-color fa fa-times" href="javascript:;"></a>
									</div>
								</div>
								<div class="card-body no-padding height-9">
									<div class="row text-center">
										<div class="col-sm-3 col-6">
                                                                                    <h4 class="margin-0">$<span id="revenueToday">${revenueToday}</span></h4>
											<p class="text-muted"> Today's Income</p>
										</div>
										<div class="col-sm-3 col-6">
											<h4  class="margin-0">$<span id="refundToday">${refundToday}</span></h4>
											<p class="text-muted">Today's Refund</p>
										</div>
										<div class="col-sm-3 col-6">
											<h4 class="margin-0">$<span id="revenueMonth">${revenueMonth}</span></h4>
											<p class="text-muted">This Month's Income</p>
										</div>
										<div class="col-sm-3 col-6">
											<h4 class="margin-0">$<span id="refundMonth">${refundMonth}</span></h4>
											<p class="text-muted">This Month's Refund</p>
										</div>
									</div>
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <canvas id="bar-chart2"></canvas>
                                                                            </div>
                                                                            
                                                                            <div class="col-md-6">
                                                                                <canvas id="bar-chart"></canvas>
                                                                            </div>    
                                                                            
                                                                                
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Chart end -->
					
					<!-- start Payment Details -->
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="card  card-box">
								<div class="card-head">
									<header>Booking Details of Month</header>
									<div class="tools">
										<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
										<a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
										<a class="t-close btn-color fa fa-times" href="javascript:;"></a>
									</div>
								</div>
								<div class="card-body">
									
										<div class="table-scrollable">
											<table class="table table-hover table-checkable order-column full-width" id="example4">
												<thead>
                                                                                                    <tr>
                                                                                                        <th class="center">No.</th>
                                                                                                        <th class="center">Booking No.</th>
                                                                                                        <th class="center"> Full Name </th>
                                                                                                        <th class="center"> Mobile </th>
                                                                                                        <th class="center"> Email </th>
                                                                                                        <th class="center"> Check-IN Date</th>
                                                                                                        <th class="center"> Check-OUT Date</th>
                                                                                                        <th class="center"> Booking Date </th>
                                                                                                        <th class="center"> Status </th>
                                                                                                        
                                                                                                    </tr>
												</thead>
												<tbody>
                                                                                                    <c:forEach items="${bookingsofMonth}" var="b" varStatus="st">                                                                        
                                                                                                        <tr class="odd gradeX">
                                                                                                            <td class="center">${st.count}</td>
                                                                                                            <td class="center text-truncate" style="max-width: 10px;">${b.bookingNumber}</td>
                                                                                                            <td class="center">${b.fullName}</td>
                                                                                                            <td class="center"><a href="tel:${b.phone}">
                                                                                                                    ${b.phone} </a></td>
                                                                                                            <td class="center"><a href="mailto:${b.email} ">
                                                                                                                    ${b.email} </a></td>
                                                                                                            <td class="center">${b.checkin}</td>
                                                                                                            <td class="center">${b.checkout}</td>
                                                                                                            <td class="center">${b.bookingDate}</td>
                                                                                                            <td class="center">${b.status}</td>
                                                                                                        </tr>
                                                                                                    </c:forEach>
													
												</tbody>
											</table>
										</div>
									
								</div>
							</div>
						</div>
					</div>
					<!-- end Payment Details -->
					
				</div>
			</div>
			<!-- end page content -->
			<!-- start chat sidebar -->
                        <jsp:include page="../include-management/body_chat_sidebar.jsp"></jsp:include>
			<!-- end chat sidebar -->
		</div>
		<!-- end page container -->
		<!-- start footer -->
		<jsp:include page="../include-management/body_footer.jsp"></jsp:include>
		<!-- end footer -->
	</div>
	<!-- start js include path -->
        <script>
        
        var revenueMonth = document.getElementById('revenueMonth').innerHTML;
        var refundMonth = document.getElementById('refundMonth').innerHTML;
	new Chart(document.getElementById("bar-chart"), {
		type: 'pie',
		data: {
			labels: ["Income", "Refund"],
			datasets: [
			           {
			        	   label: "Month",
			        	   backgroundColor: ["rgba(255, 159, 64, 0.2)", "rgba(75, 192, 192, 0.2)"],
                                           borderColor: ["rgb(255, 159, 64)", "rgb(75, 192, 192)"],
			        	   data: [
			                      revenueMonth,
			                      refundMonth
			                  ]
			           }
			           ]
		},
		options: {
			title: {
				display: true,
				text: 'This Month Income & Refund (in USD)'
			}
		}
	});
	</script>	
        <script>
        var revenueToday = document.getElementById('revenueToday').innerHTML;
        var refundToday = document.getElementById('refundToday').innerHTML;
	new Chart(document.getElementById("bar-chart2"), {
		type: 'pie',
		data: {
			labels: ["Income", "Refund"],
			datasets: [
			            {
			        	   label: "Today",
			        	   backgroundColor: ["rgba(54, 162, 235, 0.2)", "rgba(153, 102, 255, 0.2)"],
                                           borderColor: ["rgb(54, 162, 235)", "rgb(153, 102, 255)"],
			        	   data: [
			                      revenueToday,
			                      refundToday
			                  ]
			           }
			           ]
		},
		options: {
			title: {
				display: true,
				text: 'Today Income & Refund (in USD)'
			}
		}
	});
		
        </script>
	<script src="<c:url value="/resources-management/assets/plugins/jquery/jquery.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/popper/popper.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/jquery-blockui/jquery.blockui.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></c:url>"></script>
	<!-- bootstrap -->
	<script src="<c:url value="/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/sparkline/jquery.sparkline.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/pages/sparkline/sparkline-data.js"></c:url>"></script>
	<!-- Common js-->
	<script src="<c:url value="/resources-management/assets/js/app.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/layout.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/theme-color.js"></c:url>"></script>
        <!-- data tables -->
	<script src="<c:url value="/resources-management/assets/plugins/datatables/jquery.dataTables.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/pages/table/table_data.js"></c:url>"></script>
	<!-- material -->
	<script src="<c:url value="/resources-management/assets/plugins/material/material.min.js"></c:url>"></script>
	<!-- animation -->
	<script src="<c:url value="/resources-management/assets/js/pages/ui/animations.js"></c:url>"></script>
	
        
	<!-- end js include path -->
</body>

</html>
