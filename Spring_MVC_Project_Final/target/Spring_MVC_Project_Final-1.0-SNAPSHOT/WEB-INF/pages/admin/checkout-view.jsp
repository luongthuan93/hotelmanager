<%-- 
    Document   : roomtype-view
    Created on : Dec 3, 2020, 8:36:22 AM
    Author     : NO1
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- Copied from http://radixtouch.in/templates/admin/hotel/source/all_rooms.html by Cyotek WebCopy 1.8.0.652, Monday, September 14, 2020, 9:06:32 AM -->
<!-- BEGIN HEAD -->

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
	
	<!-- Material Design Lite CSS -->
	<link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/material/material.min.css"></c:url>">
	<link rel="stylesheet" href="<c:url value="/resources-management/assets/css/material_style.css"></c:url>">
	<!-- data tables -->
	<link href="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css"></c:url>" rel="stylesheet" type="text/css">
        <!-- animation -->
	<link href="<c:url value="/resources-management/assets/css/pages/animate_page.css"></c:url>" rel="stylesheet">
	<!-- Template Styles -->
	<link href="<c:url value="/resources-management/assets/css/plugins.min.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/css/style.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/css/responsive.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/css/theme-color.css"></c:url>" rel="stylesheet" type="text/css">
	<!-- favicon -->
	<link rel="shortcut icon" href="<c:url value="/resources-management/assets/img/favicon.ico"></c:url>">
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
								<div class="page-title">All Bookings</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="${pageContext.request.contextPath}/admin/home">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li><a class="parent-item" href="">Booking Management</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active">Check-OUT</li>
							</ol>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card card-box">
								<div class="card-head">
									<header>Check-OUT Section</header>
									<div class="tools">
										<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
										<a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
										<a class="t-close btn-color fa fa-times" href="javascript:;"></a>
									</div>
								</div>
								<div class="card-body ">
									<div class="row p-b-20">
										<div class="col-md-6 col-sm-6 col-6">
											<div class="btn-group">
												<a href="add_room.html" id="addRow" class="btn btn-info">
													Add New <i class="fa fa-plus"></i>
												</a>
											</div>
										</div>
										<div class="col-md-6 col-sm-6 col-6">
											<div class="btn-group pull-right">
												<a class="btn deepPink-bgcolor  btn-outline dropdown-toggle" data-toggle="dropdown">Tools
													<i class="fa fa-angle-down"></i>
												</a>
												<ul class="dropdown-menu pull-right">
													<li>
														<a href="javascript:;">
															<i class="fa fa-print"></i> Print </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="fa fa-file-pdf-o"></i> Save as PDF </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="fa fa-file-excel-o"></i> Export to Excel </a>
													</li>
												</ul>
											</div>
										</div>
									</div>
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
													<th class="center"> Action </th>
												</tr>
											</thead>
											<tbody>
                                                                                            <c:forEach items="${bookings}" var="b" varStatus="status">

												<tr class="odd gradeX">
													<td class="center">${status.count}</td>
                                                                                                        <td class="center text-truncate" style="max-width: 10px;">${b.bookingNumber}</td>
													<td class="center">${b.fullName}</td>
													<td class="center"><a href="tel:${b.phone}">
															${b.phone} </a></td>
													<td class="center"><a href="mailto:${b.email} ">
															${b.email} </a></td>
													<td class="center">${b.checkin}</td>
													<td class="center">${b.checkout}</td>
													<td class="center">${b.bookingDate}</td>
													<td class="center">
														<span class="label label-sm label-success">${b.status}</span>
													</td>
													<td class="center">
														<a href="edit-booking/${b.id}" class="btn btn-tbl-edit btn-xs">
															<i class="fa fa-pencil"></i>
														</a>
														<c:if test="${b.status == 'BOOKED' || b.status == 'CANCEL'}">
                                                                                                                    <a href="delete-booking/${b.id}"class="btn btn-tbl-delete btn-xs">
															<i class="fa fa-trash-o "></i>
                                                                                                                    </a>
                                                                                                                </c:if>
													</td>
												</tr>
                                                                                            </c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
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
	<script src="<c:url value="/resources-management/assets/plugins/jquery/jquery.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/popper/popper.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/jquery-blockui/jquery.blockui.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></c:url>"></script>
	<!-- bootstrap -->
	<script src="<c:url value="/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js"></c:url>"></script>
	
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
