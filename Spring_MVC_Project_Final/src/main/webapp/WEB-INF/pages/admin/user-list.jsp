<%-- 
    Document   : list- user
    Created on : Nov 26, 2020, 10:32:01 AM
    Author     : lamde
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- Copied from http://radixtouch.in/templates/admin/hotel/source/table_data.html by Cyotek WebCopy 1.8.0.652, Monday, September 14, 2020, 9:06:32 AM -->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <meta name="description" content="Responsive Admin Template">
        <meta name="author" content="SmartUniversity">
        <title>LUXSTAY HOTEL- ADMIN DASHBOARD</title>

        <!-- data tables -->
            <link href="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css"></c:url>" rel="stylesheet" type="text/css">

        <!-- icons -->
            <link href="<c:url value="/resources-management/assets/plugins/simple-line-icons/simple-line-icons.min.css"></c:url>" rel="stylesheet" type="text/css">
            <link href="<c:url value="/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"></c:url>" rel="stylesheet" type="text/css">
        <!--bootstrap -->
            <link href="<c:url value="/resources-management/assets/plugins/bootstrap/css/bootstrap.min.css"></c:url>" rel="stylesheet" type="text/css">
            <link href="<c:url value="/resources-management/assets/plugins/summernote/summernote.css"></c:url>" rel="stylesheet">
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
                                        <div class="page-title">User Management</div>
                                    </div>
                                    <ol class="breadcrumb page-breadcrumb pull-right">
                                        <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="${pageContext.request.contextPath}/admin/home">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li><a class="parent-item" href="">Account Management</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li class="active">View Account</li>
                                    </ol>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-topline-aqua">
                                        <div class="card-head">
                                            <header>User List: </header>
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
                                                            <th>No.</th>
                                                            <th>Email</th>
                                                            <th>Full Name</th>
                                                            <th>Address</th>
                                                            <th>Birthday</th>
                                                            <th>Phone</th>
                                                            <th>Status</th>
                                                            <th>Role</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${users}" var="u" varStatus="status">
                                                        <tr>
                                                            <td>${status.count}</td>
                                                            <td>${u.email}</td>
                                                            <td>${u.fullName}</td>
                                                            <td class="center text-truncate" style="max-width: 150px;">${u.address}</td>
                                                            <td>
                                                                <fmt:formatDate value="${u.birthDate}" pattern="dd/MM/yyyy"></fmt:formatDate>
                                                            </td>
                                                            <td>${u.phone}</td>
                                                            <td style="text-align: end;">
                                                                <c:if test="${u.status == 'INACTIVE'}">
                                                                    <span class="label label-sm label-primary">${u.status}</span>
                                                                </c:if>
                                                                <c:if test="${u.status == 'ACTIVE'}">
                                                                    <span class="label label-sm label-success">${u.status}</span>
                                                                </c:if>
                                                                <c:if test="${u.status == 'LOCK'}">
                                                                    <span class="label label-sm label-danger">${u.status}</span>
                                                                </c:if>
                                                                <div class="btn-group pull-left">
                                                                    <a class="btn deepPink-bgcolor  btn-outline dropdown-toggle" data-toggle="dropdown">Change Status
                                                                        <i class="fa fa-angle-down"></i>
                                                                    </a>
                                                                    <ul class="dropdown-menu pull-right">
                                                                        <c:if test="${u.status == 'ACTIVE'}">
                                                                            <li>
                                                                                <a href="user-status-lock/${u.id}">
                                                                                    <i class="icon-ban"></i> LOCK </a>
                                                                            </li>
                                                                        </c:if>
                                                                        <c:if test="${u.status == 'INACTIVE'}">
                                                                            <li>
                                                                                <a href="user-status-active/${u.id}">
                                                                                    <i class="icon-key"></i> ACTIVE </a>
                                                                            </li>
                                                                        </c:if>
                                                                        <c:if test="${u.status == 'LOCK'}">
                                                                            <li>
                                                                                <a href="user-status-active/${u.id}">
                                                                                    <i class="icon-ban"></i> ACTIVE </a>
                                                                            </li>
                                                                        </c:if>
                                                                        
                                                                        
                                                                    </ul>
                                                                </div>

                                                            </td>
                                                            <td class="center">
                                                                <c:forEach items="${u.userRoles}" var="r">
                                                                    <c:if test="${r.id == 1}">
                                                                        <span class="label label-sm label-success">${r.role}</span>
                                                                    </c:if>
                                                                    <c:if test="${r.id > 1}">
                                                                        <span class="label label-sm label-warning">${r.role}</span>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td class="center">
                                                                <a href="edit-account/${u.id}" class="btn btn-tbl-edit btn-xs">
                                                                    <i class="fa fa-pencil-square-o"></i>
                                                                </a>
                                                                <a href="change-password/${u.id}" class="btn btn-tbl-edit btn-xs">
                                                                    <i class="fa fa-exchange"></i>
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
            <!-- data tables -->
            <script src="<c:url value="/resources-management/assets/plugins/datatables/jquery.dataTables.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/table/table_data.js"></c:url>"></script>
            <!-- Common js-->
            <script src="<c:url value="/resources-management/assets/js/app.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/js/layout.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/js/theme-color.js"></c:url>"></script>
            <!-- material -->
            <script src="<c:url value="/resources-management/assets/plugins/material/material.min.js"></c:url>"></script>
            <!-- animation -->
            <script src="<c:url value="/resources-management/assets/js/pages/ui/animations.js"></c:url>"></script>
        <!-- end js include path -->

    </body>

    <!-- Copied from http://radixtouch.in/templates/admin/hotel/source/table_data.html by Cyotek WebCopy 1.8.0.652, Monday, September 14, 2020, 9:06:32 AM -->
</html>