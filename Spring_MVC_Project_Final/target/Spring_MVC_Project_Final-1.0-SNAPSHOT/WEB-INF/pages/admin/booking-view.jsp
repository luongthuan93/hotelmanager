<%-- 
    Document   : roomtype-view
    Created on : Dec 3, 2020, 8:36:22 AM
    Author     : NO1
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
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
        <style>
            .five-chars {
                width: 6ch;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
        </style>
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
								<li class="active">All Booking</li>
							</ol>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card card-box">
								<div class="card-head">
									<header>All Bookings</header>
									<div class="tools">
										<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
										<a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
										<a class="t-close btn-color fa fa-times" href="javascript:;"></a>
									</div>
								</div>
								<div class="card-body ">
									<div class="row p-b-20">
                                                                                <div class="col-md-6 col-sm-6 col-6">
                                                                                    <c:if test="${message !=null && message !=''}">
                                                                                        <div class="alert label-danger alert-dismissible" role="alert">
                                                                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                            <trong>${message}</trong>. Please Check your dates. Thank!
                                                                                        </div>
                                                                                    </c:if>
                                                                                </div>
										
									</div>
                                                                    
                                                                    <mvc:form action="${pageContext.request.contextPath}/admin/search-booking" method="POST">  
                                                                        <div class="row">
                                                                            <div class="col-lg-6 p-t-20">
                                                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="date" name="startDate" value="${inputsDat}" required="" min="${today}" placeholder="">
                                                                                    <label class="mdl-textfield__label">startDate</label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-6 p-t-20">
                                                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="date"  name="endDate" value="${inputeDat}" required="" min="${today}" placeholder="">
                                                                                    <label class="mdl-textfield__label">endDate</label>
                                                                                </div>
                                                                            </div>


                                                                            <div class="col-lg-12 p-t-20 text-center">
                                                                                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Search Booking Date</button>
                                                                                <button type="reset" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
                                                                            </div>
                                                                        </div>
                                                                    </mvc:form>
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
                                                                                                        <td style="text-align: end;">
                                                                                                            <c:if test="${b.status == 'BOOKED'}">
                                                                                                                <span class="label label-sm label-primary">${b.status}</span>
                                                                                                            </c:if>
                                                                                                            <c:if test="${b.status == 'CHECK_IN'}">
                                                                                                                <span class="label label-sm label-success">${b.status}</span>
                                                                                                            </c:if>
                                                                                                            <c:if test="${b.status == 'CHECK_OUT'}">
                                                                                                                <span class="label label-sm label-warning">${b.status}</span>
                                                                                                            </c:if>
                                                                                                            <c:if test="${b.status == 'CANCEL'}">
                                                                                                                <span class="label label-sm label-danger">${b.status}</span>
                                                                                                            </c:if>
                                                                                                            <c:if test="${b.status == 'COMPLETE'}">
                                                                                                                <span class="label label-sm btn-default">${b.status}</span>
                                                                                                            </c:if>
														
                                                                                                                <c:if test="${b.status == 'BOOKED' || b.status == 'CHECK_IN' || b.status == 'CHECK_OUT'}">                                                                                                                  
                                                                                                                <div class="btn-group pull-left">
                                                                                                                        <a class="btn deepPink-bgcolor  btn-outline dropdown-toggle" data-toggle="dropdown">Change Status
                                                                                                                                <i class="fa fa-angle-down"></i>
                                                                                                                        </a>
                                                                                                                        <ul class="dropdown-menu pull-right">
                                                                                                                            <c:if test="${b.status == 'BOOKED'}">
                                                                                                                                <li>
                                                                                                                                        <a href="check-in/${b.id}">
                                                                                                                                                <i class="icon-login"></i> Check-In </a>
                                                                                                                                </li>
                                                                                                                            </c:if>
                                                                                                                            <c:if test="${b.status == 'CHECK_IN'}">
                                                                                                                                <li>
                                                                                                                                        <a href="check-out/${b.id}">
                                                                                                                                                <i class="icon-logout"></i> Check-Out </a>
                                                                                                                                </li>
                                                                                                                            </c:if>
                                                                                                                            <c:if test="${b.status == 'BOOKED'}">
                                                                                                                                <li>
                                                                                                                                        <a href="cancel-booking/${b.id}">
                                                                                                                                                <i class="icon-ban"></i> CANCEL </a>
                                                                                                                                </li>
                                                                                                                            </c:if>
                                                                                                                            <c:if test="${b.status == 'CHECK_OUT'}">
                                                                                                                                <li>
                                                                                                                                        <a href="complete-booking/${b.id}">
                                                                                                                                                <i class="icon-wallet"></i> COMPLETE </a>
                                                                                                                                </li>
                                                                                                                            </c:if>
                                                                                                                        </ul>
                                                                                                                </div>
                                                                                                                </c:if>
													</td>
													<td class="center">
														<a href="edit-booking/${b.id}" class="btn btn-tbl-edit btn-xs">
															<i class="fa fa-folder-open"></i>
														</a>
                                                                                                                <c:if test="${b.status == 'BOOKED' || b.status == 'CANCEL'}">
<!--                                                                                                                    <a href="delete-booking/${b.id}"class="btn btn-tbl-delete btn-xs">
															<i class="fa fa-trash-o "></i>
                                                                                                                    </a>-->
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
