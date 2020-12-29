<%-- 
    Document   : 404
    Created on : Dec 15, 2020, 8:02:09 PM
    Author     : NO1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta name="description" content="Responsive Admin Template">
	<meta name="author" content="SmartUniversity">
	<title>LUXSTAY HOTEL- ADMIN DASHBOARD</title>
	<!-- icons -->
        <link href="<c:url value="/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"></c:url>" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/iconic/css/material-design-iconic-font.min.css"></c:url>">
	<!-- bootstrap -->
	<link href="<c:url value="/resources-management/assets/plugins/bootstrap/css/bootstrap.min.css"></c:url>" rel="stylesheet" type="text/css">
	<!-- style -->
	<link rel="stylesheet" href="<c:url value="/resources-management/assets/css/pages/extra_pages.css"></c:url>">
	<!-- favicon -->
	<link rel="shortcut icon" href="<c:url value="/resources-management/assets/img/favicon.ico"></c:url>">
</head>

<body>
	<div class="limiter">
		<div class="container-login100 page-background">
			<div class="wrap-login100">
				<form class="form-404">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-flower"></i>
					</span>
					<span class="form404-title p-b-34 p-t-27">
						Error 404
					</span>
					<p class="content-404">The page you are looking for does't exist or an other error occurred.</p>
					<div class="container-login100-form-btn">
                                            <a class="login100-form-btn" href="${pageContext.request.contextPath}/admin/home">
							Go to home page
						</a>
					</div>
					<div class="text-center p-t-27">
						<a class="txt1" href="#">
							Need Help?
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- start js include path -->
        <script src="<c:url value="/resources-management/assets/plugins/jquery/jquery.min.js"></c:url>"></script>
	<!-- bootstrap -->
	<script src="<c:url value="/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/pages/extra_pages/login.js"></c:url>"></script>
	<!-- end js include path -->
</body>

</html>