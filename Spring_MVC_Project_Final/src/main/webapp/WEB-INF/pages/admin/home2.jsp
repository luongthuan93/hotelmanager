<%-- 
    Document   : home
    Created on : Jun 20, 2019, 7:47:58 PM
    Author     : ThuanPhan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- BEGIN HEAD -->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta name="description" content="Responsive Admin Template">
	<meta name="author" content="SmartUniversity">
	<title>Spice Hotel | Bootstrap 4 Admin Dashboard Template + UI Kit</title>
	<!-- icons -->
        <link href="<c:url value="/resources-management/assets/plugins/simple-line-icons/simple-line-icons.min.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"></c:url>" rel="stylesheet" type="text/css">
	<!--bootstrap -->
	<link href="<c:url value="/resources-management/assets/plugins/bootstrap/css/bootstrap.min.css"></c:url>" rel="stylesheet" type="text/css">
	<!-- data tables -->
	<link href="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css"></c:url>" rel="stylesheet" type="text/css">
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
        <!-- data tables -->
	<script src="<c:url value="/resources-management/assets/plugins/datatables/jquery.dataTables.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/pages/table/table_data.js"></c:url>"></script>
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
								<div class="page-title">Dashboard</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="${pageContext.request.contextPath}/admin/home">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active">Account Dashboard</li>
							</ol>
						</div>
					</div>
					<!-- start widget -->
					<div class="state-overview">
						<div class="row">
							<div class="col-lg-3 col-sm-6">
								<div class="overview-panel purple">
									<div class="symbol">
										<i class="fa fa-users usr-clr"></i>
									</div>
									<div class="value white">
										<p class="sbold addr-font-h1" data-counter="counterup" data-value="${users.size()}">0</p>
										<p>Users</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="overview-panel deepPink-bgcolor">
									<div class="symbol">
										<i class="fa fa-user"></i>
									</div>
									<div class="value white">
										<p class="sbold addr-font-h1" data-counter="counterup" data-value="${userUsers.size()}">0</p>
										<p>[User] Role User</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="overview-panel orange">
									<div class="symbol">
										<i class="fa fa fa-user-circle-o"></i>
									</div>
									<div class="value white">
										<p class="sbold addr-font-h1" data-counter="counterup" data-value="${adminUsers.size()}">0</p>
										<p>[Admin] Role User</p>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-sm-6">
								<div class="overview-panel blue-bgcolor">
									<div class="symbol">
										<i class="fa fa-bars"></i>
									</div>
									<div class="value white">
										<p class="sbold addr-font-h1" data-counter="counterup" data-value="${userRoles.size()}">0</p>
										<span></span>
										<p>Roles</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end widget -->
					<div class="row">
						
					</div>
					
					
					<div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								<div class="card-head">
									<header>Users By Role</header>
								</div>
								<div class="card-body ">
									<div class="mdl-tabs mdl-js-tabs">
										<div class="mdl-tabs__tab-bar tab-left-side">
											<a href="#tab4-panel" class="mdl-tabs__tab tabs_three is-active">Admin</a>
											<a href="#tab5-panel" class="mdl-tabs__tab tabs_three">User</a>
											<a href="#tab6-panel" class="mdl-tabs__tab tabs_three">Other</a>
										</div>
										<div class="mdl-tabs__panel is-active p-t-20" id="tab4-panel">
											<div class="table-responsive">
                                                                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th>No.</th>
                                                                                                        <th>Email</th>
                                                                                                        <th>Full Name</th>
                                                                                                        <th>Card ID</th>
                                                                                                        <th>Birthday</th>
                                                                                                        <th>Phone</th>
                                                                                                        <th>Status</th>

                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                <c:forEach items="${adminUsers}" var="ad" varStatus="st">
                                                                                                    <tr>
                                                                                                        <td>${st.count}</td>
                                                                                                        <td>${ad.email}</td>
                                                                                                        <td>${ad.fullName}</td>
                                                                                                        <td>${ad.cardId}</td>
                                                                                                        <td>${ad.birthDate}</td>
                                                                                                        <td>${ad.phone}</td>
                                                                                                        <td>${ad.status}</td>
                                                                                                    </tr>
                                                                                                </c:forEach>


                                                                                            </tbody>
                                                                                        </table>
											</div>
<!--											<div class="text-center">
												<div class="full-width text-center p-t-10">
													<a href="#" class="btn purple btn-outline btn-circle margin-0">Load
														More</a>
												</div>
											</div>-->
										</div>
										<div class="mdl-tabs__panel p-t-20" id="tab5-panel">
                                                                                    
											<div class="table-responsive">
                                                                                            <table class="table table-hover table-checkable order-column full-width" id="example3">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th>No.</th>
                                                                                                        <th>Email</th>
                                                                                                        <th>Full Name</th>
                                                                                                        <th>Card ID</th>
                                                                                                        <th>Birthday</th>
                                                                                                        <th>Phone</th>
                                                                                                        <th>Status</th>

                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                <c:forEach items="${userUsers}" var="us" varStatus="stu">
                                                                                                    <tr>
                                                                                                        <td>${stu.count}</td>
                                                                                                        <td>${us.email}</td>
                                                                                                        <td>${us.fullName}</td>
                                                                                                        <td>${us.cardId}</td>
                                                                                                        <td>${us.birthDate}</td>
                                                                                                        <td>${us.phone}</td>
                                                                                                        <td>${us.status}</td>
                                                                                                    </tr>
                                                                                                </c:forEach>


                                                                                            </tbody>
                                                                                        </table>
											</div>
                                                                                    
<!--                                                                                        <div class="text-center">
                                                                                            <div class="full-width text-center p-t-10">
                                                                                                <a href="#" class="btn purple btn-outline btn-circle margin-0">Load
                                                                                                    More</a>
                                                                                            </div>
                                                                                        </div>-->
                                                                                    </div>
                                                                                    <div class="mdl-tabs__panel p-t-20" id="tab6-panel">
                                                                                        <div class="table-responsive">
                                                                                            <table class="table table-hover table-checkable order-column full-width" id="banguser">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th>No.</th>
                                                                                                        <th>Email</th>
                                                                                                        <th>Full Name</th>
                                                                                                        <th>Card ID</th>
                                                                                                        <th>Birthday</th>
                                                                                                        <th>Phone</th>
                                                                                                        <th>Status</th>

                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                <c:forEach items="${otherUsers}" var="ot" varStatus="sto">
                                                                                                    <tr>
                                                                                                        <td>${sto.count}</td>
                                                                                                        <td>${ot.email}</td>
                                                                                                        <td>${ot.fullName}</td>
                                                                                                        <td>${ot.cardId}</td>
                                                                                                        <td>${ot.birthDate}</td>
                                                                                                        <td>${ot.phone}</td>
                                                                                                        <td>${ot.status}</td>
                                                                                                    </tr>
                                                                                                </c:forEach>


                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
<!--											<div class="text-center">
												<div class="full-width text-center p-t-10">
													<a href="#" class="btn purple btn-outline btn-circle margin-0">Load
														More</a>
												</div>
											</div>-->
										</div>
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
	<!-- counterup -->
	<script src="<c:url value="/resources-management/assets/plugins/counterup/jquery.waypoints.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/counterup/jquery.counterup.min.js"></c:url>"></script>
	<!-- Common js-->
	<script src="<c:url value="/resources-management/assets/js/app.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/layout.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/theme-color.js"></c:url>"></script>
	<!-- material -->
	<script src="<c:url value="/resources-management/assets/plugins/material/material.min.js"></c:url>"></script>
	<!-- animation -->
	<script src="<c:url value="/resources-management/assets/js/pages/ui/animations.js"></c:url>"></script>
	<!-- chart js -->
	<script src="<c:url value="/resources-management/assets/plugins/chart-js/Chart.bundle.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/chart-js/utils.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/pages/chart/chartjs/home-data2.js"></c:url>"></script>
	<!-- sparkline -->
	<script src="<c:url value="/resources-management/assets/plugins/sparkline/jquery.sparkline.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/pages/sparkline/sparkline-data.js"></c:url>"></script>
        <!-- data tables -->
	<script src="<c:url value="/resources-management/assets/plugins/datatables/jquery.dataTables.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/pages/table/table_data.js"></c:url>"></script>
	<!-- end js include path -->
</body>

</html>