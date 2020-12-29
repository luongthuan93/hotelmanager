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
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/jquery-toast/dist/jquery.toast.min.css"></c:url>">

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
								<div class="page-title">Comment and View</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="${pageContext.request.contextPath}/admin/home">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li><a class="parent-item" href="">Comment-Vote</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active">All Comment & View</li>
							</ol>
						</div>
					</div>
					
                                        
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-topline-aqua">
                                <div class="card-head">
                                    <header>COMMENTS TABLE</header>
                                    <div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                        <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                    </div>
                                </div>
                                <div class="card-body ">
                                    <div class="table-scrollable">
                                        <table id="example1" class="display full-width">
                                            <thead>
												<tr>
													
													<th class="center"> No. </th>
													<th class="center"> content </th>
													<th class="center"> commentDate </th>
													<th class="center"> user </th>
								
													<th class="center"> roomType </th>
                                                                                                        <th class="center"> action </th>
												</tr>
											</thead>
											<tbody>
                                                                                        <c:forEach items="${comments}" var="c" varStatus="status">
                                                                                                
                                                                                            
												<tr class="odd gradeX">
													
													<td class="center">${status.count}</td>
													<td class="center">${c.content}</td>
													<td class="center">${c.commentDate}</td>
													<td class="center">${c.user.email}</td>
                                                                                                        <td class="center">${c.roomType.name}</td>
													
													<td class="center">
														
                                                                                                                <a href="${pageContext.request.contextPath}/admin/delete-comment/${c.id}"class="btn btn-tbl-delete btn-xs">
															<i class="fa fa-trash-o "></i>
														</a>
														
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
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-topline-yellow">
                                <div class="card-head">
                                    <header>VOTE TABLE</header>
                                    <div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                        <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                    </div>
                                </div>
                                <div class="card-body ">
                                    
                                    <table id="example3" class="display full-width">
                                        <thead>
												<tr>
													
													<th class="center"> No. </th>
													<th class="center"> vote </th>
													<th class="center"> voteDate </th>
													<th class="center"> user </th>
                                                                                                        <th class="center"> roomType </th>
								
													<th class="center"> Action </th>
												</tr>
											</thead>
											<tbody>
                                                                                        <c:forEach items="${votes}" var="v" varStatus="status">
                                                                                                
                                                                                            
												<tr class="odd gradeX">
													
													<td class="center">${status.count}</td>
													<td class="center">${v.vote} <i class="fa fa-star"></i></td>
													<td class="center">${v.voteDate}</td>
													<td class="center">${v.user.email}</td>
                                                                                                        <td class="center">${v.roomType.name}</td>
													
													<td class="center">
														
                                                                                                                <a href="${pageContext.request.contextPath}/admin/delete-vote/${v.id}"class="btn btn-tbl-delete btn-xs">
															<i class="fa fa-trash-o "></i>
														</a>
														
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
                var url_string = window.location.href;
                var url = new URL(url_string);                
                var type = url.searchParams.get("type");
                var message = url.searchParams.get("message");
//                console.log(message);
                if(message.length > 1){
                    if(type == 'success'){
                        window.onload = function() {
                            $.toast({
                            heading: 'Message From LUXSTAY HOTEL System',
                            text: message,
                            position: 'top-center',
                            loaderBg:'#ff6849',
                            icon: 'success',
                            hideAfter: 6000, 
                            stack: 6
                          });
                        };
                    }else{
                        window.onload = function() {
                            $.toast({
                            heading: 'Message From LUXSTAY HOTEL System',
                            text: message,
                            position: 'top-center',
                            loaderBg:'#ff6849',                            
                            icon: 'error',
                            hideAfter: 6000, 
                            stack: 6
                          });
                        };
                    }
            };
            </script>
	<script src="<c:url value="/resources-management/assets/plugins/jquery/jquery.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/popper/popper.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/jquery-blockui/jquery.blockui.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></c:url>"></script>
	<!-- bootstrap -->
	<script src="<c:url value="/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js"></c:url>"></script>
        <!-- notifications -->
        <script src="<c:url value="/resources-management/assets/plugins/jquery-toast/dist/jquery.toast.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/jquery-toast/dist/toast.js"></c:url>"></script>
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


